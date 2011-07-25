From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V4 12/14] spi/s3c64xx: Add support DMA engine API
Date: Mon, 25 Jul 2011 10:40:02 +0100
Message-ID: <20110725094002.GD9653@n2100.arm.linux.org.uk>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com> <1311557312-26107-13-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:39267 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751633Ab1GYJkR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 05:40:17 -0400
Content-Disposition: inline
In-Reply-To: <1311557312-26107-13-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>

On Mon, Jul 25, 2011 at 10:28:30AM +0900, Boojin Kim wrote:
> +static void s3c64xx_spi_dma_rxcb(void *data)
> +{
> +	struct s3c64xx_spi_driver_data *sdd
> +		= (struct s3c64xx_spi_driver_data *)data;

You never need explicit casts from void * or to void *.  Please remove
these.
