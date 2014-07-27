From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH 0/3] ARM: EXYNOS: Fix Exynos5410 boot
Date: Sun, 27 Jul 2014 14:25:31 +0200
Message-ID: <53D4EFBB.6000404@suse.de>
References: <1406463725-4208-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36075 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751852AbaG0MZd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Jul 2014 08:25:33 -0400
In-Reply-To: <1406463725-4208-1-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Tarek Dakhran <t.dakhran@samsung.com>, Kevin Hilman <khilman@linaro.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Am 27.07.2014 14:22, schrieb Andreas F=C3=A4rber:
> Hello,
>=20
> This mini-series unbreaks booting on 5410 based ODROID-XU.
>=20
> Since I do not have access to a TRM, the address is a guess based on=20
> 5250 and 5410. Such a node was not present in the 3.14 downstream tre=
e.

s/5410/5420/

>=20
> Regards,
> Andreas
>=20
> Andreas F=C3=A4rber (3):
>   Documentation: devicetree: Document exynos5410 PMU
>   ARM: dts: exynos: Add PMU to Exynos5410
>   ARM: EXYNOS: Add support for Exynos5410 PMU
>=20
>  Documentation/devicetree/bindings/arm/samsung/pmu.txt | 1 +
>  arch/arm/boot/dts/exynos5410.dtsi                     | 5 +++++
>  arch/arm/mach-exynos/exynos.c                         | 1 +
>  3 files changed, 7 insertions(+)

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
