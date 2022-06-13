Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80962C43334
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jun 2022 13:57:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380105AbiFMN5d (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Jun 2022 09:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380243AbiFMNx4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Jun 2022 09:53:56 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C6D37006
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jun 2022 04:34:15 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id o7so10607269eja.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jun 2022 04:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=psQQVR/f5fvbatmM/t2gUHb7xOqBl2kSfD6Yn4VXhn4=;
        b=CCl9lZDnz09VMHc2K+G9nhxXiKPlrTxi67Nm/sPyMli1Y1S9LcZTa57/sRZYQUmdT8
         8lVa6T1lK3uYdt95AJEg7WqWNL+L+CeCqs8XYWhgkY4LF57tVjnOahTu3+LCFwLoUKoK
         Abqvyhz8zaUi8HxhOciTkzy9iW/LMGc5rk+Lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=psQQVR/f5fvbatmM/t2gUHb7xOqBl2kSfD6Yn4VXhn4=;
        b=UIqep6iFZqRSSz1qzyeQdOD80TnbIHuC13pETRFk7sxtW2k4bIGz4qNvs325xTFL0Z
         BDJ9lfjZiMlS16bIW/85Kajj0/DqIC84rWVoN2qQT0AkLic7vAF7tZt3MjVpHOhMEEc+
         sz+7AyljgttLBUC1WfXceGUZcZni+4Yi/8cvdYDSjN853jawfJCafR+XDgNrKL87xoIL
         cHGcGzBMN3XlgZK74kCQhcUtxpHT3Lx2x6S55d01QinHkm7n+FrhAfK/LyODZrNNO2Dv
         sWhqMdUVJyfRBZYozYyZTc41w+a0Q1dMX1RjL3kMEGGekX4/xzHhku9Kr6c31J/LG11Y
         Z0Ag==
X-Gm-Message-State: AOAM533KRsVl9cq8XZCCIMHHIXT9ITtncnTLKtQA6l5yTJLfdU+MWQEp
        iEl8hpZZyMqmD9j7JtihW+SE5oC73mrzuOeFSRMI9g==
X-Google-Smtp-Source: ABdhPJwDToIMv6/nNTYJJcYjxVWlEOEDpBR/p8X/D6SOqOZf8PEhTIZZ1e2EWV6opwyScsFcWjLI2AIlpvVZAxD/h48=
X-Received: by 2002:a17:906:2cc3:b0:70d:b6c8:f83b with SMTP id
 r3-20020a1709062cc300b0070db6c8f83bmr48930490ejr.770.1655120054442; Mon, 13
 Jun 2022 04:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <20220504114021.33265-9-jagan@amarulasolutions.com> <17782795-10f1-067d-c6af-f82d64c6273e@intel.com>
 <CGME20220613111735eucas1p1f80de0b3b377c12f183721371cf8d6fc@eucas1p1.samsung.com>
 <CAMty3ZBYkQ8GJL+9r+zXhjrFjb+XCLgBh8pY=f+FVM_DHm-SPQ@mail.gmail.com> <8a0727e2-134f-c34e-aa32-cf828255ce8c@samsung.com>
In-Reply-To: <8a0727e2-134f-c34e-aa32-cf828255ce8c@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 13 Jun 2022 17:04:03 +0530
Message-ID: <CAMty3ZAUBVjkDuB2MjMYzZiEc9K7h6tQWn-RozHt7AYNApsJow@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] drm: bridge: samsung-dsim: Add atomic_check
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jun 13, 2022 at 5:02 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 13.06.2022 13:17, Jagan Teki wrote:
> > On Wed, May 11, 2022 at 4:01 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> >> On 04.05.2022 13:40, Jagan Teki wrote:
> >>> Fixing up the mode flags is required in order to correlate the
> >>> correct sync flags of the surrounding components in the chain
> >>> to make sure the whole pipeline can work properly.
> >>>
> >>> So, handle the mode flags via bridge, atomic_check.
> >>>
> >>> v2:
> >>> * none
> >>>
> >>> v1:
> >>> * fix mode flags in atomic_check instead of mode_fixup
> >>>
> >>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>> ---
> >>>    drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++++++++
> >>>    1 file changed, 14 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> index b618e52d0ee3..bd78cef890e4 100644
> >>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> @@ -1340,6 +1340,19 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
> >>>        pm_runtime_put_sync(dsi->dev);
> >>>    }
> >>>
> >>> +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
> >>> +                                  struct drm_bridge_state *bridge_state,
> >>> +                                  struct drm_crtc_state *crtc_state,
> >>> +                                  struct drm_connector_state *conn_state)
> >>> +{
> >>> +     struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
> >>> +
> >>> +     adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> >>> +     adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> >>
> >> 1. Shouldn't this be in mode_fixup callback?
> > Possible to do it on mode_fixup, yes. if we want to do the same stuff
> > on atomic API then atomic_check is the proper helper.
> >
> >> 2. Where this requirement comes from? As Marek says it breaks Samsung
> >> platforms and is against DSIM specification[1]:
> > At least the bridge chain starting from LCDIF+DSIM requires active high sync.
>
> Then please make this specific to the imx variant. The current version
> breaks DSI operation on all Exynos based boards.

But exynos trm also says the same?

"45.2.2.1.2 RGB Interface
Vsync, Hsync, and VDEN are active high signals"

Jagan.
