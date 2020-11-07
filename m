Return-Path: <SRS0=3dq4=EN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5576CC388F9
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  7 Nov 2020 22:17:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E06420719
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  7 Nov 2020 22:17:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgKGWRt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 7 Nov 2020 17:17:49 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:46626 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgKGWRt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 7 Nov 2020 17:17:49 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 067C82001E;
        Sat,  7 Nov 2020 23:17:45 +0100 (CET)
Date:   Sat, 7 Nov 2020 23:17:44 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        jy0922.shim@samsung.com, b.zolnierkie@samsung.com,
        narmstrong@baylibre.com, sw0312.kim@samsung.com, krzk@kernel.org,
        a.hajda@samsung.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@pengutronix.de, sylvester.nawrocki@gmail.com
Subject: Re: [PATCH v2 01/16] drm/encoder: remove obsolete documentation of
 bridge
Message-ID: <20201107221744.GA1052534@ravnborg.org>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <20200911135413.3654800-2-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911135413.3654800-2-m.tretter@pengutronix.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=bhWmGRyT7yQ3OOhjoyEA:9
        a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 11, 2020 at 03:53:58PM +0200, Michael Tretter wrote:
> In commit 05193dc38197 ("drm/bridge: Make the bridge chain a
> double-linked list") the bridge has been removed and replaced by a
> private field. Remove the leftover documentation of the removed field.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hi Michael.

Applied to drm-misc-next, thanks.
The rest of this patch-set is exynos stuff, that the maintainer needs to
deal with but I will try to take a look at some of the patches.

	Sam
