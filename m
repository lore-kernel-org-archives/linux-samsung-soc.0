Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA8BC001B0
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Jul 2023 08:35:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbjGEIfc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Jul 2023 04:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbjGEIfb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 04:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8001716
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 01:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688546079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MUOdZ4jqa/jKVAp7tf5tIQFJQKaJ8W9OX/5MST4+nx0=;
        b=BQX4OAWtrKI5e6KEIyYQ00IlnS+cFEsRD+YyGnQJSuKGE/a0mfMyKmblqPXFhJvrAdiAWx
        nbLnv7V5wt9iD9AVeBFlOoAu0Vc5qYfLda0hOMx4cK+BJOrEqCZM6TD8unluy3rPkeoWxi
        5SMk1/OVEPLmYWbQrjn8mcPcyLCydao=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-5XZyjptoMrGpawEL4oKTsQ-1; Wed, 05 Jul 2023 04:34:38 -0400
X-MC-Unique: 5XZyjptoMrGpawEL4oKTsQ-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4edc7406cb5so5521505e87.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jul 2023 01:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688546077; x=1691138077;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUOdZ4jqa/jKVAp7tf5tIQFJQKaJ8W9OX/5MST4+nx0=;
        b=FNvDAltNrtQKKprIr54/n+1U51F+VxxBKq33+FHKWG19bKLx2OzaYh253PKU58rSft
         P6LMF+Rv7PiVdC8z6mKSCnUaMYKwWX74lcSJXPYT3ZaV3RI6yLxw7raD4gz1uHSmXlrM
         zgCmdoFNOqCHQ7rv33J78ZKzv0qews41K6GSFbi1mXqYVF2hfiv1l598R3gZznR11Rfw
         1/AbW9CYUI3UiHebasm4D3aSfK76JdS3rO91qcwuDdj6uSisnUxd32kj7C5Y6DqNG/0S
         IwLHNxatuDBbAMvH3XuI8qJAlwZIGeHhsvl9S//XdH7MFxTb6llLUkstkFetrd3PazA9
         bdmQ==
X-Gm-Message-State: ABy/qLbrcddAcKaZrmVdZz1X7YaygbqAE5whx8uupnxgf5P1VtjRVr1U
        7gI5VMl6lMvZD/NjfbFBwBMmOg1GYVuEZe/BCGasvVMi19Cw/qNXmdR3BdVJiDNQoYZ/83XvOXH
        e5VUEGYh49PqRUHuC08LoF8JuA2YUhh8=
X-Received: by 2002:a19:5012:0:b0:4f9:567a:7a59 with SMTP id e18-20020a195012000000b004f9567a7a59mr12555432lfb.30.1688546076852;
        Wed, 05 Jul 2023 01:34:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlExsFBiiX6bb3J4q5RqDUoq+KcMvZbY+mbCkL7JfUUF8owQK16V9ABMtujWwpj0RBMM4IyVjA==
X-Received: by 2002:a19:5012:0:b0:4f9:567a:7a59 with SMTP id e18-20020a195012000000b004f9567a7a59mr12555416lfb.30.1688546076566;
        Wed, 05 Jul 2023 01:34:36 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id a15-20020adffacf000000b0031434c08bb7sm8537215wrs.105.2023.07.05.01.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 01:34:36 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH 04/10] drm/tegra: Set fbdev flags
In-Reply-To: <20230704160133.20261-5-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-5-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 10:34:35 +0200
Message-ID: <87wmzerc2s.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Set fbdev default flags FBNFO_DEFAULT and mark the framebuffer with
> FBINFO_VIRTFB. The framebuffer range is in DMA-able memory and should
> be accessed with the CPU's regular memory ops.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/fbdev.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
> index 82577b7c88da..8074430c52f1 100644
> --- a/drivers/gpu/drm/tegra/fbdev.c
> +++ b/drivers/gpu/drm/tegra/fbdev.c
> @@ -103,6 +103,8 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
>  		return PTR_ERR(info);
>  	}
>  
> +	info->flags = FBINFO_DEFAULT;
> +
>  	fb = tegra_fb_alloc(drm, &cmd, &bo, 1);
>  	if (IS_ERR(fb)) {
>  		err = PTR_ERR(fb);
> @@ -132,6 +134,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
>  		}
>  	}
>  
> +	info->flags |= FBINFO_VIRTFB;

I see that all fbdev drivers just do: info->flags = FBINFO_FLAG_DEFAULT | FBINFO_VIRTFB

Guess you are doing in two assignments to be consistent with drm_fbdev_dma.c ?
I was just curious about the rationale for setting the flags in two steps.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

