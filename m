From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/7] DMA: PL330: Add DMA capabilities
Date: Tue, 05 Jul 2011 16:10:21 +0900
Message-ID: <00be01cc3ae2$9d3b7080$d7b25180$%kim@samsung.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
 <1309781915-31549-4-git-send-email-kgene.kim@samsung.com>
 <CAPTzV15Y7JFDKsec8x-M0C1AFLOMp39QvHpRCsO=E001P_tH9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12017 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753632Ab1GEHK2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 03:10:28 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNU008RUMLCWL20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Jul 2011 16:10:27 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNU003ERMLDO7@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Jul 2011 16:10:26 +0900 (KST)
In-reply-to: <CAPTzV15Y7JFDKsec8x-M0C1AFLOMp39QvHpRCsO=E001P_tH9A@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanho Park' <parkch98@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Liam Girdwood' <lrg@ti.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Boojin Kim' <boojin.kim@samsung.com>

Chanho Park wrote:
> 
> Kukjin Kim <kgene.kim <at> samsung.com> writes:
> 
> (snip)
> 
> > +             if (slave_config->direction == DMA_TO_DEVICE) {
> > +                     if (slave_config->dst_addr)
> > +                             peri->fifo_addr = slave_config->dst_addr;
> > +                     if (slave_config->dst_addr_width) {
> > +                             i = 0;
> > +                             while (slave_config->dst_addr_width != (1
<<
> i))
> > +                                     i++;
> > +                             peri->burst_sz = i;
> > +                     }
> > +             } else if (slave_config->direction == DMA_FROM_DEVICE) {
> > +                     if (slave_config->src_addr)
> > +                             peri->fifo_addr = slave_config->src_addr;
> > +                     if (slave_config->src_addr_width) {
> > +                             i = 0;
> > +                             while (slave_config->src_addr_width != (1
<<
> i))
> > +                                     i++;
> > +                             peri->burst_sz = i;
> 
> Re-send including cc and mailing lists
> --
> pl330 dmac only supports 1/2/4/8/16 bytes burst size.
> If some bad D/D doesn't use powers of 2 width,
> dmaengine is going to infinite loop.
> You'd better check it instead of running loop.

Basically, src_addr_width is defined as a 'enum dma_slave_buswidth' so I
think we don't need to consider it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
