From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 02/11] clk: samsung: exynos7: Corrects CMU_TOP0 clocks names
Date: Tue, 08 Sep 2015 16:12:35 +0900
Message-ID: <55EE8A63.9080209@samsung.com>
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
 <1441366637-28001-3-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1441366637-28001-3-git-send-email-alim.akhtar@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04.09.2015 20:37, Alim Akhtar wrote:
> This patch rename CMU_TOP0 clocks names to match with user manual.
s/rename/renames/

I did not check the exact renames but overall the patch makes sense and
looks good.

Best regards,
Krzysztof

> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c |   67 ++++++++++++++++++++-----------------
>  1 file changed, 37 insertions(+), 30 deletions(-)
> 
