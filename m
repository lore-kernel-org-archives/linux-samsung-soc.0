From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH v3 5/5] ARM: dts: enable hdmi for exynos5800 based
 peach-pi board
Date: Mon, 12 May 2014 16:23:42 +0530
Message-ID: <CAPdUM4PPQbbtDSZ6_qu-Ld9ku4iNz-zanRVODTvMrLknPStZWA@mail.gmail.com>
References: <1399890248-27409-1-git-send-email-rahul.sharma@samsung.com>
	<1399890248-27409-6-git-send-email-rahul.sharma@samsung.com>
	<5370A7D0.5030409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:53033 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752464AbaELKxn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 06:53:43 -0400
In-Reply-To: <5370A7D0.5030409@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>

On 12 May 2014 16:22, Arun Kumar K <arun.kk@samsung.com> wrote:
> Hi Rahul,
>
> On 05/12/14 15:54, Rahul Sharma wrote:
>> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>>
>> Enable hdmi for peach-pi board.
>>
>> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5800-peach-pi.dts |   26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> index 742655b..bbb445a 100644
>> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> @@ -72,6 +72,13 @@
>>               samsung,pin-pud = <0>;
>>               samsung,pin-drv = <0>;
>>       };
>> +
>> +     hdmi_hpd_irq: hdmi-hpd-irq {
>> +             samsung,pins = "gpx3-7";
>> +             samsung,pin-function = <0>;
>> +             samsung,pin-pud = <1>;
>> +             samsung,pin-drv = <0>;
>> +     };
>
> This node is already added in 5420-pinctrl.dtsi in patch 3/5.
> You can drop it from here.
>

yea correct. I will remove this pin.

Regards,
Rahul Sharma.

> Regards
> Arun
>
>>  };
>>
>>  &rtc {
>> @@ -134,6 +141,25 @@
>>       };
>>  };
>>
>> +&i2c_2 {
>> +     status = "okay";
>> +     samsung,i2c-sda-delay = <100>;
>> +     samsung,i2c-max-bus-freq = <66000>;
>> +     samsung,i2c-slave-addr = <0x50>;
>> +
>> +     hdmiddc@50 {
>> +             reg = <0x50>;
>> +     };
>> +};
>> +
>> +&hdmi {
>> +     status = "okay";
>> +     hpd-gpio = <&gpx3 7 2>;
>> +     pinctrl-names = "default";
>> +     pinctrl-0 = <&hdmi_hpd_irq>;
>> +     ddc = <&i2c_2>;
>> +};
>> +
>>  /*
>>   * Use longest HW watchdog in SoC (32 seconds) since the hardware
>>   * watchdog provides no debugging information (compared to soft/hard
>>
