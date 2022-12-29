module BooksHelper
    def list_of_numbers(numbers)
        if numbers.nil?
            return []
        end
        numbers.each do |number|
            result = number =~ /[0-9]/
            if result == nil
                raise Exception.new "Required numeric string"
            end
        end
        return numbers ? numbers.reject(&:empty?).map(&:to_i) : []
    end

    def search(name, min, max)
        if name.empty?
            if min.present? and max.empty?
                return Book.includes(:author).where(Book.arel_table[:pages].gt(min.to_i))
            elsif min.empty? and max.present?
                return Book.includes(:author).where(Book.arel_table[:pages].lt(max.to_i))
            elsif min.present? and max.present?
                if max.to_i < min.to_i
                    flash[:alert] = "Maximum number should greater that minimum!"
                    return Book.includes(:author).all
                end
                return Book.includes(:author).where(pages: min.to_i..max.to_i)
            end
        elsif name.present?
            if min.present? and max.empty?
                return Book.includes(:author).where(Book.arel_table[:pages].gt(min.to_i)).where(author: {id: name})
            elsif min.empty? and max.present?
                return Book.includes(:author).where(Book.arel_table[:pages].lt(max.to_i)).where(author: {id: name})
            elsif min.present? and max.present?
                if max.to_i < min.to_i
                    flash[:alert] = "Maximum number should greater that minimum!"
                    return Book.includes(:author).all
                end
                return Book.includes(:author).where(pages: min.to_i..max.to_i).where(author: {id: name})
            end
        end
        return Book.includes(:author).all
    end
end
