From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: Add DT changes for display on peach_pi
Date: Mon, 25 Aug 2014 11:30:20 +0530
Message-ID: <CAEC9eQPKjQGw6bPg_LuF5wV=iSeJ1UzYBmoON4E2OttJ1kGaUQ@mail.gmail.com>
References: <1406317464-7525-1-git-send-email-ajaykumar.rs@samsung.com>
	<1406317464-7525-4-git-send-email-ajaykumar.rs@samsung.com>
	<53F86CFE.6070307@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:46470 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753056AbaHYGAV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Aug 2014 02:00:21 -0400
In-Reply-To: <53F86CFE.6070307@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Thierry Reding <thierry.reding@gmail.com>

On Sat, Aug 23, 2014 at 3:59 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> Seeing a Reviewed-by, I'm recording comments from another thread so t=
hat
> they don't get forgotten:
I did remember these. Thanks for the reminder though!

> Am 25.07.2014 21:44, schrieb Ajay Kumar:
>> Add DT nodes for panel-simple "auo,b133htn01" panel.
>> Add backlight enable pin and backlight power supply for pwm-backligh=
t.
>> Also add panel phandle needed by dp to enable display on peach_pi.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5800-peach-pi.dts |   27 ++++++++++--------=
---------
>>  1 file changed, 10 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/bo=
ot/dts/exynos5800-peach-pi.dts
>> index f3ee48b..5342638 100644
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
> Just "panel"? (AF)
>> +             compatible =3D "auo,b133htn01", "simple-panel";
>
> Drop "simple-panel" (Thierry)
I will fix all these nits as per the other patch and resend along with
the driver patches.

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
