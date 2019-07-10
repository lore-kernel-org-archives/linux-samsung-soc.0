From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 0/3] add coupled regulators for Exynos5422/5800
Date: Wed, 10 Jul 2019 11:00:53 +0200
Message-ID: <CAJKOXPd+UZ2MdrTVfBv5UYzK5LgKNQHUFzRbRNeq271EaDSchg@mail.gmail.com>
References: <CGME20190708141158eucas1p17d4b50978dbe1e5c876ce6d8f433cc95@eucas1p1.samsung.com>
 <20190708141140.24379-1-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190708141140.24379-1-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 8 Jul 2019 at 16:12, <k.konieczny@partner.samsung.com> wrote:
>
> From: Kamil Konieczny <k.konieczny@partner.samsung.com>
>
> Hi,
>
> The main purpose of this patch series is to add coupled regulators for
> Exynos5422/5800 to keep constrain on voltage difference between vdd_arm
> and vdd_int to be at most 300mV. In exynos-bus instead of using
> regulator_set_voltage_tol() with default voltage tolerance it should be
> used regulator_set_voltage_triplet() with volatege range, and this is
> already present in opp/core.c code, so it can be reused. While at this,
> move setting regulators into opp/core.
>
> This patchset was tested on Odroid XU3.
>
> The last patch depends on two previous.

So you break the ABI... I assume that patchset maintains
bisectability. However there is no explanation why ABI break is needed
so this does not look good...

Best regards,
Krzysztof

>
> Regards,
> Kamil
>
> Kamil Konieczny (2):
>   opp: core: add regulators enable and disable
>   devfreq: exynos-bus: convert to use dev_pm_opp_set_rate()
>
> Marek Szyprowski (1):
>   ARM: dts: exynos: add initial data for coupled regulators for
>     Exynos5422/5800
>
>  arch/arm/boot/dts/exynos5420.dtsi             |  34 ++--
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi |   4 +
>  arch/arm/boot/dts/exynos5800-peach-pi.dts     |   4 +
>  arch/arm/boot/dts/exynos5800.dtsi             |  32 ++--
>  drivers/devfreq/exynos-bus.c                  | 172 +++++++-----------
>  drivers/opp/core.c                            |  13 ++
>  6 files changed, 120 insertions(+), 139 deletions(-)
>
> --
> 2.22.0
>
