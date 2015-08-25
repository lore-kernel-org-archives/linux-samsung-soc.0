From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/4] clk: samsung: exynos7: Correct nr_clk_ids for fsys0
Date: Tue, 25 Aug 2015 16:16:17 +0900
Message-ID: <55DC1641.3050602@samsung.com>
References: <1440414356-1805-1-git-send-email-alim.akhtar@samsung.com>
 <1440414356-1805-4-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17633 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750863AbbHYHQX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 03:16:23 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NTM00HFLMV8TM20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Aug 2015 08:16:20 +0100 (BST)
In-reply-to: <1440414356-1805-4-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, mturquette@baylibre.com, amit.daniel@samsung.com

On 24.08.2015 20:05, Alim Akhtar wrote:
> This patch correct the nr_clk_ids for fsys0 block
s/correct/corrects/

> which is wrongly set to TOP1 clk numbers.
> This also adjust the a gate clock order.
s/adjust the a/adjusts the/

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
