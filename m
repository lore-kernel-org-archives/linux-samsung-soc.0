From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] ARM: exynos: pl330: Add #dma-cells for generic dma binding support
Date: Tue, 5 Mar 2013 22:37:05 +0000
Message-ID: <201303052237.05910.arnd@arndb.de>
References: <1362375268-29405-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:50491 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754728Ab3CEWhM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 17:37:12 -0500
In-Reply-To: <1362375268-29405-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, boojin.kim@samsung.com, robherring2@gmail.com, dinguyen@altera.com, Olof Johansson <olof@lixom.net>

On Monday 04 March 2013, Padmavathi Venna wrote:
> 
> This patch adds #dma-cells property to PL330 DMA controller
> nodes for supporting generic dma dt bindings on samsung exynos
> platforms. #dma-channels and #dma-requests are not required now
> but added in advance.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

Should we apply these directly to the arm-soc fixes branch, or wait
until they come back from the Samsung subarchitecture tree?
