From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 4/7] gpio/samsung: Remove useless old Samsung related
 GPIO drivers
Date: Tue, 20 Sep 2011 17:45:02 -0600
Message-ID: <20110920234502.GU7781@ponder.secretlab.ca>
References: <1314707249-12241-1-git-send-email-kgene.kim@samsung.com>
 <1314707249-12241-5-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:33188 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751915Ab1ITXpH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Sep 2011 19:45:07 -0400
Received: by yxl31 with SMTP id 31so759603yxl.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Sep 2011 16:45:05 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1314707249-12241-5-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Aug 30, 2011 at 09:27:26PM +0900, Kukjin Kim wrote:
> Since gpio-samsung.c can replace old Samsung GPIO drivers,
> this patch removes them.
> 
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Removing this code before adding the new code means it is not
bisectable.  I'll squash the two patches together when I pick them
up..

g.

> ---
>  arch/arm/plat-samsung/Makefile      |    2 -
>  arch/arm/plat-samsung/gpio-config.c |  431 -----------------------------
>  arch/arm/plat-samsung/gpio.c        |  167 ------------
>  drivers/gpio/Kconfig                |   28 --
>  drivers/gpio/Makefile               |    9 -
>  drivers/gpio/gpio-exynos4.c         |  385 --------------------------
>  drivers/gpio/gpio-plat-samsung.c    |  205 --------------
>  drivers/gpio/gpio-s3c24xx.c         |  283 -------------------
>  drivers/gpio/gpio-s3c64xx.c         |  289 --------------------
>  drivers/gpio/gpio-s5p64x0.c         |  510 -----------------------------------
>  drivers/gpio/gpio-s5pc100.c         |  354 ------------------------
>  drivers/gpio/gpio-s5pv210.c         |  287 --------------------
>  12 files changed, 0 insertions(+), 2950 deletions(-)
>  delete mode 100644 arch/arm/plat-samsung/gpio-config.c
>  delete mode 100644 arch/arm/plat-samsung/gpio.c
>  delete mode 100644 drivers/gpio/gpio-exynos4.c
>  delete mode 100644 drivers/gpio/gpio-plat-samsung.c
>  delete mode 100644 drivers/gpio/gpio-s3c24xx.c
>  delete mode 100644 drivers/gpio/gpio-s3c64xx.c
>  delete mode 100644 drivers/gpio/gpio-s5p64x0.c
>  delete mode 100644 drivers/gpio/gpio-s5pc100.c
>  delete mode 100644 drivers/gpio/gpio-s5pv210.c
> 
