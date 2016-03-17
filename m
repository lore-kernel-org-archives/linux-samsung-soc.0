From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] drm/exynos: fimd: fix broken dp_clock control
Date: Thu, 17 Mar 2016 16:19:28 +0900
Message-ID: <56EA5A80.9060903@samsung.com>
References: <1458197592-5050-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:56070 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753153AbcCQHTg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Mar 2016 03:19:36 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4600MFD9OLND90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Mar 2016 07:19:33 +0000 (GMT)
In-reply-to: <1458197592-5050-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Chanho Park <chanho61.park@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 17.03.2016 15:53, Marek Szyprowski wrote:
> Commit 1feafd3afd294b03dbbedb8e8f94e0c4db526f10 ("drm/exynos: add

The commit exists only in next so the SHA might be useless in case of
rebase of drm-exynos tree.

> exynos5420 support for fimd") add support for Exynos 5420 SoC, but it
> broke enabling display clock feature because of incorrect condition
> check. This patch fixes it, so display is working again on platforms
> requiring display clock control (i.e. Exynos5250-based SNOW platform).
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>



Best regards,

Krzysztof
