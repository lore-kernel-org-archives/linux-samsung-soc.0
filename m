From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 3/4] ARM: dts: Add #dma-cells for generic dma binding support
Date: Fri, 1 Feb 2013 15:16:57 +0000
Message-ID: <201302011516.57649.arnd@arndb.de>
References: <1359723116-18173-1-git-send-email-padma.v@samsung.com> <1359723116-18173-4-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:55217 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751340Ab3BAPRF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Feb 2013 10:17:05 -0500
In-Reply-To: <1359723116-18173-4-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org

On Friday 01 February 2013, Padmavathi Venna wrote:
> 
> This patch adds #dma-cells property to PL330 DMA controller
> nodes for supporting generic dma dt bindings on samsung
> exynos5250 platform.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>

The generic binding also lists the dma-channels and dma-requests
properties. Those are currently not required by the code, but I think
it would be good to list them anyway, to be future-proof in case
we ever need them.

Otherwise

Acked-by: Arnd Bergmann <arnd@arndb.de>
