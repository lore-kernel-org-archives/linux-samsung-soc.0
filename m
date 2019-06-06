From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v8 00/13] Exynos5 Dynamic Memory Controller driver
Date: Thu, 6 Jun 2019 15:57:05 +0200
Message-ID: <b1024bed-a8d9-12d9-9e20-5e5624a1b189@samsung.com>
References: <CGME20190605165426eucas1p20524669a299f740b5502db24977b098f@eucas1p2.samsung.com>
        <20190605165410.14606-1-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605165410.14606-1-l.luba@partner.samsung.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, willy.mh.wolff.ml@gmail.com, linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 6/5/19 18:53, Lukasz Luba wrote:
> Lukasz Luba (13):
>   clk: samsung: add needed IDs for DMC clocks in Exynos5420
>   clk: samsung: add new clocks for DMC for Exynos5422 SoC
>   clk: samsung: add BPLL rate table for Exynos 5422 SoC
>   dt-bindings: ddr: rename lpddr2 directory
>   dt-bindings: ddr: add LPDDR3 memories
>   drivers: memory: extend of_memory by LPDDR3 support
>   dt-bindings: memory-controllers: add Exynos5422 DMC device description
>   drivers: memory: add DMC driver for Exynos5422
>   drivers: devfreq: events: add Exynos PPMU new events
>   ARM: dts: exynos: add chipid label and syscon compatible
>   ARM: dts: exynos: add syscon to clock compatible
>   ARM: dts: exynos: add DMC device for exynos5422
>   ARM: exynos_defconfig: enable DMC driver


I have applied first 3 patches from this series to clk/samsung tree.

But can you please also send this series to linux-clk@vger.kernel.org 
ML, adding the clk maintainers (Stephen, Michael) at Cc?

Please make sure if future any clk patches are also sent to 
linux-clk@vger.kernel.org mailing list.

-- 
Thanks,
Sylwester
