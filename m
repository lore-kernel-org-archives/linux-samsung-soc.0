From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v5 0/4] add coupled regulators for Exynos5422/5800
Date: Thu, 8 Aug 2019 10:47:14 +0900
Message-ID: <6888b704-1971-4832-d7b9-092368c797d0@samsung.com>
References: <CGME20190807133855eucas1p1cab425b791262e8dee1b17cbe8b1b3da@eucas1p1.samsung.com>
        <20190807133838.14678-1-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807133838.14678-1-k.konieczny@partner.samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kamil,

When I applied them to testing branch, those don't have the author name
only just have the email address as following:
You have to edit the your git author information with your name.

author	k.konieczny@partner.samsung.com <k.konieczny@partner.samsung.com>	2019-08-07 15:38:36 +0200
committer	Chanwoo Choi <cw00.choi@samsung.com>	2019-08-08 10:35:16 +0900
commit	4304f4ecec93cebd255463d56b0a4f112ee9dc50 (patch)
tree	2859e566d6f68219f71a61e7c412717c1adba4f5
parent	57d85421038b458dd87ec268404ff608f90c36ae (diff)
download	linux-4304f4ecec93cebd255463d56b0a4f112ee9dc50.tar.gz

Regards,
Chanwoo Choi

On 19. 8. 7. 오후 10:38, k.konieczny@partner.samsung.com wrote:
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


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
