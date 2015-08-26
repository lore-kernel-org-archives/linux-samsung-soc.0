From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 2/4] clk: samsung: exynos7: Fix CMU TOP1 block
Date: Wed, 26 Aug 2015 14:23:28 +0900
Message-ID: <55DD4D50.70602@samsung.com>
References: <1440559844-12572-1-git-send-email-alim.akhtar@samsung.com>
 <1440559844-12572-3-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56195 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751965AbbHZFXb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Aug 2015 01:23:31 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NTO007A4CB5P090@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Aug 2015 06:23:29 +0100 (BST)
In-reply-to: <1440559844-12572-3-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, mturquette@baylibre.com, amit.daniel@samsung.com

On 26.08.2015 12:30, Alim Akhtar wrote:
> As per UM, sclk_mmc2 is bit 16 of SEL_TOP1_FSYS0. Also the DIV
> and the GATE clocks are at bit 16 in their respective registers.
> For mmc1 and mmc0 clock MUXs are in TOP1_FSYS11 instead of TOP1_FSYS1.
> And their DIV and GATE clks are in xxx_TOP1_FSYS11 instead of TOP1_FSYS1.
> This patch corrects it.
> This also adds xxx_FSYS11 to be saved/restore during s2r cycles.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c |   24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
