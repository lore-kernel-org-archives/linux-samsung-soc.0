From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 04/16] drm/exynos/hdmi: move PLL stabilization check code
 to separate function
Date: Wed, 30 Sep 2015 11:48:27 -0300
Message-ID: <20150930144827.GG21618@joana>
References: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
 <1443185309-13827-5-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f171.google.com ([209.85.160.171]:36245 "EHLO
	mail-yk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752113AbbI3Osb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 10:48:31 -0400
Received: by ykdt18 with SMTP id t18so46067592ykd.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2015 07:48:30 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1443185309-13827-5-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Andrzej,

2015-09-25 Andrzej Hajda <a.hajda@samsung.com>:

> The patch moves PLL stabilization check to separate function, adjust timeout
> parameters and de-duplicates code common for both HW variants.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 68 ++++++++++++++----------------------
>  1 file changed, 26 insertions(+), 42 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
