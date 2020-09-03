Return-Path: <SRS0=oxPC=CM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9123C43461
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 22:04:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8215920678
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 22:04:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bCVEl1OT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgICWEq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Sep 2020 18:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727804AbgICWEp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 18:04:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926FAC061244
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2020 15:04:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8420956E;
        Fri,  4 Sep 2020 00:04:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599170683;
        bh=E+/+FDToOL0NC3Mv9iT7KrVDJcatY/zLPusRkN1x/r8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bCVEl1OTlGDO9u5fWYD0fDbsmhJs5Pzy61Zt5DUI0dJDIkWocpRySwxGk3j/iLO4M
         HKB/iu3ywtUqYm/lQRP3B2Y0Yz3y+YhQiFx1nexnXHRUbFUCUlbAeg8rcX6S8jamTw
         Z8h3UCH3pIRj4gBoPLNLz5xcKQIvcbcKTmUXgX5Y=
Date:   Fri, 4 Sep 2020 01:04:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        kernel@pengutronix.de, krzk@kernel.org, narmstrong@baylibre.com
Subject: Re: [PATCH 01/16] drm/encoder: remove obsolete documentation of
 bridge
Message-ID: <20200903220419.GI6492@pendragon.ideasonboard.com>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
 <20200903165717.1272492-2-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200903165717.1272492-2-m.tretter@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Thu, Sep 03, 2020 at 06:57:02PM +0200, Michael Tretter wrote:
> In commit 05193dc38197 ("drm/bridge: Make the bridge chain a
> double-linked list") the bridge has been removed and replaced by a
> private field. Remove the leftover documentation of the removed field.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/drm/drm_encoder.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index a60f5f1555ac..5dfa5f7a80a7 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -89,7 +89,6 @@ struct drm_encoder_funcs {
>   * @head: list management
>   * @base: base KMS object
>   * @name: human readable name, can be overwritten by the driver
> - * @bridge: bridge associated to the encoder
>   * @funcs: control functions
>   * @helper_private: mid-layer private data
>   *

-- 
Regards,

Laurent Pinchart
