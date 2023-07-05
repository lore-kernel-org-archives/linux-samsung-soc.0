Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584E6C001B1
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Jul 2023 09:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231818AbjGEJEN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Jul 2023 05:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbjGEJEM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 05:04:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E15121
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 02:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688547804;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rSX7qOujOrm27lX5ys/0lBz1p5bJBCSZMCXRlfpyvEg=;
        b=Q26ZwIhJ6DuOdfvKNzdxqgryMFUqoo+CKIj9fdTdQkSTfqsZRvSzhSGgBva2aCxqWfiu/W
        VykWv/d0I/iz+vm9kC5tfSsvCGEnazrSzNzD/KPNo8/2pG43sxoCcVuSwi/4yCnNt2qhCT
        FaKdI1/Zna7r9WnrNGxQdR4iqZXdbqQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-LXL5bJOeOnmuQQJe6d4dXA-1; Wed, 05 Jul 2023 05:03:23 -0400
X-MC-Unique: LXL5bJOeOnmuQQJe6d4dXA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3fbdde92299so13036845e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jul 2023 02:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688547803; x=1691139803;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rSX7qOujOrm27lX5ys/0lBz1p5bJBCSZMCXRlfpyvEg=;
        b=TgGLYAh//t2JtzZhRQMn9S9M655Dkytkg91T635gNlMte39MRv0R8ZRmkp65shyvHy
         ub8LkHwSk34ww4SvclqyuFn3UJeL/Hj/8EAzHbCX/x3tfu5fcjUHmy2yH7sIdPUYW4KP
         ZAGxrpt4oYVdQfesXH0AO31crujp9n1/hK/KbGSyrUnaGsNv3GVXlRf6pwhaXuFQ2dA9
         l0+iW5yUxWDYWg/Gx9eSs4+yphW0lYi4WjTQuXfkaUuTKrXwQoUjZtIoHDyp9ICcqKCR
         7nou0RodfqMa4QgDqwvMqBLF8KS2dvJ8IwjE92G5fCosT4Pd85Z/QP6L5r3dHeJ+s7yx
         tAug==
X-Gm-Message-State: AC+VfDyXxLqlqf7GqTXD5ZO2iJl80VvXleZN4TUcrWRTq4zEKxhoPXfF
        uiaphw04dfowrA/3VRhvMfckUux/j3nWf9hHFNA72CsMr27iipIn+3p1rH+r9/IO213vdQ8n+8d
        nGiFNEXSDddZkXh7v2YJ+AGt5dJWwOhk=
X-Received: by 2002:a1c:f314:0:b0:3fb:adc0:609b with SMTP id q20-20020a1cf314000000b003fbadc0609bmr14653364wmq.13.1688547802806;
        Wed, 05 Jul 2023 02:03:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4D75aEjUYAXwEsqp9EVXq6EMXjhrEVDhsSnE0141Cb1WbjzG1CyfPykxapyYpYnd68hWU11g==
X-Received: by 2002:a1c:f314:0:b0:3fb:adc0:609b with SMTP id q20-20020a1cf314000000b003fbadc0609bmr14653330wmq.13.1688547802102;
        Wed, 05 Jul 2023 02:03:22 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m11-20020a7bce0b000000b003f90b9b2c31sm1507833wmc.28.2023.07.05.02.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 02:03:21 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 07/10] drm/omapdrm: Set VM flags in GEM-object mmap
 function
In-Reply-To: <20230704160133.20261-8-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-8-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 11:03:21 +0200
Message-ID: <87o7kqraqu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the mmap callback in struct drm_gem_object_funcs to set the
> VM flags. Replace a number of mmap helpers in omapdrm with their
> GEM helper counterparts. Generate DRM's file-operations instance
> with GEM's DEFINE_DRM_GEM_FOPS.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---

> +static int omap_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  {
>  	struct omap_gem_object *omap_obj = to_omap_bo(obj);
>  
> -	vm_flags_mod(vma, VM_MIXEDMAP, VM_PFNMAP);
> +	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO | VM_MIXEDMAP);
>  
>  	if (omap_obj->flags & OMAP_BO_WC) {
>  		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> @@ -563,12 +548,14 @@ int omap_gem_mmap_obj(struct drm_gem_object *obj,
>  		 * address_space (so unmap_mapping_range does what we want,
>  		 * in particular in the case of mmap'd dmabufs)
>  		 */
> -		vma->vm_pgoff = 0;
> +		vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
>  		vma_set_file(vma, obj->filp);
>  
>  		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>  	}
>  
> +	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> +
>  	return 0;
>  }
>

I think this rework deserves a more elaborated commit message.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

