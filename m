From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/3] devfreq: exynos-bus: convert to use dev_pm_opp_set_rate()
Date: Wed, 10 Jul 2019 19:04:34 +0200
Message-ID: <CAJKOXPfWr-2t_e3f6oi7E6KLLRAbskzgEKz26XyK5n_9C8wV1w@mail.gmail.com>
References: <CGME20190708141200eucas1p144ca3b2a5b4019aaa5773d23c0236f31@eucas1p1.samsung.com>
 <20190708141140.24379-1-k.konieczny@partner.samsung.com> <20190708141140.24379-3-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190708141140.24379-3-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 8 Jul 2019 at 16:12, <k.konieczny@partner.samsung.com> wrote:
>
> From: Kamil Konieczny <k.konieczny@partner.samsung.com>
>
> Reuse opp core code for setting bus clock and voltage. As a side
> effect this allow useage of coupled regulators feature (required
> for boards using Exynos5422/5800 SoCs) because dev_pm_opp_set_rate()
> uses regulator_set_voltage_triplet() for setting regulator voltage
> while the old code used regulator_set_voltage_tol() with fixed
> tolerance. This patch also removes no longer needed parsing of DT
> property "exynos,voltage-tolerance" (no Exynos devfreq DT node uses

Please also update the bindings in such case. Both with removal of
unused property and with example/recommended regulator couplings.

Best regards,
Krzysztof
