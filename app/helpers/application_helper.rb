module ApplicationHelper
    def truncate_link(link, length = 50)
        link.length > length ? "#{link[0, length]}..." : link
    end
end
