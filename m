From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2] drm/exynos/decon5433: set STANDALONE_UPDATE_F also if
 planes are disabled
Date: Fri, 13 Jan 2017 17:55:53 +0900
Message-ID: <aa240581-5f90-400b-baef-f6488dec939a@samsung.com>
References: <1484295026-16435-1-git-send-email-a.hajda@samsung.com>
 <CGME20170113084308eucas1p24db5cafc0cc94556beaabfc4cfde8200@eucas1p2.samsung.com>
 <1484296979-17195-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39956 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751304AbdAMIz0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Jan 2017 03:55:26 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OJP01TVFNGCS580@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jan 2017 17:55:24 +0900 (KST)
In-reply-to: <1484296979-17195-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

Hi Andrzej,

On 01/13/2017 05:42 PM, Andrzej Hajda wrote:
> @@ -339,8 +342,10 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
>  		decon_shadow_protect_win(ctx, i, false);
>  
>  	/* update iff there are active windows */
> -	if (crtc->base.state->plane_mask)
> +	if (test_bit(BIT_REQUEST_UPDATE, &ctx->flags)) {

It's better to just use test_and_clear_bit?

>  		decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
> +		clear_bit(BIT_REQUEST_UPDATE, &ctx->flags);
> +	}
>  
>  	if (ctx->out_type & IFTYPE_I80)
>  		set_bit(BIT_WIN_UPDATED, &ctx->flags);
> 

I tested on TM2E board,

Tested-by: Joonyoung Shim <jy0922.shim@samsung.com>

Thanks.
