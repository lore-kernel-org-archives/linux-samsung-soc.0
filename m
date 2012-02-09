From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/9] ARM: EXYNOS: use exynos_init_uarts() instead of
 exynos4_init_uarts()
Date: Thu, 09 Feb 2012 19:30:36 +0900
Message-ID: <068001cce715$dc50bcf0$94f236d0$%kim@samsung.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
 <1328024354-4277-2-git-send-email-kgene.kim@samsung.com>
 <CAH9JG2VQBA3PFOm-gcP=igetQyCHs+Qc_zWJgGNLuMpq948yVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33395 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757899Ab2BIKah (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 05:30:37 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ4004F9FUSU6T0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 19:30:36 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ400EAIFUXRRM0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 19:30:36 +0900 (KST)
In-reply-to: <CAH9JG2VQBA3PFOm-gcP=igetQyCHs+Qc_zWJgGNLuMpq948yVg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net

Kyungmin Park wrote:
> 
> On 2/1/12, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Since exynos4_init_uarts() can be used for EXYNOS5 SoCs,
> > this patch changes the name of function to exynos_init_uarts().
> >

[snip]

> >
> >  #ifdef CONFIG_ARCH_EXYNOS
> >  extern  int exynos_init(void);
> > +extern void exynos_init_uarts(struct s3c2410_uartcfg *cfg, int no);
> >  extern void exynos4_map_io(void);
> >  extern void exynos4_init_clocks(int xtal);
> > -extern void exynos4_init_uarts(struct s3c2410_uartcfg *cfg, int no);
> 
> Are there any cases build without CONFIG_ARCH_EXYNOS?
> I think it's always defined CONFIG_ARCH_EXYNOS.
> 
Right, we don't need. It will be fixed.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
