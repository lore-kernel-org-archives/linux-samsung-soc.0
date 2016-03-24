From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/3] phy: exynos-mipi-video: Add support for Exynos 5420
 and 5433 SoCs
Date: Thu, 24 Mar 2016 13:05:50 +0100
Message-ID: <56F3D81E.4000506@samsung.com>
References: <1458731358-773-1-git-send-email-m.szyprowski@samsung.com>
 <1458731358-773-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:43845 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755924AbcCXMGF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Mar 2016 08:06:05 -0400
In-reply-to: <1458731358-773-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 03/23/2016 12:09 PM, Marek Szyprowski wrote:
> This patch adds support for MIPI DPHYs found in Exynos5420-compatible
> (5420, 5422 and 5800) and Exynos5433 SoCs. Those SoCs differs from
> earlier by different offset of MIPI DPHY registers in PMU controllers
> (Exynos 5420-compatible case) or by moving MIPI DPHY reset registers to
> separate system register controllers (Exynos 5433 case). In both case
> also additional 5th PHY (MIPI CSIS 2) has been added.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
