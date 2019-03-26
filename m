From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 0/4] clk/ARM: exynos: Add ADC to Exynos5410 (Odroid XU)
Date: Tue, 26 Mar 2019 15:56:23 +0100
Message-ID: <f5892978-1cbf-7a79-4036-a34133380137@samsung.com>
References: <CGME20190212175145epcas4p1760db3c6a3e2497528925d081c12cecc@epcas4p1.samsung.com>
        <20190212175052.6310-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212175052.6310-1-krzk@kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 2/12/19 18:50, Krzysztof Kozlowski wrote:

> The DTS patch depends on bindings header with clock ID.  I will take it
> through samsung-soc for consecutive release.

> Krzysztof Kozlowski (4):
>   dt-bindings: clock: exynos: Put CLK_UART3 in order
>   dt-bindings: clock: exynos: Add ADC clock ID to Exynos5410
>   clk: samsung: exynos5410: Add gate clock for ADC
>   ARM: dts: exynos: Add ADC node to Exynos5410 and Odroid XU

I have applied first 3 patches to clk/samsung tree, thanks!
With prefix in summary line of the first 2 commits changed to
"clk: samsung: dt-bindings:".

-- 
Regards
Sylwester
