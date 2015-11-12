From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 08/25] drm/exynos: rotator: convert to common clock
 framework
Date: Thu, 12 Nov 2015 16:13:31 -0200
Message-ID: <20151112181331.GD2264@joana>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
 <1447161821-1877-9-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f179.google.com ([209.85.160.179]:34552 "EHLO
	mail-yk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751911AbbKLSNi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Nov 2015 13:13:38 -0500
Received: by ykfs79 with SMTP id s79so105754709ykf.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Nov 2015 10:13:38 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1447161821-1877-9-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Javier Martinez Canillas <javier@osg.samsung.com>

Hi Marek,

2015-11-10 Marek Szyprowski <m.szyprowski@samsung.com>:

> This driver was not used after introduction of common clock framework.
> This patch adds missing prepare/unprepare calls and allows to use it
> again with current kernel code.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
