From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: s3c64xx: Fix init order of clock providers
Date: Tue, 8 Oct 2019 19:18:09 +0200
Message-ID: <20191008171809.GA25661@kozik-lap>
References: <20191008165917.23908-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191008165917.23908-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Lihua Yao <ylhuajnu@outlook.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Oct 08, 2019 at 06:59:17PM +0200, Krzysztof Kozlowski wrote:
> From: Lihua Yao <ylhuajnu@outlook.com>
> 
> fin_pll is the parent of clock-controller@7e00f000, specify
> the dependency to ensure proper initialization order of clock
> providers.
> 
> without this patch:
> [    0.000000] S3C6410 clocks: apll = 0, mpll = 0
> [    0.000000]  epll = 0, arm_clk = 0
> 
> with this patch:
> [    0.000000] S3C6410 clocks: apll = 532000000, mpll = 532000000
> [    0.000000]  epll = 24000000, arm_clk = 532000000
> 
> Fixes: 3f6d439f2022 ("clk: reverse default clk provider initialization order in of_clk_init()")
> Signed-off-by: Lihua Yao <ylhuajnu@outlook.com>

Thanks, applied.

Best regards,
Krzysztof
