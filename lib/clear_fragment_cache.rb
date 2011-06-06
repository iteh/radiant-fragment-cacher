module ClearFragmentCache

  module ClassMethods
    def callbacks
      after_save :clear_fragment_cache
    end
  end

  def clear_fragment_cache
    FragmentCacherExtension.ensure_cache_dir
    FileUtils.rm(Dir.glob(File.join(FragmentCacherExtension::FRAGMENT_CACHE_DIR, "_fragment_*")))
  end

  def self.included(base)
    base.extend(ClassMethods).callbacks
  end

end