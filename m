From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v5 00/10] ARM: dts: exynos: Prepare Spring
Date: Fri, 01 Aug 2014 07:16:27 +0200
Message-ID: <53DB22AB.6020007@suse.de>
References: <1406868897-26874-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45960 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750864AbaHAFQd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 01:16:33 -0400
In-Reply-To: <1406868897-26874-1-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>

Am 01.08.2014 06:54, schrieb Andreas F=C3=A4rber:
> Andreas F=C3=A4rber (10):
>   ARM: dts: Fix MMC pinctrl for exynos5250-snow
>   ARM: dts: Fold exynos5250-cros-common into exynos5250-snow
>   ARM: dts: Clean up exynos5250-snow
>   ARM: dts: Fill in bootargs for exynos5250-snow
>   ARM: dts: Move dp_hpd from exynos5250 into smdk5250 and snow
>   ARM: dts: Clean up exynos5250-smdk5250
>   ARM: dts: Clean up exynos5250-arndale

>   ARM: dts: Fix apparent GPIO typo in exynos5250-arndale
>   ARM: dts: Simplify USB3503 on exynos5250-arndale

Note that these two are again untested! They are entirely optional.

Andreas

>   ARM: dts: Add exynos5250-spring device tree
>=20
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/exynos5250-arndale.dts      | 927 +++++++++++++---=
----------
>  arch/arm/boot/dts/exynos5250-cros-common.dtsi | 164 -----
>  arch/arm/boot/dts/exynos5250-pinctrl.dtsi     |   7 -
>  arch/arm/boot/dts/exynos5250-smdk5250.dts     | 641 +++++++++-------=
--
>  arch/arm/boot/dts/exynos5250-snow.dts         | 441 +++++++-----
>  arch/arm/boot/dts/exynos5250-spring.dts       | 536 +++++++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi             |  24 +-
>  8 files changed, 1624 insertions(+), 1117 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/exynos5250-cros-common.dtsi
>  create mode 100644 arch/arm/boot/dts/exynos5250-spring.dts

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
