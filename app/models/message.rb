class Message < ActiveRecord::Base
    
    belongs_to :sender, class_name: "User", foreign_key: :sender_id
    belongs_to :recipient, class_name: "User", foreign_key: :recipient_id

    def self.current_user_messages(session)
        user = Helper.current_user(session)
        Message.all.select{|m| m.sender_id == user.id || m.recipient_id == user.id}
    end

    def self.user_conversations(session)
        user = Helper.current_user(session)
        conversations = {}
        Message.current_user_messages(session).each do |m|
            if m.sender_id != user.id
                conversations[m.sender_id] = []
            elsif m.recipient_id != user.id
                conversations[m.recipient_id] = []
            end
        end

        Message.current_user_messages(session).each do |m|
            if m.sender_id != user.id
                conversations[m.sender_id] << m
            elsif m.recipient_id != user.id
                conversations[m.recipient_id] << m
            end
        end

        return conversations
    end

    def self.sorted_single_conversation(session:, other_user_id:)
        Message.user_conversations(session)[other_user_id.to_i].sort_by{|m| m.created_at }
    end

    
end