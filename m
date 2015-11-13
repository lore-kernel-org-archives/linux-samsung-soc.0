From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 15/25] drm/exynos: add generic check for plane state
Date: Fri, 13 Nov 2015 10:30:17 -0200
Message-ID: <20151113123017.GK2264@joana>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
 <1447161821-1877-16-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f181.google.com ([209.85.160.181]:35323 "EHLO
	mail-yk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932234AbbKMMaW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2015 07:30:22 -0500
Received: by ykba77 with SMTP id a77so142624180ykb.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2015 04:30:21 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1447161821-1877-16-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Javier Martinez Canillas <javier@osg.samsung.com>

Hi Marek,

2015-11-10 Marek Szyprowski <m.szyprowski@samsung.com>:

> This patch adds generic check for plane state: pixel format and display
> area dimensions, so drivers can always assume that they get valid plane
> state to set.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 ++
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 51 +++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
