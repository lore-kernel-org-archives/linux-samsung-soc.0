From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Y2038] [PATCH] drm/exynos: g2d: Replace struct timeval usage
Date: Mon, 01 Jun 2015 21:27:42 +0200
Message-ID: <11771769.CzI59d4H3P@wuerfel>
References: <20150601030618.GA2754@tinar>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:49332 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751220AbbFAT1u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jun 2015 15:27:50 -0400
In-Reply-To: <20150601030618.GA2754@tinar>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: y2038@lists.linaro.org
Cc: Tina Ruchandani <ruchandani.tina@gmail.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-arm-kernel@lists.infradead.org

On Monday 01 June 2015 08:36:18 Tina Ruchandani wrote:
> -       do_gettimeofday(&now);
> +       getnstimeofday64(&now);
>         e->event.tv_sec = now.tv_sec;
> -       e->event.tv_usec = now.tv_usec;
> +       e->event.tv_usec = (now.tv_nsec / NSEC_PER_USEC);
>         e->event.cmdlist_no = cmdlist_no;
> 

This has the same problem as the ipp patch: e->event.tv_sec is
a 32-bit variable, so this will still overflow, and the patch
has no effect.

	Arnd
