From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/exynos/ipp: Replace struct timeval usage
Date: Mon, 01 Jun 2015 21:26:35 +0200
Message-ID: <1520355.0EVvn96T68@wuerfel>
References: <20150601033859.GA3254@tinar>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:52927 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751425AbbFAT0l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jun 2015 15:26:41 -0400
In-Reply-To: <20150601033859.GA3254@tinar>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tina Ruchandani <ruchandani.tina@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, y2038@lists.linaro.org

On Monday 01 June 2015 09:09:00 Tina Ruchandani wrote:
> @@ -1518,10 +1519,11 @@ static int ipp_send_event(struct exynos_drm_ippdrv *ippdrv,
>         e = list_first_entry(&c_node->event_list,
>                 struct drm_exynos_ipp_send_event, base.link);
>  
> -       do_gettimeofday(&now);
> -       DRM_DEBUG_KMS("tv_sec[%ld]tv_usec[%ld]\n", now.tv_sec, now.tv_usec);
> +       getnstimeofday64(&now);
> +       DRM_DEBUG_KMS("tv_sec[%lld]tv_usec[%lld]\n", now.tv_sec, (now.tv_nsec /
> +                                                               NSEC_PER_SEC));
>         e->event.tv_sec = now.tv_sec;
> -       e->event.tv_usec = now.tv_usec;
> +       e->event.tv_usec = now.tv_nsec / NSEC_PER_SEC;
>         e->event.prop_id = property->prop_id;
>  

Unfortunately, this has two important bugs:

* e->event.tv_sec is defined as a '__u32' variable and is used in a public
  user space API, so the code is just as broken afterwards as it was before.
  Fixing this will require adding new ioctl commands.

* You have a typo above: I assume you mean NSEC_PER_USEC instead of
  NSEC_PER_SEC, the current code will always assign tv_usec to zero,
  because now.tv_nsec is by definition smaller than NSEC_PER_SEC.

	Arnd
