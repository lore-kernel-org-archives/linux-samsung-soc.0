From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 3/4] ARM: S5PC110: add common FIMC setup code
Date: Mon, 06 Sep 2010 19:21:50 +0900
Message-ID: <4C84C0BE.3050305@samsung.com>
References: <1283745044-15514-1-git-send-email-m.szyprowski@samsung.com>
 <1283745044-15514-4-git-send-email-m.szyprowski@samsung.com>
 <AANLkTinhbmKX5gs4TPZwVUX0WSEQ5RLN+_gHAqXsTj1b@mail.gmail.com>
 <4C84AA6D.10509@samsung.com>
 <AANLkTikakB1Y6N-UT2Hx+PHfdyticHxCFQzs=uc7KWNc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:43245 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750817Ab0IFKWG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Sep 2010 06:22:06 -0400
Received: from eu_spt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L8B002HWM4R7F40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 06 Sep 2010 11:22:03 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L8B00IR6M4RJG@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 06 Sep 2010 11:22:03 +0100 (BST)
In-reply-to: <AANLkTikakB1Y6N-UT2Hx+PHfdyticHxCFQzs=uc7KWNc@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Hello,

On 2010-09-06 18:17, Jassi Brar wrote:

>> I'm thinking of making the parent clock an argument to the
>> s5pv210_fimc_setup_clks().
> Yes, that's better since the relevant clock is managed by the CMU

What do you mean by the CMU? This function is intended to be called from 
board startup code.

>> I really don't like the idea of passing clock name through the platform data
>> and letting driver to mess with clock's parents.
> In case of SPI the clock mux and scalar is present _within_ the SPI
> controller and having to touch SPI regs from outside the driver isn't
> what I prefer.

I know. It is the same case as with SDHCI and UART controllers. I have 
an idea how to solve this in a bit more cleaner way. I hope to post a 
proposition soon.

>> Machine startup code is the
>> last place where such things should be changed.
> Until I am enlightened, I'd like to think otherwise.
> I think the board designer would already have thought out the clock sourcing
> hierarchy. Setting appropriate parents once at boot-time and having drivers
> not worry about it, should be better.

Definitely, but in our case kernel the default fimc_sclk parent points 
to non-existing clock.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
