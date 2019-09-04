From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v13 5/8] drivers: memory: add DMC driver for Exynos5422
Date: Wed, 4 Sep 2019 20:35:10 +0200
Message-ID: <20190904183510.GC12918@kozik-lap>
References: <20190821104303.32079-1-l.luba@partner.samsung.com>
 <CGME20190821104323eucas1p1ab979133de45373866e9db1a5f63fb76@eucas1p1.samsung.com>
 <20190821104303.32079-6-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190821104303.32079-6-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 12:43:00PM +0200, Lukasz Luba wrote:
> This patch adds driver for Exynos5422 Dynamic Memory Controller.
> The driver provides support for dynamic frequency and voltage scaling
> for DMC and DRAM. It supports changing timings of DRAM running with
> different frequency. There is also an algorithm to calculate timigns
> based on memory description provided in DT.
> The patch also contains needed MAINTAINERS file update.
> 
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  MAINTAINERS                             |    8 +
>  drivers/memory/samsung/Kconfig          |   13 +
>  drivers/memory/samsung/Makefile         |    1 +
>  drivers/memory/samsung/exynos5422-dmc.c | 1257 +++++++++++++++++++++++
>  4 files changed, 1279 insertions(+)
>  create mode 100644 drivers/memory/samsung/exynos5422-dmc.c

Thanks, applied... or almost. Let's fix it incrementally.

You have two smatch warnings:
  CHECK   ../drivers/memory/samsung/exynos5422-dmc.c
drivers/memory/samsung/exynos5422-dmc.c:272 exynos5_init_freq_table() warn: passing devm_ allocated variable to kfree. 'dmc->opp'
  CHECK   ../drivers/memory/jedec_ddr_data.c
drivers/memory/samsung/exynos5422-dmc.c:565 exynos5_dmc_get_volt_freq() warn: passing zero to 'PTR_ERR'

The second looks like false positive, but first seems to be real.

You have also sparse warning to fix:
../drivers/memory/samsung/exynos5422-dmc.c:736:1: warning: symbol 'exynos5_dmc_align_init_freq' was not declared. Should it be static?

Best regards,
Krzysztof
