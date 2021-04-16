Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B6EC433ED
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:47:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EECBF61107
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:47:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245293AbhDPOrz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Apr 2021 10:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244897AbhDPOrz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Apr 2021 10:47:55 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B95BC061756
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Apr 2021 07:47:29 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id r9so42529453ejj.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Apr 2021 07:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=g0XKUS1TlHQQdNyUmvZMzlYJbLqAhGmFHXulH+uYRNc=;
        b=f2ZDTmiEuxYYa86N6C2qnat3M3pM2bVpaAu8VGRFYHaK2P0DpmovNk6o3hjJWiPUlD
         o7G+UY8ZoobPKwIv1mPIMzcC6jIIsrQnz9MmvkFQQDbJESSFCCtp4DI555jrRDVsnAFq
         lqLTXtBHIRmFIPOJr469vpYRjut7wS7s5Z2I4UdSPsC0JOoF/6nihD0rAqCQGONxFceB
         aIPTbvELdUWV3srRx4qBjZklNeztXm++7k5YcAGOiVoe72zUDwYVB2GZTRtq9cEUzK3R
         h8MDLgKeQtLVZ5EnMn6IxlNxQSD/CSrHJA7qWSnvUh/SU/CIxia85W7Vv0HRuI15Pc9q
         w9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=g0XKUS1TlHQQdNyUmvZMzlYJbLqAhGmFHXulH+uYRNc=;
        b=Tcu1Qd5BumCn2BYoOHhJX5E+AhOnKpSbYCuw9krlcVU3v592jBKRxB5EpPOuditat1
         K9YNEQ4UMzb4TqLE8n0riLU0E8PG+VZkyfb7l/4b7smb8ucP4CliJD6M/K7aSYkBI2OV
         XK9ZNLwdRgRTTvev1m5+sLXyrddp1icSiN16Ey/4+Y4U0pLZuQl2lJkxKZxy9E7GlHTl
         /73V42OMVmBUs+5BHgOQyiQ5vKrJ30czFHHaBlViXrz2TtAS65P/X5TxbgfumRuJ+5tM
         IVLmC1I/A23vY+/eOhERjRTtHdGJOLPON1hEnTyJGXnOH1iK0sk0fgwEK5KX5v7miovG
         chIQ==
X-Gm-Message-State: AOAM533e8oOytVuMPyTYLW4r9UK7u5w2UNIGJU256RamYdr8BzmxDfCx
        q4pN6+pmrDN1MrIqKjz0YBXcnQ==
X-Google-Smtp-Source: ABdhPJwK7OS5GZ6fsGB4Jf+dnVda/NwOxPrNHCrgw7AUMQ4UAFFNFcBcXSU20uxtVOc2TeiOy2SjEg==
X-Received: by 2002:a17:906:1c17:: with SMTP id k23mr8876981ejg.266.1618584448071;
        Fri, 16 Apr 2021 07:47:28 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id o6sm5646765edw.24.2021.04.16.07.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 07:47:27 -0700 (PDT)
Date:   Fri, 16 Apr 2021 15:47:21 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 34/40] drm/exynos/exynos_drm_fimd: Realign function name
 with its header
Message-ID: <20210416144721.GZ4869@dell>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-35-lee.jones@linaro.org>
 <f871839d-6b1b-84b4-19d1-860d209ef193@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f871839d-6b1b-84b4-19d1-860d209ef193@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 16 Apr 2021, Krzysztof Kozlowski wrote:

> On 16/04/2021 16:37, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c:734: warning: expecting prototype for shadow_protect_win(). Prototype was for fimd_shadow_protect_win() instead
> > 
> > Cc: Inki Dae <inki.dae@samsung.com>
> > Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Hi Lee,
> 
> I already sent a fix for this one on 5th of April:
> https://lore.kernel.org/lkml/20210405181524.52426-1-krzysztof.kozlowski@canonical.com/

No problem.  Thanks for letting me know.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
