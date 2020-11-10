Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E19C55ABD
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Nov 2020 08:28:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9E6E2080A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Nov 2020 08:28:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgKJI2T (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Nov 2020 03:28:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgKJI2T (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 03:28:19 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3E3C0613CF
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Nov 2020 00:28:18 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kcP0h-0002KR-T5; Tue, 10 Nov 2020 09:28:15 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kcP0f-0001KH-Tn; Tue, 10 Nov 2020 09:28:13 +0100
Date:   Tue, 10 Nov 2020 09:28:13 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        jy0922.shim@samsung.com, b.zolnierkie@samsung.com,
        narmstrong@baylibre.com, sw0312.kim@samsung.com, krzk@kernel.org,
        a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, sylvester.nawrocki@gmail.com,
        Adrian Ratiu <adrian.ratiu@collabora.com>
Subject: Re: [PATCH v2 06/16] drm/exynos: shift register values to fields on
 write
Message-ID: <20201110082813.GC13669@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <20200911135413.3654800-7-m.tretter@pengutronix.de>
 <20201107223930.GE1052534@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201107223930.GE1052534@ravnborg.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:19:04 up 264 days, 15:49, 88 users,  load average: 0.18, 0.17,
 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 07 Nov 2020 23:39:30 +0100, Sam Ravnborg wrote:
> On Fri, Sep 11, 2020 at 03:54:03PM +0200, Michael Tretter wrote:
> > The phy timings are already shifted to the field position. If the driver
> > is reused on multiple platforms, this exposes the field positions to the
> > platform code.
> > 
> > Store only the timing values in the platform data and shift the value to
> > the field when writing the fields to the registers.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> 
> This and the following patch smells like the regmap functionality is
> partly open coded. regmaps supports defining different register layouts
> and select the correct layout at runtime.
> 
> See for example:
> https://www.collabora.com/news-and-blog/blog/2020/05/27/using-regmaps-to-make-linux-drivers-more-generic/
> or
> https://www.youtube.com/watch?v=0RPDGANArFc
> 
> Some parts is not a perfect fit - but using regmaps will make it better
> as a general and well-known solution is used.

I considered using regmaps, but there was something that didn't work out.
Unfortunately, I don't remember, what it actually was. Therefore, it is
probably best to use regmaps here.

Michael

> 
> @Adrian - see https://lore.kernel.org/dri-devel/20200911135413.3654800-1-m.tretter@pengutronix.de/T/#m8e211c8cce915168cf2b8c4eef1c7ec9b8447af8
> for the original patch.
> 
> 	Sam
> 
