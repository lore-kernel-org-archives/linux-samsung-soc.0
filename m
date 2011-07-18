From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V3 12/13] ASoC: Samsung: Update DMA interface
Date: Mon, 18 Jul 2011 18:51:34 +0900
Message-ID: <20110718095133.GC423@opensource.wolfsonmicro.com>
References: <1310798666-7659-1-git-send-email-kgene.kim@samsung.com>
 <1310798666-7659-13-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:48716 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753826Ab1GRJvj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 05:51:39 -0400
Content-Disposition: inline
In-Reply-To: <1310798666-7659-13-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Grant Likely <grant.likely@secretlab.ca>, Liam Girdwood <lrg@ti.com>, Linus Walleij <linus.walleij@stericsson.com>, Jassi Brar <jassisinghbrar@gmail.com>, Boojin Kim <boojin.kim@samsung.com>

On Sat, Jul 16, 2011 at 03:44:25PM +0900, Kukjin Kim wrote:
> From: Boojin Kim <boojin.kim@samsung.com>
> 
> This patch adds to support the DMA PL330 driver that uses
> DMA generic API. Samsung sound driver uses DMA generic API
> if architecture supports it. Otherwise, use samsung specific
> S3C-PL330 API driver to transfer PCM data.

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
