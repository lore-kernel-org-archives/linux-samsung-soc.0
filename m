Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44733C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Nov 2020 08:13:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE86B20870
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Nov 2020 08:13:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727711AbgKJINk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Nov 2020 03:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbgKJINk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 03:13:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA22C0613CF
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Nov 2020 00:13:40 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kcOmY-0000Xc-KA; Tue, 10 Nov 2020 09:13:38 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kcOmW-0000np-HD; Tue, 10 Nov 2020 09:13:36 +0100
Date:   Tue, 10 Nov 2020 09:13:36 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Inki Dae <inki.dae@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com
Subject: Re: [PATCH v2 00/16] drm/exynos: Convert driver to drm bridge
Message-ID: <20201110081336.GB13669@pengutronix.de>
References: <CGME20200911165401epcas1p3c7ee84dd01db93f472d6fa21c1100f29@epcas1p3.samsung.com>
 <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <fa535450-cd68-415f-5c48-a4f753b2b70b@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa535450-cd68-415f-5c48-a4f753b2b70b@samsung.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:49:50 up 264 days, 15:20, 76 users,  load average: 0.13, 0.15,
 0.15
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 09 Nov 2020 12:15:39 +0900, Inki Dae wrote:
> 20. 9. 11. 오후 10:53에 Michael Tretter 이(가) 쓴 글:
> > This is v2 of the series to convert the Exynos MIPI DSI driver into a drm
> > bridge and make it usable with other drivers. Although the driver is
> > converted, it still supports the component framework API to stay compliant
> > with the Exynos DRM driver.
> > 
> > The Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
> > i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
> > the Exynos Decon. The driver for the LCDIF does not use the component
> > framework, but uses drm bridges.
> > 
> > I don't have any Exynos SoC to actually test the series. I build a dummy to
> > test the bridge with a component driver, to make sure that at least the
> > initialization is working. Furthermore, tested the driver as a bridge with a
> > few additional unfinished patches on the i.MX8M Mini EVK. However, somebody
> > should verify that the driver is still working on Exynos hardware.
> > 
> > I also changed the order of the patches to first make the driver more platform
> > independent (patches 2 to 8), then convert to a drm bridge driver (patches 10
> 
> Just a fundamental question, A MIPI-DSI(Display Serial Interface) bus device
> would be one of an encoder type of devices not bridge such as DSI to LVDS
> and LVDS to DSI bridge devices, and also image enhancer and image compressor
> in case of Exynos.

I don't understand, why the MIPI-DSI bus device would be an encoder type and
DSI to LVDS or MIPI-DSI to HDMI would be bridges. For example, the device tree
documentation for the DSIM states that the DSIM receives RGB video as input
and produces MIPI-DSI as output. Thus, the DSIM is basically a parallel RGB to
MIPI-DSI bridge and the encoder is the LCD controller that encodes the video
data as parallel RGB.

On the i.MX8MM, the LCDIF is already the encoder. On Exynos, the series
implements the encoder in the platform glue, but in the end the encoder can
probably be moved to the DECON.

> Why do you want to convert such MIPI-DSI driver to bridge type of driver?
> Seems not sensible. The reason would be just to share MIPI-DSI phy driver
> for Exynos with i.MX8M Mini?

Yes, the reason is that the driver should be shared between Exynos and
i.MX8MM. It is the same IP and I don't see a reason why we should introduce
another driver for the same IP if the driver works for both SoCs.

Michael
