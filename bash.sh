for filename in .; do
    if [ -f "$filename" ]; then
        # Translate digits (1->2, 9->0)
        new_filename=$(echo "$filename" | tr '1234567890' '2345678901')
        
        # Translate uppercase letters (A->B, Z->A)
        new_filename=$(echo "$new_filename" | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'BCDEFGHIJKLMNOPQRSTUVWXYZA')
        
        # Translate lowercase letters (a->b, z->a)
        new_filename=$(echo "$new_filename" | tr 'abcdefghijklmnopqrstuvwxyz' 'bcdefghijklmnopqrstuvwxyza')
        
        # Only rename if a change was actually made
        if [[ "$filename" != "$new_filename" ]]; then
            mv -- "$filename" "$new_filename"
            echo "Renamed '$filename' to '$new_filename'"
        fi
    fi
done
