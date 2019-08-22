From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: Re: [RESEND PATCH v5 0/4] add coupled regulators for
 Exynos5422/5800
Date: Thu, 22 Aug 2019 15:18:50 +0200
Message-ID: <fd9897b6-edc9-f88f-4393-62050bd66710@partner.samsung.com>
References: <CGME20190808090249eucas1p19944820d79ec211c85d9e1285f892f9c@eucas1p1.samsung.com>
        <20190808090234.12577-1-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808090234.12577-1-k.konieczny@partner.samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


Dear MyungJoo,

On 08.08.2019 11:02, Kamil Konieczny wrote:
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
> The DTS coupled regulators patch depends on previous patches.
> 
> Changes:
> v5:
> - squashed last patch "remove exynos_bus_passive_target()" into second
> - added Acked-by to patch "correct clock enable sequence"

Could you please merge patches 1/4 and 2/4 for v5.4
(they were already Ack-ed by Chanwoo Choi)?

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland

> v4:
> - removed "opp: core: add regulators enable and disable" from patchset
>   as it was applied by Viresh Kumar and changed cover letter
> - fix patch "devfreq: exynos-bus: correct clock enable sequence" to
>   correct order of enable/disable
> - removed unrelated changes in "devfreq: exynos-bus: convert to use
>   dev_pm_opp_set_rate()"
> - added new patch "devfreq: exynos-bus: remove exynos_bus_passive_target()"
>   as suggested by Chanwoo Choi
> v3:
> - added new exynos-bus patch to correct clock and regulator enabling
>   and disabling sequence as suggested by Chanwoo Choi
> - corrected error path in enable and improved commit message in opp/core
> - improve comment in devfreq/exynos-bus.c before devfreq_recommended_opp()
> - change cover letter as there is new patch
> - added note before Signed-off-by in 4th patch
> v2:
> - improve regulators enable/disable code in opp/core as suggested by
>   Viresh Kumar
> - add new patch for remove unused dt-bindings as suggested by Krzysztof
>   Kozlowski
> 
> Kamil Konieczny (3):
>   devfreq: exynos-bus: correct clock enable sequence
>   devfreq: exynos-bus: convert to use dev_pm_opp_set_rate()
>   dt-bindings: devfreq: exynos-bus: remove unused property
> 
> Marek Szyprowski (1):
>   ARM: dts: exynos: add initial data for coupled regulators for
>     Exynos5422/5800
> 
>  .../bindings/devfreq/exynos-bus.txt           |   2 -
>  arch/arm/boot/dts/exynos5420.dtsi             |  34 ++--
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi |   4 +
>  arch/arm/boot/dts/exynos5800-peach-pi.dts     |   4 +
>  arch/arm/boot/dts/exynos5800.dtsi             |  32 ++--
>  drivers/devfreq/exynos-bus.c                  | 153 +++++-------------
>  6 files changed, 78 insertions(+), 151 deletions(-)
> 
