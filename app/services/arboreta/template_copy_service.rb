module Arboreta
  class TemplateCopyService

    def self.copy_from_template_to_subject(template:, subject:)
      new_tree = template.amoeba_dup
      new_tree.subject = subject
      new_tree.save
    end

  end
end