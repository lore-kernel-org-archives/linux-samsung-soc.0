Return-Path: <SRS0=uzqe=4O=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC57AC4BA0E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Feb 2020 10:24:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A61320801
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Feb 2020 10:24:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HGLQ0n4P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbgBZKYk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 Feb 2020 05:24:40 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35122 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727457AbgBZKYj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 05:24:39 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16B8843F;
        Wed, 26 Feb 2020 11:24:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582712678;
        bh=Lm8rEXb3feusd6GdVTy83/P52TZ8Y0opBd2NmJhOjIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HGLQ0n4Pg/B5DYhIIpYGrRDviRYdkooY/NUKhcd9cY39tRGPapLNC0/OGw+AGYpqv
         Vpaz0n5QASQyz04bRuQrfXr46tWb8eJqvqrQ8x53rAxpbFUn+DiyrMXUVjQD6cJJLK
         /vVFJph7sMhd12fy4kCMCuk3haz1wVC/4b7gNRsA=
Date:   Wed, 26 Feb 2020 12:24:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH] drm/bridge: sii9234: silence warning about regulators
 during deferred probe
Message-ID: <20200226102416.GA4770@pendragon.ideasonboard.com>
References: <CGME20200226101316eucas1p2fd16a7c821632084710167216b78f6c5@eucas1p2.samsung.com>
 <20200226101307.16708-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200226101307.16708-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Wed, Feb 26, 2020 at 11:13:07AM +0100, Marek Szyprowski wrote:
> Don't confuse user with meaningless warning about failure in getting
> regulators in case of deferred probe.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/sii9234.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index f81f81b7051f..b1258f0ed205 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -836,7 +836,8 @@ static int sii9234_init_resources(struct sii9234 *ctx,
>  	ctx->supplies[3].supply = "cvcc12";
>  	ret = devm_regulator_bulk_get(ctx->dev, 4, ctx->supplies);
>  	if (ret) {
> -		dev_err(ctx->dev, "regulator_bulk failed\n");
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(ctx->dev, "regulator_bulk failed\n");
>  		return ret;
>  	}
>  

-- 
Regards,

Laurent Pinchart
