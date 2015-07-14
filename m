From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 0/7] drm/exynos/hdmi: refactoring/cleanup patches
Date: Tue, 14 Jul 2015 15:43:18 +0900
Message-ID: <55A4AF86.9070608@samsung.com>
References: <1436452092-20757-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43908 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751018AbbGNGnX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jul 2015 02:43:23 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NRG02BNFTC50B90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jul 2015 15:43:17 +0900 (KST)
In-reply-to: <1436452092-20757-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

On 07/09/2015 11:28 PM, Andrzej Hajda wrote:
> Hi Inki, Joonyoung,
> 
> These patches removes obsolete and old structures, to simplify further
> development. They should not change behavior of the driver.
> 
> The patchset is based on exynos-drm-next plus my HDMI related fixes [1].
> 
> The patchset was tested on Universal and Odroid U3.
> 
> [1]: http://permalink.gmane.org/gmane.comp.video.dri.devel/132348
> 
> Regards
> Andrzej
> 
> 
> Andrzej Hajda (7):
>   drm/exynos/hdmi: remove old platform data code
>   drm/exynos/hdmi: Simplify HPD gpio handling
>   drm/exynos/hdmi: remove private lock code
>   drm/exynos/hdmi: add driver data pointer to private context
>   drm/exynos/hdmi: remove redundant configuration fields
>   drm/exynos/hdmi: remove hdmi_v13_conf struct
>   drm/exynos/hdmi: remove hdmi_v14_conf struct
> 
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 860 ++++++++++-------------------------
>  1 file changed, 245 insertions(+), 615 deletions(-)
> 

Looks good to me about this patchset,

Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
