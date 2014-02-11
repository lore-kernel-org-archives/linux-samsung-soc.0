From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/3] arm64: dts: add initial dts for Samsung GH7 SoC and
 SSDK-GH7 board
Date: Tue, 11 Feb 2014 12:16:26 +0900
Message-ID: <52F9960A.2090802@samsung.com>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com> <1392100183-30930-2-git-send-email-kgene.kim@samsung.com> <20140211181529.GC15200@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:64390 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751645AbaBMBUj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 20:20:39 -0500
Received: by mail-pd0-f182.google.com with SMTP id v10so9865104pde.27
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2014 17:20:38 -0800 (PST)
In-Reply-To: <20140211181529.GC15200@e106331-lin.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Ilho Lee <ilho215.lee@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.ab@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Catalin Marinas <Catalin.Marinas@arm.com>

On 02/12/14 03:15, Mark Rutland wrote:
> On Tue, Feb 11, 2014 at 06:29:41AM +0000, Kukjin Kim wrote:
>> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
>> Reviewed-by: Thomas Abraham<thomas.ab@samsung.com>
>> Cc: Catalin Marinas<catalin.marinas@arm.com>
>> ---
>>   arch/arm64/boot/dts/samsung-gh7.dtsi     |  108 ++++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/samsung-ssdk-gh7.dts |   26 +++++++
>>   2 files changed, 134 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/samsung-gh7.dtsi
>>   create mode 100644 arch/arm64/boot/dts/samsung-ssdk-gh7.dts
>>
>> diff --git a/arch/arm64/boot/dts/samsung-gh7.dtsi b/arch/arm64/boot/dts/samsung-gh7.dtsi
>> new file mode 100644
>> index 0000000..5b8785c
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/samsung-gh7.dtsi
>> @@ -0,0 +1,108 @@
>> +/*
>> + * SAMSUNG GH7 SoC device tree source
>> + *
>> + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
>> + *		http://www.samsung.com
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +/dts-v1/;
>> +
>> +/memreserve/ 0x80000000 0x0C400000;
>
> That looks _very_ large. What is this for?
>
Yes, I know but we need to reserve that for EL3 monitor, UEFI services, 
secure, hypervisor and scan chanin...


> [...]
>
>> +	timer {
>> +		compatible = "arm,armv8-timer";
>> +		interrupts =<1 13 0xff01>,	/* Secure Phys IRQ */
>> +			<1 14 0xff01>,	/* Non-secure Phys IRQ */
>> +			<1 11 0xff01>,	/* Virt IRQ */
>> +			<1 10 0xff01>;	/* Hyp IRQ */
>> +		clock-frequency =<100000000>;
>
> Please, get your bootloader to set CNTFREQ. The clock frequency property
> for the timer node is a horrible hack for buggy firmware.
>
You're right. OK.

> [...]
>
>> +	amba {
>> +		compatible = "arm,amba-bus";
>> +		#address-cells =<1>;
>> +		#size-cells =<1>;
>> +		ranges;
>> +
>> +		serial@12c00000 {
>> +			compatible = "arm,pl011", "arm,primecell";
>> +			reg =<0x12c00000 0x10000>;
>> +			interrupts =<418>;
>> +		};
>> +
>> +		serial@12c20000 {
>> +			compatible = "arm,pl011", "arm,primecell";
>> +			reg =<0x12c20000 0x10000>;
>> +			interrupts =<420>;
>> +		};
>
> Don't these need clocks?
>
We don't need and the clocks will be handled by bootloader...

> [...]
>
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		reg =<0x00000000 0x80000000 0 0x80000000>;
>
> Minor nit, but it would be nice for the 0 values to be consistently padded.
>
OK.

Thanks,
Kukjin
