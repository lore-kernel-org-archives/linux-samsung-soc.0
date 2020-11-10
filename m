Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F84FC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Nov 2020 18:52:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C621B20797
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Nov 2020 18:52:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730770AbgKJSwv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Nov 2020 13:52:51 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:55570 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgKJSwv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 13:52:51 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id D47D68073D;
        Tue, 10 Nov 2020 19:52:44 +0100 (CET)
Date:   Tue, 10 Nov 2020 19:52:43 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Inki Dae <inki.dae@samsung.com>,
        linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
        narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sw0312.kim@samsung.com, krzk@kernel.org, a.hajda@samsung.com,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
        sylvester.nawrocki@gmail.com, Laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 00/16] drm/exynos: Convert driver to drm bridge
Message-ID: <20201110185243.GB2814653@ravnborg.org>
References: <CGME20200911165401epcas1p3c7ee84dd01db93f472d6fa21c1100f29@epcas1p3.samsung.com>
 <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <fa535450-cd68-415f-5c48-a4f753b2b70b@samsung.com>
 <20201110081336.GB13669@pengutronix.de>
 <969deb9e-d883-49a9-5631-7747f0b3e583@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <969deb9e-d883-49a9-5631-7747f0b3e583@samsung.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=IkcTkHD0fZMA:10 a=nZFnvLcjIg9HzW9zXsUA:9 a=QEXdDO2ut3YA:10
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

On Tue, Nov 10, 2020 at 01:34:26PM +0100, Marek Szyprowski wrote:
> Hi Michael,
> 
> On 10.11.2020 09:13, Michael Tretter wrote:
> > On Mon, 09 Nov 2020 12:15:39 +0900, Inki Dae wrote:
> >> 20. 9. 11. 오후 10:53에 Michael Tretter 이(가) 쓴 글:
> >>> This is v2 of the series to convert the Exynos MIPI DSI driver into a drm
> >>> bridge and make it usable with other drivers. Although the driver is
> >>> converted, it still supports the component framework API to stay compliant
> >>> with the Exynos DRM driver.
> >>>
> >>> The Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
> >>> i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
> >>> the Exynos Decon. The driver for the LCDIF does not use the component
> >>> framework, but uses drm bridges.
> >>>
> >>> I don't have any Exynos SoC to actually test the series. I build a dummy to
> >>> test the bridge with a component driver, to make sure that at least the
> >>> initialization is working. Furthermore, tested the driver as a bridge with a
> >>> few additional unfinished patches on the i.MX8M Mini EVK. However, somebody
> >>> should verify that the driver is still working on Exynos hardware.
> >>>
> >>> I also changed the order of the patches to first make the driver more platform
> >>> independent (patches 2 to 8), then convert to a drm bridge driver (patches 10
> >> Just a fundamental question, A MIPI-DSI(Display Serial Interface) bus device
> >> would be one of an encoder type of devices not bridge such as DSI to LVDS
> >> and LVDS to DSI bridge devices, and also image enhancer and image compressor
> >> in case of Exynos.
> > I don't understand, why the MIPI-DSI bus device would be an encoder type and
> > DSI to LVDS or MIPI-DSI to HDMI would be bridges. For example, the device tree
> > documentation for the DSIM states that the DSIM receives RGB video as input
> > and produces MIPI-DSI as output. Thus, the DSIM is basically a parallel RGB to
> > MIPI-DSI bridge and the encoder is the LCD controller that encodes the video
> > data as parallel RGB.
> >
> > On the i.MX8MM, the LCDIF is already the encoder. On Exynos, the series
> > implements the encoder in the platform glue, but in the end the encoder can
> > probably be moved to the DECON.
> 
> This is probably the historical decision. That time when Exynos DSI 
> driver has been implemented, support for DRM bridges wasn't ready enough 
> to use to for such purpose.
> 
> Frankly, I'm still not convinced that the current DRM bridge framework 
> provides everything needed to reimplement the Exynos DSI driver with all 
> its features. There are a lots of corner cases and order-specific bits 
> in turning on/off the display pipeline, which don't map nicely to the 
> bridge pre_enable (called in post-order) and enable (called in 
> pre-order) callbacks. Especially if you consider that there might be 
> another bridge before and after.
> 
> I think that Andrzej Hajda already pointed those drawbacks of the 
> current design. Last week I've spent some significant amount of time 
> playing with exynos dsi code to check how to match its operations 
> (especially the runtime power management) to this design with the 
> current boards (Arndale with additional DSI->LVDS bridge and panel, 
> Trats2 with DSI panel and TM2e with MIC 'in-bridge' and DSI panel), but 
> without a success.

Can you help by iterating the missing pieces in the current bridge
infrastructure? Maybe it is something we can work out in a way that
benefits more than one bridge driver.

It would be nice with specific issues to look into.

Thanks in advance,

	Sam
