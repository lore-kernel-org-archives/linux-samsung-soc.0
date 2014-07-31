From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v4 3/4] ARM: dts: Clean up exynos5250-snow
Date: Thu, 31 Jul 2014 21:21:28 +0200
Message-ID: <53DA9738.6080809@suse.de>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de> <1406822910-6255-4-git-send-email-afaerber@suse.de> <53DA96C7.30009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39523 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752245AbaGaTVc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 15:21:32 -0400
In-Reply-To: <53DA96C7.30009@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, open list <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Stephan van Schaik <stephan@synkhronix.com>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org

Am 31.07.2014 21:19, schrieb Tomasz Figa:
> Andreas,
>=20
> Please see my comments inline.
>=20
> On 31.07.2014 18:08, Andreas F=C3=A4rber wrote:
>> Use the new style of referencing inherited nodes and use symbolic na=
mes.
>>
>> Suggested-by: Doug Anderson <dianders@chromium.org>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>=20
> [snip]
>=20
>> -
>>  	usb@12110000 {
>> -		samsung,vbus-gpio =3D <&gpx1 1 0>;
>> +		samsung,vbus-gpio =3D <&gpx1 1 GPIO_ACTIVE_HIGH>;
>>  	};
>=20
> This is a higher level node being overridden, so it should be specifi=
ed
> using references too.
>=20
>> =20
>>  	fixed-rate-clocks {
>> @@ -287,7 +206,7 @@
>>  	};
>> =20
>>  	hdmi {
>=20
> Ditto.

Same problem as with spring: We need the labels first!

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
