From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Subject: Re: [PATCH v2 3/3] drm/exynos: initialize VIDCON0 when fimd is
 disabled
Date: Mon, 15 Jun 2015 17:44:15 -0300
Message-ID: <20150615204415.GC4650@joana>
References: <1434097636-10709-1-git-send-email-jy0922.shim@samsung.com>
 <1434097636-10709-3-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:59115 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752028AbbFOUoY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 16:44:24 -0400
Content-Disposition: inline
In-Reply-To: <1434097636-10709-3-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com, m.szyprowski@samsung.com, a.hajda@samsung.com

Hi Joonyoung,

2015-06-12 Joonyoung Shim <jy0922.shim@samsung.com>:

> When the fimd is disabled by fimd_disable(), enabled overlay layers also
> are disabled. If clocks for fimd are enabled by fimd_enable() on this
> case, it can lead IOMMU page fault. The reason is that VIDCON0_ENVID and
> VIDCON0_ENVID_F bits of VIDCON0 register are set still even though fimd
> is disabled, so it may continue display output of prior when clocks for
> fimd are enabled again.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
