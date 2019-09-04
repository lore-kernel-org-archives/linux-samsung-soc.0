From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v13 7/8] ARM: dts: exynos: add DMC device for exynos5422
Date: Wed, 4 Sep 2019 20:25:02 +0200
Message-ID: <20190904182502.GA12918@kozik-lap>
References: <20190821104303.32079-1-l.luba@partner.samsung.com>
 <CGME20190821104324eucas1p16bdeb27250c8c9fa87591d6bd9743a17@eucas1p1.samsung.com>
 <20190821104303.32079-8-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190821104303.32079-8-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 12:43:02PM +0200, Lukasz Luba wrote:
> Add description of Dynamic Memory Controller and PPMU counters.
> They are used by exynos5422-dmc driver.
> There is a definition of the memory chip, which is then used during
> calculation of timings for each OPP.
> The algorithm in the driver needs these two sets to bound the timings.
> 
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi             |  71 +++++++++++
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 116 ++++++++++++++++++
>  2 files changed, 187 insertions(+)

Thanks, applied conditionally. Please send a follow up fixing the
checkpatch error about undocumented binding:
https://krzk.eu/#/builders/26/builds/392

You should not skip such checkpatch warning.

Best regards,
Krzysztof
