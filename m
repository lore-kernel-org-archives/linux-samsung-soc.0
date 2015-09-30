From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 07/16] drm/exynos/hdmi: fix removal order
Date: Wed, 30 Sep 2015 11:57:31 -0300
Message-ID: <20150930145731.GJ21618@joana>
References: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
 <1443185309-13827-8-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f174.google.com ([209.85.160.174]:33359 "EHLO
	mail-yk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752464AbbI3O5f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 10:57:35 -0400
Received: by ykft14 with SMTP id t14so46508274ykf.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2015 07:57:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1443185309-13827-8-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Andrzej,

2015-09-25 Andrzej Hajda <a.hajda@samsung.com>:

> DRM device should be destroyed before releasing resources.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
