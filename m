From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 09/25] drm/exynos: exynos7-decon: remove excessive check
Date: Thu, 12 Nov 2015 16:15:55 -0200
Message-ID: <20151112181555.GE2264@joana>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
 <1447161821-1877-10-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f181.google.com ([209.85.160.181]:36069 "EHLO
	mail-yk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753235AbbKLSQA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Nov 2015 13:16:00 -0500
Received: by ykdr82 with SMTP id r82so105418531ykd.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Nov 2015 10:15:59 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1447161821-1877-10-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Javier Martinez Canillas <javier@osg.samsung.com>

Hi Marek,

2015-11-10 Marek Szyprowski <m.szyprowski@samsung.com>:

> Display area is already checked by exynos plane core, so there is no
> need for such check in driver code.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 10 ----------
>  1 file changed, 10 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
