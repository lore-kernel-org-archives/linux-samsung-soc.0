From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 08/11] ARM: EXYNOS: add support for ARCH_EXYNOS5 and
 EXYNOS5250
Date: Thu, 16 Feb 2012 14:19:16 +0900
Message-ID: <054501ccec6a$872fb140$958f13c0$%kim@samsung.com>
References: <1328981685-8602-1-git-send-email-kgene.kim@samsung.com>
 <1328981685-8602-9-git-send-email-kgene.kim@samsung.com>
 <CAH9JG2Usa5k0J0uoyOPxnPG5y9bZAFD+5AR43mbFN04P7t3Npw@mail.gmail.com>
 <201202160515.00068.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55344 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214Ab2BPFTU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 00:19:20 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZH00LXU034G450@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 Feb 2012 14:19:18 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZH00KD6044AY20@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 16 Feb 2012 14:19:18 +0900 (KST)
In-reply-to: <201202160515.00068.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, olof@lixom.net

Arnd Bergmann wrote:
> 
> On Thursday 16 February 2012, Kyungmin Park wrote:
> > >
> > > +config ARCH_EXYNOS5
> > > +     bool "SAMSUNG EXYNOS5"
> > > +     select HAVE_SMP
> > > +     help
> > > +       Samsung EXYNOS5 (Cortex-A15) SoC based systems
> > This config is located at choice. It means it can't build the exynos4
> > and exynos5 simultaneously. I'm not sure it's acceptable for mainline.
> 
> If we use the new common struct clk on exynos5 but not exynos4, it should
> stay a "choice" for the time being and get turned into a nonexclusive
> selection as soon as exynos4 moves over.
> 
Yes, right.

> If exynos4 and exynos5 end up using the same struct clk in 3.4, I would
> indeed ask to do this change now.
> 
If possible, yes. But I'm going to move common struct clk for exynos4 and exynos5 next time.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
