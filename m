Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3D3C64ED6
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Feb 2023 14:39:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjB1Ojm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Feb 2023 09:39:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjB1Ojl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Feb 2023 09:39:41 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A730512BC6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Feb 2023 06:39:39 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-536c02c9dfbso277675017b3.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Feb 2023 06:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEGZKVo2nMwQXB+uOt8DqCZVCfS1QX4jwGYSbTq9MY0=;
        b=ZgFOu+i6CM4J8PKF9WIH3wsToVjRUgA7VsOE4YKhhflNaStV+u+K14DcEof7uBr7zr
         JSs18BMEK9cC1Mtz7nWLPyQfIoamzSqQxVjr6P4ML8FDssbWgOssQ6yFL0vscJftN2NJ
         5EbvrAWOLOp5D7RYqqDgsNfSSpUyoUeAXjlYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEGZKVo2nMwQXB+uOt8DqCZVCfS1QX4jwGYSbTq9MY0=;
        b=S3ZKFXBq9sPySHiOkt+tu/Gzq2bBaXO9G4WdVZKkAYxAKTALYqzZlW9dzJDrGyQQ1h
         DQ0UITwUqi9d1goYVF2k3Gk4OUOM8tpUzYM3sJaGkSEP3DLZ2A8cOSKJjNg6xOTaH66O
         4b2jW7Am+rosNbYNvkws43umnNt17X+MlYtcMc+GRLQLp6S8v0yIF02yhhkSNNNViHp5
         /EULVy8bFUYmKMh/52yn/zLUVnjeM4GuZCqOJvCEeOvx2+73HcBDfQeVInz/cujHKLnB
         MVEJzJ4hvEaONmjhYvQgav+K0eyk6goiUNLp0wuYk/heXd6cboFNqR2uXVoagNu0xx76
         6mFg==
X-Gm-Message-State: AO0yUKVgzgnrZ2i1Tv6wUQ44yuu/SeiBd5lZUqc9z3ioDFjg1anp6Hj0
        t83z8e7MuZqHhdJxK7dckKXJP/QjLcrBgO839X+tjw==
X-Google-Smtp-Source: AK7set/6aDQGsZIZsBkuoKiZD2MwNs9h4uNB7dcSM3OJNLwQ900kPgNP0k/0RFwEVLZ7ymCMgDJos9TZfkCFPLBkQT4=
X-Received: by 2002:a25:900d:0:b0:a09:314f:a560 with SMTP id
 s13-20020a25900d000000b00a09314fa560mr1294740ybl.1.1677595178739; Tue, 28 Feb
 2023 06:39:38 -0800 (PST)
MIME-Version: 1.0
References: <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de> <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
 <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de> <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
 <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de> <CAMty3ZDjwD+3SKJiOgZLbYYTtq=udWkXbqnsyYaM73rsYxDumQ@mail.gmail.com>
 <47b8ad7d-cfc1-112c-2117-cb3612c1bba5@denx.de> <CAMty3ZDMJFW36g5=A1=_08VT1dZUMemEg3YcQMh08iZNRa+cTw@mail.gmail.com>
 <5c10d1e6-75ce-d926-fba9-a9bf5e240895@denx.de> <CAMty3ZBpWd817b5Ye_AQse1zruUtWOm2E4WUz0b7a4k9mVEzEQ@mail.gmail.com>
 <20230228120447.q7k5xup6hbvagg33@houat>
In-Reply-To: <20230228120447.q7k5xup6hbvagg33@houat>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 28 Feb 2023 20:09:26 +0530
Message-ID: <CAMty3ZAG_zONg181mmEzx=7y7kk=kX1pObQ379d3m8_TsPzHaA@mail.gmail.com>
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge
 find helper
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Marek Vasut <marex@denx.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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

On Tue, Feb 28, 2023 at 5:34 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Feb 28, 2023 at 02:08:53AM +0530, Jagan Teki wrote:
> > On Tue, Feb 28, 2023 at 1:40 AM Marek Vasut <marex@denx.de> wrote:
> > >
> > > On 2/27/23 20:49, Jagan Teki wrote:
> > > > On Tue, Feb 28, 2023 at 1:11 AM Marek Vasut <marex@denx.de> wrote:
> > > >>
> > > >> On 2/27/23 20:34, Jagan Teki wrote:
> > > >>> On Tue, Feb 28, 2023 at 12:54 AM Marek Vasut <marex@denx.de> wrot=
e:
> > > >>>>
> > > >>>> On 2/27/23 20:15, Jagan Teki wrote:
> > > >>>>> On Tue, Feb 28, 2023 at 12:38 AM Marek Vasut <marex@denx.de> wr=
ote:
> > > >>>>>>
> > > >>>>>> On 2/27/23 20:01, Jagan Teki wrote:
> > > >>>>>>> On Tue, Feb 28, 2023 at 12:25 AM Marek Vasut <marex@denx.de> =
wrote:
> > > >>>>>>>>
> > > >>>>>>>> On 2/27/23 12:39, Jagan Teki wrote:
> > > >>>>>>>>> drm_of_dsi_find_panel_or_bridge is capable of looking up th=
e
> > > >>>>>>>>> downstream DSI bridge and panel and trying to add a panel b=
ridge
> > > >>>>>>>>> if the panel is found.
> > > >>>>>>>>>
> > > >>>>>>>>> Replace explicit finding calls with drm_of_dsi_find_panel_o=
r_bridge
> > > >>>>>>>>> followed with drmm_panel_bridge_add.
> > > >>>>>>>>>
> > > >>>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > >>>>>>>>> ---
> > > >>>>>>>>> Changes for v13, v12, v11:
> > > >>>>>>>>> - none
> > > >>>>>>>>> Changes for v10:
> > > >>>>>>>>> - new patch
> > > >>>>>>>>>
> > > >>>>>>>>>       drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 ++++++++=
+++++------------
> > > >>>>>>>>>       1 file changed, 13 insertions(+), 12 deletions(-)
> > > >>>>>>>>>
> > > >>>>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/driv=
ers/gpu/drm/exynos/exynos_drm_dsi.c
> > > >>>>>>>>> index df15501b1075..12a6dd987e8f 100644
> > > >>>>>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > >>>>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > >>>>>>>>> @@ -25,6 +25,7 @@
> > > >>>>>>>>>       #include <drm/drm_atomic_helper.h>
> > > >>>>>>>>>       #include <drm/drm_bridge.h>
> > > >>>>>>>>>       #include <drm/drm_mipi_dsi.h>
> > > >>>>>>>>> +#include <drm/drm_of.h>
> > > >>>>>>>>>       #include <drm/drm_panel.h>
> > > >>>>>>>>>       #include <drm/drm_print.h>
> > > >>>>>>>>>       #include <drm/drm_probe_helper.h>
> > > >>>>>>>>> @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_attach(s=
truct mipi_dsi_host *host,
> > > >>>>>>>>>           struct device *dev =3D dsi->dev;
> > > >>>>>>>>>           struct drm_encoder *encoder =3D &dsi->encoder;
> > > >>>>>>>>>           struct drm_device *drm =3D encoder->dev;
> > > >>>>>>>>> +     struct drm_bridge *bridge;
> > > >>>>>>>>>           struct drm_panel *panel;
> > > >>>>>>>>>           int ret;
> > > >>>>>>>>>
> > > >>>>>>>>> -     panel =3D of_drm_find_panel(device->dev.of_node);
> > > >>>>>>>>> -     if (!IS_ERR(panel)) {
> > > >>>>>>>>> -             dsi->out_bridge =3D devm_drm_panel_bridge_add=
(dev, panel);
> > > >>>>>>>>> -     } else {
> > > >>>>>>>>> -             dsi->out_bridge =3D of_drm_find_bridge(device=
->dev.of_node);
> > > >>>>>>>>> -             if (!dsi->out_bridge)
> > > >>>>>>>>> -                     dsi->out_bridge =3D ERR_PTR(-EINVAL);
> > > >>>>>>>>> -     }
> > > >>>>>>>>
> > > >>>>>>>> As far as I understand this from my conversation with Maxime=
 (please put
> > > >>>>>>>> him on CC of V15), the change here should instead perform th=
e panel look
> > > >>>>>>>> up NOT in exynos_dsi_host_attach() , but in exynos_dsi_bind(=
) , i.e. in
> > > >>>>>>>> the component_ops .bind callback . Here is an example of cor=
rect
> > > >>>>>>>> implementation:
> > > >>>>>>>>
> > > >>>>>>>> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/v=
c4/vc4_dsi.c#n1805
> > > >>>>>>>
> > > >>>>>>> But, we don't have component_ops.bind for imx8m case, so wher=
e do we
> > > >>>>>>> want to place the panel hook?
> > > >>>>>>>
> > > >>>>>>> Exynos drm drivers are component-based but, imx8mm is not.
> > > >>>>>>
> > > >>>>>> In 14/18 patch, the same should be added to generic_dsim_regis=
ter_host()
> > > >>>>>> , which is called from the driver .probe() callback, but that =
is OK.
> > > >>>>>>
> > > >>>>>> That's ^ is the iMX part.
> > > >>>>>
> > > >>>>> Ohh. You mean, we need to find the panel hook separately in two=
 places like
> > > >>>>> - bind for exynos
> > > >>>>> - probe for imx8mm
> > > >>>>
> > > >>>> Yes
> > > >>>>
> > > >>>>> If so? how can I find the drm_device pointer in the probe?
> > > >>>>
> > > >>>> What for ? The panel lookup uses OF graph . Where do you need th=
e
> > > >>>> drm_device in it ?
> > > >>>
> > > >>> May I can summarize the whole setback here so that everybody is o=
n the
> > > >>> same page and find the proper solution?
> > > >>>
> > > >>> The key blocker is accessing the DRM pointer in order to use the
> > > >>> DRM-managed action helper.
> > > >>>
> > > >>> 1. If we find the panel hook in Exynos component_ops.bind then we=
 can
> > > >>> use the DRM pointer directly as VC4 does.
> > > >>> 2. if we find the panel hook in Samsung drm_bridge_funcs.attach (=
for
> > > >>> imx8mm) then we can use the DRM pointer directly via bridge->dev.
> > > >>>
> > > >>> If we make 2) has common across like finding the panel hook in
> > > >>> drm_bridge_funcs.attach the Exynos drm pipeline cannot find the
> > > >>> panels.
> > > >>>
> > > >>> The common solution for both exynos and imx8m is host.attach but =
if we
> > > >>> do so we cannot get find the DRM pointer.
> > > >>
> > > >> There isn't going to be common solution, you would really have to =
do the
> > > >> look up in component_ops .bind callback for exynos , and
> > > >> generic_dsim_register_host() for i.MX .
> > > >>
> > > >>> If we go ahead with no need for DRM-managed helper at the moment,=
 then
> > > >>> find the panel hook in host.attach and then drop 2/18.
> > > >>
> > > >> The panel lookup must happen in .bind/.probe for exynos/imx respec=
tively
> > > >> , that's really all that is required here. Then you can drop 1,2,3=
/18
> > > >> and get this series applied (I hope) .
> > > >
> > > > I'm not quite sure, if the panel hook in .bind work for exynos or n=
ot?
> > >
> > > Marek should be able to test exynos for you one more time I hope.
> > >
> > > > the host. attach has KMS hotplug code after the panel hook and
> > > > bridge_attach as before. I believe that is a working scenario for
> > > > Exynos to be the panel hook in the host. attach.
> > >
> > > As far as I understand it, the look up has to be in .bind callback (a=
nd
> > > generic_dsim_register_host() for imx). Can you try if/how that works =
?
> > >
> > > >> Can you implement just this one change ?
> > > >>
> > > >> There is no need to use drmm_* helper for now, that can be improve=
d
> > > >> later if possible.
> > > >
> > > > If this is the case then 1/18 will need otherwise
> > >
> > > Ah yes, 1/18 will be needed indeed. It should just be called from .bi=
nd
> > > callback or generic_dsim_register_host() (i.e. probe callback).
> >
> > panel hook at the probe call would be wrong.
>
> Why?
>
> > the downstream bridge will call mipi_dsi_attach for finding the
> > connected upstream, so it indeed calls host.attach. If we move the
> > panel hook at the probe, then probing will defer.
> >
> > [   12.046862] platform 32e10000.dsi: deferred probe pending
> > [   12.052309] platform 32e00000.lcdif: deferred probe pending
>
> What is the dependency chain there, and why doesn't it probe?

Let me answer here for the above 2 queries.

This is clearly a point 2 scenario from the documentation.

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
"

So, the samsung-dsim follows the same rule, mipi_dsi_host_register()
in the probe and drm_bridge_attach() in mipi_dsi_host_ops.attach hook.

Above also mentioned "The upstream driver will be assured that the
bridge driver is connected between the mipi_dsi_host_ops.attach and
mipi_dsi_host_ops.detach operations" that means we need to find the
panel or bridge in mipi_dsi_host_ops.attach am I correct? not in the
probe.

lcdif =3D> samsung-dsim =3D> ti-sn65dsi (I2C) =3D> panel this is the bridge
chain. ti-sn65dsi is registered the MIPI Device and attaches the
upstream driver via mipi_dsi_attach that indeed calls upstream driver
mipi_dsi_host_ops.attach so if we move finding panel or bridge from
mipi_dsi_host_ops.attach to the probe then dev->of_node cannot be
valid so it will not find the bridge driver.

>
> > What is the problem to have it in host.attach for both cases?
>
> You've put a link to the documentation that explains what the problem is
> in your mail.
>
> > some DSI host bridges still do the same (mtk_dsi)
>
> Then some are broken. How is that an argument?

May be mtk_dsi has some different approach, not sure.

>
> > and this is what is mentioned in documentation point 2 and 3 here,
> > https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html#special-c=
are-with-mipi-dsi-bridges
> >
> > "
> > The upstream driver doesn=E2=80=99t use the component framework, but is=
 a
> > MIPI-DSI host.
>
> Exynos uses the component framework. So that point doesn't apply to it.
>
> > The bridge device uses the MIPI-DCS commands to be
> > controlled. In this case, the bridge device is a child of the display
> > device and when it will probe it=E2=80=99s assured that the display dev=
ice
> > (and MIPI-DSI host) is present. The upstream driver will be assured
> > that the bridge driver is connected between the
> > mipi_dsi_host_ops.attach and mipi_dsi_host_ops.detach operations.
> > Therefore, it must run mipi_dsi_host_register() in its probe function,
> > and then run drm_bridge_attach() in its mipi_dsi_host_ops.attach hook.
> >
> > The upstream driver uses the component framework and is a MIPI-DSI
> > host. The bridge device uses the MIPI-DCS commands to be controlled.
> > This is the same situation than above, and can run
> > mipi_dsi_host_register() in either its probe or bind hooks.
> > "
> >
> > Point 2 for Exynos and 3 for imx8m flow, for both the cases
> > drm_bridge_attach in host_ops.attach hook so the panel hook must be in
> > same place.
>
> And you forgot the fourth point:
>
> > The upstream driver uses the component framework and is a MIPI-DSI
> > host. The bridge device uses a separate bus (such as I2C) to be
> > controlled. In this case, there=E2=80=99s no correlation between the pr=
obe of
> > the bridge and upstream drivers, so care must be taken to avoid an
> > endless EPROBE_DEFER loop, with each driver waiting for the other to
> > probe.
>
> Which is what the whole discussion is about.

I got it, Points 3, and 4 are followed by three points that are
related to Exynos DSI and the connected bridge is I2C-based. In this
case, the existing Exynos DSI has some faults. and It is working for
Exynos DSI since they didn't deal any I2C-based bridge driver, may be.

Jagan.
