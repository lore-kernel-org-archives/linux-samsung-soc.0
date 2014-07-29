From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v2 3/4] ARM: dts: exynos5250: Fold common ChromeOS parts
 into Snow
Date: Tue, 29 Jul 2014 14:45:37 +0200
Message-ID: <53D79771.1020406@suse.de>
References: <1405704009-8430-1-git-send-email-afaerber@suse.de>	<1405704009-8430-4-git-send-email-afaerber@suse.de> <CAD=FV=VK0KJknJ2099S7fEDzBnpPCrpSZ36WPkJB156GpcyEfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44083 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750828AbaG2Mpl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 08:45:41 -0400
In-Reply-To: <CAD=FV=VK0KJknJ2099S7fEDzBnpPCrpSZ36WPkJB156GpcyEfg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/SAMSUNG ARM A..." <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Doug,

Am 25.07.2014 18:02, schrieb Doug Anderson:
> On Fri, Jul 18, 2014 at 10:20 AM, Andreas F=C3=A4rber <afaerber@suse.=
de> wrote:
>> +/*
>> + * On Snow we've got SIP WiFi and so can keep drive strengths low t=
o
>> + * reduce EMI.
>> + */
>> +&mmc_3 {
>> +       status =3D "okay";
>> +       num-slots =3D <1>;
>> +       supports-highspeed;
>> +       broken-cd;
>> +       card-detect-delay =3D <200>;
>> +       samsung,dw-mshc-ciu-div =3D <3>;
>> +       samsung,dw-mshc-sdr-timing =3D <2 3>;
>> +       samsung,dw-mshc-ddr-timing =3D <1 2>;
>> +
>> +       slot@0 {
>> +               reg =3D <0>;
>> +               bus-width =3D <4>;
>> +               pinctrl-names =3D "default";
>> +               pinctrl-0 =3D <&sd3_clk &sd3_cmd &sd3_bus4>;
>=20
> This actually looks like a bug on snow.  I don't think these pinctrl
> statements are taking effect and I think they belong at the mmc level=
,
> not the slot level.  That's not a new bug introduced by you, though.
> Mind fixing it?  You've already got it right for Spring mmc_1.

I was taught never to mix code movements with functional changes, as it
hides them even if mentioned in the commit message. Would you like me t=
o
fix it pre- or post-move? Post-move would be easiest for me. ;)

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
