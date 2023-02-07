Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A2BC636CC
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Feb 2023 20:15:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjBGUP1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Feb 2023 15:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjBGUP0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Feb 2023 15:15:26 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17FA93A598
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Feb 2023 12:15:25 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso12387892wms.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Feb 2023 12:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cdinGgVazI5fUgZBgObY9YOTAF5gu6cqTGjYkW5HU9c=;
        b=tkPGpovGMEec0DDGESsbPR6aJLfnHktdEbfldpxzQqYpHdt/1Tu42rxfwAcpDF93qQ
         crEJ0DcNWGY2+z3oQJzXCZeVlUZ01jVAildSAMimonAgEqXobj440SE9w340FTDTRj3W
         +Ro/yeZw6f1murs6frpkTVBJRQxdI90dxw2CAl69pl9V14kDcoE5SJBhQe9O5+nvshnA
         XZQxtHeU3djbkPBA5sMxqeQ/pg+ZWvAEn66/soaf0Dun4Ss5KhhGADotpAVYssKRbRjb
         Uyy8O87oh1eUULJ+azD7Rj2mVQk6Q8RXCSTW3gOINHQaXxEvGcHv1fzWAdcH+ycjEdQu
         C1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cdinGgVazI5fUgZBgObY9YOTAF5gu6cqTGjYkW5HU9c=;
        b=LMjiRaFmt6hRN5amyZUC2OrZkaVFboSfmoWfgO20zXTRTUnvTku/a5QELthj1+EpRw
         SQdkiLqXIU/fMCjo++gZFFCMCUb9bM2qbolFzuO6LS+1AFrvxIBmVldG2+gdsFHQgwSM
         Lsz0kfYBvqkZJV0HoJzMq3SMDX2+l1Ex5x1cfDbeJzdpRAGHwkgegufG/xaRdCJG1EQU
         q9Obrs/oUTxunQZy4jv43LGkoDPOThVFwlsMvyoHhwnJKLxCv5dvSxSIQPRpkltZUYSK
         sDMAFBwPxuceoqZKE4Z59HcewXMS4L26vUSCxRkvwOe9gHwdumD7r7JJrON4Pd5WCVpU
         RARA==
X-Gm-Message-State: AO0yUKXbJDJjQ6UETQnbFfM3IHR3muDbzDxlCQvJazJqULyLfFeJoG9S
        tISqPebLg+7g42nMJefdeWWtIg==
X-Google-Smtp-Source: AK7set/5h8OvHzwHdZa8t7WRpHyDlCmAbwfSNzSfFZWUQj5pO3yjNS+ImIIb15Q2AmvMbBLoFt9JVw==
X-Received: by 2002:a05:600c:331e:b0:3dc:5823:d6c0 with SMTP id q30-20020a05600c331e00b003dc5823d6c0mr4222460wmp.6.1675800923588;
        Tue, 07 Feb 2023 12:15:23 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o37-20020a05600c512500b003c6bbe910fdsm21958398wms.9.2023.02.07.12.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 12:15:23 -0800 (PST)
Message-ID: <6461a06b-55fa-e41a-0cf0-5a587ed2c389@linaro.org>
Date:   Tue, 7 Feb 2023 21:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] media: samsung: exynos4-is: drop simple-bus from
 compatibles
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20230207192914.549309-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207192914.549309-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/02/2023 20:29, Krzysztof Kozlowski wrote:
> The FIMC camera node wrapper is not a bus, so using simple-bus fallback
> compatible just to instantiate its children nodes was never correct.
> Driver should explicitly populate all its children devices.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/media/platform/samsung/exynos4-is/media-dev.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
> index 98a60f01129d..70c4ca7844d3 100644
> --- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
> @@ -1440,6 +1440,10 @@ static int fimc_md_probe(struct platform_device *pdev)
>  	if (!fmd)
>  		return -ENOMEM;
>  
> +	ret = devm_of_platform_populate(dev);
> +	if (ret < 0)
> +		return -ENOMEM;
> +

This cannot be devm-like, because on errors unpopulating devices breaks
links and IOMMU. I will make it of_platform_populate() instead.

Best regards,
Krzysztof

