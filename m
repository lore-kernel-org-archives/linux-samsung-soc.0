Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF17C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Jan 2022 12:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238449AbiARMCu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 18 Jan 2022 07:02:50 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47514
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238235AbiARMCu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 07:02:50 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 37A7F3F163
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 12:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642507369;
        bh=Ql5o5btca7TixCCJyaZ5PmuuPXE/PMkoelxyDyHmTek=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=eG4Qf1I7Lum4cDbOgZZG5Fmgyuw8kdccCsHPnfzWk54z74i6+ynP/SrAgLzcUimtF
         Jbumsnp0agfE0Yhgvse0uriL0+ruXNY5P0n+SLWQ9gT37voqNRq/E+V6aTylzgVTcN
         PZlSXIao54V8fP6CbvLn+YNsacLuPxi/zMPchRfaryAv6XI6e15/s3XVwYP7MOYW/D
         BU2+bUqyi9RSQBg6K7mJVfQCL3yTPDKwvFCb2jVatKsFxdy0tysffH9IuoLpF94YGk
         m8tdspn6B+Cg5lJZbitg6q0Z6bqv9NSRE8R9B3RxJwEQ4Z3bqAHHcIkjCxsO+NHgRk
         vWh1rITMsJOJw==
Received: by mail-ed1-f72.google.com with SMTP id z6-20020a50eb46000000b00403a7687b5bso970948edp.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 04:02:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ql5o5btca7TixCCJyaZ5PmuuPXE/PMkoelxyDyHmTek=;
        b=frRbUOPMeZrMVYldDxp3M6IaJ5B/khdtF/C99xqmmMCltJC69MXoDU9wD9t8IHG795
         GLGKYrcwmg6l5tN0mzikhmWqM4R/62I8igieq1ymmdQMuhW8XCxeAqsKBTA77m1kOOx/
         8MegRsRx2VBRi6g3HGwl7JHCGBtTc1D5Q2nLkGwFDpAA1+MWSqZJDUvA20o4rjI4lNcJ
         RVKbsnJgN5UqajE8gP7ShWEC+sVyZQJH6PIKAjyN+XwCPBzt386+uJw10WApPNtKRIKx
         0nODkwVhwPAJKmWQ6U33Ez5pamLM95jz0MryxlI4rdbmPMImtWeGZa2LimagfgFfVLpZ
         O1zQ==
X-Gm-Message-State: AOAM532mecJLaqqW8GdP9wTOYgM3ZUBV0KDQZJG1RS0LLLUGNfrWfH16
        tHog+24nC+PmdIKZIohDHty2umIu+WjwON45WHSgkLYrtp6sRcDp1lnYLOGHHdOh+eph05VVyJh
        SIyRTLJbSg8kmGO86T/LZZcu/HyiM57LqXuib3HQBDMRnZwwt
X-Received: by 2002:a17:907:97c8:: with SMTP id js8mr7881018ejc.204.1642507368861;
        Tue, 18 Jan 2022 04:02:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwacinpKUaMirkbH8G+vfVFL4LbqvlkHQiVfnNzpT2tQNau8eAn3SRNodkGspyp69k0iQbWBQ==
X-Received: by 2002:a17:907:97c8:: with SMTP id js8mr7881003ejc.204.1642507368668;
        Tue, 18 Jan 2022 04:02:48 -0800 (PST)
Received: from [192.168.0.41] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id z6sm7090894edb.58.2022.01.18.04.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 04:02:48 -0800 (PST)
Message-ID: <da169a51-d779-0c0b-8836-dc8776186d4c@canonical.com>
Date:   Tue, 18 Jan 2022 13:02:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 2/3 v2] spi: s3c64xx: Drop custom gpio setup argument
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>
References: <20220118110928.120640-1-linus.walleij@linaro.org>
 <20220118110928.120640-2-linus.walleij@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118110928.120640-2-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/01/2022 12:09, Linus Walleij wrote:
> The SPI0 platform population function was taking a custom
> gpio setup callback but the only user pass NULL as
> argument so drop this argument.
> 
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1-v2:
> - Split out to separate patch
> ---
>  arch/arm/mach-s3c/devs.c                  | 5 ++---
>  arch/arm/mach-s3c/mach-crag6410.c         | 2 +-
>  include/linux/platform_data/spi-s3c64xx.h | 4 +---
>  3 files changed, 4 insertions(+), 7 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
