From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add exynos5422-odroidxu4 board
Date: Tue, 1 Sep 2015 21:27:23 +0900
Message-ID: <55E599AB.5030300@samsung.com>
References: <1440993365-26896-1-git-send-email-k.kozlowski@samsung.com>
 <55E56646.2070106@osg.samsung.com> <55E5936B.3050003@samsung.com>
 <55E597AC.7070208@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:33684 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753923AbbIAM1a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Sep 2015 08:27:30 -0400
In-Reply-To: <55E597AC.7070208@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, p.marczak@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>

W dniu 01.09.2015 o 21:18, Javier Martinez Canillas pisze:
> Hello Krzysztof,
> 
> On 09/01/2015 02:00 PM, Krzysztof Kozlowski wrote:
>> W dniu 01.09.2015 o 17:48, Javier Martinez Canillas pisze:
> 
> [snip]
> 
>>>>  
>>>>  &hsi2c_5 {
>>>>  	status = "okay";
>>>
>>> since I believe for the Odroid XU4 we would like this to be disabled.
>>> The only I2C device in this I2C bus is the max98090 codec which is
>>> not present in the XU4.
>>
>> hsi2c_5 and i2s_0 are not used by board directly but are connected to
>> external connector:
>> http://www.hardkernel.com/main/products/prdt_info.php?g_code=G143452239825&tab_idx=2
>>
>> This is the 12pin GPIO/I2C/I2S connector in bottom-right corner of board
>> view.
>>
> 
> Thanks for the info, I missed that.
>  
>> This is why I left this and is2_0 enabled on Odroid XU4 - I assumed
>> someone may connect something to it. However I have doubts if it is
> 
> Yes, now it makes sense.
> 
>> usable in such state: without respective addresses and interrupts. In
>> the same time OF_OVERLAY should customize it properly.
>>
>> What do you think?
>>
> 
> As you said, these are not usable in the current form since if someone
> wants to use it, has to add a dev node for the I2C device, possibly a
> clock-frequency to change the default operating frequency, etc.
> 
> So has to either create a new DTS based on exynos5422-odroidxu4.dts or
> as you said use OF overlays. IMHO these should be left disabled and be
> enabled by users when adding the needed stuff.

Okay. I'll update the patch by moving entire hsi2c_5 node to audio DTSI
(including "okay") and i2s0 thus disabling them on XU4.

Best regards,
Krzysztof
