From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: EXYNOS: add support GPIO for EXYNOS5250
Date: Thu, 09 Feb 2012 20:48:02 +0900
Message-ID: <06ae01cce720$ad9eb190$08dc14b0$%kim@samsung.com>
References: <1328025040-4751-1-git-send-email-kgene.kim@samsung.com>
 <1328025040-4751-2-git-send-email-kgene.kim@samsung.com>
 <20120131224043.GD8338@n2100.arm.linux.org.uk>
 <CAH9JG2W3Uk=J6GR4C6O6w-vkrG+b=j3ow5mEFbC21EFKS52Sdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36990 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752557Ab2BILsE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 06:48:04 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ4002TZJG2C920@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 20:48:02 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ400CETJG0PF80@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 20:48:02 +0900 (KST)
In-reply-to: <CAH9JG2W3Uk=J6GR4C6O6w-vkrG+b=j3ow5mEFbC21EFKS52Sdg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Grant Likely' <grant.likely@secretlab.ca>, 'Sangsu Park' <sangsu4u.park@samsung.com>

Kyungmin Park wrote:
> 
> On 2/1/12, Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
> > On Wed, Feb 01, 2012 at 12:50:39AM +0900, Kukjin Kim wrote:
> >> From: Sangsu Park <sangsu4u.park@samsung.com>
> >>
> >> This patch adds follwing.
> >> - IO-map for EXYNOS5250 GPIO support
> >> - EXYNOS5250 GPIO bank size/number definitions
> >> - memory map definition for S5P GPIO4
> >>
> >> Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>
> >> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> >
> > Do you actually need these static mapping definitions?  The samsung
> > gpiolib initialization is called from a core_initcall(), and at this
> > time ioremap() is fully capable of working.
> 
> If it assumes it has 8 gpios, you can make it simple calculate it like
> this.
> 
But unfortunately, it has not 8 gpios in each gpio bank.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> enum exynos5_gpios {
>      EXYNOS5_GPIO_A,
>      ...
> };
> 
> EXYNOS5_GPIO_A_START(n)          (EXYNOS5_GPIO_A * 8)
> 
> with this one, it can make a simple gpio driver when using irq domain for
> GPIO.
> 
