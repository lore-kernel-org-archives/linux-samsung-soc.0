From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 02/12] clk: samsung: exynos7: Adds missing clocks gates
 of CMU_TOPC
Date: Tue, 15 Sep 2015 15:08:13 +0900
Message-ID: <55F7B5CD.90600@samsung.com>
References: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
 <1441874677-24148-3-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:21454 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751327AbbIOGIS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Sep 2015 02:08:18 -0400
In-reply-to: <1441874677-24148-3-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org

On 10.09.2015 17:44, Alim Akhtar wrote:
> This adds some of the missing GATE clocks of CMU_TOPC block.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c       |   27 +++++++++++++++++++++++++++
>  include/dt-bindings/clock/exynos7-clk.h |   13 ++++++++++++-
>  2 files changed, 39 insertions(+), 1 deletion(-)


Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
