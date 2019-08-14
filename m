From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 0/9] Exynos Adaptive Supply Voltage support
Date: Wed, 14 Aug 2019 15:03:08 +0200
Message-ID: <CAJKOXPdm2qj_GDR4NQriuOjPFyAxf_CdH_hXEsQNDp4qGHaUZA@mail.gmail.com>
References: <CGME20190813150842eucas1p2c248537d9cd593073e12abeac2cacab5@eucas1p2.samsung.com>
 <20190813150827.31972-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813150827.31972-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 13 Aug 2019 at 17:08, Sylwester Nawrocki <s.nawrocki@samsung.com> w=
rote:
>
> This is third iteration of my patch series adding ASV (Adaptive Supply
> Voltage) support for Exynos SoCs. The previous one can be found at:
> https://lore.kernel.org/lkml/20190718143044.25066-1-s.nawrocki@samsung.co=
m
>
> There is no major changes in this series comparing to v2, only minor
> corrections addressing review comments.
>
> I was not sure it was a good idea to try to extend the OPP binding
> so as to include the ASV data tables in DT, so the tables are left
> in the driver.
>
> This patch set includes Exynos CHIPID driver posted by Pankaj Dubey and
> futher improved by Bart=C5=82omiej =C5=BBo=C5=82nierkiewicz [1].
>
> Tested on Odroid XU3, XU3 Lite, XU4.
>
> One of the things on TODO list is support for the Adaptive Body Bias.
> This will require modifications on the cpufreq driver side in order to
> support multiple voltage regulators and changes in the OPP framework
> to support adding OPPs with multiple voltages.
>
> [1] https://lkml.org/lkml/2018/11/15/908
>
> Pankaj Dubey (3):
>   soc: samsung: Add exynos chipid driver support
>   ARM: EXYNOS: enable exynos_chipid for ARCH_EXYNOS
>   ARM64: EXYNOS: enable exynos_chipid for ARCH_EXYNOS
>
> Sylwester Nawrocki (6):
>   soc: samsung: Convert exynos-chipid driver to use the regmap API
>   soc: samsung: Add Exynos Adaptive Supply Voltage driver
>   ARM: EXYNOS: Enable exynos-asv driver for ARCH_EXYNOS
>   soc: samsung: Update the CHIP ID DT binding documentation
>   ARM: dts: Add "syscon" compatible string to chipid node
>   ARM: dts: Add samsung,asv-bin property for odroidxu3-lite

All look good to me but I need acks for bindings before applying.

Best regards,
Krzysztof
