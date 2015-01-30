From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH] exynos/drm: fix no hdmi output
Date: Fri, 30 Jan 2015 12:55:08 -0200
Message-ID: <20150130145508.GF30820@joana>
References: <1422566320-6126-1-git-send-email-prahal@yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f179.google.com ([209.85.216.179]:61122 "EHLO
	mail-qc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932565AbbA3OzL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Jan 2015 09:55:11 -0500
Content-Disposition: inline
In-Reply-To: <1422566320-6126-1-git-send-email-prahal@yahoo.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alban Browaeys <alban.browaeys@gmail.com>
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-next@vger.kernel.org, Alban Browaeys <prahal@yahoo.com>

Hi Alban,

2015-01-29 Alban Browaeys <alban.browaeys@gmail.com>:

> The hdmi outputs black screen only even though under the hood Xorg and
> framebuffer console  are fine : devices found and initialized, but
> not a pixel out.
> 
> Commit 93bca243ec96 ("drm/exynos: remove struct exynos_drm_manager")
> changed the call order of mixer_initialize with regards to
>  exynos_drm_crtc_create.
> 
> This changes breaks hdmi out on Odroid U2 (linux-next with added
>  Marek Szyprowski v4 hdmi patchset from linux-samsung-soc ML).
> 
> Restore the previous call ordering get hdmi to ouput proper pixels:
> ie call mixer_initialize first then exynos_drm_crtc_create.
> 
> Fixes: 93bca243ec96 ("drm/exynos: remove struct exynos_drm_manager")
> Signed-off-by: Alban Browaeys <prahal@yahoo.com>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
