From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Add support for pre-sleep/post-restore	gpio
 control
Date: Fri, 10 Jun 2011 08:09:09 +0200
Message-ID: <001f01cc2734$e97e8f70$bc7bae50$%szyprowski@samsung.com>
References: <1303925654-27715-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <00fc01cc0baa$d7d94cb0$878be610$%kim@samsung.com>
 <003b01cc24df$29b841b0$7d28c510$%szyprowski@samsung.com>
 <4DF13E03.50803@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54486 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751681Ab1FJGJb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2011 02:09:31 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LMK002VN93UCF@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 07:09:30 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LMK000Q793TSU@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 07:09:29 +0100 (BST)
In-reply-to: <4DF13E03.50803@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org

Hello,

On Thursday, June 09, 2011 11:41 PM Kukjin Kim wrote:

> On 06/06/11 23:50, Marek Szyprowski wrote:
> > Hello,
> >
> Hi :)
> 
> (snip)
> 
> >
> > This patch lacks stubs for s5p64x0, s5pc100 and exynos4. I will send a
> quick fix
> > soon.
> 
> Oops, I couldn't test it all on my laptop which is so slow :(

In fact the problem was only on exynos4 platform, because both s5p64x0 and
s5pc100 don't support pm at all. I've posted build fix patch for exynos4.
 
Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
