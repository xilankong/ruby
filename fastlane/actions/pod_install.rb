module Fastlane
  module Actions
    module SharedValues
      POD_INSTALL_CUSTOM_VALUE = :POD_INSTALL_CUSTOM_VALUE
    end

    class PodInstallAction < Action
      def self.run(params)
        repo = "-no-repo-update"
        command = []

        command << "pod install"

        if params[:repo_update]
          repo = "--repo-update"
        end

        command << repo

        if params[:verbose]
          command << "--verbose"
        end

        result = Actions.sh(command.join(' '))
        UI.success(command.join(' ') + " Successfully ⬆️ ")

        return result
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "pod install action"
      end

      def self.details
        "verbose / repo-update /"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :verbose,
                                       description: "Allow output detail in console",
                                       optional: true,
                                       is_string: false,
                                       default_value: false),
          FastlaneCore::ConfigItem.new(key: :repo_update,
                                       description: "Allow output detail in console",
                                       optional: true,
                                       is_string: false,
                                       default_value: false)
        ]
      end

      def self.output
      end

      def self.return_value
      end

      def self.authors
        ["yang.huang"]
      end

      def self.is_supported?(platform)

        platform == :ios
      end


    end
  end
end
