From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2 1/2] ARM: dts: Add DT changes for display on snow
Date: Thu, 28 Aug 2014 11:04:33 +0530
Message-ID: <CAEC9eQMKfso-rmMdqyDZeCdaxf21O1fqN6Z2YrS=njqGHh5d5Q@mail.gmail.com>
References: <1409150908-12801-1-git-send-email-ajaykumar.rs@samsung.com>
	<20140827150146.GB9737@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:62118 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932473AbaH1Fee (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Aug 2014 01:34:34 -0400
In-Reply-To: <20140827150146.GB9737@leverpostej>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "kgene.kim@gmail.com" <kgene.kim@gmail.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "seanpaul@google.com" <seanpaul@google.com>, "jg1.han@samsung.com" <jg1.han@samsung.com>, "joshi@samsung.com" <joshi@samsung.com>, "prashanth.g@samsung.com" <prashanth.g@samsung.com>

On Wed, Aug 27, 2014 at 8:31 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> On Wed, Aug 27, 2014 at 03:48:27PM +0100, Ajay Kumar wrote:
>> Add DT nodes for ptn3460 bridge chip and panel.
>> Add backlight enable pin and backlight power supply for pwm-backlight.
>> Also add bridge phandle needed by dp to enable display on snow.
>>
>> Note that, snow doesn't support "chunghwa,claa101wb01" panel,
>> but still we choose to reuse the binding since "chunghwa,claa101wb01"
>> has similar LCD timings.
>
> What does it actually have?
>
> It's fine to have "chunghwa,claa101wb01" as a fallback but we should
> have an identifier for the actual display, too.
Actual display used is "AUO,B116XTN0", for which no data currently exists
in panel file. Instead of adding a new panel_desc for B116XTN0,
why not we reuse existing ones? what is the "identifier" you are talking about?

Ajay
> Thanks,
> Mark.
>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>> Changes since V1:
>>       -- Remove "simple-panel" compatible string.
>>       -- Use GPIO_ACTIVE_HIGH instead of 0.
>>       -- Change panel node naming from "panel-simple" to "panel".
>>
>>  arch/arm/boot/dts/exynos5250-snow.dts |   41 ++++++++++++++++++---------------
>>  1 file changed, 22 insertions(+), 19 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
>> index f2b8c41..1ac9709 100644
>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>> @@ -9,6 +9,7 @@
>>  */
>>
>>  /dts-v1/;
>> +#include <dt-bindings/gpio/gpio.h>
>>  #include "exynos5250.dtsi"
>>  #include "exynos5250-cros-common.dtsi"
>>
>> @@ -181,7 +182,7 @@
>>                                       dcdc3 {
>>                                               ti,enable-ext-control;
>>                                       };
>> -                                     fet1 {
>> +                                     fet1: fet1 {
>>                                               regulator-name = "vcd_led";
>>                                               ti,overcurrent-wait = <3>;
>>                                       };
>> @@ -204,7 +205,7 @@
>>                                               regulator-always-on;
>>                                               ti,overcurrent-wait = <3>;
>>                                       };
>> -                                     fet6 {
>> +                                     fet6: fet6 {
>>                                               regulator-name = "lcd_vdd";
>>                                               ti,overcurrent-wait = <3>;
>>                                       };
>> @@ -253,6 +254,15 @@
>>                       pinctrl-0 = <&max98095_en>;
>>                       pinctrl-names = "default";
>>               };
>> +
>> +             ptn3460: lvds-bridge@20 {
>> +                     compatible = "nxp,ptn3460";
>> +                     reg = <0x20>;
>> +                     powerdown-gpios = <&gpy2 5 GPIO_ACTIVE_HIGH>;
>> +                     reset-gpios = <&gpx1 5 GPIO_ACTIVE_HIGH>;
>> +                     edid-emulation = <5>;
>> +                     panel = <&panel>;
>> +             };
>>       };
>>
>>       i2s0: i2s@03830000 {
>> @@ -300,11 +310,13 @@
>>               vdd_pll-supply = <&ldo8_reg>;
>>       };
>>
>> -     backlight {
>> +     backlight: backlight {
>>               compatible = "pwm-backlight";
>>               pwms = <&pwm 0 1000000 0>;
>>               brightness-levels = <0 100 500 1000 1500 2000 2500 2800>;
>>               default-brightness-level = <7>;
>> +             enable-gpios = <&gpx3 0 GPIO_ACTIVE_HIGH>;
>> +             power-supply = <&fet1>;
>>               pinctrl-0 = <&pwm0_out>;
>>               pinctrl-names = "default";
>>       };
>> @@ -314,6 +326,12 @@
>>               samsung,invert-vclk;
>>       };
>>
>> +     panel: panel {
>> +             compatible = "chunghwa,claa101wb01";
>> +             power-supply = <&fet6>;
>> +             backlight = <&backlight>;
>> +     };
>> +
>>       dp-controller@145B0000 {
>>               status = "okay";
>>               pinctrl-names = "default";
>> @@ -325,22 +343,7 @@
>>               samsung,link-rate = <0x0a>;
>>               samsung,lane-count = <2>;
>>               samsung,hpd-gpio = <&gpx0 7 0>;
>> -
>> -             display-timings {
>> -                     native-mode = <&timing1>;
>> -
>> -                     timing1: timing@1 {
>> -                             clock-frequency = <70589280>;
>> -                             hactive = <1366>;
>> -                             vactive = <768>;
>> -                             hfront-porch = <40>;
>> -                             hback-porch = <40>;
>> -                             hsync-len = <32>;
>> -                             vback-porch = <10>;
>> -                             vfront-porch = <12>;
>> -                             vsync-len = <6>;
>> -                     };
>> -             };
>> +             bridge = <&ptn3460>;
>>       };
>>  };
>>
>> --
>> 1.7.9.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
