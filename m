Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7990EC64ED8
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 20:39:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjB0UjP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 15:39:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjB0UjO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 15:39:14 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF574E069
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 12:39:06 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-536bbe5f888so210843517b3.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 12:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0E8dvhFkWifflnv/gVVflacVfe+bXDuYqYI3VPi4eM=;
        b=P5K5hYykdKQr9+2QCk9+7W+dc+d20TKPsbm3x9xVDbWlgnG0dZv5x26GR8Oawgj/Nj
         nwjMDKLJw2iJIwGRPxkkWA/Ru6kFCLIpxOJ1j+mkQFTeAHtRXxwHtZD42/UItBBf+AMq
         FX1qxAfdJuPd+ByhheOaVLSbCiptcpZLdIdYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u0E8dvhFkWifflnv/gVVflacVfe+bXDuYqYI3VPi4eM=;
        b=pyJkkGAknB5gq3SAM1ERNUfPIUObro3oNuu2tZRfbFS5HYmBCvMyNf06tKABLJJWil
         cW9uxWCrehRCr9DfkyJmWK+R0Prou89ytxe+C2lmCgB0LN2elkWt0xOtpT2o6kbGyrVq
         GPJmLqW+2R6nZcLQP2tW1mazdliqJW0nBYa+PfhYR95ON8fmgmYBwkaNc0ScXVDUYaqe
         6q4u1JC7Jf99d5X74PU4E/B4omfyY10139kzG0vYWHepbPvs83xQEJ69fjb/zIJpY2hp
         hlsnxUvB3A+bLDZpQuNdwblHFX8kg5dC0fjDply65FqEW+ScWXrmvmMnILBbeQEzjq1I
         djEA==
X-Gm-Message-State: AO0yUKXWDWr1o6dgPU6PsEwiDN1BEjrZe/bTo2apkZo2pKzhDbYKutNG
        4SBLTK4/BsaW38WZM1/xlvWKbm4tI9/iJgppfDjm5A==
X-Google-Smtp-Source: AK7set+UYCVRk1oV08L2CYHDKR/UGlJXk+Aj9gdv7tVSNB5QKftrQprZ+ti1UIOB4mZrxiCwFgxP3uSOpCF3D+Tvc0A=
X-Received: by 2002:a81:b664:0:b0:52e:cea7:f6e3 with SMTP id
 h36-20020a81b664000000b0052ecea7f6e3mr9158ywk.10.1677530345848; Mon, 27 Feb
 2023 12:39:05 -0800 (PST)
MIME-Version: 1.0
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-5-jagan@amarulasolutions.com> <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
 <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
 <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de> <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
 <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de> <CAMty3ZDjwD+3SKJiOgZLbYYTtq=udWkXbqnsyYaM73rsYxDumQ@mail.gmail.com>
 <47b8ad7d-cfc1-112c-2117-cb3612c1bba5@denx.de> <CAMty3ZDMJFW36g5=A1=_08VT1dZUMemEg3YcQMh08iZNRa+cTw@mail.gmail.com>
 <5c10d1e6-75ce-d926-fba9-a9bf5e240895@denx.de>
In-Reply-To: <5c10d1e6-75ce-d926-fba9-a9bf5e240895@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 28 Feb 2023 02:08:53 +0530
Message-ID: <CAMty3ZBpWd817b5Ye_AQse1zruUtWOm2E4WUz0b7a4k9mVEzEQ@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Feb 28, 2023 at 1:40 AM Marek Vasut <marex@denx.de> wrote:
>
> On 2/27/23 20:49, Jagan Teki wrote:
> > On Tue, Feb 28, 2023 at 1:11 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 2/27/23 20:34, Jagan Teki wrote:
> >>> On Tue, Feb 28, 2023 at 12:54 AM Marek Vasut <marex@denx.de> wrote:
> >>>>
> >>>> On 2/27/23 20:15, Jagan Teki wrote:
> >>>>> On Tue, Feb 28, 2023 at 12:38 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>>
> >>>>>> On 2/27/23 20:01, Jagan Teki wrote:
> >>>>>>> On Tue, Feb 28, 2023 at 12:25 AM Marek Vasut <marex@denx.de> wrot=
e:
> >>>>>>>>
> >>>>>>>> On 2/27/23 12:39, Jagan Teki wrote:
> >>>>>>>>> drm_of_dsi_find_panel_or_bridge is capable of looking up the
> >>>>>>>>> downstream DSI bridge and panel and trying to add a panel bridg=
e
> >>>>>>>>> if the panel is found.
> >>>>>>>>>
> >>>>>>>>> Replace explicit finding calls with drm_of_dsi_find_panel_or_br=
idge
> >>>>>>>>> followed with drmm_panel_bridge_add.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>>>>>>>> ---
> >>>>>>>>> Changes for v13, v12, v11:
> >>>>>>>>> - none
> >>>>>>>>> Changes for v10:
> >>>>>>>>> - new patch
> >>>>>>>>>
> >>>>>>>>>       drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 ++++++++++++=
+------------
> >>>>>>>>>       1 file changed, 13 insertions(+), 12 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/=
gpu/drm/exynos/exynos_drm_dsi.c
> >>>>>>>>> index df15501b1075..12a6dd987e8f 100644
> >>>>>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>>>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>>>>>>>> @@ -25,6 +25,7 @@
> >>>>>>>>>       #include <drm/drm_atomic_helper.h>
> >>>>>>>>>       #include <drm/drm_bridge.h>
> >>>>>>>>>       #include <drm/drm_mipi_dsi.h>
> >>>>>>>>> +#include <drm/drm_of.h>
> >>>>>>>>>       #include <drm/drm_panel.h>
> >>>>>>>>>       #include <drm/drm_print.h>
> >>>>>>>>>       #include <drm/drm_probe_helper.h>
> >>>>>>>>> @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_attach(struc=
t mipi_dsi_host *host,
> >>>>>>>>>           struct device *dev =3D dsi->dev;
> >>>>>>>>>           struct drm_encoder *encoder =3D &dsi->encoder;
> >>>>>>>>>           struct drm_device *drm =3D encoder->dev;
> >>>>>>>>> +     struct drm_bridge *bridge;
> >>>>>>>>>           struct drm_panel *panel;
> >>>>>>>>>           int ret;
> >>>>>>>>>
> >>>>>>>>> -     panel =3D of_drm_find_panel(device->dev.of_node);
> >>>>>>>>> -     if (!IS_ERR(panel)) {
> >>>>>>>>> -             dsi->out_bridge =3D devm_drm_panel_bridge_add(dev=
, panel);
> >>>>>>>>> -     } else {
> >>>>>>>>> -             dsi->out_bridge =3D of_drm_find_bridge(device->de=
v.of_node);
> >>>>>>>>> -             if (!dsi->out_bridge)
> >>>>>>>>> -                     dsi->out_bridge =3D ERR_PTR(-EINVAL);
> >>>>>>>>> -     }
> >>>>>>>>
> >>>>>>>> As far as I understand this from my conversation with Maxime (pl=
ease put
> >>>>>>>> him on CC of V15), the change here should instead perform the pa=
nel look
> >>>>>>>> up NOT in exynos_dsi_host_attach() , but in exynos_dsi_bind() , =
i.e. in
> >>>>>>>> the component_ops .bind callback . Here is an example of correct
> >>>>>>>> implementation:
> >>>>>>>>
> >>>>>>>> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/vc4/v=
c4_dsi.c#n1805
> >>>>>>>
> >>>>>>> But, we don't have component_ops.bind for imx8m case, so where do=
 we
> >>>>>>> want to place the panel hook?
> >>>>>>>
> >>>>>>> Exynos drm drivers are component-based but, imx8mm is not.
> >>>>>>
> >>>>>> In 14/18 patch, the same should be added to generic_dsim_register_=
host()
> >>>>>> , which is called from the driver .probe() callback, but that is O=
K.
> >>>>>>
> >>>>>> That's ^ is the iMX part.
> >>>>>
> >>>>> Ohh. You mean, we need to find the panel hook separately in two pla=
ces like
> >>>>> - bind for exynos
> >>>>> - probe for imx8mm
> >>>>
> >>>> Yes
> >>>>
> >>>>> If so? how can I find the drm_device pointer in the probe?
> >>>>
> >>>> What for ? The panel lookup uses OF graph . Where do you need the
> >>>> drm_device in it ?
> >>>
> >>> May I can summarize the whole setback here so that everybody is on th=
e
> >>> same page and find the proper solution?
> >>>
> >>> The key blocker is accessing the DRM pointer in order to use the
> >>> DRM-managed action helper.
> >>>
> >>> 1. If we find the panel hook in Exynos component_ops.bind then we can
> >>> use the DRM pointer directly as VC4 does.
> >>> 2. if we find the panel hook in Samsung drm_bridge_funcs.attach (for
> >>> imx8mm) then we can use the DRM pointer directly via bridge->dev.
> >>>
> >>> If we make 2) has common across like finding the panel hook in
> >>> drm_bridge_funcs.attach the Exynos drm pipeline cannot find the
> >>> panels.
> >>>
> >>> The common solution for both exynos and imx8m is host.attach but if w=
e
> >>> do so we cannot get find the DRM pointer.
> >>
> >> There isn't going to be common solution, you would really have to do t=
he
> >> look up in component_ops .bind callback for exynos , and
> >> generic_dsim_register_host() for i.MX .
> >>
> >>> If we go ahead with no need for DRM-managed helper at the moment, the=
n
> >>> find the panel hook in host.attach and then drop 2/18.
> >>
> >> The panel lookup must happen in .bind/.probe for exynos/imx respective=
ly
> >> , that's really all that is required here. Then you can drop 1,2,3/18
> >> and get this series applied (I hope) .
> >
> > I'm not quite sure, if the panel hook in .bind work for exynos or not?
>
> Marek should be able to test exynos for you one more time I hope.
>
> > the host. attach has KMS hotplug code after the panel hook and
> > bridge_attach as before. I believe that is a working scenario for
> > Exynos to be the panel hook in the host. attach.
>
> As far as I understand it, the look up has to be in .bind callback (and
> generic_dsim_register_host() for imx). Can you try if/how that works ?
>
> >> Can you implement just this one change ?
> >>
> >> There is no need to use drmm_* helper for now, that can be improved
> >> later if possible.
> >
> > If this is the case then 1/18 will need otherwise
>
> Ah yes, 1/18 will be needed indeed. It should just be called from .bind
> callback or generic_dsim_register_host() (i.e. probe callback).

panel hook at the probe call would be wrong. the downstream bridge
will call mipi_dsi_attach for finding the connected upstream, so it
indeed calls host.attach. If we move the panel hook at the probe, then
probing will defer.

[   12.046862] platform 32e10000.dsi: deferred probe pending
[   12.052309] platform 32e00000.lcdif: deferred probe pending

What is the problem to have it in host.attach for both cases? some DSI
host bridges still do the same (mtk_dsi) and this is what is mentioned
in documentation point 2 and 3 here,
https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html#special-care-=
with-mipi-dsi-bridges

"
The upstream driver doesn=E2=80=99t use the component framework, but is a
MIPI-DSI host. The bridge device uses the MIPI-DCS commands to be
controlled. In this case, the bridge device is a child of the display
device and when it will probe it=E2=80=99s assured that the display device
(and MIPI-DSI host) is present. The upstream driver will be assured
that the bridge driver is connected between the
mipi_dsi_host_ops.attach and mipi_dsi_host_ops.detach operations.
Therefore, it must run mipi_dsi_host_register() in its probe function,
and then run drm_bridge_attach() in its mipi_dsi_host_ops.attach hook.

The upstream driver uses the component framework and is a MIPI-DSI
host. The bridge device uses the MIPI-DCS commands to be controlled.
This is the same situation than above, and can run
mipi_dsi_host_register() in either its probe or bind hooks.
"

Point 2 for Exynos and 3 for imx8m flow, for both the cases
drm_bridge_attach in host_ops.attach hook so the panel hook must be in
same place.

Thanks,
Jagan.
