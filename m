Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16318C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Oct 2021 16:51:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F168961AAB
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Oct 2021 16:51:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354802AbhJAQw6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 1 Oct 2021 12:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354604AbhJAQw6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Oct 2021 12:52:58 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5001C061775
        for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Oct 2021 09:51:13 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id v25so5837110wra.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Oct 2021 09:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aWc04FVFbnD+y7yRpbWGtfVv1ySLSPX/fcKqMjm+70A=;
        b=bPqlDe4wsW8lHXd/0s10l2Io6hrThjzp4TnGqp9iiUwYX6JjL/attmbSCl7A9FhxWO
         NOYHGLS2T4cNLD71i6K2ag9GcSlVLRFeOxVASsyN4owZR4M1RwcTDUIBE30onAU0YMiS
         vyaAMDZ9EVFl7Y2uvHoSxdVTGQoERu3cu/+z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aWc04FVFbnD+y7yRpbWGtfVv1ySLSPX/fcKqMjm+70A=;
        b=jvoQQTcCHhdxTW7PniwGPQFheoDs2tvEjjMqnjp/imcZXABcATEKSII5hNjSNHUHkd
         TF5txapDvLQzfQDauvGXQ50y0UkraDfqYLC6pH+tqHSxZhtNcMP9CfADsXApe6w44hRt
         23ETeEg6h9iZmm0rD529abcMCosChf+y3TlErtjco1Gz1j9uZQ/mIUTtMXHQCjfdxiWG
         rzRmWW8yGvdnkmUbhgDU/rgOnauevb2BihbBsBGgsgYy0s+Rq6cFvGwt/8yuwwv9VWbi
         7K0V1me6MLRW7THeDPR5sAM9pAlH+liXyqdSmUkOZLjDErSYJYMp3KyswO42MyLdwlNo
         VcmQ==
X-Gm-Message-State: AOAM533ycIPp2BMmbyRyaf3XlvS5jp6mFASdzqeA1oXTEhe5zFJco3am
        O7dFJP+++yzKOWn4BmKBRzU5iKF40Mmjhw==
X-Google-Smtp-Source: ABdhPJwI4mtzsvYvvWE8R9a1y2Vo044CIzcQjA4RApUgW8v+gnQdNMp1eCx9WzsusQHO7YqVi3/Xjw==
X-Received: by 2002:a5d:4243:: with SMTP id s3mr14706090wrr.216.1633107072172;
        Fri, 01 Oct 2021 09:51:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id k17sm8401523wmj.0.2021.10.01.09.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 09:51:11 -0700 (PDT)
Date:   Fri, 1 Oct 2021 18:51:09 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Inki Dae <inki.dae@samsung.com>
Cc:     airlied@linux.ie, dri-devel@lists.freedesktop.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [GIT PULL] exynos-drm-fixes
Message-ID: <YVc8fXoVf0gMlT2V@phenom.ffwll.local>
References: <20210928074158.2942-1-inki.dae@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928074158.2942-1-inki.dae@samsung.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Sep 28, 2021 at 04:41:58PM +0900, Inki Dae wrote:
> Hi Dave,
> 
>    Just one clean up to use helper function.
> 
> Please kindly let me know if there is any problem.
> 
> Thanks,
> Inki Dae
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.15-rc4
> 
> for you to fetch changes up to 17ac76e050c51497e75871a43aa3328ba54cdafd:
> 
>   drm/exynos: Make use of the helper function devm_platform_ioremap_resource() (2021-09-16 14:05:07 +0900)
> 
> ----------------------------------------------------------------
> One cleanup
> - Use devm_platform_ioremap_resource() helper function instead of old
>   one.

Pulled into drm-fixes, thanks.
-Daniel

> 
> ----------------------------------------------------------------
> Cai Huoqing (1):
>       drm/exynos: Make use of the helper function devm_platform_ioremap_resource()
> 
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 +---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 4 +---
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c      | 5 +----
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 4 +---
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 5 +----
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c       | 6 +-----
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 4 +---
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 4 +---
>  drivers/gpu/drm/exynos/exynos_hdmi.c          | 4 +---
>  9 files changed, 9 insertions(+), 31 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
