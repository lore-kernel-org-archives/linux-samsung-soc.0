From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/3] phy: exynos-mipi-video: Rewrite handling of phy
 registers
Date: Thu, 24 Mar 2016 12:48:38 +0100
Message-ID: <56F3D416.3070701@samsung.com>
References: <1458731358-773-1-git-send-email-m.szyprowski@samsung.com>
 <1458731358-773-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:42762 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750926AbcCXLso (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Mar 2016 07:48:44 -0400
In-reply-to: <1458731358-773-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 03/23/2016 12:09 PM, Marek Szyprowski wrote:
> Controlling Exynos MIPI DPHY is done by handling 2 registers: one for
> phy reset and one for enabling it. This patch moves definitions of those
> 2 registers to speparate exynos_mipi_phy_desc structure, which can be
> defined separately for each PHY for each supported hardware variant.
> This code rewrite is needed to add support for newer Exynos SoCs, which
> have MIPI PHY related registers at different offsets or even different
> register regions.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

I've tested this patch series on Trats2 and an exynos5433 based
board and it seems to be all working well.

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Thanks,
Sylwester
