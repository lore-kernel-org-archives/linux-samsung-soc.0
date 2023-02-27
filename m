Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60D9C7EE2E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 19:01:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjB0TBy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 14:01:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjB0TBw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 14:01:52 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05A8252AE
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 11:01:36 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-536cd8f6034so203100807b3.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 11:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bbW4sU0s1kcqSS7K1zznkPttVBDfpTp3pE111rq5zio=;
        b=B4O0e+vuc5pGWeYuNCu72tWPIongyzqo1o7K77WYcMCWaelmxh+C7N+yYNb0lZfr9m
         j5KMAPBvDKOfroiR957Gq4qkgiiZKi5w88bB29m55VQRlZbvq9qUTcHSZwBPFbawXKyM
         VIQ+xTAby6VNCAZFI0tJTEGWvVUA51szvv2TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbW4sU0s1kcqSS7K1zznkPttVBDfpTp3pE111rq5zio=;
        b=rGo/tiMDO5joMPhfhq5qJwCa9moO7Mh2ROYxP/CRD1fINLwP6yFqHNnDHWFFBtIXUO
         KbqpTLaX9fSCIYHewEwfufwBHWUuDR8Qrw5SQJoYwyskfHWeLMRlxPVkXwApl2tEnt0M
         HxC+qhhRMiuW6f2qkcgJy+mIFUUTYv8wYe+M8FNDT1MnIH0KTYpeXPL0MgQVq86CHvt8
         UmUXbhVyAGDSApqoFgmtlJ0eezLW7kp+uAeX9qzy0msaNpx2UUsxXcDuWfgkV7Pxz6Fl
         S+5srcQ9IIFse4TRtWxydNdmJubDCJHTC8dWR8Fo1voCTOarog1i4Ul6a5hvgCUxynPo
         jdWQ==
X-Gm-Message-State: AO0yUKXjFl79jLRwTn4bATKK2Ok+IjBU9TLbW065AVwIq5oNjsAM/E7Q
        rzi3j9NN8Eg/1+BNJSjPV4NHs/pYPk0t00ZHEhftEw==
X-Google-Smtp-Source: AK7set+Z/FmZXkRjTjMaQfbSlEDda+xLmqvPkzq8zRZG69iwMnvGsQ7zu8Z2OMsQqJkMSa8VbrM6Mttn9IA8Sjay9mY=
X-Received: by 2002:a25:8f91:0:b0:a9d:be6e:3340 with SMTP id
 u17-20020a258f91000000b00a9dbe6e3340mr1268801ybl.1.1677524495462; Mon, 27 Feb
 2023 11:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-5-jagan@amarulasolutions.com> <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
In-Reply-To: <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 28 Feb 2023 00:31:23 +0530
Message-ID: <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge
 find helper
To:     Marek Vasut <marex@denx.de>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Feb 28, 2023 at 12:25 AM Marek Vasut <marex@denx.de> wrote:
>
> On 2/27/23 12:39, Jagan Teki wrote:
> > drm_of_dsi_find_panel_or_bridge is capable of looking up the
> > downstream DSI bridge and panel and trying to add a panel bridge
> > if the panel is found.
> >
> > Replace explicit finding calls with drm_of_dsi_find_panel_or_bridge
> > followed with drmm_panel_bridge_add.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v13, v12, v11:
> > - none
> > Changes for v10:
> > - new patch
> >
> >   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 +++++++++++++------------
> >   1 file changed, 13 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index df15501b1075..12a6dd987e8f 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -25,6 +25,7 @@
> >   #include <drm/drm_atomic_helper.h>
> >   #include <drm/drm_bridge.h>
> >   #include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_of.h>
> >   #include <drm/drm_panel.h>
> >   #include <drm/drm_print.h>
> >   #include <drm/drm_probe_helper.h>
> > @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> >       struct device *dev = dsi->dev;
> >       struct drm_encoder *encoder = &dsi->encoder;
> >       struct drm_device *drm = encoder->dev;
> > +     struct drm_bridge *bridge;
> >       struct drm_panel *panel;
> >       int ret;
> >
> > -     panel = of_drm_find_panel(device->dev.of_node);
> > -     if (!IS_ERR(panel)) {
> > -             dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > -     } else {
> > -             dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
> > -             if (!dsi->out_bridge)
> > -                     dsi->out_bridge = ERR_PTR(-EINVAL);
> > -     }
>
> As far as I understand this from my conversation with Maxime (please put
> him on CC of V15), the change here should instead perform the panel look
> up NOT in exynos_dsi_host_attach() , but in exynos_dsi_bind() , i.e. in
> the component_ops .bind callback . Here is an example of correct
> implementation:
>
> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/vc4/vc4_dsi.c#n1805

But, we don't have component_ops.bind for imx8m case, so where do we
want to place the panel hook?

Exynos drm drivers are component-based but, imx8mm is not.

Jagan.
