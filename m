From: Chanho Park <parkch98@gmail.com>
Subject: Re: [PATCH 3/7] DMA: PL330: Add DMA capabilities
Date: Tue, 5 Jul 2011 17:08:33 +0900
Message-ID: <CAPTzV17yr5hw=QukGdWJr_0uS2O4VwdCQsgZb1euzonVCLj+6w@mail.gmail.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
	<1309781915-31549-4-git-send-email-kgene.kim@samsung.com>
	<CAPTzV15Y7JFDKsec8x-M0C1AFLOMp39QvHpRCsO=E001P_tH9A@mail.gmail.com>
	<00be01cc3ae2$9d3b7080$d7b25180$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:63826 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754506Ab1GEIIf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 04:08:35 -0400
Received: by bwd5 with SMTP id 5so4555158bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2011 01:08:33 -0700 (PDT)
In-Reply-To: <00be01cc3ae2$9d3b7080$d7b25180$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Grant Likely <grant.likely@secretlab.ca>, Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Boojin Kim <boojin.kim@samsung.com>

>
> Basically, src_addr_width is defined as a 'enum dma_slave_buswidth' so I
> think we don't need to consider it.
>

Client D/D normally uses 'enum dma_slave_buswidth' type.
However, dmaengine driver cannot guarantee all client D/D uses it.
See below your spi driver. Thus, the dmaengine driver check it correctly.

+#if defined(CONFIG_DMADEV_PL330)
+                       memset(&slave_config, 0, sizeof(slave_config));
+                       slave_config.direction = DMA_TO_DEVICE;
+                       slave_config.src_addr = xfer->tx_dma;
+                       slave_config.dst_addr =
+                               sdd->sfr_start + S3C64XX_SPI_TX_DATA;
+                       slave_config.dst_addr_width = sdd->cur_bpw / 8;
+                       dmaengine_slave_config(sdd->tx_chan, &slave_config);

-- 
Best Regards,
Chanho Park
