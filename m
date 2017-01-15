From: Kukjin Kim <kgene.kim@gmail.com>
Subject: Re: [PATCH 0/4] Drop drivers for Exynos4415
Date: Sun, 15 Jan 2017 10:00:45 +0800
Message-ID: <16B68D3F-5D33-41D5-A2FE-218422E16AB3@gmail.com>
References: <20170114123642.15581-1-krzk@kernel.org>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170114123642.15581-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-gpio@vge
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzk,

2017. 1. 14. PM 8:36 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Hi,
>=20
> Support for Exynos4415 is being removed because:
> 1. There are no upstream users,
> 2. There are no known downstream users,
> 3. Except compile testing, you cannot build working kernel
>   for Exynos4415 anymore.
>=20
> Patches are rebased on current next and are independent.
> Please pick up as you wish.
>=20
> Best regards,
> Krzysztof

Agreed,

Acked-by: Kukjin Kim <kgene@kernel.org>

k-gene
>=20
> Krzysztof Kozlowski (4):
>  ARM: EXYNOS: Remove Exynos4415 driver (SoC not supported anymore)
>  clk: samsung: Remove Exynos4415 driver (SoC not supported anymore)
>  pinctrl: samsung: Remove support for Exynos4415 (SoC not supported
>    anymore)
>  drm: exynos: Remove support for Exynos4415 (SoC not supported anymore)
>=20
> .../devicetree/bindings/clock/exynos4415-clock.txt |   38 -
> .../bindings/display/exynos/exynos_dsim.txt        |    1 -
> .../bindings/display/exynos/samsung-fimd.txt       |    1 -
> arch/arm/mach-exynos/Kconfig                       |    5 -
> arch/arm/mach-exynos/exynos.c                      |    1 -
> arch/arm/mach-exynos/suspend.c                     |    1 -
> drivers/clk/samsung/Makefile                       |    1 -
> drivers/clk/samsung/clk-exynos4415.c               | 1022 ----------------=
----
> drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   15 +-
> drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   18 +-
> drivers/pinctrl/samsung/pinctrl-exynos.c           |   75 --
> drivers/pinctrl/samsung/pinctrl-samsung.c          |    2 -
> drivers/pinctrl/samsung/pinctrl-samsung.h          |    1 -
> include/dt-bindings/clock/exynos4415.h             |  360 -------
> 14 files changed, 3 insertions(+), 1538 deletions(-)
> delete mode 100644 Documentation/devicetree/bindings/clock/exynos4415-cloc=
k.txt
> delete mode 100644 drivers/clk/samsung/clk-exynos4415.c
> delete mode 100644 include/dt-bindings/clock/exynos4415.h
>=20
> --=20
> 2.9.3
>=20
