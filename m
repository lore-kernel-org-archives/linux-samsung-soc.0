From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 0/9] Various cleanups for Samsung clocks drivers
Date: Mon, 09 Oct 2017 12:37:49 +0200
Message-ID: <180a571f-26ea-88f6-4b0c-8d5cce37da34@samsung.com>
References: <CGME20171003100028eucas1p11057e4643675c66f6144d0737e8b933a@eucas1p1.samsung.com>
        <20171003100016.32029-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20171003100016.32029-1-m.szyprowski@samsung.com>
Content-language: en-GB
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 10/03/2017 12:00 PM, Marek Szyprowski wrote:
> Patch summary:
> 
> Marek Szyprowski (9):
>   clk: samsung: Remove support for obsolete Exynos4212 CPU clock
>   clk: samsung: Remove clkdev alias support in Exynos4 clk driver
>   clk: samsung: Remove double assignment to CLK_ARM_CLK id in Exynos4
>     driver
>   clk: samsung: Remove clkdev alias support in Exynos5250 clk driver
>   clk: samsung: Drop useless alias in Exynos5420 clk driver
>   clk: samsung: Rework clkdev alias handling in Exynos5440 driver
>   clk: samsung: Rework clkdev alias handling in S3C2443 driver
>   clk: samsung: Add explicit MPLL and EPLL clkdev aliases in S3C2443
>     driver
>   clk: samsung: Remove obsolete clkdev alias support

I have applied this patch set, thanks.
