From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 1/5] ARM: EXYNOS4: Change clock name for FIMD
Date: Tue, 21 Jun 2011 10:21:58 +0200
Message-ID: <4E0054A6.9080401@samsung.com>
References: <22737339.68511308629879847.JavaMail.weblogic@epml09>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:13334 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751800Ab1FUIjb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 04:39:31 -0400
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LN4009LETDR97@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Jun 2011 09:39:29 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LN400BYMSKMNU@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Jun 2011 09:21:59 +0100 (BST)
In-reply-to: <22737339.68511308629879847.JavaMail.weblogic@epml09>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jg1.han@samsung.com
Cc: Sylwester Nawrocki <snjw23@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Jong-Hun Han <jonghun.han@samsung.com>, ANAND KUMAR N <anand.kn@samsung.com>, THOMAS P ABRAHAM <thomas.ab@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kmpark@infradead.org>, In-Ki Dae <inki.dae@samsung.com>, ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>

On 06/21/2011 06:18 AM, JinGoo Han wrote:
>>> ----------+-----------------------+------------------------+
>>> exynos4   |  ACLK_160 (fimd)  | O  |  SCLK_FIMD (sclk_fimd)|
>>> ----------+------------------------+-----------------------+
>>              ^^^^^^^^^^^^^^^^^^^
>> In mach-exynos4/clock.c this clock is described as ACLK_133 (lcd)
> I cannot find it.
> Let me know where 'fimd' is described as ACLK_133.
> Anyway, according to datasheet, this clock is described as ACLK_160.

My apologies, I had been looking not at the mainline source, just some
internal tree. And that's right it is described as ACLK_160 in the datasheet.
