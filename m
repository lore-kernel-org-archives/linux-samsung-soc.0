From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/2] memory: samsung: exynos5422-dmc: Fix kfree() of
 devm-allocated memory and missing static
Date: Thu, 19 Sep 2019 20:19:43 +0200
Message-ID: <20190919181943.GA10759@kozik-lap>
References: <20190919092641.4407-1-l.luba@partner.samsung.com>
 <CGME20190919092652eucas1p12dbf9ba9d60a0c89cb7de05ab61893be@eucas1p1.samsung.com>
 <20190919092641.4407-2-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190919092641.4407-2-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, willy.mh.wolff.ml@gmail.com, dan.carpenter@oracle.com
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 19, 2019 at 11:26:40AM +0200, Lukasz Luba wrote:
> Fix issues captured by static checkers: used kfree() and missing 'static'
> in the private function.
> 
> Fixes Smatch warning:
>     drivers/memory/samsung/exynos5422-dmc.c:272
>         exynos5_init_freq_table() warn: passing devm_ allocated variable to kfree. 'dmc->opp'
> 
> Fixes Sparse warning:
>     drivers/memory/samsung/exynos5422-dmc.c:736:1:
>         warning: symbol 'exynos5_dmc_align_init_freq' was not declared.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  drivers/memory/samsung/exynos5422-dmc.c | 6 ++----

Thanks, applied.

Best regards,
Krzysztof
