From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH 0/3] drm/exynos: fimd: get signal polarities from device
 tree
Date: Tue, 27 Aug 2013 11:46:26 +0900
Message-ID: <02a501cea2cf$9fc08f50$df41adf0$%dae@samsung.com>
References: <1377094923-6919-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:21300 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751807Ab3H0Cq3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 22:46:29 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MS600G4K51CQK50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Aug 2013 11:46:26 +0900 (KST)
In-reply-to: <1377094923-6919-1-git-send-email-a.hajda@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Andrzej Hajda' <a.hajda@samsung.com>, "'open list:DRM DRIVERS FOR E...'" <dri-devel@lists.freedesktop.org>
Cc: 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'David Airlie' <airlied@linux.ie>, "'moderated list:ARM/S5P EXYNOS AR...'" <linux-samsung-soc@vger.kernel.org>, t.figa@samsung.com, s.nawrocki@samsung.com



> -----Original Message-----
> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-
> owner@vger.kernel.org] On Behalf Of Andrzej Hajda
> Sent: Wednesday, August 21, 2013 11:22 PM
> To: open list:DRM DRIVERS FOR E...
> Cc: Andrzej Hajda; Inki Dae; Joonyoung Shim; Seung-Woo Kim; Kyungmin Park;
> David Airlie; moderated list:ARM/S5P EXYNOS AR...; t.figa@samsung.com;
> s.nawrocki@samsung.com
> Subject: [PATCH 0/3] drm/exynos: fimd: get signal polarities from device
> tree
> 
> Hi,
> 
> This patch series adds signal polarities parsing from display-timings
> devicetree node. To do it efficiently struct fb_videomode is replaced
> with struct videomode and some additional code cleaning is performed.
> 

Good patch set. Applied.

Thanks,
Inki Dae


> The patches are for drm-exynos/exynos-drm-next branch.
> 
> Regards
> Andrzej Hajda
> 
> Andrzej Hajda (3):
>   drm/exynos: fimd: replace struct fb_videomode with videomode
>   drm/exynos: fimd: get signal polarities from device tree
>   drm/exynos: fimd: move platform data parsing to separate function
> 
>  drivers/gpu/drm/exynos/exynos_drm_connector.c |  33 +----
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 189
+++++++++++++---------
> ----
>  include/drm/exynos_drm.h                      |   3 +-
>  3 files changed, 103 insertions(+), 122 deletions(-)
> 
> --
> 1.8.1.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-
> soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
