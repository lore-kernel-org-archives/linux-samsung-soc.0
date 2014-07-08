From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH RESEND] clk: samsung: Make of_device_id array const
Date: Tue, 08 Jul 2014 15:06:11 +0200
Message-ID: <53BBECC3.9020202@samsung.com>
References: <1403784006-17605-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:12626 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754812AbaGHNGp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 09:06:45 -0400
In-reply-to: <1403784006-17605-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Krzysztof,

On 26.06.2014 14:00, Krzysztof Kozlowski wrote:
> Array of struct of_device_id may be be const as expected by
> of_match_table field and of_find_matching_node_and_match() function.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c    | 2 +-
>  drivers/clk/samsung/clk-exynos5250.c | 2 +-
>  drivers/clk/samsung/clk-exynos5420.c | 2 +-
>  drivers/clk/samsung/clk-exynos5440.c | 2 +-
>  drivers/clk/samsung/clk.c            | 2 +-
>  drivers/clk/samsung/clk.h            | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 

Thanks for the patch. Will apply.

Best regards,
Tomasz
