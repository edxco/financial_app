module GroupsHelper

def group_for_select
    Group.all.collect { |m| [m.name, m.id] }
end

end