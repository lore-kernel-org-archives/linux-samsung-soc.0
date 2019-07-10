From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: exynos: add initial data for coupled
 regulators for Exynos5422/5800
Date: Wed, 10 Jul 2019 11:02:13 +0200
Message-ID: <CAJKOXPd+KKG4kT6OeE4EZkwdhe3i_XoorJm4B+f7OUi09VOUyg@mail.gmail.com>
References: <CGME20190708141200eucas1p12bf901a2589efe92b133b357d2cbc57e@eucas1p1.samsung.com>
 <20190708141140.24379-1-k.konieczny@partner.samsung.com> <20190708141140.24379-4-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190708141140.24379-4-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 8 Jul 2019 at 16:12, <k.konieczny@partner.samsung.com> wrote:
>
> From: Marek Szyprowski <m.szyprowski@samsung.com>
>
> Declare Exynos5422/5800 voltage ranges for opp points for big cpu core and
> bus wcore and couple their voltage supllies as vdd_arm and vdd_int should
> be in 300mV range.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi             | 34 +++++++++----------
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  4 +++
>  arch/arm/boot/dts/exynos5800-peach-pi.dts     |  4 +++
>  arch/arm/boot/dts/exynos5800.dtsi             | 32 ++++++++---------
>  4 files changed, 41 insertions(+), 33 deletions(-)

Looks good, I assume bisectability is not affected, because of
dependency on the driver changes I will take it for next next release
(v5.5). Assuming that driver change goes into v5.4.

Best regards,
Krzysztof
