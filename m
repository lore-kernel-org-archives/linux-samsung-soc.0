From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add missing clock/pin-control entries for I2S0
 on Exynos4
Date: Mon, 16 Jun 2014 13:50:56 +0200
Message-ID: <539EDA20.7090607@samsung.com>
References: <1402133454-28445-1-git-send-email-tushar.b@samsung.com>
 <5395841B.8000702@samsung.com> <53958FF0.40101@gmail.com>
 <5395954A.5070203@samsung.com> <539ED85E.8050002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:48635 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751216AbaFPLvA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jun 2014 07:51:00 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N79002XSFKS2H90@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Jun 2014 12:50:52 +0100 (BST)
In-reply-to: <539ED85E.8050002@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <trblinux@gmail.com>, Tushar Behera <tushar.b@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 16/06/14 13:43, Tushar Behera wrote:
> On 06/09/2014 04:36 PM, Sylwester Nawrocki wrote:
>> > On 09/06/14 12:44, Tushar Behera wrote:
>>> >> IMHO, the clock entries belong here as the audss clock provider
>>> >> essentially remains same for all Exynos4 based systems.
>>> >>
>>> >> As for pin-control entry, I believe we can move them to respective SoC
>>> >> dtsi files.
>>> >>
>>> >> Does that sound okay to you?
>> > 
>> > I guess that's fine, I tend to agree with you about the clocks.
>> > 
> As I was going ahead with the implementation, it felt like repetition
> with the same code. Would it be acceptable to you if we go ahead with
> the earlier approach of adding both clock and pin-control entry to
> exynos4.dtsi?
> 
> I can see i2c_n and spi_n adding pin-control entries in exynos4.dtsi itself.

OK, I don't mind, I'll leave it up to the maintainers.

--
Regards,
Sylwester
