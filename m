From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: S5P: Dynamicly numbered GPIO interrupt support
Date: Fri, 14 May 2010 11:10:19 +0200
Message-ID: <008e01caf345$50ad0610$f2071230$%szyprowski@samsung.com>
References: <1273826403-28976-1-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56630 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752317Ab0ENJLQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 May 2010 05:11:16 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2E00E2UK6QQN@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 18:11:14 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2E000NJK602O@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 18:11:14 +0900 (KST)
In-reply-to: <1273826403-28976-1-git-send-email-ben-linux@fluff.org>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com

Hello,

On Friday, May 14, 2010 10:40 AM Ben Dooks wrote:

> Add support for GPIO interrupts where the interrupt number
> is dynamically allocated at first request from gpiolib.
> 
> This method is employed as the newer SoCs have a large number
> of possible interrupt numbers which are very rarely heavily
> used. However, the classic code has always registered all
> possible interrupts, using a large amount of memory for the
> irq_desc[] table.

I like this idea, however I already see some problems. This solves
only gpio to irq mappings, but what about reverse mappings? There
are many i2c/spi/whatever drivers that requires a irq number to be
passed with platform data. With static gpio-irq mappings this is
trivial. However with dynamic gpio2irq mappings this becomes more
complicated. 

Machine startup code would need to:
1. request the gpio pin used for interrupt (ok)
2. convert it to irq number (ok)
3. put it in driver specific platform data (ok)
4. release the gpio pin (?)

Would request_irq() work after release of that gpio pin?
 
Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
