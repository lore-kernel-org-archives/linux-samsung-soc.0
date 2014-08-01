From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v5 05/10] ARM: dts: Move dp_hpd from exynos5250 into smdk5250
 and snow
Date: Fri, 01 Aug 2014 22:54:34 +0200
Message-ID: <53DBFE8A.7020505@suse.de>
References: <1406868897-26874-1-git-send-email-afaerber@suse.de>	<1406868897-26874-6-git-send-email-afaerber@suse.de> <CAD=FV=WhocoyQ=rU7dU1EPM-PAQq06gg9HhamSOm+BgMDeM8NA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60359 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755933AbaHAUyi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 16:54:38 -0400
In-Reply-To: <CAD=FV=WhocoyQ=rU7dU1EPM-PAQq06gg9HhamSOm+BgMDeM8NA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, open list <linux-kernel@vger.kernel.org>

Doug,

Am 01.08.2014 22:33, schrieb Doug Anderson:
> On Thu, Jul 31, 2014 at 9:54 PM, Andreas F=C3=A4rber <afaerber@suse.d=
e> wrote:
>> Spring uses a different GPIO, so this is not a generic SoC piece.
>>
>> Suggested-by: Tomasz Figa <t.figa@samsung.com>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>> ---
>>  v5: New (Tomasz Figa)
>>  Frees dp_hpd for Spring.
>>
>>  arch/arm/boot/dts/exynos5250-pinctrl.dtsi | 7 -------
>>  arch/arm/boot/dts/exynos5250-smdk5250.dts | 9 +++++++++
>>  arch/arm/boot/dts/exynos5250-snow.dts     | 7 +++++++
>>  3 files changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi b/arch/arm/bo=
ot/dts/exynos5250-pinctrl.dtsi
>> index 886cfca044ac..ed0e5230514b 100644
>> --- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>> @@ -581,13 +581,6 @@
>>                         samsung,pin-pud =3D <0>;
>>                         samsung,pin-drv =3D <0>;
>>                 };
>> -
>> -               dp_hpd: dp_hpd {
>> -                       samsung,pins =3D "gpx0-7";
>> -                       samsung,pin-function =3D <3>;
>> -                       samsung,pin-pud =3D <0>;
>> -                       samsung,pin-drv =3D <0>;
>> -               };
>>         };
>>
>>         pinctrl@13400000 {
>> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/bo=
ot/dts/exynos5250-smdk5250.dts
>> index aaa055ac0fe3..5d30fe1dcda4 100644
>> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> @@ -414,3 +414,12 @@
>>                 };
>>         };
>>  };
>> +
>> +&pinctrl_0 {
>> +       dp_hpd: dp_hpd {
>> +               samsung,pins =3D "gpx0-7";
>> +               samsung,pin-function =3D <3>;
>> +               samsung,pin-pud =3D <0>;
>> +               samsung,pin-drv =3D <0>;
>> +       };
>> +};
>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/d=
ts/exynos5250-snow.dts
>> index c4b0c73c736d..a9a2f2743794 100644
>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>> @@ -547,6 +547,13 @@
>>  };
>>
>>  &pinctrl_0 {
>> +       dp_hpd: dp_hpd {
>> +               samsung,pins =3D "gpx0-7";
>> +               samsung,pin-function =3D <3>;
>> +               samsung,pin-pud =3D <0>;
>> +               samsung,pin-drv =3D <0>;
>> +       };
>> +
>=20
> NAK.  dp_hpd is a generic SoC piece.  Pin function 0 and 1 are GPIOs.
> Pin function 3 is special function.  This pin _is_ the hot plug detec=
t
> pin for display port.  When it's set as special function 3 it goes
> straight into the hot plug logic of the display port controller.
>=20
> Spring may have had its reasons to detect hot plug events on a GPIO
> instead of using this pin, but that doesn't make this pin any less th=
e
> "hot plug pin".

Please advise how to handle it then: Should there be two different
pinctrl entries (if so, how should it be named?), or should spring
override the generic entry? As I reported, 3.8 has only one dp-hpd
pinctrl entry, so I dropped the dp-hpd-gpio naming.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
