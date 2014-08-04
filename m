From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2] ARM: dts: Add DT changes for display on peach_pi
Date: Mon, 4 Aug 2014 14:22:06 +0530
Message-ID: <CAEC9eQNskPt_BFZd7Ed2Faii4dEbjj597HArK2sYMyWL4Sk7UA@mail.gmail.com>
References: <1406910258-28036-1-git-send-email-ajaykumar.rs@samsung.com>
	<53DBC641.3090601@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f179.google.com ([209.85.220.179]:65510 "EHLO
	mail-vc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751046AbaHDIwH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Aug 2014 04:52:07 -0400
In-Reply-To: <53DBC641.3090601@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, InKi Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Hi Andreas,

Thanks for the comments.

On Fri, Aug 1, 2014 at 10:24 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> Hi,
>
> Am 01.08.2014 18:24, schrieb Ajay Kumar:
>> Add DT nodes for panel-simple "auo,b133htn01" panel.
>> Add backlight enable pin and backlight power supply for pwm-backligh=
t.
>> Also add panel phandle needed by dp to enable display on peach_pi.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>> Changes since V1:
>> Remove "simple-panel" compatible string and use only ""auo,b133htn01=
".
>>
>>  arch/arm/boot/dts/exynos5800-peach-pi.dts |   27 ++++++++++--------=
---------
>>  1 file changed, 10 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/bo=
ot/dts/exynos5800-peach-pi.dts
>> index f3ee48b..f8c2e61 100644
>> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> @@ -28,11 +28,13 @@
>>               i2c20 =3D "/spi@12d40000/cros-ec@0/i2c-tunnel";
>>       };
>>
>> -     backlight {
>> +     backlight: backlight {
>>               compatible =3D "pwm-backlight";
>>               pwms =3D <&pwm 0 1000000 0>;
>>               brightness-levels =3D <0 100 500 1000 1500 2000 2500 2=
800>;
>>               default-brightness-level =3D <7>;
>> +             enable-gpios =3D <&gpx2 2 0>;
>
> For Spring I was asked to use GPIO_ACTIVE_* - here that would mean
> s/0/GPIO_ACTIVE_HIGH/ IIUC and if necessary
> #include <dt-bindings/gpio/gpio.h> before the .dtsi #include.
Ok. I will use  it.

> A modified version of your patch for Snow, rebased onto my cleanups, =
can
> be found on my spring-next branch.
>
>> +             power-supply =3D <&tps65090_fet1>;
>>               pinctrl-0 =3D <&pwm0_out>;
>>               pinctrl-names =3D "default";
>>       };
>> @@ -98,6 +100,12 @@
>>               regulator-boot-on;
>>               regulator-always-on;
>>       };
>> +
>> +     panel: panel-simple {
>
> Nit: panel-simple seems backwards in English language, and given that
> simple-panel would be referring to the implementation, I used just
> "panel" for Spring.
Right. All the platforms just use "panel". I will use the same.

>> +             compatible =3D "auo,b133htn01";
>
> FWIW this depends on auo,b133htn01 getting added to Documentation and
> panel-simple, which I think hasn't happened yet?
>
> https://patchwork.kernel.org/patch/4625321/
This version is already old ;)
Latest version is here:
http://www.spinics.net/lists/devicetree/msg44158.html
I hope it will be(is?) merged!

Ajay

>> +             power-supply =3D <&tps65090_fet6>;
>> +             backlight =3D <&backlight>;
>> +     };
>>  };
>>
>>  &dp {
>> @@ -111,22 +119,7 @@
>>       samsung,link-rate =3D <0x0a>;
>>       samsung,lane-count =3D <2>;
>>       samsung,hpd-gpio =3D <&gpx2 6 0>;
>> -
>> -     display-timings {
>> -             native-mode =3D <&timing1>;
>> -
>> -             timing1: timing@1 {
>> -                     clock-frequency =3D <150660000>;
>> -                     hactive =3D <1920>;
>> -                     vactive =3D <1080>;
>> -                     hfront-porch =3D <60>;
>> -                     hback-porch =3D <172>;
>> -                     hsync-len =3D <80>;
>> -                     vback-porch =3D <25>;
>> -                     vfront-porch =3D <10>;
>> -                     vsync-len =3D <10>;
>> -             };
>> -     };
>> +     panel =3D <&panel>;
>>  };
>>
>>  &fimd {
>
> Regards,
> Andreas
>
> --
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=
=C3=BCrnberg
