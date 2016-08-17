From: Kukjin Kim <kgene.kim@gmail.com>
Subject: Re: [PATCH v3] MAINTAINERS: Switch to kernel.org account for Krzysztof Kozlowski
Date: Wed, 17 Aug 2016 10:45:35 +0900
Message-ID: <9819B1EB-CDED-464B-A955-AF4935F6E8CD@gmail.com>
References: <1471366242-11432-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1471366242-11432-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, k.kozlowski@samsung.com, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Krzysztof Kozlowski wrote:
> Change my email address to kernel.org account instead of Samsung one.
>=20
> Add Bartlomiej Zolnierkiewicz as a co-maintainer of Maxim and Samsung
> PMIC drivers.  These are used on many of our boards along with Exynos
> SoCs and Samsung R&D Institute Poland can still take care of them.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Kukjin Kim <kgene@kernel.org>

Acked-by: Kukjin Kim <kgene@kernel.org>

> Cc: linux-samsung-soc@vger.kernel.org
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>=20
> ---
>=20
> Third revision for simple maintainers update. Nice! :)
>=20
> Changes since v2:
> 1. Add Bartlomiej, leave MUIC charger drivers as "Supported".
>=20
> Changes since v1:
> 1. Update also mailmap after Joe Perches suggestion.
>=20
> Affected drivers/subsystems:
> 1. arch/arm,
> 2. mfd,
> 3. power,
> 4. regulator,
> 5. clk,
> 6. rtc,
> 7. extcon,
> 8. pinctrl,
> 9. sound/soc,
>=20
> However if there are no objections, I can push it through my tree (to
> arm-soc folks).
> ---
> .mailmap    |  1 +
> MAINTAINERS | 15 +++++++++------
> 2 files changed, 10 insertions(+), 6 deletions(-)
>=20
> diff --git a/.mailmap b/.mailmap
> index 2a91c14c80bf..b18912c5121e 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -88,6 +88,7 @@ Kay Sievers <kay.sievers@vrfy.org>
> Kenneth W Chen <kenneth.w.chen@intel.com>
> Konstantin Khlebnikov <koct9i@gmail.com> <k.khlebnikov@samsung.com>
> Koushik <raghavendra.koushik@neterion.com>
> +Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski@samsung.com>
> Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski.k@gmail.com>
> Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Leonid I Ananiev <leonid.i.ananiev@intel.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 45c98485c3f0..f77df673d097 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1623,7 +1623,7 @@ N:    rockchip
>=20
> ARM/SAMSUNG EXYNOS ARM ARCHITECTURES
> M:    Kukjin Kim <kgene@kernel.org>
> -M:    Krzysztof Kozlowski <k.kozlowski@samsung.com>
> +M:    Krzysztof Kozlowski <krzk@kernel.org>
> L:    linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)=

> L:    linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> S:    Maintained
> @@ -7465,7 +7465,8 @@ F:    Documentation/devicetree/bindings/sound/max986=
0.txt
> F:    sound/soc/codecs/max9860.*
>=20
> MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS
> -M:    Krzysztof Kozlowski <k.kozlowski@samsung.com>
> +M:    Krzysztof Kozlowski <krzk@kernel.org>
> +M:    Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> L:    linux-pm@vger.kernel.org
> S:    Supported
> F:    drivers/power/supply/max14577_charger.c
> @@ -7481,7 +7482,8 @@ F:    include/dt-bindings/*/*max77802.h
>=20
> MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BOARDS
> M:    Chanwoo Choi <cw00.choi@samsung.com>
> -M:    Krzysztof Kozlowski <k.kozlowski@samsung.com>
> +M:    Krzysztof Kozlowski <krzk@kernel.org>
> +M:    Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> L:    linux-kernel@vger.kernel.org
> S:    Supported
> F:    drivers/*/max14577*.c
> @@ -9258,7 +9260,7 @@ F:    drivers/pinctrl/sh-pfc/
>=20
> PIN CONTROLLER - SAMSUNG
> M:    Tomasz Figa <tomasz.figa@gmail.com>
> -M:    Krzysztof Kozlowski <k.kozlowski@samsung.com>
> +M:    Krzysztof Kozlowski <krzk@kernel.org>
> M:    Sylwester Nawrocki <s.nawrocki@samsung.com>
> L:    linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)=

> L:    linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> @@ -10189,7 +10191,7 @@ S:    Maintained
> F:    drivers/platform/x86/samsung-laptop.c
>=20
> SAMSUNG AUDIO (ASoC) DRIVERS
> -M:    Krzysztof Kozlowski <k.kozlowski@samsung.com>
> +M:    Krzysztof Kozlowski <krzk@kernel.org>
> M:    Sangbeom Kim <sbkim73@samsung.com>
> M:    Sylwester Nawrocki <s.nawrocki@samsung.com>
> L:    alsa-devel@alsa-project.org (moderated for non-subscribers)
> @@ -10204,7 +10206,8 @@ F:    drivers/video/fbdev/s3c-fb.c
>=20
> SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
> M:    Sangbeom Kim <sbkim73@samsung.com>
> -M:    Krzysztof Kozlowski <k.kozlowski@samsung.com>
> +M:    Krzysztof Kozlowski <krzk@kernel.org>
> +M:    Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> L:    linux-kernel@vger.kernel.org
> L:    linux-samsung-soc@vger.kernel.org
> S:    Supported
> --=20
> 2.7.4
>=20
