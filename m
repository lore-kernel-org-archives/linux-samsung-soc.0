From: Chanho Park <parkch98@gmail.com>
Subject: Re: [PATCH 3/7] DMA: PL330: Add DMA capabilities
Date: Tue, 5 Jul 2011 15:33:49 +0900
Message-ID: <CAPTzV15Y7JFDKsec8x-M0C1AFLOMp39QvHpRCsO=E001P_tH9A@mail.gmail.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
	<1309781915-31549-4-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:41886 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753701Ab1GEGdu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 02:33:50 -0400
Received: by bwd5 with SMTP id 5so4507634bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Jul 2011 23:33:49 -0700 (PDT)
In-Reply-To: <1309781915-31549-4-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Grant Likely <grant.likely@secretlab.ca>, Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Boojin Kim <boojin.kim@samsung.com>

Kukjin Kim <kgene.kim <at> samsung.com> writes:

(snip)

> +             if (slave_config->direction == DMA_TO_DEVICE) {
> +                     if (slave_config->dst_addr)
> +                             peri->fifo_addr = slave_config->dst_addr;
> +                     if (slave_config->dst_addr_width) {
> +                             i = 0;
> +                             while (slave_config->dst_addr_width != (1 <<
i))
> +                                     i++;
> +                             peri->burst_sz = i;
> +                     }
> +             } else if (slave_config->direction == DMA_FROM_DEVICE) {
> +                     if (slave_config->src_addr)
> +                             peri->fifo_addr = slave_config->src_addr;
> +                     if (slave_config->src_addr_width) {
> +                             i = 0;
> +                             while (slave_config->src_addr_width != (1 <<
i))
> +                                     i++;
> +                             peri->burst_sz = i;

Re-send including cc and mailing lists
--
pl330 dmac only supports 1/2/4/8/16 bytes burst size.
If some bad D/D doesn't use powers of 2 width,
dmaengine is going to infinite loop.
You'd better check it instead of running loop.
