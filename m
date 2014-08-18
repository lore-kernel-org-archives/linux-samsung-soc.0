From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Enable PMIC interrupts on ODROID
Date: Mon, 18 Aug 2014 11:43:07 -0500
Message-ID: <53F22D1B.4010900@samsung.com>
References: <1405500606-5752-1-git-send-email-drake@endlessm.com> <CAAObsKAokjDmpVy5cm_iFD52bCq+3jYeGDWzACsmh-JKktyjDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:49742 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750834AbaHRQnT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Aug 2014 12:43:19 -0400
Received: by mail-ig0-f170.google.com with SMTP id h3so8387524igd.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2014 09:43:18 -0700 (PDT)
In-Reply-To: <CAAObsKAokjDmpVy5cm_iFD52bCq+3jYeGDWzACsmh-JKktyjDw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Daniel Drake <drake@endlessm.com>, liquid.acid@gmx.net, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>

On 08/12/14 08:06, Tomeu Vizoso wrote:
> Tested on an Odroid-U2:
>
> Tested-by: Tomeu Vizoso<tomeu@tomeuvizoso.net>
>
> Thanks,
>
> Tomeu
>
>
> On 16 July 2014 10:50, Daniel Drake<drake@endlessm.com>  wrote:
>> The ODROID kernel shows that the PMIC interrupt line is hooked up
>> to pin GPX3-2.
>>
>> This is needed for the max77686-irq driver to create the PMIC IRQ
>> domain, which is needed by max77686-rtc.
>>
>> Signed-off-by: Daniel Drake<drake@endlessm.com>
>> ---
>>   arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>> index 6d6d23c..cb6f55f 100644
>> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>> @@ -148,6 +148,10 @@
>>
>>                  max77686: pmic@09 {
>>                          compatible = "maxim,max77686";
>> +                       interrupt-parent =<&gpx3>;
>> +                       interrupts =<2 0>;
>> +                       pinctrl-names = "default";
>> +                       pinctrl-0 =<&max77686_irq>;
>>                          reg =<0x09>;
>>                          #clock-cells =<1>;
>>
>> @@ -368,4 +372,11 @@
>>                  samsung,pins = "gpx1-3";
>>                  samsung,pin-pud =<0>;
>>          };
>> +
>> +       max77686_irq: max77686-irq {
>> +               samsung,pins = "gpx3-2";
>> +               samsung,pin-function =<0>;
>> +               samsung,pin-pud =<0>;
>> +               samsung,pin-drv =<0>;
>> +       };
>>   };

Thanks, applied this series.

- Kukjin
