From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: dts: s3c64xx: Fix init order of clock providers
Date: Tue, 8 Oct 2019 19:30:50 +0200
Message-ID: <ceede424-e4a2-03f1-3ce0-04f405688721@samsung.com>
References: <CGME20191008165931epcas3p2dd2937d851ed06948dd7746e5a2674b4@epcas3p2.samsung.com>
        <20191008165917.23908-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191008165917.23908-1-krzk@kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Lihua Yao <ylhuajnu@outlook.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 10/8/19 18:59, Krzysztof Kozlowski wrote:
> From: Lihua Yao <ylhuajnu@outlook.com>
> 
> fin_pll is the parent of clock-controller@7e00f000, specify
> the dependency to ensure proper initialization order of clock
> providers.

> Fixes: 3f6d439f2022 ("clk: reverse default clk provider initialization order in of_clk_init()")

The patch looks good but I'm not sure above tag points to the right commit.
That commit is just a regression fix for
1771b10d605d26cc "clk: respect the clock dependencies in of_clk_init"
 
How about picking some commit touching the dts files itself, e.g.
a43736deb47d21bd "ARM: dts: Add dts file for S3C6410-based Mini6410 board" ?

> Signed-off-by: Lihua Yao <ylhuajnu@outlook.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Regards,
Sylwester
