From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Add HS400 support for exynos5422-odroidxu3
Date: Wed, 08 Apr 2015 09:37:03 +0900
Message-ID: <5524782F.4040607@samsung.com>
References: <551970E5.3000308@fivetechno.de> <551A92C6.7070906@fivetechno.de>
 <5523F8B2.4070404@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25172 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753869AbbDHAhF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Apr 2015 20:37:05 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NMG00CM6PPR3CB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Apr 2015 09:37:04 +0900 (KST)
In-reply-to: <5523F8B2.4070404@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>, Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, 'Alim Akhtar' <alim.akhtar@gmail.com>, 'Ulf Hansson' <ulf.hansson@linaro.org>, Anand Moon <linux.amoon@gmail.com>

Hi, Markus.

I have also tested on Odroid-xu3 board.

Acked-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung


On 04/08/2015 12:33 AM, Markus Reichl wrote:
> Hi,
> 
> the base patch in [0] has been applied now.
> 
> My patch was meanwhile
> 
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> 
> 
> Am 31.03.2015 um 14:27 schrieb Markus Reichl:
>> Am 30.03.2015 um 17:51 schrieb Markus Reichl:
>>> HS400 timing values are added for exynos5422-odroidxu3 board.
>>> ---
>>> This patch is analog to [0].
>>> This patch needs [0] for the pin-ctrl definition of sd0_rclk.
>>>
>>> [0]: https://www.mail-archive.com/linux-samsung-soc%40vger.kernel.org/msg42902.html
>>>
>>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>>> ---
>>>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 7 ++++++-
>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>>> index a519c86..0408ec0 100644
>>> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>>> @@ -298,15 +298,20 @@
>>>  
>>>  &mmc_0 {
>>>  	status = "okay";
>>> +	num-slots = <1>;
>>>  	broken-cd;
>>>  	card-detect-delay = <200>;
>>>  	samsung,dw-mshc-ciu-div = <3>;
>>>  	samsung,dw-mshc-sdr-timing = <0 4>;
>>>  	samsung,dw-mshc-ddr-timing = <0 2>;
>>> +	samsung,dw-mshc-hs400-timing = <0 2>;
>>> +	samsung,read-strobe-delay = <90>;
>>>  	pinctrl-names = "default";
>>> -	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
>>> +	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8 &sd0_rclk>;
>>>  	bus-width = <8>;
>>>  	cap-mmc-highspeed;
>>> +	mmc-hs200-1_8v;
>>> +	mmc-hs400-1_8v;
>>>  };
>>>  
>>>  &mmc_2 {
>>>
>>
>> hdparm -t /dev/mmcblk0
>>
>> without this patch:
>> /dev/mmcblk0:
>>  Timing buffered disk reads: 230 MB in  3.01 seconds =  76.30 MB/sec
>>
>> with this patch:
>> /dev/mmcblk0:
>>  Timing buffered disk reads: 588 MB in  3.00 seconds = 195.92 MB/sec
>>
>> cat /sys/kernel/debug/mmc0/ios
>>
>> without patch:
>> clock:          52000000 Hz
>> vdd:            7 (1.65 - 1.95 V)
>> bus mode:       2 (push-pull)
>> chip select:    0 (don't care)
>> power mode:     2 (on)
>> bus width:      3 (8 bits)
>> timing spec:    8 (mmc DDR52)
>> signal voltage: 0 (1.80 V)
>>
>> with patch:
>> clock:          200000000 Hz
>> vdd:            7 (1.65 - 1.95 V)
>> bus mode:       2 (push-pull)
>> chip select:    0 (don't care)
>> power mode:     2 (on)
>> bus width:      3 (8 bits)
>> timing spec:    10 (mmc HS400)
>> signal voltage: 0 (1.80 V)
>>
>> Best Regards
>>
> 
> 
