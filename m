From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 09/11] clk: samsung: exynos7: Corrects CMU_FSYS1 clocks
 names
Date: Thu, 10 Sep 2015 13:05:00 +0900
Message-ID: <55F1016C.6050903@samsung.com>
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
 <1441366637-28001-10-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1441366637-28001-10-git-send-email-alim.akhtar@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04.09.2015 20:37, Alim Akhtar wrote:
> This patch rename CMU_FSYS1 clocks names to match with user manual.
> And also adds missing gate clock for aclk_fsys1_200.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c       |   16 ++++++++++------
>  include/dt-bindings/clock/exynos7-clk.h |    3 ++-
>  2 files changed, 12 insertions(+), 7 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof


