From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 3/4] ARM: S5PC110: add common FIMC setup code
Date: Mon, 06 Sep 2010 17:46:37 +0900
Message-ID: <4C84AA6D.10509@samsung.com>
References: <1283745044-15514-1-git-send-email-m.szyprowski@samsung.com>
 <1283745044-15514-4-git-send-email-m.szyprowski@samsung.com>
 <AANLkTinhbmKX5gs4TPZwVUX0WSEQ5RLN+_gHAqXsTj1b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35391 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752114Ab0IFIqw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Sep 2010 04:46:52 -0400
Received: from eu_spt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L8B00GHOHQ28660@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 06 Sep 2010 09:46:50 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L8B006KEHQ2MJ@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 06 Sep 2010 09:46:50 +0100 (BST)
In-reply-to: <AANLkTinhbmKX5gs4TPZwVUX0WSEQ5RLN+_gHAqXsTj1b@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Hello,

On 2010-09-06 13:52, Jassi Brar wrote:
> On Mon, Sep 6, 2010 at 12:50 PM, Marek Szyprowski
> <m.szyprowski@samsung.com>  wrote:
> ....
>> +       parent = clk_get(NULL, "mout_epll");
>> +       if (IS_ERR(parent))
>> +               return PTR_ERR(parent);
>> +
>> +       for (i = 0; err == 0&&  i<  ARRAY_SIZE(fimc_devs); i++) {
>> +               if (fimc_devs[i]) {
>> +                       clk_fimc = clk_get(fimc_devs[i], "sclk_fimc");
>> +                       if (IS_ERR(clk_fimc)) {
>> +                               err = PTR_ERR(clk_fimc);
>> +                               break;
>> +                       }
>> +                       clk_set_parent(clk_fimc, parent);
>> +                       clk_put(clk_fimc);
>> +               }
>> +       }
>
> The sclk_fimc could source clock from a number of options out of a mux.
> mout_epll is just one of them. Different machines may want to source the
> clock differently.

Right, I forgot about this case.

> So, IMO the parent selection should not be done in platform code, but rather
> in machine init code.
> Not the best, but a better solution can be found in
> arch/arm/mach-s5pc100/dev-spi.c
> Give it a thought.

I'm thinking of making the parent clock an argument to the 
s5pv210_fimc_setup_clks().

I really don't like the idea of passing clock name through the platform 
data and letting driver to mess with clock's parents. Machine startup 
code is the last place where such things should be changed.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
