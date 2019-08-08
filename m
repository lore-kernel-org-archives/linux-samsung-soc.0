From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 1/2] clk: samsung: Change signature of
 exynos5_subcmus_init() function
Date: Thu, 8 Aug 2019 16:57:07 +0200
Message-ID: <f8358f6b-a9a2-55e8-ab5e-aa64da6a0917@samsung.com>
References: <CGME20190808144936eucas1p2e65eddc3d970de35590cb84fe200b438@eucas1p2.samsung.com>
        <20190808144929.18685-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808144929.18685-1-s.nawrocki@samsung.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@kernel.org, mturquette@baylibre.com
Cc: linux@armlinux.org.uk, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, cw00.choi@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 8/8/19 16:49, Sylwester Nawrocki wrote:
> In order to make it easier in subsequent patch to create different subcmu
> lists for exynos5420 and exynos5800 SoCs the code is rewritten so we pass
> an array of pointers to the subcmus initialization function.
> 
> Fixes: b06a532bf1fa ("clk: samsung: Add Exynos5 sub-CMU clock driver")
> Tested-by: Jaafar Ali <jaafarkhalaf@gmail.com>

I should have also added here
 Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>

> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
