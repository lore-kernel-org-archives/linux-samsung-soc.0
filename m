From: Vinod Koul <vkoul@infradead.org>
Subject: Re: [PATCH 0/2] ARM: EXYNOS: Set the capability of pdm0 and pdm1 as
 DMA_PRIVATE
Date: Fri, 31 Aug 2012 06:22:10 +0530
Message-ID: <1346374330.15463.5.camel@vkoul-mobl4>
References: <1346215585-31023-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:38231 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753021Ab2HaAo7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Aug 2012 20:44:59 -0400
In-Reply-To: <1346215585-31023-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: vinod.koul@intel.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, jaswinder.singh@linaro.org, kgene.kim@samsung.com, patches@linaro.org

On Wed, 2012-08-29 at 10:16 +0530, Tushar Behera wrote:
> DMA clients pdma0 and pdma1 are internal to the SoC and are used only
> by dedicated peripherals. Since they cannot be used for generic
> purpose, their capability should be set as DMA_PRIVATE.
> 
> The patches are rebased on top of v3.6-rc3.
Kukjin, if you ack them I can take thru my tree, other way round is fine
with me too.
> 
> Tushar Behera (2):
>   ARM: EXYNOS: Set the capability of pdm0 and pdm1 as DMA_PRIVATE
>   DMA: PL330: Set the capability of pdm0 and pdm1 as DMA_PRIVATE
> 
>  arch/arm/mach-exynos/dma.c |    2 ++
>  drivers/dma/pl330.c        |    1 +
>  2 files changed, 3 insertions(+), 0 deletions(-)
> 

-- 
~Vinod Koul
Intel Corp.
