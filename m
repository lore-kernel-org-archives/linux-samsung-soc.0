From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: Add DT changes for display on snow
Date: Mon, 25 Aug 2014 11:38:56 +0530
Message-ID: <CAEC9eQNrTW8TJsCNwtQv6Tr15gfz1HJbJkSfUR8NLchvCGbVOQ@mail.gmail.com>
References: <1406317464-7525-1-git-send-email-ajaykumar.rs@samsung.com>
	<1406317464-7525-2-git-send-email-ajaykumar.rs@samsung.com>
	<53F8713E.5040408@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:56967 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752496AbaHYGI5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Aug 2014 02:08:57 -0400
In-Reply-To: <53F8713E.5040408@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Thierry Reding <thierry.reding@gmail.com>

On Sat, Aug 23, 2014 at 4:17 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> Am 25.07.2014 21:44, schrieb Ajay Kumar:
>> Add DT nodes for ptn3460 bridge chip and panel-simple panel.
>
> "simple-panel"
Ok.

>> Add backlight enable pin and backlight power supply for pwm-backligh=
t.
>> Also add bridge phandle needed by dp to enable display on snow.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5250-snow.dts |   40 +++++++++++++++++-----=
-----------
>>  1 file changed, 21 insertions(+), 19 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/d=
ts/exynos5250-snow.dts
>> index 6c36d41..f57f993 100644
>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>> @@ -270,7 +270,7 @@
>>                                       dcdc3 {
>>                                               ti,enable-ext-control;
>>                                       };
>> -                                     fet1 {
>> +                                     fet1: fet1 {
>>                                               regulator-name =3D "vc=
d_led";
>>                                               ti,overcurrent-wait =3D=
 <3>;
>>                                       };
>> @@ -293,7 +293,7 @@
>>                                               regulator-always-on;
>>                                               ti,overcurrent-wait =3D=
 <3>;
>>                                       };
>> -                                     fet6 {
>> +                                     fet6: fet6 {
>>                                               regulator-name =3D "lc=
d_vdd";
>>                                               ti,overcurrent-wait =3D=
 <3>;
>>                                       };
>> @@ -342,6 +342,15 @@
>>                       pinctrl-0 =3D <&max98095_en>;
>>                       pinctrl-names =3D "default";
>>               };
>> +
>> +             ptn3460: ptn3460-bridge@20 {
>
> "lvds-bridge"? (AF)
Ok.
>> +                     compatible =3D "nxp,ptn3460";
>> +                     reg =3D <0x20>;
>> +                     powerdown-gpios =3D <&gpy2 5 0>;
>> +                     reset-gpios =3D <&gpx1 5 0>;
>> +                     edid-emulation =3D <5>;
>> +                     panel =3D <&panel>;
>> +             };
>>       };
>>
>>       i2s0: i2s@03830000 {
>> @@ -389,11 +398,13 @@
>>               vdd_pll-supply =3D <&ldo8_reg>;
>>       };
>>
>> -     backlight {
>> +     backlight: backlight {
>>               compatible =3D "pwm-backlight";
>>               pwms =3D <&pwm 0 1000000 0>;
>>               brightness-levels =3D <0 100 500 1000 1500 2000 2500 2=
800>;
>>               default-brightness-level =3D <7>;
>> +             enable-gpios =3D <&gpx3 0 0>;
>> +             power-supply =3D <&fet1>;
>>               pinctrl-0 =3D <&pwm0_out>;
>>               pinctrl-names =3D "default";
>>       };
>> @@ -403,6 +414,12 @@
>>               samsung,invert-vclk;
>>       };
>>
>> +     panel: panel-simple {
>
> Just "panel"? (AF)
>
>> +             compatible =3D "simple-panel";
>
> Use something more concrete than "simple-panel"? (Thierry)
Right.
>> +             power-supply =3D <&fet6>;
>> +             backlight =3D <&backlight>;
>> +     };
>> +
>>       dp-controller@145B0000 {
>>               status =3D "okay";
>>               pinctrl-names =3D "default";
>> @@ -414,21 +431,6 @@
>>               samsung,link-rate =3D <0x0a>;
>>               samsung,lane-count =3D <2>;
>>               samsung,hpd-gpio =3D <&gpx0 7 0>;
>> -
>> -             display-timings {
>> -                     native-mode =3D <&timing1>;
>> -
>> -                     timing1: timing@1 {
>> -                             clock-frequency =3D <70589280>;
>> -                             hactive =3D <1366>;
>> -                             vactive =3D <768>;
>> -                             hfront-porch =3D <40>;
>> -                             hback-porch =3D <40>;
>> -                             hsync-len =3D <32>;
>> -                             vback-porch =3D <10>;
>> -                             vfront-porch =3D <12>;
>> -                             vsync-len =3D <6>;
>> -                     };
>> -             };
>> +             bridge =3D <&ptn3460>;
>>       };
>>  };
>
> This patch will trivially conflict with my Snow cleanup [1]; ptn3460
> would go into the appropriate &i2c_* and this hunk into &dp then.
Yes, display-timings node should be removed from the DP DT node.
Should I rebase these DT patches on top of your cleanup series?

Ajay
