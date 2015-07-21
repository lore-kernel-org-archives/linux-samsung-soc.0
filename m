From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL] ARM: EXYNOS: dts: Improvements for 4.3
Date: Tue, 21 Jul 2015 13:56:03 +0900
Message-ID: <06b401d0c371$8b7a6740$a26f35c0$@kernel.org>
References: <1437014519-19571-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37400 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751122AbbGUE4F convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jul 2015 00:56:05 -0400
In-reply-to: <1437014519-19571-1-git-send-email-k.kozlowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Krzysztof Kozlowski wrote:
>=20
> Dear Kukjin,
>=20
Hi Krzysztof,

> DTS related improvements. Description along with a tag.
> You can find them also on the lists with my reviewed-by.
>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit a419d78a6f97f8c977fe55d5d590cd0654=
ecd1ee:
>=20
>   ARM: dts: Exynos4210: add CPU OPP and regulator supply property (20=
15-07-13 21:16:05 +0900)
>=20
> are available in the git repository at:
>=20
>   https://github.com/krzk/linux.git tags/samsung-dt-4.3
>=20
> for you to fetch changes up to cd0b551be420d49c2bde8dcf5ea147278dc89f=
fb:
>=20
>   ARM: dts: Extend exynos5420-pinctrl nodes using labels instead of p=
aths (2015-07-16 11:22:11 +0900)
>=20
> ----------------------------------------------------------------
> Device Tree improvements for Exynos based boards:
> 1. Enable proper USB 3.0 regulators on Odroid XU3 board.
> 2. Set over-heat and over-voltage thresholds for Trats2 board fuel
>    gauge.
> 3. Fix missing display frequency on Exynos3250 Rinato board
>    (necessary to fix the display).
> 4. Enable thermal management and fan control on Odroid XU3 board.
>    The speed of fan is adjusted to current temperature of SoC.
> 5. Cleanups and usage of label-notation for overriding nodes.
>=20
> ----------------------------------------------------------------
> Anand Moon (5):
>       ARM: dts: odroidxu3: Enable USB3 regulators
>       ARM: dts: exynos5422-odroidxu3: Add pwm-fan node
>       ARM: dts: exynos5422-odroidxu3: Enable TMU at Exynos5422 base
>       ARM: dts: exynos5422-odroidxu3: Define default thermal-zones
>       ARM: dts: exynos5422-odroidxu3: Enable thermal-zones
>=20
> Andreas F=C3=A4rber (1):
>       ARM: dts: Clean up exynos5410-smdk5410 indentation
>=20
> Hyungwon Hwang (1):
>       ARM: dts: fix the clock-frequency of exynos3250-rinato board's =
panel
>=20
> Javier Martinez Canillas (4):
>       ARM: dts: Include exynos5250-pinctrl after the nodes were defin=
ed
>       ARM: dts: Extend exynos5250-pinctrl nodes using labels instead =
of paths
>       ARM: dts: Include exynos5420-pinctrl after the nodes were defin=
ed
>       ARM: dts: Extend exynos5420-pinctrl nodes using labels instead =
of paths
>=20
> Krzysztof Kozlowski (2):
>       ARM: dts: Set max17047 over heat and over voltage thresholds
>       ARM: dts: Use labels for overriding nodes in exynos4210-univers=
al
>=20
>  arch/arm/boot/dts/exynos3250-rinato.dts            |    2 +-
>  arch/arm/boot/dts/exynos4210-universal_c210.dts    |  620 ++++----
>  arch/arm/boot/dts/exynos4412-trats2.dts            |    3 +
>  arch/arm/boot/dts/exynos5250-pinctrl.dtsi          | 1600 ++++++++++=
----------
>  arch/arm/boot/dts/exynos5250.dtsi                  |    3 +-
>  arch/arm/boot/dts/exynos5410-smdk5410.dts          |    6 +-
>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi          | 1411 +++++++++-=
-------
>  arch/arm/boot/dts/exynos5420.dtsi                  |    3 +-
>  arch/arm/boot/dts/exynos5422-cpu-thermal.dtsi      |   59 +
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |   46 +
>  10 files changed, 1930 insertions(+), 1823 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos5422-cpu-thermal.dtsi
> --

Applied all of changes into fixes/non-critical and next/dt-samsung.

Note will be sent out to arm-soc in a couple of days.

Thanks,
Kukjin
