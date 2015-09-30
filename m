From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 09/16] drm/exynos/hdmi: use constant size array for
 regulators
Date: Wed, 30 Sep 2015 12:08:12 -0300
Message-ID: <20150930150812.GK21618@joana>
References: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
 <1443185309-13827-10-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:33000 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750768AbbI3PIQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 11:08:16 -0400
Received: by ykft14 with SMTP id t14so46892853ykf.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2015 08:08:16 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1443185309-13827-10-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Andrzej,

2015-09-25 Andrzej Hajda <a.hajda@samsung.com>:

> Driver always uses the same number of regulators, so there is no point in
> dynamic allocation.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
