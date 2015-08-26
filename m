From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 1/4] clk: samsung: exynos7: Fix CMU TOPC block clock
Date: Wed, 26 Aug 2015 14:22:03 +0900
Message-ID: <55DD4CFB.7020708@samsung.com>
References: <1440559844-12572-1-git-send-email-alim.akhtar@samsung.com>
 <1440559844-12572-2-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:62020 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751965AbbHZFWI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Aug 2015 01:22:08 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NTO005G3C8TC190@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Aug 2015 06:22:05 +0100 (BST)
In-reply-to: <1440559844-12572-2-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, mturquette@baylibre.com, amit.daniel@samsung.com

On 26.08.2015 12:30, Alim Akhtar wrote:
> Corrects the bit width of DIV_TOPC3 register.
> These are worngly set to 3 which should be 4 bit wide as per UM.
> This also adjusts the MUX clock order.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
