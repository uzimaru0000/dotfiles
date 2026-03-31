function aws-login
    set profile (aws configure list-profiles | sk)

    if test $status -eq 130
        return 0
    end

    aws sso login --profile $profile
    set -gx AWS_PROFILE $profile

    echo "✅ AWS_PROFILE set to: $profile"
end

