From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 04/11] ARM: EXYNOS: add interrupt definitions for
 EXYNOS5250
Date: Tue, 21 Feb 2012 19:35:40 +0900
Message-ID: <00a901ccf084$90460900$b0d21b00$%kim@samsung.com>
References: <1328981685-8602-1-git-send-email-kgene.kim@samsung.com>
 <1328981685-8602-5-git-send-email-kgene.kim@samsung.com>
 <CAOesGMhmcnt6LPb9O+3420VgG=PiCnOjzZA3JqsA=4OdHN-R-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:15736 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753794Ab2BUKfq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Feb 2012 05:35:46 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZQ00K5TO3GYTP0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 19:35:45 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZQ0086RO3JU070@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 19:35:44 +0900 (KST)
In-reply-to: <CAOesGMhmcnt6LPb9O+3420VgG=PiCnOjzZA3JqsA=4OdHN-R-g@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de

Olof Johansson wrote:
> 
> Hi,
> 
Hi Olof,

[snip]

> > +#ifdef CONFIG_ARCH_EXYNOS4
> > +
> 
> irqs.h seems to be one of the major files that causes conflicts if a
> combined EXYNOS4+5 kernel is built (after editing Kconfig to allow
> both). Can you please try to come up with a way to allow both of them
> to coexist instead of making them exclusive?
> 
Yes, as you said, it brakes single zImage for EXYNOS4 + EXYNOS5
(mach-exynos). So I'm working on regarding resource for EXYNOS SoCs and I
think, it can resolve the problem you said before v3.4 merge window.

If any updates, let you know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
