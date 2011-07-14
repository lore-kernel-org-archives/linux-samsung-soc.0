From: boojin <boojin.kim@samsung.com>
Subject: RE: [PATCH 3/7] DMA: PL330: Add DMA capabilities
Date: Thu, 14 Jul 2011 18:04:26 +0900
Message-ID: <002801cc4205$08c91f90$1a5b5eb0$%kim@samsung.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
 <1309781915-31549-4-git-send-email-kgene.kim@samsung.com>
 <CAPTzV15Y7JFDKsec8x-M0C1AFLOMp39QvHpRCsO=E001P_tH9A@mail.gmail.com>
 <CABb+yY0M659Ob0u+wOBW5i6v_VfpayRkY29-TUNpsp1oVLn-SQ@mail.gmail.com>
 <002201cc41c0$fdf79810$f9e6c830$%kim@samsung.com>
 <CABb+yY198iVKYV765C_dokzciL9en3kkRyZgcgYpp5WphPNZmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39888 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753311Ab1GNJE3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jul 2011 05:04:29 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOB00FH7FUX4M10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Jul 2011 18:04:28 +0900 (KST)
Received: from DOBOOJINKIM03 (12-23-120-72.csky.net [12.23.120.72])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOB00JQVFVFIC@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Jul 2011 18:04:27 +0900 (KST)
In-reply-to: <CABb+yY198iVKYV765C_dokzciL9en3kkRyZgcgYpp5WphPNZmw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: 'Chanho Park' <parkch98@gmail.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Liam Girdwood' <lrg@ti.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>

Jassi Brar Wrote:
> On Thu, Jul 14, 2011 at 6:27 AM, boojin <boojin.kim@samsung.com> wrote:
> > Jassi Brar wrote:
> >
> >> On Tue, Jul 5, 2011 at 12:03 PM, Chanho Park <parkch98@gmail.com> wrote:
> >> > Kukjin Kim <kgene.kim <at> samsung.com> writes:
> >> >
> >> > (snip)
> >> >
> >> >> +             if (slave_config->direction == DMA_TO_DEVICE) {
> >> >> +                     if (slave_config->dst_addr)
> >> >> +                             peri->fifo_addr = slave_config->dst_addr;
> >> >> +                     if (slave_config->dst_addr_width) {
> >> >> +                             i = 0;
> >> >> +                             while (slave_config->dst_addr_width != (1
> <<
> >> > i))
> >> >> +                                     i++;
> >> >> +                             peri->burst_sz = i;
> >> >> +                     }
> >> >> +             } else if (slave_config->direction == DMA_FROM_DEVICE)
> {
> >> >> +                     if (slave_config->src_addr)
> >> >> +                             peri->fifo_addr = slave_config->src_addr;
> >> >> +                     if (slave_config->src_addr_width) {
> >> >> +                             i = 0;
> >> >> +                             while (slave_config->src_addr_width != (1
> <<
> >> > i))
> >> >> +                                     i++;
> >> >> +                             peri->burst_sz = i;
> >> >
> >> > Re-send including cc and mailing lists
> >> > --
> >> > pl330 dmac only supports 1/2/4/8/16 bytes burst size.
> >> > If some bad D/D doesn't use powers of 2 width,
> >> > dmaengine is going to infinite loop.
> >> > You'd better check it instead of running loop.
> >> >
> >> It might be even better to start with max possible width and
> >> keep decreasing 'i' in the loop.
> > I will addressed your comment on next release.
> 
> Actually, best would be to simply do
>     peri->burst_sz =  __ffs(slave_config->src_addr_width);
> 
> And sorry I haven't yet reviewed the patches because I have been
> very busy lately. Will be more active in a few days.

Thanks for good information. Please give me your feedback.
I will release next version after gathering and reflecting all comments.
