From: Chanho Park <parkch98@gmail.com>
Subject: Re: [PATCH 6/7] spi/s3c64xx: Add support DMA engine API
Date: Tue, 5 Jul 2011 17:39:50 +0900
Message-ID: <CAPTzV16XF5tVJrw0UO+kM9uz+49b3jtCi9QHVm8eDbd8kbueBA@mail.gmail.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
	<1309781915-31549-7-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:36538 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753804Ab1GEIjw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 04:39:52 -0400
Received: by bwd5 with SMTP id 5so4572195bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2011 01:39:51 -0700 (PDT)
In-Reply-To: <1309781915-31549-7-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Grant Likely <grant.likely@secretlab.ca>, Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Boojin Kim <boojin.kim@samsung.com>

> =A0static int acquire_dma(struct s3c64xx_spi_driver_data *sdd)
> =A0{
> +#if defined(CONFIG_DMADEV_PL330)
> + =A0 =A0 =A0 dma_cap_mask_t mask;
> + =A0 =A0 =A0 dma_cap_zero(mask);
> + =A0 =A0 =A0 dma_cap_set(DMA_SLAVE, mask);
> + =A0 =A0 =A0 sdd->rx_chan =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_request_channel(mask, rxfilter, (vo=
id *)sdd);
> + =A0 =A0 =A0 if (!sdd->rx_chan) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&sdd->pdev->dev, "cannot get Rx=
DMA\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 sdd->tx_chan =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_request_channel(mask, txfilter, (vo=
id *)sdd);
> + =A0 =A0 =A0 if (!sdd->tx_chan) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&sdd->pdev->dev, "cannot get Tx=
DMA\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 }
> +#else

When acquiring tx_chan is failed, you must release a rx_chan before
error return.
If not, the rx_chan is always busy because it was allocated in the
previous attempt.

--=20
Best Regards,
Chanho Park
