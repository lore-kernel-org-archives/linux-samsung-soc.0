Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA36EC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:41:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89A8760FE5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:41:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245194AbhDPOlY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Apr 2021 10:41:24 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40316 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245221AbhDPOke (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Apr 2021 10:40:34 -0400
Received: from mail-ej1-f71.google.com ([209.85.218.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lXPdg-0008Us-SP
        for linux-samsung-soc@vger.kernel.org; Fri, 16 Apr 2021 14:40:08 +0000
Received: by mail-ej1-f71.google.com with SMTP id k5-20020a1709061c05b029037cb8a99e03so2078121ejg.16
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Apr 2021 07:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GSjWTZ/Z5DNODKF+c0WPTkeFDX79xKYMxkTcm2HoLd4=;
        b=YYE/4IzYbJR5ZaRIyAgjQ4R35UKK3Tz93yZRF5yYx13xR0lclHYykyl5M23kbn9q3h
         o1Yv8D+EKLeB/h1DaZNSxFg6WmL5/R8pHCeICN0mv+Gk5RvMr53QpBWZq/Jev3CkhwX/
         9Yr5XZs41D4SYFmJzXmWQJbCGGPAZ35+bCCzw8aMi/nQ4ln0Ag1Se7NyZWDyYwYtKtFG
         jfVT0/gyfVE6KdV2nNWjOUK1JzERyt5YhucrRBLZQpiafxlHTg7UbWH/hkC2Yr+lcT08
         pccctbFQS+uROgZV718jmRRXdbyM0/53/I6g6GIn7FsWWccg2bXNYieUCVSs33n/xFyX
         xMeg==
X-Gm-Message-State: AOAM531UUIYLUQ3QYpvfdOlyaU1GOXm/WEG9cbqNv1a/yZ98lAPhcZ4N
        KK654ePef1LD0vDNFzkWe/kPf7dxT1LyQojGiA0ShtjiDscXs4hEABU+PgwhMyJdzJWw3fEZBYK
        BQENE+AZ1IahBrjM5+cIUoIf3U3t7ptGSn9p+vvdzvCq4cAW1
X-Received: by 2002:a05:6402:3592:: with SMTP id y18mr10107027edc.360.1618584008186;
        Fri, 16 Apr 2021 07:40:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqIT1TOvyHKrbuARFcYx9jG1/j3L7k9n1N225zWDszydFHt4CPZHqWrxmI/gzjjqbJS3IMcg==
X-Received: by 2002:a05:6402:3592:: with SMTP id y18mr10107011edc.360.1618584008076;
        Fri, 16 Apr 2021 07:40:08 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id m14sm1832815edc.18.2021.04.16.07.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 07:40:07 -0700 (PDT)
Subject: Re: [PATCH 34/40] drm/exynos/exynos_drm_fimd: Realign function name
 with its header
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-35-lee.jones@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f871839d-6b1b-84b4-19d1-860d209ef193@canonical.com>
Date:   Fri, 16 Apr 2021 16:40:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416143725.2769053-35-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/04/2021 16:37, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c:734: warning: expecting prototype for shadow_protect_win(). Prototype was for fimd_shadow_protect_win() instead
> 
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi Lee,

I already sent a fix for this one on 5th of April:
https://lore.kernel.org/lkml/20210405181524.52426-1-krzysztof.kozlowski@canonical.com/


Best regards,
Krzysztof

> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 49a2e0c539187..ae576122873e0 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -723,7 +723,7 @@ static void fimd_win_set_colkey(struct fimd_context *ctx, unsigned int win)
>  }
>  
>  /**
> - * shadow_protect_win() - disable updating values from shadow registers at vsync
> + * fimd_shadow_protect_win() - disable updating values from shadow registers at vsync
>   *
>   * @ctx: local driver data
>   * @win: window to protect registers for
> 

