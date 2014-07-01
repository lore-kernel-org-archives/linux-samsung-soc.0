From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH RESEND] clk: samsung: Make of_device_id array const
Date: Tue, 01 Jul 2014 10:55:58 +0900
Message-ID: <00a201cf94cf$9a8ee1b0$cfaca510$%han@samsung.com>
References: <1403784006-17605-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40925 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750742AbaGAB4B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 21:56:01 -0400
In-reply-to: <1403784006-17605-1-git-send-email-k.kozlowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, 'Mike Turquette' <mturquette@linaro.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>

On Thursday, June 26, 2014 9:00 PM, Krzysztof Kozlowski wrote:
> 
> Array of struct of_device_id may be be const as expected by
> of_match_table field and of_find_matching_node_and_match() function.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  drivers/clk/samsung/clk-exynos4.c    | 2 +-
>  drivers/clk/samsung/clk-exynos5250.c | 2 +-
>  drivers/clk/samsung/clk-exynos5420.c | 2 +-
>  drivers/clk/samsung/clk-exynos5440.c | 2 +-
>  drivers/clk/samsung/clk.c            | 2 +-
>  drivers/clk/samsung/clk.h            | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
