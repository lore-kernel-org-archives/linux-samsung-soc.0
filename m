From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 2/4] clk: s2mps11: allocate only one structure for clock
 init
Date: Thu, 21 Jan 2016 09:23:53 +0900
Message-ID: <56A02519.4050207@samsung.com>
References: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
 <1453284864-8082-3-git-send-email-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:17584 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751721AbcAUAX4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2016 19:23:56 -0500
In-reply-to: <1453284864-8082-3-git-send-email-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sangbeom Kim <sbkim73@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andi Shyti <andi@etezian.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>

On 20.01.2016 19:14, Andi Shyti wrote:
> The driver allocates three structures, s2mpsxx_clk_init, for
> three different clock types (s2mps11, s2mps13 and s2mps14). They
> are quite similar but they differ only by the name. Only one of
> these structures is used, while the others lie unused in the
> memory.
> 
> The clock's name, though, is not such a meaningful information
> and by assigning the same name to the initial data we can avoid
> over allocation. The common name chosen will be s2mps11,
> coherently with the device driver name, instead of the clock
> device.
> 
> Therefore, remove the structures associated to s2mps13 and
> s2mps14 and use only the one referred to s2mps11 for all kind of
> clocks.
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/clk/clk-s2mps11.c | 51 +++++++----------------------------------------
>  1 file changed, 7 insertions(+), 44 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
