Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8CDC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 10 Nov 2021 10:46:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37F91611BF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 10 Nov 2021 10:46:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhKJKtk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 10 Nov 2021 05:49:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbhKJKtj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 05:49:39 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5126C061764
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Nov 2021 02:46:51 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id x15so8862257edv.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Nov 2021 02:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CJ8BKvr5XUSO/Vo4sS7QvREYUZiUN+4dM8bteUPX/YU=;
        b=a5PDaYRSHhLE0B/0FQ+MlW7rePX4lX8rMFt04k9jy714oeV6rCydngg+4chiEab4BB
         0et1lR5054ugeHjiqzoRhGkDg1UoJWAzmwRFvIlBA+ugUkN39qs5cm5is5LIv5WH2xEf
         oEhqQbxoFXx4fNzwMrzHIsDeA0puwKDSYP3nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CJ8BKvr5XUSO/Vo4sS7QvREYUZiUN+4dM8bteUPX/YU=;
        b=rgM31qFVmha0s6HK7S9kZZhx6B+5hUmpyLyu3pAaDs+gpb7kXKmSTfKqSMFgXFozWo
         PWPbovZhkyWIyc4CYGGEJ/O4hTVVGFNfVj40CrHZUOzfyHg1MGyiSEC6drK4WbiZyhGu
         SrFRomFA1Iwz1wYpm7Hnff7whIuoeXHdzMl/6RW+QYNNOWzgeQkGm8B8ppDlGLCaT0XS
         1Zv2uznt4bU8lL8CzH+gDwkLwPzWxpIbVc8QuqAvzhE+x7E1H387R7pl/1K+1GTjArlI
         924JfLlELt4doaSUhIIKP6RJt6CmK7rvUWhi7DUyKl8T+9JyL7zWtiNIm6dEWo5VPEMm
         Qzmg==
X-Gm-Message-State: AOAM530jYe72vbJk/LTmhf+tWLeNSsP1a1LCVOTRgzvxQQ2u2c32MOQc
        f6norS6JKjYiKnNyqK0MM0KTLg==
X-Google-Smtp-Source: ABdhPJzex3EJLJxKesbpcXVhuXhXz8mKsgkAvORtmUcskNu2IAPYg8LWXRVSpkQDC+igoNaKseVJbA==
X-Received: by 2002:aa7:d546:: with SMTP id u6mr20545346edr.311.1636541210512;
        Wed, 10 Nov 2021 02:46:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z10sm14094307edd.12.2021.11.10.02.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 02:46:50 -0800 (PST)
Date:   Wed, 10 Nov 2021 11:46:48 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@canonical.com,
        oleksandr_andrushchenko@epam.com, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/3] drm: Update documentation and TODO of gem_prime_mmap
 hook
Message-ID: <YYujGLFf+spiXMil@phenom.ffwll.local>
References: <20211108102846.309-1-tzimmermann@suse.de>
 <20211108102846.309-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108102846.309-4-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Nov 08, 2021 at 11:28:46AM +0100, Thomas Zimmermann wrote:
> The hook gem_prime_mmap in struct drm_driver is deprecated. Document
> the new requirements.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/todo.rst | 11 -----------
>  include/drm/drm_drv.h      | 11 +++++++----
>  2 files changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 60d1d7ee0719..6593c4c4006e 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -268,17 +268,6 @@ Contact: Daniel Vetter
>  
>  Level: Intermediate
>  
> -Clean up mmap forwarding
> -------------------------
> -
> -A lot of drivers forward gem mmap calls to dma-buf mmap for imported buffers.
> -And also a lot of them forward dma-buf mmap to the gem mmap implementations.
> -There's drm_gem_prime_mmap() for this now, but still needs to be rolled out.
> -
> -Contact: Daniel Vetter
> -
> -Level: Intermediate
> -
>  Generic fbdev defio support
>  ---------------------------
>  
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 0cd95953cdf5..a84eb4028e5b 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -345,11 +345,14 @@ struct drm_driver {
>  	 * mmap hook for GEM drivers, used to implement dma-buf mmap in the
>  	 * PRIME helpers.
>  	 *
> -	 * FIXME: There's way too much duplication going on here, and also moved
> -	 * to &drm_gem_object_funcs.
> +	 * This hook only exists for historical reasons. Drivers must use
> +	 * drm_gem_prime_mmap() to implement it.
> +	 *
> +	 * FIXME: Convert all drivers to implement mmap in struct
> +	 * &drm_gem_object_funcs and inline drm_gem_prime_mmap() into
> +	 * its callers. This hook should be removed afterwards.

I think at least i915 has different semantics between dma-buf mmap and gem
mmap in some cases, so this might be tricky to achieve. But I think
everywhere else this should be solid.
-Daniel

>  	 */
> -	int (*gem_prime_mmap)(struct drm_gem_object *obj,
> -				struct vm_area_struct *vma);
> +	int (*gem_prime_mmap)(struct drm_gem_object *obj, struct vm_area_struct *vma);
>  
>  	/**
>  	 * @dumb_create:
> -- 
> 2.33.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
