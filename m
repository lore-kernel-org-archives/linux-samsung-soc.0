From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 00/15] drm/exynos/ipp: image post processing fixes and
 improvements, part four
Date: Tue, 26 Aug 2014 15:52:50 +0900
Message-ID: <53FC2EC2.2030204@samsung.com>
References: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36631 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752889AbaHZGww (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Aug 2014 02:52:52 -0400
In-reply-to: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>

On 08/22/2014 04:52 PM, Andrzej Hajda wrote:
> This set of patches contains various improvement and fixes
> for exynos_drm ipp framework.
> The patchset is based on exynos-drm-next branch.
> 
> IPP framework was tested for regressions on exynos4210-trats target.
> 
> Regards
> Andrzej
> 
> 
> Andrzej Hajda (15):
>   drm/exynos/ipp: remove fake pm callbacks
>   drm/exynos/ipp: cancel works before command node clean
>   drm/exynos/ipp: move file reference from memory to command node
>   drm/exynos/ipp: remove only related commands on file close
>   drm/exynos/ipp: remove unused field in command node
>   drm/exynos/ipp: free partially allocated resources on error
>   drm/exynos/ipp: move nodes cleaning to separate function
>   drm/exynos/ipp: clean memory nodes on command node cleaning
>   drm/exynos/ipp: replace work_struct casting with better constructs
>   drm/exynos/ipp: stop hardware before freeing memory
>   drm/exynos/ipp: remove events during command cleaning
>   drm/exynos/fimc: avoid clearing overflow bits
>   drm/exynos/fimc: do not enable fimc twice
>   drm/exynos/fimc: simplify buffer queuing
>   drm/exynos/fimc: fix source buffer registers

With some minor comments,

Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>

Thanks.

> 
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c    |  90 ++-----
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c     |   3 +-
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c     | 369 ++++++++++++----------------
>  drivers/gpu/drm/exynos/exynos_drm_ipp.h     |   4 +-
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c |   3 +-
>  5 files changed, 180 insertions(+), 289 deletions(-)
> 
