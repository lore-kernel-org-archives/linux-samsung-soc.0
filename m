From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/3] arm64: dts: add initial dts for Samsung GH7 SoC and
 SSDK-GH7 board
Date: Tue, 25 Feb 2014 08:56:21 +0900
Message-ID: <530BDC25.10207@samsung.com>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com> <1392100183-30930-2-git-send-email-kgene.kim@samsung.com> <20140211181529.GC15200@e106331-lin.cambridge.arm.com> <52F9960A.2090802@samsung.com> <20140218103015.GA6051@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:63616 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752581AbaBXX4b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Feb 2014 18:56:31 -0500
Received: by mail-pd0-f172.google.com with SMTP id p10so2538984pdj.31
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Feb 2014 15:56:31 -0800 (PST)
In-Reply-To: <20140218103015.GA6051@e106331-lin.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Catalin Marinas <Catalin.Marinas@arm.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.ab@samsung.com>, Ilho Lee <ilho215.lee@samsung.com>

On 02/18/14 19:30, Mark Rutland wrote:
> On Tue, Feb 11, 2014 at 03:16:26AM +0000, Kukjin Kim wrote:
>> On 02/12/14 03:15, Mark Rutland wrote:
>>> On Tue, Feb 11, 2014 at 06:29:41AM +0000, Kukjin Kim wrote:
>>>> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
>>>> Reviewed-by: Thomas Abraham<thomas.ab@samsung.com>
>>>> Cc: Catalin Marinas<catalin.marinas@arm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/samsung-gh7.dtsi     |  108 ++++++++++++++++++++++++++++++
>>>>    arch/arm64/boot/dts/samsung-ssdk-gh7.dts |   26 +++++++
>>>>    2 files changed, 134 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/samsung-gh7.dtsi
>>>>    create mode 100644 arch/arm64/boot/dts/samsung-ssdk-gh7.dts
>>>>
>>>> diff --git a/arch/arm64/boot/dts/samsung-gh7.dtsi b/arch/arm64/boot/dts/samsung-gh7.dtsi
>>>> new file mode 100644
>>>> index 0000000..5b8785c
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/samsung-gh7.dtsi
>>>> @@ -0,0 +1,108 @@
>>>> +/*
>>>> + * SAMSUNG GH7 SoC device tree source
>>>> + *
>>>> + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
>>>> + *		http://www.samsung.com
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modify
>>>> + * it under the terms of the GNU General Public License version 2 as
>>>> + * published by the Free Software Foundation.
>>>> +*/
>>>> +
>>>> +/dts-v1/;
>>>> +
>>>> +/memreserve/ 0x80000000 0x0C400000;
>>>
>>> That looks _very_ large. What is this for?
>>>
>> Yes, I know but we need to reserve that for EL3 monitor, UEFI services,
>> secure, hypervisor and scan chanin...
>
> OK. How much of that memory does the kernel need to know about then?
>
> Surely the kernel shouldn't be able to map the EL3 monitor or hypervisor
> at all?
>
> What address is the kernel getting loaded at if everything up to
> 0x8C400000 isn't usable?
>
> [...]
>
>>
>>> [...]
>>>
>>>> +	amba {
>>>> +		compatible = "arm,amba-bus";
>>>> +		#address-cells =<1>;
>>>> +		#size-cells =<1>;
>>>> +		ranges;
>>>> +
>>>> +		serial@12c00000 {
>>>> +			compatible = "arm,pl011", "arm,primecell";
>>>> +			reg =<0x12c00000 0x10000>;
>>>> +			interrupts =<418>;
>>>> +		};
>>>> +
>>>> +		serial@12c20000 {
>>>> +			compatible = "arm,pl011", "arm,primecell";
>>>> +			reg =<0x12c20000 0x10000>;
>>>> +			interrupts =<420>;
>>>> +		};
>>>
>>> Don't these need clocks?
>>>
>> We don't need and the clocks will be handled by bootloader...
>
> While that might be sufficient for the device to function, Linux doesn't
> know that from this DT, and as far as I can see the device can't
> possibly probe, as no clocks are provided through platform data:
>
> of_platform_bus_create will call of_amba_device_create for anyting
> compatible with "arm,primecell". This in turn will call amba_device_add,
> which will call amba_get_enable_pclk. Then clk_get(&pcdev->dev,
> "apb_pclk") should fail, amba_device_add should fail, and
> of_platform_bus_create will stop trying to probe the node.
> of_platform_populate will carry on probing other nodes.
>
> Surely the pl011 nodes at least need "apb_pclk"?
>
You're right. We should make a dummy clock for pl011, proper clocks will 
be added in next version.

Thanks,
Kukjin
