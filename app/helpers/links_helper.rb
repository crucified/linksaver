module LinksHelper
  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end
  
  def displayed_text(l)
    if l.link && l.link.match(/[[\w]+.]*[\w^\d]{2,4}/)
      if l.title.empty?
        return link_to l.link, url_with_protocol(l.link), {:target => "_blank"}
      else
        return link_to l.title, url_with_protocol(l.link), {:target => "_blank"}
      end
    else
      return l.title
    end 
  end
end
