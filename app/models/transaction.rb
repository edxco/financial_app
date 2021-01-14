class Transaction < ApplicationRecord
    validates :name, presence: true
    validates :amount, presence: true
    belongs_to :user
    belongs_to :group, optional: true
    before_save :titlelize_name
  
    s_str = 'transactions.name, transactions.id, transactions.amount, transactions.user_id, transactions.created_at'
    s_str2 = ', groups.icon, groups.name as gname, users.username as uname'
    s_str3 = ', users.username as uname'
    s_str4 = 'users.username as uname, sum(transactions.amount) as tot_amount'
  
    scope :grouped_display, ->(gid) { where(group_id: gid).joins(:group).joins(:user).select(s_str + s_str2) }
    scope :expense_display, ->(uid) { where(user_id: uid).joins(:group).joins(:user).select(s_str + s_str2) }
    scope :income_display, ->(uid) { where(user_id: uid, group_id: nil).joins(:user).select(s_str + s_str3) }
    scope :by_user, -> { joins(:user).select(s_str4).group(:uname) }
  
    private
  
    def titlelize_name
      self.name = name.split.collect(&:capitalize).join(' ') if name && !name.blank?
    end
  end