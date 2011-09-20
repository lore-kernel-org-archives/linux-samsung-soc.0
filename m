From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 4/7] gpio/samsung: Remove useless old Samsung related GPIO
 drivers
Date: Wed, 21 Sep 2011 08:53:59 +0900
Message-ID: <003b01cc77f0$91e54580$b5afd080$%kim@samsung.com>
References: <1314707249-12241-1-git-send-email-kgene.kim@samsung.com>
 <1314707249-12241-5-git-send-email-kgene.kim@samsung.com>
 <20110920234502.GU7781@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40178 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752178Ab1ITXyD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Sep 2011 19:54:03 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRU00F4RI9P0P80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 08:54:01 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRU00JYGIE01H@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 08:54:01 +0900 (KST)
In-reply-to: <20110920234502.GU7781@ponder.secretlab.ca>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Grant Likely' <grant.likely@secretlab.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Grant Likely wrote:
> 
> On Tue, Aug 30, 2011 at 09:27:26PM +0900, Kukjin Kim wrote:
> > Since gpio-samsung.c can replace old Samsung GPIO drivers,
> > this patch removes them.
> >
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > Cc: Grant Likely <grant.likely@secretlab.ca>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> 
> Removing this code before adding the new code means it is not
> bisectable.  I'll squash the two patches together when I pick them
> up..
> 
OK, no problem and would be better to me if you could create some topic
branch for this series. I'd like to merge it to avoid conflicts with Samsung
stuff.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> 
> > ---
> >  arch/arm/plat-samsung/Makefile      |    2 -
> >  arch/arm/plat-samsung/gpio-config.c |  431
-----------------------------
> >  arch/arm/plat-samsung/gpio.c        |  167 ------------
> >  drivers/gpio/Kconfig                |   28 --
> >  drivers/gpio/Makefile               |    9 -
> >  drivers/gpio/gpio-exynos4.c         |  385 --------------------------
> >  drivers/gpio/gpio-plat-samsung.c    |  205 --------------
> >  drivers/gpio/gpio-s3c24xx.c         |  283 -------------------
> >  drivers/gpio/gpio-s3c64xx.c         |  289 --------------------
> >  drivers/gpio/gpio-s5p64x0.c         |  510
-----------------------------------
> >  drivers/gpio/gpio-s5pc100.c         |  354 ------------------------
> >  drivers/gpio/gpio-s5pv210.c         |  287 --------------------
> >  12 files changed, 0 insertions(+), 2950 deletions(-)
> >  delete mode 100644 arch/arm/plat-samsung/gpio-config.c
> >  delete mode 100644 arch/arm/plat-samsung/gpio.c
> >  delete mode 100644 drivers/gpio/gpio-exynos4.c
> >  delete mode 100644 drivers/gpio/gpio-plat-samsung.c
> >  delete mode 100644 drivers/gpio/gpio-s3c24xx.c
> >  delete mode 100644 drivers/gpio/gpio-s3c64xx.c
> >  delete mode 100644 drivers/gpio/gpio-s5p64x0.c
> >  delete mode 100644 drivers/gpio/gpio-s5pc100.c
> >  delete mode 100644 drivers/gpio/gpio-s5pv210.c
> >
