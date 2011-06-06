class FragmentCacherExtension < Radiant::Extension
  version "0.2"
  description "Allows fragments to be cached outside of the normal Radiant cache."
  url "http://github.com/mokisystems/radiant-fragment-cacher/"

  FRAGMENT_CACHE_DIR = RAILS_ROOT + "/tmp/cache/fragment_cache"
  
  def activate
    FileUtils.mkdir_p(FRAGMENT_CACHE_DIR) unless File.exist?(FRAGMENT_CACHE_DIR)
    Page.send :include, FragmentCacher

    Page.class_eval do
      include ClearFragmentCache
    end
    Snippet.class_eval do
      include ClearFragmentCache
    end
    Layout.class_eval do
      include ClearFragmentCache
    end
  end
  
  def deactivate
  end
end
