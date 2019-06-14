From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v10 08/13] drivers: memory: add DMC driver for Exynos5422
Date: Fri, 14 Jun 2019 14:58:55 +0200
Message-ID: <CAJKOXPehO2pKrTKMO4YRwDMaPPngmeWG9WF=kMuBG+=P1ix3NA@mail.gmail.com>
References: <CGME20190614095327eucas1p19b6e522efa15c8fd21c51f3900e376e9@eucas1p1.samsung.com>
 <20190614095309.24100-1-l.luba@partner.samsung.com> <20190614095309.24100-9-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614095309.24100-9-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 14 Jun 2019 at 11:53, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> This patch adds driver for Exynos5422 Dynamic Memory Controller.
> The driver provides support for dynamic frequency and voltage scaling for
> DMC and DRAM. It supports changing timings of DRAM running with different
> frequency. There is also an algorithm to calculate timigns based on
> memory description provided in DT.
> The patch also contains needed MAINTAINERS file update.
>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  MAINTAINERS                             |    8 +
>  drivers/memory/samsung/Kconfig          |   17 +
>  drivers/memory/samsung/Makefile         |    1 +
>  drivers/memory/samsung/exynos5422-dmc.c | 1262 +++++++++++++++++++++++
>  4 files changed, 1288 insertions(+)
>  create mode 100644 drivers/memory/samsung/exynos5422-dmc.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 57f496cff999..6ffccfd95351 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3470,6 +3470,14 @@ S:       Maintained
>  F:     drivers/devfreq/exynos-bus.c
>  F:     Documentation/devicetree/bindings/devfreq/exynos-bus.txt
>
> +DMC FREQUENCY DRIVER FOR SAMSUNG EXYNOS5422

Eh, more comments from my side.
"For the hard of thinking, this list is meant to remain in alphabetical order."

> +M:     Lukasz Luba <l.luba@partner.samsung.com>
> +L:     linux-pm@vger.kernel.org
> +L:     linux-samsung-soc@vger.kernel.org
> +S:     Maintained
> +F:     drivers/memory/samsung/exynos5422-dmc.c
> +F:     Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
> +
>  BUSLOGIC SCSI DRIVER
>  M:     Khalid Aziz <khalid@gonehiking.org>
>  L:     linux-scsi@vger.kernel.org
> diff --git a/drivers/memory/samsung/Kconfig b/drivers/memory/samsung/Kconfig
> index 79ce7ea58903..c93baa029654 100644
> --- a/drivers/memory/samsung/Kconfig
> +++ b/drivers/memory/samsung/Kconfig
> @@ -5,6 +5,23 @@ config SAMSUNG_MC
>           Support for the Memory Controller (MC) devices found on
>           Samsung Exynos SoCs.
>
> +config ARM_EXYNOS5422_DMC

Why you added prefix of ARM to CONFIG_? I think none of other Exynos
Kconfig options follow such convention (except devfreq).

> +       tristate "ARM EXYNOS5422 Dynamic Memory Controller driver"
> +       depends on ARCH_EXYNOS
> +       select DDR

In general select should be used only for non-visible symbols and DDR
is visible. Use depends.

> +       select PM_DEVFREQ

This definitely cannot be select. You do not select entire subsystem
because some similar driver was chosen.

> +       select DEVFREQ_GOV_SIMPLE_ONDEMAND
> +       select DEVFREQ_GOV_USERSPACE

I think only simple_ondemand is needed. Is userspace governor
necessary for working? Or actually maybe both could be skipped?

> +       select PM_DEVFREQ_EVENT

Again, depends.

> +       select PM_OPP
> +       help
> +         This adds driver for Exynos5422 DMC (Dynamic Memory Controller).
> +         The driver provides support for Dynamic Voltage and Frequency Scaling in
> +         DMC and DRAM. It also supports changing timings of DRAM running with
> +         different frequency. The timings are calculated based on DT memory
> +         information.
> +
> +
>  if SAMSUNG_MC

Why this is outside of SAMSUNG_MC?

Best regards,
Krzysztof
