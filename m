From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 4/4] DMA: PL330: Modify pl330 filter based on new generic dma dt bindings.
Date: Fri, 1 Feb 2013 15:23:25 +0000
Message-ID: <201302011523.25771.arnd@arndb.de>
References: <1359723116-18173-1-git-send-email-padma.v@samsung.com> <1359723116-18173-5-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:50201 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755758Ab3BAPXu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Feb 2013 10:23:50 -0500
In-Reply-To: <1359723116-18173-5-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org

On Friday 01 February 2013, Padmavathi Venna wrote:
> This patch modify the filter function to filter the required channel
> based on new filter params.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>

The result of this looks good, but I fear that changing the filter function
like this wil break all drivers that currently use the plat-samsung/dma-ops.c
code. For migration purposes, I think the best way is to change
samsung_dmadev_request() to match the new filter_param format.

After that is done, you can migrate all the drivers using samsung_dma_get_ops
over to the new dma_request_slave_channel interface without breaking
anything when only part of the series is applied.

	Arnd
