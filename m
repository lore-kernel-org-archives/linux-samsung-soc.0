Return-Path: <SRS0=Wlns=CZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF06C43461
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 19:02:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F6E0206B2
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 19:02:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Gf8367WP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbgIPTCW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 16 Sep 2020 15:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbgIPRsf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 13:48:35 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13043C0698CE
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2020 04:31:58 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a17so6530028wrn.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2020 04:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s0lmtJr9NtSCh2ARFa6xphTVLFrbX2QsJYq/k2jzQ5U=;
        b=Gf8367WPeSeQPQPququqR9nmCFZMOfneoLHOSZNngAZR6FN2a/oYqM2srKfxMlffls
         y3lwL3nsdUYo4QYi65kWsWkPt53jlGyhlIKucwEnvyHoLGlzIkdEYE798B0fVOq9JPNb
         cBFavPvt6MU2augrp90p56CBz8CIaWxEaUJYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s0lmtJr9NtSCh2ARFa6xphTVLFrbX2QsJYq/k2jzQ5U=;
        b=RZNsbSpfOd0eWCGf/T8/v0n4D/pN7jshUvcG4xBb36KEfXUKjNG3loiovu4CyOXWao
         2g0K22pl9G3f1ad9MwLTOJVe+MufBVKQFQ8+AYf1kWO1H0AFrWXpN+5pBQi8FLJtw098
         pFNjCBcJtaoKA1uPjCQQFyNGSm9iSvR+Ybnj79PaJ84uVbvPiYqAqKNg2xq/Q8iQcaoc
         1tBtlb6PdfXEo/jDvx3gXyjm0oAoJu4FWz03aqC+c3VT0rFMGScqbQ8CwxyshL2Hnrpi
         G9QgNEgkJsDiybTTLcxBwou/nGzgGAvmb+bZpcFkn7X5decRIjZYJRr43dVfSV2Mamwn
         3HOQ==
X-Gm-Message-State: AOAM5328NjyJjTgfn8oAC/cVw9tak8u9ePjedpneBHKJjqLyw5xrZveR
        yiiWfXeDKeP23KyAm/CtIq390A==
X-Google-Smtp-Source: ABdhPJwDUHLS9jy7ETv8dWHdpP/K//iCwwECKpW/tCNWTEIypWcTfch4omPC7wkyf4knOCNGQ9EKaQ==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr25445792wrp.286.1600255917009;
        Wed, 16 Sep 2020 04:31:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u186sm4255475wmu.34.2020.09.16.04.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 04:31:55 -0700 (PDT)
Date:   Wed, 16 Sep 2020 13:31:52 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        l.stach@pengutronix.de, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
        tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com,
        heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
        laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
        sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
        tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
        andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
        xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
        chris@chris-wilson.co.uk, matthew.auld@intel.com,
        tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com,
        sam@ravnborg.org, miaoqinglang@huawei.com,
        emil.velikov@collabora.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 05/21] drm/gma500: Introduce GEM object functions
Message-ID: <20200916113152.GJ438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-6-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Sep 15, 2020 at 04:59:42PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in gma500.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/gma500/framebuffer.c |  2 ++
>  drivers/gpu/drm/gma500/gem.c         | 18 ++++++++++++++++--
>  drivers/gpu/drm/gma500/gem.h         |  3 +++
>  drivers/gpu/drm/gma500/psb_drv.c     |  9 ---------
>  drivers/gpu/drm/gma500/psb_drv.h     |  2 --
>  5 files changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
> index 54d9876b5305..5ede24fb44ae 100644
> --- a/drivers/gpu/drm/gma500/framebuffer.c
> +++ b/drivers/gpu/drm/gma500/framebuffer.c
> @@ -24,6 +24,7 @@
>  #include <drm/drm_gem_framebuffer_helper.h>
>  
>  #include "framebuffer.h"
> +#include "gem.h"
>  #include "gtt.h"
>  #include "psb_drv.h"
>  #include "psb_intel_drv.h"
> @@ -285,6 +286,7 @@ static struct gtt_range *psbfb_alloc(struct drm_device *dev, int aligned_size)
>  	/* Begin by trying to use stolen memory backing */
>  	backing = psb_gtt_alloc_range(dev, aligned_size, "fb", 1, PAGE_SIZE);
>  	if (backing) {
> +		backing->gem.funcs = &psb_gem_object_funcs;
>  		drm_gem_private_object_init(dev, &backing->gem, aligned_size);
>  		return backing;
>  	}
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index f9c4b1d76f56..8f07de83b6fb 100644
> --- a/drivers/gpu/drm/gma500/gem.c
> +++ b/drivers/gpu/drm/gma500/gem.c
> @@ -18,7 +18,9 @@
>  
>  #include "psb_drv.h"
>  
> -void psb_gem_free_object(struct drm_gem_object *obj)
> +static vm_fault_t psb_gem_fault(struct vm_fault *vmf);
> +
> +static void psb_gem_free_object(struct drm_gem_object *obj)
>  {
>  	struct gtt_range *gtt = container_of(obj, struct gtt_range, gem);
>  
> @@ -36,6 +38,17 @@ int psb_gem_get_aperture(struct drm_device *dev, void *data,
>  	return -EINVAL;
>  }
>  
> +static const struct vm_operations_struct psb_gem_vm_ops = {
> +	.fault = psb_gem_fault,
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};
> +
> +const struct drm_gem_object_funcs psb_gem_object_funcs = {
> +	.free = psb_gem_free_object,
> +	.vm_ops = &psb_gem_vm_ops,
> +};
> +
>  /**
>   *	psb_gem_create		-	create a mappable object
>   *	@file: the DRM file of the client
> @@ -63,6 +76,7 @@ int psb_gem_create(struct drm_file *file, struct drm_device *dev, u64 size,
>  		dev_err(dev->dev, "no memory for %lld byte GEM object\n", size);
>  		return -ENOSPC;
>  	}
> +	r->gem.funcs = &psb_gem_object_funcs;
>  	/* Initialize the extra goodies GEM needs to do all the hard work */
>  	if (drm_gem_object_init(dev, &r->gem, size) != 0) {
>  		psb_gtt_free_range(dev, r);
> @@ -123,7 +137,7 @@ int psb_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>   *	vma->vm_private_data points to the GEM object that is backing this
>   *	mapping.
>   */
> -vm_fault_t psb_gem_fault(struct vm_fault *vmf)
> +static vm_fault_t psb_gem_fault(struct vm_fault *vmf)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct drm_gem_object *obj;
> diff --git a/drivers/gpu/drm/gma500/gem.h b/drivers/gpu/drm/gma500/gem.h
> index 4a74dc623b6b..3741a711b9fd 100644
> --- a/drivers/gpu/drm/gma500/gem.h
> +++ b/drivers/gpu/drm/gma500/gem.h
> @@ -8,6 +8,9 @@
>  #ifndef _GEM_H
>  #define _GEM_H
>  
> +extern const struct drm_gem_object_funcs psb_gem_object_funcs;
> +
>  extern int psb_gem_create(struct drm_file *file, struct drm_device *dev,
>  			  u64 size, u32 *handlep, int stolen, u32 align);
> +
>  #endif
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 34b4aae9a15e..b13376a6fb91 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -480,12 +480,6 @@ static const struct dev_pm_ops psb_pm_ops = {
>  	.runtime_idle = psb_runtime_idle,
>  };
>  
> -static const struct vm_operations_struct psb_gem_vm_ops = {
> -	.fault = psb_gem_fault,
> -	.open = drm_gem_vm_open,
> -	.close = drm_gem_vm_close,
> -};
> -
>  static const struct file_operations psb_gem_fops = {
>  	.owner = THIS_MODULE,
>  	.open = drm_open,
> @@ -507,9 +501,6 @@ static struct drm_driver driver = {
>  	.irq_uninstall = psb_irq_uninstall,
>  	.irq_handler = psb_irq_handler,
>  
> -	.gem_free_object_unlocked = psb_gem_free_object,
> -	.gem_vm_ops = &psb_gem_vm_ops,
> -
>  	.dumb_create = psb_gem_dumb_create,
>  	.ioctls = psb_ioctls,
>  	.fops = &psb_gem_fops,
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> index 956926341316..c71a5a4e912c 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -735,12 +735,10 @@ extern const struct drm_connector_helper_funcs
>  extern const struct drm_connector_funcs psb_intel_lvds_connector_funcs;
>  
>  /* gem.c */
> -extern void psb_gem_free_object(struct drm_gem_object *obj);
>  extern int psb_gem_get_aperture(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  extern int psb_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  			struct drm_mode_create_dumb *args);
> -extern vm_fault_t psb_gem_fault(struct vm_fault *vmf);
>  
>  /* psb_device.c */
>  extern const struct psb_ops psb_chip_ops;
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
