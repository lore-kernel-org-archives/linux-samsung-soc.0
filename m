Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864E7C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:42:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64787610CE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:42:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244859AbhDPOmg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Apr 2021 10:42:36 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40407 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244886AbhDPOmb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Apr 2021 10:42:31 -0400
Received: from mail-ej1-f70.google.com ([209.85.218.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lXPfZ-0000Cu-Od
        for linux-samsung-soc@vger.kernel.org; Fri, 16 Apr 2021 14:42:05 +0000
Received: by mail-ej1-f70.google.com with SMTP id ji8-20020a1709079808b029037c921a9ea0so2084750ejc.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Apr 2021 07:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H3orKY1/6E7It9couZQFwgWHB9x2xfiTMv49UiHX33I=;
        b=a4i0Q5iIDmiUEk1vRLMAhg0kFES0HTMAG8wnMGhug5KDIat9SGOA9MzUsuCXTVSWde
         H65Gpd0CJ9N9lclAfz0U2tTIYhWCHRqh2Fgi0fTzlSZcX6GxjpA1P2OfaOcMFCpHjzy1
         ptv2AvOQSFmNzbGBV2ZQ7ZNIz8Nj1xLlcfWfmVBOTPstnfmfUUjTczXZrfHpSYQy5MSu
         3FVtSkWnwiXQjiY7MQgltdpbItNKHBcYbkGXuHGnfjSGI8h0J1MUMSGDIGsuNnD0ZQtk
         i11+p3pOB1snLA22n9Nf85yEd5H3FJWbLtdT0I3QomCjcZrE8e5eBRqiJVvajkacjg+8
         1/TA==
X-Gm-Message-State: AOAM531VF8w1m2zXcNI1eZFuEVcHrK1UQkerh17dpcsijAW9sNy6iNrT
        AMdDtQbGMxG27nBoDKUInm5RE8h7yBUkToO0RYeb1CtJiwHjnNcO5uNUxX1arAVuYAvzCeDKvZI
        RLgWtaU9MgkmVYvK5DXYwsMwMR8dR26jUGLat/qLvH9bkzYnk
X-Received: by 2002:a17:906:3153:: with SMTP id e19mr8808147eje.351.1618584125253;
        Fri, 16 Apr 2021 07:42:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLYgDmRYOx7mlmnqWjHmwHF8mTlbAilqonRblj7lGIBqxozRBPiD2hV0hjFdS3yuqciMmEQw==
X-Received: by 2002:a17:906:3153:: with SMTP id e19mr8808134eje.351.1618584125122;
        Fri, 16 Apr 2021 07:42:05 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id t7sm5532707edq.42.2021.04.16.07.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 07:42:04 -0700 (PDT)
Subject: Re: [PATCH 38/40] drm/exynos/exynos_drm_ipp: Fix some function name
 disparity issues
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-39-lee.jones@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <81a27ab8-9e2e-8f29-c1dd-19ec54ec3d28@canonical.com>
Date:   Fri, 16 Apr 2021 16:42:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416143725.2769053-39-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/04/2021 16:37, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c:105: warning: expecting prototype for exynos_drm_ipp_ioctl_get_res_ioctl(). Prototype was for exynos_drm_ipp_get_res_ioctl() instead
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c:153: warning: expecting prototype for exynos_drm_ipp_ioctl_get_caps(). Prototype was for exynos_drm_ipp_get_caps_ioctl() instead
> 
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
