Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3419FC64ED6
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 12:28:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjB0M2V (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 07:28:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjB0M2T (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 07:28:19 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F77EC6C
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 04:28:16 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-536c02eea4dso171119477b3.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 04:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WwR6ZSekWbBuT7yj7OTRMClZyQccVnFXtI1dVPMFqqU=;
        b=Emc8xQxFSXMvSrm+i70nSvGeFZesVg4lDXPcqr+1kCyqci31jAiQYw/aHaeWi8Vh8f
         kVjiEWCuWvT2FYubxbZLPn6BSb5MnpuCwwn7cERSb7IActXOShQ0Ge9DBO2IPsFXEyRa
         Ir8VVHVN3q9oSupSQe0W1W4HNo1pKt2k2NHW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwR6ZSekWbBuT7yj7OTRMClZyQccVnFXtI1dVPMFqqU=;
        b=Ou0H+3nICj2JZS2kIz7ZFh05uW3ZuptD2B25O+qrZQ2IrGMBFLoAmXP9Db8m2+iVwf
         YXRLTO/MxVk6XGDY1lNxgTf/7/uLwWSKs6lqOdZ3LDa5OHN+kL73R5TP3jDBD+HQ19iH
         lOk5RzTNyycvUUdxgflGqZxe8nIGKQQbqyOXjJl8KWrt2E5ekynzlfDxnORoz14AG4+Z
         VTt7+BYbR8fH1jbB3bULnmHhET763rMZG77O2M3B69j5tiwcYvdrsTmTO4xsKBaRaFeT
         M4t/qQdyVXguvlZ+hLYH0XelnxfxQZnswv2faR1LnG58kdpsZjMcPGg7J/9BEjRkA+ow
         FE3A==
X-Gm-Message-State: AO0yUKVKEZOcs7ELI4vf6YVVUmnCtogFJbCYi2tRAYuhKvlhZX7qtEVL
        +KX8hQ8KlldG/s4POIhsHG6/8rVTUo7pcJWGb7LpSA==
X-Google-Smtp-Source: AK7set/J1/v6xMiecz4aEizWMrNP2r+5Uo6EjVIK1FJeWxI5ysPY4sPzBtm5HepMje66xHgnhJKxP8ZzBK4nloEmtfE=
X-Received: by 2002:a81:ac60:0:b0:52a:92e9:27c1 with SMTP id
 z32-20020a81ac60000000b0052a92e927c1mr10155528ywj.10.1677500895190; Mon, 27
 Feb 2023 04:28:15 -0800 (PST)
MIME-Version: 1.0
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-3-jagan@amarulasolutions.com> <20230227121149.c3ibajgog3i2s2ek@houat>
In-Reply-To: <20230227121149.c3ibajgog3i2s2ek@houat>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 27 Feb 2023 17:58:03 +0530
Message-ID: <CAMty3ZDt64C0dv2=wVcaCLdZVFU2u6D4EKswuoqEjvByKyMseg@mail.gmail.com>
Subject: Re: [PATCH v13 02/18] drm: bridge: panel: Support nodrm case for drmm_panel_bridge_add
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Feb 27, 2023 at 5:41 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Feb 27, 2023 at 05:09:09PM +0530, Jagan Teki wrote:
> > drmm_panel_bridge_add DRM-managed action helper is useful for the bridge
> > which automatically removes the bridge when drm pointer is cleaned.
> >
> > Supporting the same on non-component bridges like host DSI bridge requires
> > a drm pointer which is indeed available only when a panel-bridge is found.
> >
> > For these use cases, the caller would call the drmm_panel_bridge_add by
> > passing NULL to drm pointer.
> >
> > So, assign the bridge->dev to drm pointer for those cases.
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v13:
> > - new patch
> >
> > Note: use case on
> > "[PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge find helper"
> >
> >  drivers/gpu/drm/bridge/panel.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > index d4b112911a99..45a0c6671000 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -402,6 +402,13 @@ struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
> >       if (IS_ERR(bridge))
> >               return bridge;
> >
> > +     /*
> > +      * For non-component bridges, like host DSI bridge the DRM pointer
> > +      * can be available only when a panel-bridge is found.
> > +      */
> > +     if (!drm)
> > +             drm = bridge->dev;
> > +
>
> Why can't the caller use bridge->dev?

The first step of drmm_panel_bridge_add is to find the panel-bridge,
so we can only get bridge->dev after this step. The caller doesn't
know anything about the panel bridge it just sends a panel pointer to
find the panel-bridge and then assigns bridge->dev to drm for DRM
action.

Please check this patch about the caller,
https://patchwork.kernel.org/project/dri-devel/patch/20230227113925.875425-5-jagan@amarulasolutions.com/

>
> Also, where did the devm_drm_of_dsi_get_bridge go? I thought you were
> going to convert it to a drm-managed version?

Look like your suggestion to can't use devm_drm_of_dsi_get_bridge and
call the DRM-action from the driver, that is the reason I have removed
this and done the same as your previous inputs.
https://lore.kernel.org/all/20230203110437.otzl2azscbujigv6@houat/

Jagan.
