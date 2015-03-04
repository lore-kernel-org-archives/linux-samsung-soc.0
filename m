From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 8/9] ARM: EXYNOS: suspend requires regulator access
Date: Wed, 04 Mar 2015 22:14:01 +0100
Message-ID: <4263601.lmZODAZr9H@wuerfel>
References: <1423769746-582629-1-git-send-email-arnd@arndb.de> <2062492.pEav958W9c@wuerfel> <CAJKOXPf6eY4oZZe3tG51QnRhsvFuOVRmYsEpc4g0bwyAfip0EQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:63850 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751109AbbCDVOa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Mar 2015 16:14:30 -0500
In-Reply-To: <CAJKOXPf6eY4oZZe3tG51QnRhsvFuOVRmYsEpc4g0bwyAfip0EQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof =?utf-8?B?S296xYJvd3NraQ==?= <k.kozlowski.k@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "arm@kernel.org" <arm@kernel.org>, javier.martinez@collabora.co.uk, broonie@kernel.org

On Wednesday 04 March 2015 20:44:07 Krzysztof Koz=C5=82owski wrote:
> W dniu poniedzia=C5=82ek, 2 marca 2015 Arnd Bergmann <arnd@arndb.de> =
napisa=C5=82(a):
> >
> > Building an exynos kernel without regulators but with suspend enabl=
ed results
> > in a link error:
> >
> > arch/arm/mach-exynos/built-in.o: In function `exynos_suspend_finish=
':
> > arch/arm/mach-exynos/suspend.c:532: undefined reference to `regulat=
or_suspend_finish'
> > arch/arm/mach-exynos/built-in.o: In function `exynos_suspend_prepar=
e':
> > arch/arm/mach-exynos/suspend.c:515: undefined reference to `regulat=
or_suspend_prepare'
> >
> > This adds an appropriate 'select' statement in Kconfig to ensure th=
e symbols
> > are available.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>=20
>=20
> Isn't this fixed already by: https://lkml.org/lkml/2015/2/4/119
> (applied by Mark Brown)?
>=20
> I can't test it now (I am out of office) but issue looks quite simila=
r.
>=20
>=20

Yes, that is probably right.

Thanks,

	Arnd
