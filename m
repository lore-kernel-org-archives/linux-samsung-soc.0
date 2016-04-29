From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 0/3] phy: exynos-mipi-video: add support for Exynos 54xx
 SoCs
Date: Fri, 29 Apr 2016 14:57:03 +0530
Message-ID: <572328E7.8050101@ti.com>
References: <1458731358-773-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:58734 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752764AbcD2MIO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Apr 2016 08:08:14 -0400
In-Reply-To: <1458731358-773-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>



On Wednesday 23 March 2016 04:39 PM, Marek Szyprowski wrote:
> Hello,
> 
> This patch series adds upport for MIPI Video DPHY found in Exynos
> 5420/5422/5800 and 5433 SoCs.

Fixed the below checkpatch error and merged.
ERROR: open brace '{' following struct go on the same line
#292: FILE: drivers/phy/phy-exynos-mipi-video.c:40:
+struct mipi_phy_device_desc
+{

Thanks
Kishon

> 
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
> 
> 
> Patch summary:
> 
> Marek Szyprowski (2):
>   phy: exynos-mipi-video: rewrite handling of phy registers
>   phy: exynos-mipi-video: add support for Exynos 5420 and 5433 SoCs
> 
> Sylwester Nawrocki (1):
>   phy: exynos-mipi-video: Drop support for direct access to PMU
> 
>  .../devicetree/bindings/phy/samsung-phy.txt        |  18 +-
>  drivers/phy/phy-exynos-mipi-video.c                | 322 ++++++++++++++++-----
>  include/linux/mfd/syscon/exynos5-pmu.h             |   3 +
>  3 files changed, 276 insertions(+), 67 deletions(-)
> 
