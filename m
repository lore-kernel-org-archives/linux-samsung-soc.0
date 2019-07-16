From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/4] ARM: dts: exynos: add initial data for coupled
 regulators for Exynos5422/5800
Date: Tue, 16 Jul 2019 11:22:54 +0200
Message-ID: <CAJKOXPd6a5aLf1CEhx9m7khPQOwruSuA22efkJb41BsaWXjM3A@mail.gmail.com>
References: <CGME20190715120432eucas1p1b32d72d239420b861bf8596d4e8a053d@eucas1p1.samsung.com>
 <20190715120416.3561-1-k.konieczny@partner.samsung.com> <20190715120416.3561-4-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715120416.3561-4-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 15 Jul 2019 at 14:04, Kamil Konieczny
<k.konieczny@partner.samsung.com> wrote:
>
> Declare Exynos5422/5800 voltage ranges for opp points for big cpu core and
> bus wcore and couple their voltage supllies as vdd_arm and vdd_int should
> be in 300mV range.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>

This one was previously from Marek, now it is from you. Any changes here?

Best regards,
Krzysztof
