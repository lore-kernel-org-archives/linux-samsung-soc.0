From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [RFC 0/5] ARM: EXYNOS: ODROID-XU DT and LEDs
Date: Thu, 31 Jul 2014 06:46:45 +0200
Message-ID: <53D9CA35.1030800@suse.de>
References: <1406549892-5558-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49352 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751555AbaGaEqt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 00:46:49 -0400
In-Reply-To: <1406549892-5558-1-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>
Cc: Hakjoo Kim <ruppi.kim@hardkernel.com>, Tarek Dakhran <t.dakhran@samsung.com>, Kevin Hilman <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Humberto Naves <hsnaves@gmail.com>

Kukjin,

Am 28.07.2014 14:18, schrieb Andreas F=C3=A4rber:
> Hello,
>=20
> This series adds a dedicated ODROID-XU device tree and enhances it wi=
th=20
> LED configuration, to match the downstream 3.14 based behavior.
>=20
> It had turned out less trivial than I initially thought as the whole=20
> pinctrl stuff is still missing. I thus cherry-pick two downstream com=
mits.
>=20
> Hakjoo, can you please reply with a Signed-off-by to your patches
> so that we can get them into upstream? Thanks in advance!

=46TR, Hakjoo Kim did reply with signed off patches (thanks again!) and
updated their branch accordingly:

https://github.com/hardkernel/linux/commits/odroid-3.14.y-linaro
https://github.com/hardkernel/linux/commit/53edc3da0d1da287517681b47daf=
36679637b6ba
https://github.com/hardkernel/linux/commit/afdc310e47e4d1799719566bfb5a=
47c55141a7cb

> Andreas F=C3=A4rber (3):
>   ARM: dts: exynos5410: Clean up SMDK5410 indentation
>   ARM: dts: exynos5410: Prepare ODROID-XU device tree

The functional changes below haven't been reviewed yet, but could you
consider applying trivial patches 1-2?

Regards,
Andreas

>   ARM: dts: exynos5410: Add ODROID-XU LEDs
>=20
> Hakjoo Kim (2):
>   pinctrl: exynos: add exynos5410 SoC specific data
>   ARM: dts: add pinctrl support to Exynos5410
>=20
>  .../bindings/pinctrl/samsung-pinctrl.txt           |   1 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/exynos5410-odroidxu.dts          | 111 ++++++
>  arch/arm/boot/dts/exynos5410-pinctrl.dtsi          | 408 +++++++++++=
++++++++++
>  arch/arm/boot/dts/exynos5410-smdk5410.dts          |   6 +-
>  arch/arm/boot/dts/exynos5410.dtsi                  |  32 ++
>  drivers/pinctrl/pinctrl-exynos.c                   | 126 +++++++
>  drivers/pinctrl/pinctrl-samsung.c                  |   2 +
>  drivers/pinctrl/pinctrl-samsung.h                  |   1 +
>  9 files changed, 685 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos5410-odroidxu.dts
>  create mode 100644 arch/arm/boot/dts/exynos5410-pinctrl.dtsi
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
