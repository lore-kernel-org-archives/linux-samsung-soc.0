From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 01/16] drm/exynos/hdmi: remove support for deprecated
 compatible
Date: Wed, 30 Sep 2015 11:35:44 -0300
Message-ID: <20150930143544.GD21618@joana>
References: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
 <1443185309-13827-2-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f179.google.com ([209.85.160.179]:34096 "EHLO
	mail-yk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751436AbbI3Ofr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 10:35:47 -0400
Received: by ykdg206 with SMTP id g206so44415629ykd.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2015 07:35:47 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1443185309-13827-2-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Andrzej,

2015-09-25 Andrzej Hajda <a.hajda@samsung.com>:

> This compatible was marked as deprecated in Jun 2013 and it is not used since
> then. Additionally its driver data points to wrong pll settings, so it
> cannot work anyway.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 10 ----------
>  1 file changed, 10 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
