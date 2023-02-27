Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13594C64ED6
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 19:34:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjB0TeV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 14:34:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbjB0TeV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 14:34:21 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111D53C12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 11:34:19 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-536bbef1c5eso205930017b3.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 11:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eaE7gABucHn7zbD+pCw5Qyl7h7dVDi0KPiftTPERLOQ=;
        b=fUN1/7wj3oVXJDXd8mEbUPj9PcUqXkqanUEbuJISATPQFHyF5OQ9lTYhwHG5JX6+Ba
         9pUh43QLgDxsUcE1fMmmbyRzfjZhAxW0BJd6LRaDR97gK5Nvu3yXv82otp7S+NgcXsEO
         vluUg2dMQw2G5r8jWdbFPmHL+HPybccuvRFZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaE7gABucHn7zbD+pCw5Qyl7h7dVDi0KPiftTPERLOQ=;
        b=hETTD2XtgSfVNhsBr4I63pCFQ8VbPD4YWi5ofon3iXFFbbC3R2wBFgOVapYu1JzUaN
         GGJm5hWwQT0X4l60KNz2dvp8YrH0TxKf/5uOFnXN0+6mSQ2kI168ORbtiCvHWz+uRtj7
         8X239RWe4L54p/Re08Uvfjne4foa76qYjv++FSvedtJ3XzN4sn7iCdPr92fNucs/n+uL
         6yV5awNDmKzLrF5/1rHbSslBbYou17zQoyYHyFeykH6++K4KpWsJ0xXKXySbXV3Lbg7G
         mcTHUlqEoeGKF5sB+psbxOa2ZXITP9HNhYkUqQ31+L/TeHv3GawtWaR5jsPgCVPv56A4
         mfbg==
X-Gm-Message-State: AO0yUKWmRUkbufvenqgobjlz+nA/ncD+M78oalniU2abbScaezghFPr7
        7TrtZ8avE+IlS7Cu5mAlm9TrkzU8aez9SGoXTyY/8A==
X-Google-Smtp-Source: AK7set+o7S0JYaWxBbIgRQ7uet2xswRXogHF4R/EFM2u4lf5cn5oIZdFhdTTvfUHeRYaobHzvjC3p5lrixGizrKwngE=
X-Received: by 2002:a81:af50:0:b0:533:9ffb:cb12 with SMTP id
 x16-20020a81af50000000b005339ffbcb12mr10971223ywj.10.1677526459147; Mon, 27
 Feb 2023 11:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-5-jagan@amarulasolutions.com> <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
 <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
 <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de> <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
 <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de>
In-Reply-To: <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 28 Feb 2023 01:04:07 +0530
Message-ID: <CAMty3ZDjwD+3SKJiOgZLbYYTtq=udWkXbqnsyYaM73rsYxDumQ@mail.gmail.com>
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

On Tue, Feb 28, 2023 at 12:54 AM Marek Vasut <marex@denx.de> wrote:
>
> On 2/27/23 20:15, Jagan Teki wrote:
> > On Tue, Feb 28, 2023 at 12:38 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 2/27/23 20:01, Jagan Teki wrote:
> >>> On Tue, Feb 28, 2023 at 12:25 AM Marek Vasut <marex@denx.de> wrote:
> >>>>
> >>>> On 2/27/23 12:39, Jagan Teki wrote:
> >>>>> drm_of_dsi_find_panel_or_bridge is capable of looking up the
> >>>>> downstream DSI bridge and panel and trying to add a panel bridge
> >>>>> if the panel is found.
> >>>>>
> >>>>> Replace explicit finding calls with drm_of_dsi_find_panel_or_bridge
> >>>>> followed with drmm_panel_bridge_add.
> >>>>>
> >>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>>>> ---
> >>>>> Changes for v13, v12, v11:
> >>>>> - none
> >>>>> Changes for v10:
> >>>>> - new patch
> >>>>>
> >>>>>     drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 +++++++++++++------------
> >>>>>     1 file changed, 13 insertions(+), 12 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>>>> index df15501b1075..12a6dd987e8f 100644
> >>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>>>> @@ -25,6 +25,7 @@
> >>>>>     #include <drm/drm_atomic_helper.h>
> >>>>>     #include <drm/drm_bridge.h>
> >>>>>     #include <drm/drm_mipi_dsi.h>
> >>>>> +#include <drm/drm_of.h>
> >>>>>     #include <drm/drm_panel.h>
> >>>>>     #include <drm/drm_print.h>
> >>>>>     #include <drm/drm_probe_helper.h>
> >>>>> @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> >>>>>         struct device *dev = dsi->dev;
> >>>>>         struct drm_encoder *encoder = &dsi->encoder;
> >>>>>         struct drm_device *drm = encoder->dev;
> >>>>> +     struct drm_bridge *bridge;
> >>>>>         struct drm_panel *panel;
> >>>>>         int ret;
> >>>>>
> >>>>> -     panel = of_drm_find_panel(device->dev.of_node);
> >>>>> -     if (!IS_ERR(panel)) {
> >>>>> -             dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> >>>>> -     } else {
> >>>>> -             dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
> >>>>> -             if (!dsi->out_bridge)
> >>>>> -                     dsi->out_bridge = ERR_PTR(-EINVAL);
> >>>>> -     }
> >>>>
> >>>> As far as I understand this from my conversation with Maxime (please put
> >>>> him on CC of V15), the change here should instead perform the panel look
> >>>> up NOT in exynos_dsi_host_attach() , but in exynos_dsi_bind() , i.e. in
> >>>> the component_ops .bind callback . Here is an example of correct
> >>>> implementation:
> >>>>
> >>>> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/vc4/vc4_dsi.c#n1805
> >>>
> >>> But, we don't have component_ops.bind for imx8m case, so where do we
> >>> want to place the panel hook?
> >>>
> >>> Exynos drm drivers are component-based but, imx8mm is not.
> >>
> >> In 14/18 patch, the same should be added to generic_dsim_register_host()
> >> , which is called from the driver .probe() callback, but that is OK.
> >>
> >> That's ^ is the iMX part.
> >
> > Ohh. You mean, we need to find the panel hook separately in two places like
> > - bind for exynos
> > - probe for imx8mm
>
> Yes
>
> > If so? how can I find the drm_device pointer in the probe?
>
> What for ? The panel lookup uses OF graph . Where do you need the
> drm_device in it ?

May I can summarize the whole setback here so that everybody is on the
same page and find the proper solution?

The key blocker is accessing the DRM pointer in order to use the
DRM-managed action helper.

1. If we find the panel hook in Exynos component_ops.bind then we can
use the DRM pointer directly as VC4 does.
2. if we find the panel hook in Samsung drm_bridge_funcs.attach (for
imx8mm) then we can use the DRM pointer directly via bridge->dev.

If we make 2) has common across like finding the panel hook in
drm_bridge_funcs.attach the Exynos drm pipeline cannot find the
panels.

The common solution for both exynos and imx8m is host.attach but if we
do so we cannot get find the DRM pointer.

If we go ahead with no need for DRM-managed helper at the moment, then
find the panel hook in host.attach and then drop 2/18.

Thanks,
Jagan.
