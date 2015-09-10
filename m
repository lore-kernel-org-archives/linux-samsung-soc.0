From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 06/11] clk: samsung: exynos7: Corrects CMU_PERIC1 clocks
 names
Date: Thu, 10 Sep 2015 13:01:56 +0900
Message-ID: <55F100B4.5020107@samsung.com>
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
 <1441366637-28001-7-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:17170 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727AbbIJEB6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Sep 2015 00:01:58 -0400
In-reply-to: <1441366637-28001-7-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org

On 04.09.2015 20:37, Alim Akhtar wrote:
> This patch rename CMU_PERIC1 clocks names to match with user manual.
> And also adds missing gate clock for aclk_peric1_66.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c       |   38 ++++++++++++++++---------------
>  include/dt-bindings/clock/exynos7-clk.h |    3 ++-
>  2 files changed, 22 insertions(+), 19 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
