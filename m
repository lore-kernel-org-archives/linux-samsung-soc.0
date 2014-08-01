From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 00/10] ARM: dts: exynos: Prepare Spring
Date: Fri, 01 Aug 2014 23:07:07 +0200
Message-ID: <53DC017B.9000902@gmail.com>
References: <1406868897-26874-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:55357 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751460AbaHAVHM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 17:07:12 -0400
In-Reply-To: <1406868897-26874-1-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>

Hi Andreas,

On 01.08.2014 06:54, Andreas F=C3=A4rber wrote:
> Hello,
>=20
> Based on the preinstalled 3.8 based ChromeOS kernel and previous 3.15=
=20
> based attempts by Stephan and me that broke for 3.16, I've prepared a=
=20
> device tree for the HP Chromebook 11 aka Google Spring.
>=20
> v5 cleans up a regulator and the USB3503 hub and touches more=20
> exynos5250 files.
>=20
> Not yet enabled are trackpad, Wifi and sound.
>=20
> My rebasing branch for testing is here:
> https://github.com/afaerber/linux/commits/spring-next
>=20
> Regards,
> Andreas
>=20
> v1 -> v2:
> * Dropped 3 documentation patches from series:
>   2 picked up,
>   https://patchwork.kernel.org/patch/4397271/
>   https://patchwork.kernel.org/patch/4397291/
>   1 already sent separately as v2, pending.
>   https://patchwork.kernel.org/patch/4424881/
> * Minimized and beautified Spring device tree and to some degree Snow=
 as well.
>   See individual patches.
>=20
> v2 -> v3:
> * Rebased: Two -cros-common cleanup patches were already applied
> * Lots of small cleanups for both Snow and Spring
> * Enabled I2S in Spring for symmetry
> * Added lid-switch and gpio-keys pinctrls to Spring
>=20
> v3 -> v4:
> * Fixed pin-function 1 -> 0 for dp-hpd pinctrl, style cleanup
>=20
> v4 -> v5:
> * Dropped regulator and fixed USB3503 for Spring
> * More cleanups, including SMDK5250 and Arndale
>=20
>=20
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
>=20

I have looked through all the patches and they look good to me, so, for
the whole series:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

There is one unrelated issue I reported in my reply to patch 7/10, but
it is more of a bug report, not a comment to your patch.

Best regards,
Tomasz
