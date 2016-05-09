From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 00/22] ARM: dts: exynos: Add initial support for
 Odroid XU
Date: Mon, 9 May 2016 15:00:50 -0700
Message-ID: <20160509220050.GR3492@codeaurora.org>
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462734367-5619-1-git-send-email-krzk@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 05/08, Krzysztof Kozlowski wrote:
> 
> Hi,
> 
> Patchset adds necessary clocks, reorganizes existing stuff and finally
> adds Odroid XU support.
> 
> Merging strategy
> ================
> Complicated! The clock dt-bindings and driver changes can go to clock
> tree. However there are three DTS patches in the middle.
> a. This has to go in before adding "fin_pll_new" to clock driver:
>    - [PATCH v2 03/22] ARM: dts: exynos: Add fin_pll node for clock driver
> 
> b. This should go in before renaming "fin_pll_new" back to original name:
>    - [PATCH v2 05/22] ARM: dts: exynos: Switch MCT node to a new fin_pll clock
>    - [PATCH v2 06/22] ARM: dts: exynos: Remove old fixed-clock provider on SMDK5410
> 
> The order of patches in the patchset is really how it should go in
> to reduce any bisectability glitches.

If you want to just merge them through arm-soc then feel free to
add my Acked-by to the clk driver and clock dt-binding ones.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
