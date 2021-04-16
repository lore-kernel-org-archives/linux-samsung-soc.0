Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C296FC43460
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95CA1610CE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244696AbhDPOmI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Apr 2021 10:42:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40353 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244809AbhDPOle (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Apr 2021 10:41:34 -0400
Received: from mail-ej1-f69.google.com ([209.85.218.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lXPef-00007G-63
        for linux-samsung-soc@vger.kernel.org; Fri, 16 Apr 2021 14:41:09 +0000
Received: by mail-ej1-f69.google.com with SMTP id d11-20020a170906370bb029037c87968c04so2090755ejc.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Apr 2021 07:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b25TSBS6UiWWLc/aOExDgRNzZidx4yrWBstLaTFqS8Y=;
        b=o2Vw0A2+k0jZaUOQln2G59F5h0thhqZy4PQbvcIFCcFFQurx3dZ+o2zjRXzB0W6gv8
         fIwxQiDPf2KCuzHHshdHFQ1svw8WJIVB5QIRMpMYdCrUxEjO6qfN1Px+lc77JgG4l//+
         eb0dqtmfM7cQgDi7ASDTci6/bNknPpbaSTvuubiKLc1kQJlab0+j/IMR+bOFf2BnEc+U
         tW46SOyfCoTgF8EVXokfwRMUmlW80fBgXY39ar1fLauG6rmXg1xpL3aChOjfgao3ax5p
         GF58vFS9YyXMS1hl+xfMvHolVVVjUCxVzkT8kFNu8acJaWuoc+IfdT+pe0mN4VIRNDGU
         oMZg==
X-Gm-Message-State: AOAM532N6rTBt+kg5t2bgkOsEszq/2KlQl0wr6F/Vst/KNWwIfnEE1my
        59oKwWphgVMy+MK7DfwT8C9IAkTLX7KMN8w/MYuBlgxZNkTmOVDyCkcrmyRZpmWoCiVB0C2m/qJ
        E/Uj/iYI3DdnTCWYrxl097dw6L0SmTDSS2QFtu0nFAzSw+4Vg
X-Received: by 2002:aa7:c40b:: with SMTP id j11mr10408441edq.219.1618584068506;
        Fri, 16 Apr 2021 07:41:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlc2f00RlqR/ykNACjQsXBZXVvhiN61LyMrfeRQGlPwDyvhCSQPMZ1jgI6EptuQv5bwl2/qQ==
X-Received: by 2002:aa7:c40b:: with SMTP id j11mr10408420edq.219.1618584068345;
        Fri, 16 Apr 2021 07:41:08 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id y7sm5629666edq.88.2021.04.16.07.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 07:41:07 -0700 (PDT)
Subject: Re: [PATCH 36/40] drm/exynos/exynos7_drm_decon: Realign function name
 with its header
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akshu Agarwal <akshua@gmail.com>,
        Ajay Kumar <ajaykumar.rs@samsung.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-37-lee.jones@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9b6753f4-a448-514d-85b0-2f3ab3049f1c@canonical.com>
Date:   Fri, 16 Apr 2021 16:41:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416143725.2769053-37-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/04/2021 16:37, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c:355: warning: expecting prototype for shadow_protect_win(). Prototype was for decon_shadow_protect_win() instead
> 
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Akshu Agarwal <akshua@gmail.com>
> Cc: Ajay Kumar <ajaykumar.rs@samsung.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
