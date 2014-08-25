From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: Add DT changes for display on peach_pit
Date: Mon, 25 Aug 2014 11:31:50 +0530
Message-ID: <CAEC9eQP1wAJwC6-9YMjHvA+O=4c93SJNA5YG90t2aWj4P1S6kg@mail.gmail.com>
References: <1406317464-7525-1-git-send-email-ajaykumar.rs@samsung.com>
	<1406317464-7525-3-git-send-email-ajaykumar.rs@samsung.com>
	<53F86E85.3050200@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:37333 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751780AbaHYGBv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Aug 2014 02:01:51 -0400
In-Reply-To: <53F86E85.3050200@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Thierry Reding <thierry.reding@gmail.com>

On Sat, Aug 23, 2014 at 4:05 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> Am 25.07.2014 21:44, schrieb Ajay Kumar:
>> Add DT nodes for ps8622 bridge chip and panel-simple panel.
>
> "simple-panel"
Ok.

>> Add backlight power supply for pwm-backlight.
>> Also add bridge phandle needed by dp to enable display on peach_pit.
>
> Note that peach_pi[t] is inconsistent with the file names being
> peach-pi[t] here and in the two subjects.
Ok.
>>
>> Note that, peach_pit doesn't support "chunghwa,claa101wb01" panel,
>> but still we choose to reuse the binding since "chunghwa,claa101wb01=
"
>> has similar LCD timings.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5420-peach-pit.dts |   36 +++++++++++++++--=
-----------
>>  1 file changed, 19 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/b=
oot/dts/exynos5420-peach-pit.dts
>> index 228a6b1..79beba8 100644
>> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> @@ -30,11 +30,12 @@
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
>> +             power-supply =3D <&tps65090_fet1>;
>>               pinctrl-0 =3D <&pwm0_out>;
>>               pinctrl-names =3D "default";
>>       };
>> @@ -100,6 +101,12 @@
>>               regulator-boot-on;
>>               regulator-always-on;
>>       };
>> +
>> +     panel: panel-simple {
>
> Just "panel"? (AF)
>
>> +             compatible =3D "chunghwa,claa101wb01", "simple-panel";
>
> Drop "simple-panel" (Thierry)
Right.

>> +             power-supply =3D <&tps65090_fet6>;
>> +             backlight =3D <&backlight>;
>> +     };
>>  };
>>
>>  &dp {
>> @@ -113,22 +120,7 @@
>>       samsung,link-rate =3D <0x06>;
>>       samsung,lane-count =3D <2>;
>>       samsung,hpd-gpio =3D <&gpx2 6 0>;
>> -
>> -     display-timings {
>> -             native-mode =3D <&timing1>;
>> -
>> -             timing1: timing@1 {
>> -                     clock-frequency =3D <70589280>;
>> -                     hactive =3D <1366>;
>> -                     vactive =3D <768>;
>> -                     hfront-porch =3D <40>;
>> -                     hback-porch =3D <40>;
>> -                     hsync-len =3D <32>;
>> -                     vback-porch =3D <10>;
>> -                     vfront-porch =3D <12>;
>> -                     vsync-len =3D <6>;
>> -             };
>> -     };
>> +     bridge =3D <&ps8625>;
>>  };
>>
>>  &fimd {
>> @@ -155,6 +147,16 @@
>>               pinctrl-names =3D "default";
>>               pinctrl-0 =3D <&max98090_irq>;
>>       };
>> +
>> +     ps8625: ps8625-bridge@48 {
>
> "lvds-bridge"? (AF)
Ok.

I will fix all these nits and resend along with the driver patches.

Ajay

>> +             compatible =3D "parade,ps8625";
>> +             reg =3D <0x48>;
>> +             sleep-gpios =3D <&gpx3 5 0>;
>> +             reset-gpios =3D <&gpy7 7 0>;
>> +             lane-count =3D <2>;
>> +             panel =3D <&panel>;
>> +             backlight =3D <&backlight>;
>> +     };
>>  };
>>
>>  &hsi2c_9 {
>
> Regards,
> Andreas
>
> --
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=
=C3=BCrnberg
