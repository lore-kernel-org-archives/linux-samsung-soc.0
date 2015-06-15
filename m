From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Subject: Re: [PATCH v2 1/3] drm/exynos: remove to call mixer_wait_for_vblank
Date: Mon, 15 Jun 2015 17:39:59 -0300
Message-ID: <20150615203959.GA4650@joana>
References: <1434097636-10709-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:59103 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751864AbbFOUkJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 16:40:09 -0400
Content-Disposition: inline
In-Reply-To: <1434097636-10709-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com, m.szyprowski@samsung.com, a.hajda@samsung.com

Hi Joonyoung,

2015-06-12 Joonyoung Shim <jy0922.shim@samsung.com>:

> The reason waiting vblank is to be power gated and disabled clocks after
> dma operation is completed. The dma operation is stopped already before
> be power gated and clocks are disabled when mixer is disabled by commit
> 381be025ac1a6("drm/exynos: stop mixer before gating clocks during
> poweroff"). Don't need to wait vblank anymore.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
