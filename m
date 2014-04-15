From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 3/4] ARM: dts: exynos5250-snow: add tps65090 power regulator
Date: Tue, 15 Apr 2014 15:25:56 +0530
Message-ID: <CAK9yfHw=8q03Qj5H2XeT+hN8R6vQdJAoiv2TgHBi6PWqi_ozow@mail.gmail.com>
References: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>
	<1397481367-12652-3-git-send-email-sachin.kamat@linaro.org>
	<CAD=FV=Vv5SuBDohaNQ=ry1ctHnwQodu3xuFr3XkqBuX5tobwAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:53210 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751352AbaDOJz4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Apr 2014 05:55:56 -0400
Received: by mail-ob0-f182.google.com with SMTP id uz6so10538616obc.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2014 02:55:56 -0700 (PDT)
In-Reply-To: <CAD=FV=Vv5SuBDohaNQ=ry1ctHnwQodu3xuFr3XkqBuX5tobwAQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Olof Johansson <olof@lixom.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>

Hi Doug,

On 15 April 2014 04:13, Doug Anderson <dianders@chromium.org> wrote:
> Sachin,
>
> On Mon, Apr 14, 2014 at 6:16 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> From: Doug Anderson <dianders@chromium.org>
>>
>> Added TPS65090 regulator related nodes to Snow board.
>>
>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos5250-snow.dts |   90 +++++++++++++++++++++++++++++++++
>>  1 file changed, 90 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
>> index 469c85d..a38fd18 100644
>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>> @@ -44,6 +44,13 @@
>>                 sd3_bus4: sd3-bus-width4 {
>>                         samsung,pin-drv = <0>;
>>                 };
>> +
>> +               tps65090_irq: tps65090-irq {
>> +                       samsung,pins = "gpx2-6";
>> +                       samsung,pin-function = <0>;
>> +                       samsung,pin-pud = <0>;
>> +                       samsung,pin-drv = <0>;
>> +               };
>>         };
>>
>>         pinctrl@13400000 {
>> @@ -75,6 +82,12 @@
>>                 };
>>         };
>>
>> +       vbat: vbat-fixed-regulator {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vbat-supply";
>> +               regulator-boot-on;
>> +       };
>> +
>>         i2c-arbitrator {
>>                 compatible = "i2c-arb-gpio-challenge";
>>                 #address-cells = <1>;
>> @@ -201,6 +214,83 @@
>>                                                         0x070c0069>;    /* LEFT */
>>                                 };
>>                         };
>> +
>> +                       power-regulator {
>> +                               compatible = "ti,tps65090";
>> +                               reg = <0x48>;
>> +
>> +                               /*
>> +                                * Config irq to disable internal pulls
>> +                                * even though we run in polling mode.
>
> This comment refers to a feature that hasn't yet been sent upstream.
> ...but it's a good reminder and I can send it upstream now.  You can
> see it at:
>
> * https://chromium-review.googlesource.com/62630
> * https://chromium-review.googlesource.com/175653
>
> Since this is only a comment I guess it's OK to refer to a feature
> that hasn't yet landed (?).
>
>
>> +                                */
>> +                               pinctrl-names = "default";
>> +                               pinctrl-0 = <&tps65090_irq>;
>> +
>> +                               vsys1-supply = <&vbat>;
>> +                               vsys2-supply = <&vbat>;
>> +                               vsys3-supply = <&vbat>;
>> +                               infet1-supply = <&vbat>;
>> +                               infet2-supply = <&vbat>;
>> +                               infet3-supply = <&vbat>;
>> +                               infet4-supply = <&vbat>;
>> +                               infet5-supply = <&vbat>;
>> +                               infet6-supply = <&vbat>;
>> +                               infet7-supply = <&vbat>;
>> +                               vsys-l1-supply = <&vbat>;
>> +                               vsys-l2-supply = <&vbat>;
>> +
>> +                               regulators {
>> +                                       dcdc1 {
>> +                                               ti,enable-ext-control;
>> +                                       };
>> +                                       dcdc2 {
>> +                                               ti,enable-ext-control;
>> +                                       };
>> +                                       dcdc3 {
>> +                                               ti,enable-ext-control;
>> +                                       };
>> +                                       fet1 {
>> +                                               regulator-name = "vcd_led";
>> +                                               ti,overcurrent-wait = <3>;
>
> This is also referring to something that hasn't been sent upstream yet.  See:
> * https://chromium-review.googlesource.com/184607
>
>> +                                       };
>> +                                       tps65090_fet2: fet2 {
>> +                                               regulator-name = "video_mid";
>> +                                               regulator-always-on;
>> +                                               ti,overcurrent-wait = <3>;
>> +                                       };
>> +                                       fet3 {
>> +                                               regulator-name = "wwan_r";
>> +                                               regulator-always-on;
>> +                                               ti,overcurrent-wait = <3>;
>> +                                       };
>> +                                       fet4 {
>> +                                               regulator-name = "sdcard";
>> +                                               ti,overcurrent-wait = <3>;
>> +                                       };
>> +                                       fet5 {
>> +                                               regulator-name = "camout";
>> +                                               regulator-always-on;
>> +                                               ti,overcurrent-wait = <3>;
>> +                                       };
>> +                                       fet6 {
>> +                                               regulator-name = "lcd_vdd";
>> +                                               ti,overcurrent-wait = <3>;
>> +                                       };
>> +                                       tps65090_fet7: fet7 {
>> +                                               regulator-name = "video_mid_1a";
>> +                                               regulator-always-on;
>> +                                               ti,overcurrent-wait = <3>;
>> +                                       };
>> +                                       ldo1 {
>> +                                       };
>> +                                       ldo2 {
>> +                                       };
>> +                               };
>> +
>> +                               charger {
>> +                                       compatible = "ti,tps65090-charger";
>> +                               };
>
> I'm nearly certain that the charger will be pretty unhappy without the
> polling mode change mentioned above.

Since the patches that you pointed out were in the internal tree, did
not realise they
had not yet hit mainline. This patch should certainly come after that.

-- 
With warm regards,
Sachin
