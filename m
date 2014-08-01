From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v4 4/4] ARM: dts: Add exynos5250-spring device tree
Date: Fri, 01 Aug 2014 05:17:42 +0200
Message-ID: <53DB06D6.9060604@suse.de>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de> <1406822910-6255-5-git-send-email-afaerber@suse.de> <53DA936E.9060004@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44884 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751663AbaHADRt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 23:17:49 -0400
In-Reply-To: <53DA936E.9060004@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>

Am 31.07.2014 21:05, schrieb Tomasz Figa:
>> +
>> +&i2c_2 {
>> +	status =3D "okay";
>> +	samsung,i2c-sda-delay =3D <100>;
>> +	samsung,i2c-max-bus-freq =3D <66000>;
>> +
>> +	hdmiddc@50 {
>> +		compatible =3D "samsung,exynos4210-hdmiddc";
>> +		reg =3D <0x50>;
>> +	};
>=20
> I don't think this matches current Exynos HDMI bindings, which I beli=
eve
> have been changed to just take a phandle to i2c bus instead.

Looks correct to me:

http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/tre=
e/Documentation/devicetree/bindings/video/exynos_hdmiddc.txt?h=3Dfor-ne=
xt

https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/D=
ocumentation/devicetree/bindings/video/exynos_hdmiddc.txt

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
