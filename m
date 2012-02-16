From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 08/11] ARM: EXYNOS: add support for ARCH_EXYNOS5 and
 EXYNOS5250
Date: Thu, 16 Feb 2012 14:23:00 +0900
Message-ID: <054601ccec6b$0c9292d0$25b7b870$%kim@samsung.com>
References: <1328981685-8602-1-git-send-email-kgene.kim@samsung.com>
 <1328981685-8602-9-git-send-email-kgene.kim@samsung.com>
 <CAH9JG2Usa5k0J0uoyOPxnPG5y9bZAFD+5AR43mbFN04P7t3Npw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23422 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751358Ab2BPFXF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 00:23:05 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZH0076F09YY5K0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 Feb 2012 14:23:00 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZH009L10ACRR20@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 16 Feb 2012 14:23:00 +0900 (KST)
In-reply-to: <CAH9JG2Usa5k0J0uoyOPxnPG5y9bZAFD+5AR43mbFN04P7t3Npw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net

Kyungmin Park wrote:
> 
> Hi,
> 

[...]

> >
> > +config ARCH_EXYNOS5
> > +	bool "SAMSUNG EXYNOS5"
> > +	select HAVE_SMP
> > +	help
> > +	  Samsung EXYNOS5 (Cortex-A15) SoC based systems
> This config is located at choice. It means it can't build the exynos4
> and exynos5 simultaneously. I'm not sure it's acceptable for mainline.

See Arnd's comments.

[...]

> > +obj-$(CONFIG_ARCH_EXYNOS5)	+= clock-exynos5.o
> Where's clock-exynos5.c file in this patch?. maybe it's another patch.

See 3rd patch.

[...]

> > +void exynos5_restart(char mode, const char *cmd)
> > +{
> > +	__raw_writel(0x1, EXYNOS_SWRESET);
> > +}
> Why new restart is required? it's same S5P_SWRESET and EXYNOS_SWRESET.
> see below.

It will be updated for exynos5.

[...]

> >
> >  #define S5P_SWRESET				S5P_PMUREG(0x0400)
> > +#define EXYNOS_SWRESET				S5P_PMUREG(0x0400)
> Please use just one.
> 
See above.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
