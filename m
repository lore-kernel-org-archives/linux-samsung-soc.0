From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/4] ARM: SAMSUNG: Add support for detecting CPU at	runtime
Date: Tue, 23 Aug 2011 10:50:21 +0900
Message-ID: <06bd01cc6137$058b1bc0$10a15340$%kim@samsung.com>
References: <1313816759-14564-1-git-send-email-kgene.kim@samsung.com>
 <1313816759-14564-2-git-send-email-kgene.kim@samsung.com>
 <20110820080759.GA18827@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33518 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752888Ab1HWBuZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 21:50:25 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQC002KHYFSMP00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Aug 2011 10:50:23 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQC000VTYFZG8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Aug 2011 10:50:23 +0900 (KST)
In-reply-to: <20110820080759.GA18827@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Russell King - ARM Linux wrote:
> 
> On Sat, Aug 20, 2011 at 02:05:56PM +0900, Kukjin Kim wrote:
> > The cpu_is_[name]() can be used to distinguish cpu at runtime.
> 
> This really should be soc_is_xxx().  The CPU is stuff like ARM920, ARM926,
> Cortex-A9 etc.  The SoC is the CPU plus the peripherals.
> 
> S3C6410 describes the entire SoC, not just the CPU.

OK and will address comments from you.

Russell, I'm not sure it is required to change CPU_XXX such as
CPU_EXYNOS4210 to SOC_XXX in Kconfig.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
