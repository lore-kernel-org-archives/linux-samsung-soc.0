Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3199CC43460
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 08:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03EA460FE6
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 08:41:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbhDTImN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 04:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhDTImN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 04:42:13 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE034C06174A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 01:41:41 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id h10so43996016edt.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kTvIrhd5T0TmCSro7OLiMHWa1HxRfzT9Q0+pVpW/bYk=;
        b=DSigTbIsYkqSL3KITeBAXN/N0hP3Ld+165PN23dIeZJXGLdonEiXwLRfVPmWBp1go5
         FCrjItUox6HVivFasOP0JdWtU+i6ljo4CQQd6ILT0zdcdEAyW/ADSXxoKOwqOB2pxPGi
         zrM3Px+4JKJyk5BoGWJTlyOXmMvELNvZBsbxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=kTvIrhd5T0TmCSro7OLiMHWa1HxRfzT9Q0+pVpW/bYk=;
        b=T+MLZlRdHaU1ErpZ3xhr6PATbCDPixc6/RwNUJwMf8njRx6w6II9Q+LDSyl67HWaOC
         bXtFRFPvfthV/TTdAGo7u0JdmMF5XjECg08eKQ9h+VwQCRoLLISIuYiwuvztYfkHEo9U
         +v95AQg4a6lY4jZuT06UJIGiZG94exA5j/qbzdFeQbTLpCCyYx9M7634IBrgrOB/vTf4
         L+g3eqS0UepmkeA+zC+JRbzdsA7BJx/ACg0uepEe1TsdkGGC+5PS/VJpfCYKIZ4XLz1U
         nf8Kw9kbiRCKEnUF3htQxuRxzaU4KenHWrjw/RpvBbjtIr2ghvtowhogM57/hHddqXZ1
         18uw==
X-Gm-Message-State: AOAM532XrqXbOqDGKURp9c9w+B5bqmQ1Bas1WEOmYROtu/l4b2BqmtEu
        Nj+uWTeH97j8MIsl6R07ING0kQ==
X-Google-Smtp-Source: ABdhPJx2ryokP8VgMHZsZx3rV56DrXASKZhZO9f8TLrCQaNIsfP8YRMpAEE06MpiBvJ1iiDmKkZNzA==
X-Received: by 2002:a05:6402:42c9:: with SMTP id i9mr31162294edc.35.1618908100756;
        Tue, 20 Apr 2021 01:41:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a21sm12068247ejk.15.2021.04.20.01.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 01:41:40 -0700 (PDT)
Date:   Tue, 20 Apr 2021 10:41:38 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Inki Dae <inki.dae@samsung.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 03/12] drm/exynos: Don't set allow_fb_modifiers explicitly
Message-ID: <YH6TwgrVIUlQwH2g@phenom.ffwll.local>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
 <CGME20210413094922epcas1p47e75ce008a78971af7a923aadc0b9d3b@epcas1p4.samsung.com>
 <20210413094904.3736372-3-daniel.vetter@ffwll.ch>
 <df4acc12-27da-3a81-6e2b-eee197107341@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df4acc12-27da-3a81-6e2b-eee197107341@samsung.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Apr 20, 2021 at 03:31:27PM +0900, Inki Dae wrote:
> 
> 
> 21. 4. 13. 오후 6:48에 Daniel Vetter 이(가) 쓴 글:
> > Since
> > 
> > commit 890880ddfdbe256083170866e49c87618b706ac7
> > Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Date:   Fri Jan 4 09:56:10 2019 +0100
> > 
> >     drm: Auto-set allow_fb_modifiers when given modifiers at plane init
> > 
> > this is done automatically as part of plane init, if drivers set the
> > modifier list correctly. Which is the case here.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Acked-by: Inki Dae <inki.dae@samsung.com>

Thanks for taking a look, pushed to drm-misc-next.
-Daniel

> 
> Thanks,
> Inki Dae
> 
> > Cc: Inki Dae <inki.dae@samsung.com>
> > Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_fb.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> > index 64370b634cca..79fa3649185c 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> > @@ -177,7 +177,5 @@ void exynos_drm_mode_config_init(struct drm_device *dev)
> >  	dev->mode_config.funcs = &exynos_drm_mode_config_funcs;
> >  	dev->mode_config.helper_private = &exynos_drm_mode_config_helpers;
> >  
> > -	dev->mode_config.allow_fb_modifiers = true;
> > -
> >  	dev->mode_config.normalize_zpos = true;
> >  }
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
