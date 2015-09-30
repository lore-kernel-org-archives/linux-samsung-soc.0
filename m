From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 13/16] drm/exynos/hdmi: convert container_of macro to
 inline function
Date: Wed, 30 Sep 2015 12:08:38 -0300
Message-ID: <20150930150838.GL21618@joana>
References: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
 <1443185309-13827-14-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f180.google.com ([209.85.160.180]:36080 "EHLO
	mail-yk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751921AbbI3PIm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 11:08:42 -0400
Received: by ykdt18 with SMTP id t18so46768865ykd.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2015 08:08:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1443185309-13827-14-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Andrzej,

2015-09-25 Andrzej Hajda <a.hajda@samsung.com>:

> Inline function is safer than macro, also the name has been changed to
> be consistent with other inline function encoder_to_hdmi.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
