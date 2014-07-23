From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 1/2] clk: samsung: exynos4: Enable ARMCLK down feature
Date: Wed, 23 Jul 2014 14:47:42 +0200
Message-ID: <53CFAEEE.7040702@samsung.com>
References: <1405694193-29643-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34040 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753765AbaGWMrq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jul 2014 08:47:46 -0400
In-reply-to: <1405694193-29643-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Krzysztof,

On 18.07.2014 16:36, Krzysztof Kozlowski wrote:
> Enable ARMCLK down feature on all Exynos4 SoCs. The frequency of
> ARMCLK will be reduced upon entering idle mode (WFI or WFE).

Will apply the whole series to Samsung clock tree.

Best regards,
Tomasz
