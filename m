Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA50C77B7F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 12 May 2023 09:46:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240111AbjELJqI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 12 May 2023 05:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240657AbjELJpx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 12 May 2023 05:45:53 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51AAA11D88
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 May 2023 02:45:45 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-55aa1da9d4aso172025427b3.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 May 2023 02:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683884744; x=1686476744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SeNDNqSbKtT4juprQIPOMJ5pas9h2iCUoYs/y7tb/+s=;
        b=GtZrqROkH4ZfxGqVx3hrHf4l23PetZ6CMy4woniilPGVWRB8G4rBVVXin8SU4uHEVE
         wtZY3W1oMghoYi0guVodFnlz+uaCahv0XpFAQuvWhtuOwpHYzDzLdczdRUBnyFe0UMnY
         ztzXOPBi7FwwlScghGzKcZOUHy28qYMiHNbWYDdhvyVDU1bi+zqLAaW30ayjTfc5VAix
         MdfGcZ9GWL8VrtC6wj/+gnSAsIGxP/u4QEo67j1tEoedMw500PsRi70JcBCPSeS4tVaz
         wItCQ8APNkxcAOsobVaDsVv67krITCKIYm9EhKTCjpaneEn6E6xTcNKaC8nPgAFpqcIo
         aE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683884744; x=1686476744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeNDNqSbKtT4juprQIPOMJ5pas9h2iCUoYs/y7tb/+s=;
        b=DIm++pCa8Rer+BM3x2QK3n993sb5I7PCf8RiEAgJYia6SwgMuT+iGDIp8SfM6ddu+J
         CIPZPItbQNIntjMNVFD6dubTEFoSXvTQl1AZOXXWO1AXPcEgmxUxXdiw4ZXLnZG+Wj3g
         NgGArRKIyBbWkj4VMsnhNV3DCzdEEuSYmFXOKIBU2iVaFPlP08ccPcqmIPy4OuPYDL6e
         scJ1483MpohvalG59PwHL3uCk2Nv9pRDcxHEASeGqRz5MJs+4vmgQR3rCvU05KGDirh4
         zCFFYQnW5dm/qPnDn5z7fyjqvVSqrAwmI2AFQSQFnlxopZPSFCZhyvfBPSu4oQnOv3un
         3zWQ==
X-Gm-Message-State: AC+VfDw371GDwiOx0hFAsnFQZysqIkohYbGhn87iW7c72usGQmiyPLhs
        E862gGD31R4RSPKWeAwR78098QwhvcdU8f5kBq54PA==
X-Google-Smtp-Source: ACHHUZ6lutSExTqyZsU/hQjFKIAv55bPUWGU0TtTWdM/WQJARaWIZ1aV+bmHH/6SrdqtE4Nhmy+pjSm4iiG39PZWMJU=
X-Received: by 2002:a0d:d691:0:b0:539:1b13:3d64 with SMTP id
 y139-20020a0dd691000000b005391b133d64mr23654781ywd.48.1683884744449; Fri, 12
 May 2023 02:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230512084152.31233-1-tzimmermann@suse.de> <20230512084152.31233-7-tzimmermann@suse.de>
In-Reply-To: <20230512084152.31233-7-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 12 May 2023 12:45:33 +0300
Message-ID: <CAA8EJpr8oGfmZ0f49W6C23K=EOWW0a-E4tzyn+U23sYkPeaArQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] drm/msm: Use regular fbdev I/O helpers
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 12 May 2023 at 11:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Use the regular fbdev helpers for framebuffer I/O instead of DRM's
> helpers. Msm does not use damage handling, so DRM's fbdev helpers
> are mere wrappers around the fbdev code.
>
> Add CONFIG_DRM_MSM_FBDEV_EMULATION to select the necessary
> Kconfig options automatically. Make fbdev emulation depend on
> the new config option.
>
> By using fbdev helpers directly within each DRM fbdev emulation,
> we can eventually remove DRM's wrapper functions entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/Kconfig     |  9 +++++++++
>  drivers/gpu/drm/msm/Makefile    |  2 +-
>  drivers/gpu/drm/msm/msm_drv.h   |  2 +-
>  drivers/gpu/drm/msm/msm_fbdev.c | 12 +++++++-----
>  4 files changed, 18 insertions(+), 7 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
