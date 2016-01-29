From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 1/3] clk: samsung: Enable COMPILE_TEST for Samsung
 clocks
Date: Fri, 29 Jan 2016 12:43:21 -0800
Message-ID: <20160129204321.GS12841@codeaurora.org>
References: <1453941324-15742-1-git-send-email-k.kozlowski@samsung.com>
 <1453941324-15742-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453941324-15742-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 01/28, Krzysztof Kozlowski wrote:
> Enable the COMPILE_TEST to get build coverage of some of Samsung clock
> controller drivers. Still some of them will be built only if
> appropriate SoC is chosen (like SOC_EXYNOS4415 or ARCH_S3C64XX).
> 
> Anyway in case of COMPILE_TEST the Samsung clocks would show up in main
> drivers section because they are not inside the "Common Clock Framework"
> menu item. Move them under the "Common Clock Framework".
> 
> This changes the logic of selecting Samsung clocks from specific
> architectures. Now the COMMON_CLK should be selected before selecting
> specific clock (like S3C2410_COMMON_CLK or COMMON_CLK_SAMSUNG).
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
