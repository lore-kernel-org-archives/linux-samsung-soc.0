From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v5 04/10] ARM: dts: Fill in bootargs for exynos5250-snow
Date: Fri, 01 Aug 2014 23:10:34 +0200
Message-ID: <53DC024A.3020106@suse.de>
References: <1406868897-26874-1-git-send-email-afaerber@suse.de>	<1406868897-26874-5-git-send-email-afaerber@suse.de> <CAD=FV=V4hQeGvE9+O2EY8KGvDj3SJKfOZGes4gKpHfg=xz1h4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60505 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751460AbaHAVKk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 17:10:40 -0400
In-Reply-To: <CAD=FV=V4hQeGvE9+O2EY8KGvDj3SJKfOZGes4gKpHfg=xz1h4A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, open list <linux-kernel@vger.kernel.org>

Hi Doug,

Am 01.08.2014 22:28, schrieb Doug Anderson:
> On Thu, Jul 31, 2014 at 9:54 PM, Andreas F=C3=A4rber <afaerber@suse.d=
e> wrote:
>> exynos5250-cros-common.dtsi had an empty /chosen node.
>> Fill in exemplary boot arguments.
>>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>> ---
>>  v5: New
>>  Cleanup for /chosen node moved into -snow.dts.
>>
>>  arch/arm/boot/dts/exynos5250-snow.dts | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/d=
ts/exynos5250-snow.dts
>> index 7680d5e03fb3..c4b0c73c736d 100644
>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>> @@ -27,6 +27,7 @@
>>         };
>>
>>         chosen {
>> +               bootargs =3D "console=3Dtty1";
>=20
> As mentioned earlier, I don't think this is a particularly useful
> change.  Just this boot argument is not enough to boot with anyway, s=
o
> listing it doesn't really help anyone.  In theory you could make some
> assertion about what the "most popular" boot device and filesystem is=
,
> but it seems unlikely to cover the majority of the cases.
>=20
> I won't NAK this change myself, but I certainly won't push for it.

This patch should be entirely optional.

I believe you said it wasn't necessary because the bootloader supplies
it. My point is that someone needs to know what to put into the bootarg=
s
(setenv / boot.scr / uEnv.txt) - knowing whether it's ttySAC3 vs.
ttySAC2 vs. ttyS0 etc. has been pretty handy for me. In this case, Snow
and Spring use an identical console, so not sure if it might be tty2 or
something elsewhere?

My question of what to use for linux,stdout-path (which was elsewhere
mentioned as successor to bootargs in that regard) remained unanswered.
Should it point to the dp-controller node or what?

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
