From: Tushar Behera <trblinux@gmail.com>
Subject: Re: [PATCH] ARM: dts: Add missing clock/pin-control entries for I2S0
 on Exynos4
Date: Mon, 16 Jun 2014 17:13:26 +0530
Message-ID: <539ED85E.8050002@gmail.com>
References: <1402133454-28445-1-git-send-email-tushar.b@samsung.com> <5395841B.8000702@samsung.com> <53958FF0.40101@gmail.com> <5395954A.5070203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:44238 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751039AbaFPLnb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jun 2014 07:43:31 -0400
Received: by mail-pb0-f44.google.com with SMTP id md12so3584116pbc.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jun 2014 04:43:30 -0700 (PDT)
In-Reply-To: <5395954A.5070203@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tushar Behera <tushar.b@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 06/09/2014 04:36 PM, Sylwester Nawrocki wrote:
> On 09/06/14 12:44, Tushar Behera wrote:
>> IMHO, the clock entries belong here as the audss clock provider
>> essentially remains same for all Exynos4 based systems.
>>
>> As for pin-control entry, I believe we can move them to respective SoC
>> dtsi files.
>>
>> Does that sound okay to you?
> 
> I guess that's fine, I tend to agree with you about the clocks.
> 

As I was going ahead with the implementation, it felt like repetition
with the same code. Would it be acceptable to you if we go ahead with
the earlier approach of adding both clock and pin-control entry to
exynos4.dtsi?

I can see i2c_n and spi_n adding pin-control entries in exynos4.dtsi itself.

> --
> Thanks,
> Sylwester
> 


-- 
Tushar Behera
