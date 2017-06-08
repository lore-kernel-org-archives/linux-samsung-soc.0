From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/3] clk: samsung: Add missing exynos5420 audio related
 clocks
Date: Thu, 8 Jun 2017 19:05:40 +0200
Message-ID: <20170608170540.dniqcjqyzal52zt5@kozik-lap>
References: <1496931433-5712-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20170608141726epcas1p1ab3faf22e9f398ae4cf23f84f487d123@epcas1p1.samsung.com>
 <1496931433-5712-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1496931433-5712-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, cw00.choi@samsung.com, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jun 08, 2017 at 04:17:12PM +0200, Sylwester Nawrocki wrote:
> This patch adds missing definitions of mux clocks required for using
> EPLL as the audio subsystem root clock on exynos5420/exynos5422 SoCs.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since RFC version:
>   - dropped one clean up chunk
> ---
>  drivers/clk/samsung/clk-exynos5420.c   | 10 +++++++---
>  include/dt-bindings/clock/exynos5420.h |  3 +++
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

