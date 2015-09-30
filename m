From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH] drm/exynos: dp: remove suspend/resume functions
Date: Wed, 30 Sep 2015 11:25:01 -0300
Message-ID: <20150930142501.GA21618@joana>
References: <1443612079-28094-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f182.google.com ([209.85.160.182]:32852 "EHLO
	mail-yk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754522AbbI3OZG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 10:25:06 -0400
Received: by ykft14 with SMTP id t14so45229886ykf.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2015 07:25:06 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1443612079-28094-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com

Hi Inki,

2015-09-30 Inki Dae <inki.dae@samsung.com>:

> This patch removes unnecessary pm suspend/resume functions.
> 
> All kms sub drivers will be controlled by top of Exynos drm driver
> and connector dpms so these sub drivers shouldn't have their own
> pm interfaces.
> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c | 23 -----------------------
>  1 file changed, 23 deletions(-)

This sounds reasonable to me.

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
