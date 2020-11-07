Return-Path: <SRS0=3dq4=EN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F9FC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  7 Nov 2020 22:39:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB7232087E
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  7 Nov 2020 22:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgKGWjf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 7 Nov 2020 17:39:35 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:47594 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgKGWjf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 7 Nov 2020 17:39:35 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 227242001E;
        Sat,  7 Nov 2020 23:39:32 +0100 (CET)
Date:   Sat, 7 Nov 2020 23:39:30 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        jy0922.shim@samsung.com, b.zolnierkie@samsung.com,
        narmstrong@baylibre.com, sw0312.kim@samsung.com, krzk@kernel.org,
        a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, sylvester.nawrocki@gmail.com,
        Adrian Ratiu <adrian.ratiu@collabora.com>
Subject: Re: [PATCH v2 06/16] drm/exynos: shift register values to fields on
 write
Message-ID: <20201107223930.GE1052534@ravnborg.org>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <20200911135413.3654800-7-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911135413.3654800-7-m.tretter@pengutronix.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8 a=vnREMb7VAAAA:8 a=VwQbUJbxAAAA:8
        a=p7nbUh97NmR1ihCDxR4A:9 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22
        a=AjGcO6oz07-iQ99wixmX:22
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Michael.

On Fri, Sep 11, 2020 at 03:54:03PM +0200, Michael Tretter wrote:
> The phy timings are already shifted to the field position. If the driver
> is reused on multiple platforms, this exposes the field positions to the
> platform code.
> 
> Store only the timing values in the platform data and shift the value to
> the field when writing the fields to the registers.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

This and the following patch smells like the regmap functionality is
partly open coded. regmaps supports defining different register layouts
and select the correct layout at runtime.

See for example:
https://www.collabora.com/news-and-blog/blog/2020/05/27/using-regmaps-to-make-linux-drivers-more-generic/
or
https://www.youtube.com/watch?v=0RPDGANArFc

Some parts is not a perfect fit - but using regmaps will make it better
as a general and well-known solution is used.

@Adrian - see https://lore.kernel.org/dri-devel/20200911135413.3654800-1-m.tretter@pengutronix.de/T/#m8e211c8cce915168cf2b8c4eef1c7ec9b8447af8
for the original patch.

	Sam
