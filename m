Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1610C388F9
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Nov 2020 10:18:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44C5220795
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Nov 2020 10:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgKKKSM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Nov 2020 05:18:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbgKKKSM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Nov 2020 05:18:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46171C0613D1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2020 02:18:12 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kcnCc-0007WQ-QQ; Wed, 11 Nov 2020 11:18:10 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kcnCa-0004L6-H0; Wed, 11 Nov 2020 11:18:08 +0100
Date:   Wed, 11 Nov 2020 11:18:08 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Inki Dae <inki.dae@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com
Subject: Re: [PATCH v2 00/16] drm/exynos: Convert driver to drm bridge
Message-ID: <20201111101808.GA16630@pengutronix.de>
References: <CGME20200911165401epcas1p3c7ee84dd01db93f472d6fa21c1100f29@epcas1p3.samsung.com>
 <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <fa535450-cd68-415f-5c48-a4f753b2b70b@samsung.com>
 <20201110081336.GB13669@pengutronix.de>
 <fd177674-b22e-6743-9886-5590ccade2f5@samsung.com>
 <c56586b0-f616-6a57-3628-5840a99f6c1a@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c56586b0-f616-6a57-3628-5840a99f6c1a@samsung.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:17:33 up 265 days, 17:48, 92 users,  load average: 0.20, 0.28,
 0.27
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 11 Nov 2020 12:11:15 +0900, Inki Dae wrote:
> 20. 11. 11. 오후 12:04에 Inki Dae 이(가) 쓴 글:
> > 20. 11. 10. 오후 5:13에 Michael Tretter 이(가) 쓴 글:
> >> On Mon, 09 Nov 2020 12:15:39 +0900, Inki Dae wrote:
> >>> 20. 9. 11. 오후 10:53에 Michael Tretter 이(가) 쓴 글:
> >>>> This is v2 of the series to convert the Exynos MIPI DSI driver into a drm
> >>>> bridge and make it usable with other drivers. Although the driver is
> >>>> converted, it still supports the component framework API to stay compliant
> >>>> with the Exynos DRM driver.
> >>>>
> >>>> The Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
> >>>> i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
> >>>> the Exynos Decon. The driver for the LCDIF does not use the component
> >>>> framework, but uses drm bridges.
> >>>>
> >>>> I don't have any Exynos SoC to actually test the series. I build a dummy to
> >>>> test the bridge with a component driver, to make sure that at least the
> >>>> initialization is working. Furthermore, tested the driver as a bridge with a
> >>>> few additional unfinished patches on the i.MX8M Mini EVK. However, somebody
> >>>> should verify that the driver is still working on Exynos hardware.
> >>>>
> >>>> I also changed the order of the patches to first make the driver more platform
> >>>> independent (patches 2 to 8), then convert to a drm bridge driver (patches 10
> >>>
> >>> Just a fundamental question, A MIPI-DSI(Display Serial Interface) bus device
> >>> would be one of an encoder type of devices not bridge such as DSI to LVDS
> >>> and LVDS to DSI bridge devices, and also image enhancer and image compressor
> >>> in case of Exynos.
> >>
> >> I don't understand, why the MIPI-DSI bus device would be an encoder type and
> >> DSI to LVDS or MIPI-DSI to HDMI would be bridges. For example, the device tree
> >> documentation for the DSIM states that the DSIM receives RGB video as input
> >> and produces MIPI-DSI as output. Thus, the DSIM is basically a parallel RGB to
> > 
> > MIPI-DSI receives RGB video as input and encodes it to MIPI packet and then transfers the packet to MIPI panel.
> > And finally, MIPI panel decodes the packet and updates it - RGB data - on its SRAM.
> > 
> > MIPI-DSI driver programs how the RGB video should be made as MIPI packet. For more detail, you could refer to MIPI-DSI spec.
> > This would be why we handle MIPI-DSI driver as an encoder like other ARM SoC DRM drivers did.
> > 
> >> MIPI-DSI bridge and the encoder is the LCD controller that encodes the video
> >> data as parallel RGB.
> >>
> >> On the i.MX8MM, the LCDIF is already the encoder. On Exynos, the series
> >> implements the encoder in the platform glue, but in the end the encoder can
> >> probably be moved to the DECON.
> > 
> > As you know, Display controller can transfer RGB video to various devices such as RGB panel, CPU panel, LVDS panel via LVDS bridge, MIPI panel via MIPI-DSI bus device, and so on like below,
> > 
> > Display Controller --> RGB panel or CPU panel.
> > Display Controller --> LVDS bridge --> LVDS panel.
> > Display Controller --> MIPI DSI bus device --> MIPI Panel.
> > ...
> > 
> > Display controller drivers such as FIMD and DECON series in case of Exynos don't create an encoder driver-internally instead of it depends on Display pipeline configuration - what kind of Display panel is used.
> > In fact, if the Display pipeline uses RGB panel or CPU panel without Display bus device such as MIPI-DSI, then FIMD and DECON drivers create an encoder for it internally - just we separated the code to consider other type of panels.

What happens if I add a MIPI-DSI --> HDMI bridge to the Display pipeline? Then
the Pipeline is

Display Controller --> MIPI DSI bus device --> HDMI bridge --> HDMI Panel

If the type of the Display panel decides which part of the pipeline provides
the encoder, the HDMI bridge driver would be responsible for creating the
encoder, right? Thus, the MIPI-DSI driver would not be responsible for
creating the encoder and would also get the encoder from another driver.
Therefore, I prefer to think of the Display Controller as the encoder and
other bridges are just bridges.

BTW, this is exactly the Display pipeline that is used on the i.MX8MM EVK.

> > 
> > On the I.MX8MM, could you share how to handle an encoder if some board has only MIPI-DSI panel, and in this case, where is an encoder for it created? I looked into I.MX8MM DRM driver but didn't find MIPI-DSI driver.
> > Seems that they support only parallel display, HDMI and LVDS panel.
> 
> One more thing, If I saw correctly, the LVDS driver of IMX DRM - lmx_ldb - creates an encoder internally like MIPI-DSI driver of Exynos DRM did.

Yes, but the IMX DRM driver is not used on the i.MX8MM. The i.MX8MM uses the
LCDIF display controller instead of the IPU of the i.MX6. The driver for the
LCDIF is the mxsfb driver, which in turn uses the drm_simple_display_pipe,
which already provides the encoder. Therefore, to use a bridge driver with a
driver based on a drm_simple_display_pipe, the bridge driver must accept other
encoders.

Michael

> 
> > 
> > Thanks,
> > Inki Dae
> > 
> >>
> >>> Why do you want to convert such MIPI-DSI driver to bridge type of driver?
> >>> Seems not sensible. The reason would be just to share MIPI-DSI phy driver
> >>> for Exynos with i.MX8M Mini?
> >>
> >> Yes, the reason is that the driver should be shared between Exynos and
> >> i.MX8MM. It is the same IP and I don't see a reason why we should introduce
> >> another driver for the same IP if the driver works for both SoCs.
> >>
> >> Michael
> >>
> > 
> 
