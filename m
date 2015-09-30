From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 05/16] drm/exynos/hdmi: simplify HDMI-PHY power sequence
Date: Wed, 30 Sep 2015 11:53:03 -0300
Message-ID: <20150930145303.GH21618@joana>
References: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
 <1443185309-13827-6-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f180.google.com ([209.85.160.180]:34290 "EHLO
	mail-yk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751641AbbI3OxH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 10:53:07 -0400
Received: by ykdg206 with SMTP id g206so44993266ykd.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2015 07:53:06 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1443185309-13827-6-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Andrzej,

2015-09-25 Andrzej Hajda <a.hajda@samsung.com>:

> Currently driver tries to set specific HDMI-PHY registers in three situations:
> - before reset,
> - before power off,
> - after applying HDMI-PHY configuration.
> 
> First two cases seems to be unnecessary - register contents will be lost
> anyway. The third case can be merged with HDMI-PHY configuration by fixing
> the last byte of configuration data.
> 
> The patch has been tested with following platforms:
> - exynos4210-universal_c210,
> - exynos4412-odroidu3,
> - exynos5422-odroidxu3.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 93 ++++--------------------------------
>  1 file changed, 8 insertions(+), 85 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
