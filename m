From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: Re: [PATCH] ARM: dts: add interrupt-names property to get interrupt
 resource by name
Date: Fri, 15 Mar 2013 09:34:38 +0530
Message-ID: <CAD025yT4w6QBpo+nShXu6+WCsy8MmJCychLtvE-TxuG-que97w@mail.gmail.com>
References: <1363173980-11428-1-git-send-email-vikas.sajjan@linaro.org> <51408FB9.90808@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:49113 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750743Ab3COEE7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Mar 2013 00:04:59 -0400
Received: by mail-lb0-f181.google.com with SMTP id gm6so2410055lbb.26
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Mar 2013 21:04:58 -0700 (PDT)
In-Reply-To: <51408FB9.90808@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, l.krishna@samsung.com, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com, inki.dae@samsung.com, linaro-kernel@lists.linaro.org, sylvester.nawrocki@gmail.com

Hi,

On 13 March 2013 20:09, Rob Herring <robherring2@gmail.com> wrote:
> The subject is completely misleading. Make it clear what the scope of
> this patch is.
>
> On 03/13/2013 06:26 AM, Vikas Sajjan wrote:
>> The FIMD driver expects the "vsync" interrupt to be mentioned as the 1st
>> parameter in the FIMD DT node. So to meet this expectation of the driver,
>> the FIMD DT node was forced to be made by keeping "vsync" as the 1st
>> parameter.
>>
>> this resolves the above mentioned "hack" by introducing
>> "interrupt-names", so that FIMD driver can get the interrupt resource by
>> name as discussed at
>> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg16211.html
>
> I fail to see what the hack is. The order of interrupt properties must
> be defined by the binding. interrupt-names is auxiliary data and must
> not be required by an OS.
>
>> patch is dependent on https://patchwork.kernel.org/patch/2184981/
>
> Why the split? These should be combined.
Sure, I shall ask Leela to merge this patch with
https://patchwork.kernel.org/patch/2184981/
and resend.

>
>>
>> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos5250.dtsi |    3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
>> index 0ee4706..76c8911 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -588,6 +588,7 @@
>>               compatible = "samsung,exynos5-fimd";
>>               interrupt-parent = <&combiner>;
>>               reg = <0x14400000 0x40000>;
>> -             interrupts = <18 5>, <18 4>, <18 6>;
>> +             interrupt-names = "fifo", "vsync", "lcd_sys";
>> +             interrupts = <18 4>, <18 5>, <18 6>;
>
> There should be some documentation describing the order of the interrupts.
>
> Rob
>



-- 
Thanks and Regards
 Vikas Sajjan
