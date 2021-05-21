Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6615C47076
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 May 2021 15:31:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4A5B613D8
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 May 2021 15:31:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237435AbhEUPdB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 May 2021 11:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232010AbhEUPdB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 May 2021 11:33:01 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262D3C061574
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 May 2021 08:31:38 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id f20-20020a05600c4e94b0290181f6edda88so732053wmq.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 May 2021 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BQooRokNzYu+8L1z5m8iD9Xdikuak2pvynvEV5qLXGA=;
        b=i+dVyKE9llJ409BIktxahKJ2hedAcOuyBrShYy27YcSgdX+KQPWeCnIYejwgJ1lk2N
         IPTXfZKemezA+Cno3dHOoDgwZX2lR0OrCSMzfTVUmR/LrzaB1zBx51kjJUg8va+iRLO4
         5guxjCj1e/w1Ef/otGl5Ti6AY5n0oFfvok/h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BQooRokNzYu+8L1z5m8iD9Xdikuak2pvynvEV5qLXGA=;
        b=fG0i0WSoAAbper/cLuSFW/7CXpFtoZq9XHfLvhBREIdE9+p+uZXBcqkUNwXkJhBRZu
         cwYowWpIVVYa2hKm0MWu7ujpNSbGr5zAWjKkE7Kh2YGWMacW5/s3yyJ6wU0z0h2fCLa2
         kL9eKlTsZx9Hu3L+y4aqVxBxvrKUbJsNDBjSMu4I/I7F2m4QDwTajt/gS2q5GWEPQ9VE
         aS6YuUxwKWUxPnMCyYPizDAOb22kwkZp99AYug8xFJIzK5q/Q+ia5IrXIb+bddwinsRf
         AeOi6Y9kUOVJNAZXQ5bE6m4QKwik207tNwMC2smV1DcyYJoZ9wA/HsTAx0CiiGMV3pO5
         egiw==
X-Gm-Message-State: AOAM531//vzXhSURzZCCdENnVla8Bt1Y/lmSAiH+OjuupJZqhvcq7ieL
        dK44wn3wmPGigzwWCwD10CUl/w==
X-Google-Smtp-Source: ABdhPJxHXpkSiCSjtUwFEOSowutWtJr5778QWzm3dwsHfDEBRBsOsd4q7nG7TA7B3jciQ3PNG0+RrA==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr9417366wml.168.1621611096262;
        Fri, 21 May 2021 08:31:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l16sm9195415wmj.47.2021.05.21.08.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 08:31:35 -0700 (PDT)
Date:   Fri, 21 May 2021 17:31:33 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     inki.dae@samsung.com, airlied@linux.ie, daniel@ffwll.ch,
        krzysztof.kozlowski@canonical.com, dri-devel@lists.freedesktop.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2] drm/exynos: Use pm_runtime_resume_and_get() to
 replace open coding
Message-ID: <YKfSVdw16TPLlEKX@phenom.ffwll.local>
References: <1621587966-62687-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621587966-62687-1-git-send-email-tiantao6@hisilicon.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, May 21, 2021 at 05:06:06PM +0800, Tian Tao wrote:
> use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle.

It would be good to explain why: Apparently get_sync increments the
refcount even if it fails, which ususally leads to leaks.

With that or similar added to the commit message:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
> 
> v2: drop unnecessary change about if condition.
> ---
>  drivers/gpu/drm/exynos/exynos_drm_mic.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> index 3821ea7..32672bf 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> @@ -268,11 +268,9 @@ static void mic_pre_enable(struct drm_bridge *bridge)
>  	if (mic->enabled)
>  		goto unlock;
>  
> -	ret = pm_runtime_get_sync(mic->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(mic->dev);
> +	ret = pm_runtime_resume_and_get(mic->dev);
> +	if (ret < 0)
>  		goto unlock;
> -	}
>  
>  	mic_set_path(mic, 1);
>  
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
