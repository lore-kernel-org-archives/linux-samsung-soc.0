From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 3/4] clk: samsung: exynos5410: Add gate clock for ADC
Date: Wed, 13 Feb 2019 16:11:38 +0900
Message-ID: <c75f4582-18e4-f123-382d-e50626b650c8@samsung.com>
References: <20190212175052.6310-1-krzk@kernel.org>
        <CGME20190212175212epcas5p4ff5ed8b2264956844e14d5e6ca03eac6@epcas5p4.samsung.com>
        <20190212175052.6310-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212175052.6310-4-krzk@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 19. 2. 13. 오전 2:50, Krzysztof Kozlowski wrote:
> Add the gate clock for ADC block on Exynos5410.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/clk/samsung/clk-exynos5410.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
> index 0a0b09591e6f..b2da2c8fa0c7 100644
> --- a/drivers/clk/samsung/clk-exynos5410.c
> +++ b/drivers/clk/samsung/clk-exynos5410.c
> @@ -209,6 +209,7 @@ static const struct samsung_gate_clock exynos5410_gate_clks[] __initconst = {
>  	GATE(CLK_USI1, "usi1", "aclk66", GATE_IP_PERIC, 11, 0, 0),
>  	GATE(CLK_USI2, "usi2", "aclk66", GATE_IP_PERIC, 12, 0, 0),
>  	GATE(CLK_USI3, "usi3", "aclk66", GATE_IP_PERIC, 13, 0, 0),
> +	GATE(CLK_TSADC, "tsadc", "aclk66", GATE_IP_PERIC, 15, 0, 0),
>  	GATE(CLK_PWM, "pwm", "aclk66", GATE_IP_PERIC, 24, 0, 0),
>  
>  	GATE(CLK_SCLK_UART0, "sclk_uart0", "div_uart0",
> 

I checked it on Exynos5410 TRM. Looks good to me.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
