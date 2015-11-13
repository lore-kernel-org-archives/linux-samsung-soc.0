From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 16/25] drm/exynos: mixer: use ratio precalculated in
 exynos_state
Date: Fri, 13 Nov 2015 10:35:04 -0200
Message-ID: <20151113123504.GL2264@joana>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
 <1447161821-1877-17-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f174.google.com ([209.85.160.174]:34303 "EHLO
	mail-yk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752126AbbKMMfH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2015 07:35:07 -0500
Received: by ykfs79 with SMTP id s79so143602685ykf.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2015 04:35:07 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1447161821-1877-17-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Javier Martinez Canillas <javier@osg.samsung.com>

Hi Marek,

2015-11-10 Marek Szyprowski <m.szyprowski@samsung.com>:

> Common plane code already calculates and checks for supported scalling
> modes, so additional code in mixer driver can be now removed.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 33 +++------------------------------
>  1 file changed, 3 insertions(+), 30 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
