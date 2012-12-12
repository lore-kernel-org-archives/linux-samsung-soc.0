From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/4] DMA: PL330: fix locking in pl330_free_chan_resources()
Date: Wed, 12 Dec 2012 16:08:53 +0100
Message-ID: <201212121608.53648.b.zolnierkie@samsung.com>
References: <1351504796-24788-1-git-send-email-b.zolnierkie@samsung.com>
 <201211301159.31098.b.zolnierkie@samsung.com>
 <1354298873.7077.76.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37646 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752872Ab2LLPJu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Dec 2012 10:09:50 -0500
In-reply-to: <1354298873.7077.76.camel@vkoul-udesk3>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@linux.intel.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, rob.herring@calxeda.com, dinguyen@altera.com, pawel.moll@arm.com, t.figa@samsung.com, kyungmin.park@samsung.com, Dan Williams <djbw@fb.com>

On Friday 30 November 2012 19:07:53 Vinod Koul wrote:
> On Fri, 2012-11-30 at 11:59 +0100, Bartlomiej Zolnierkiewicz wrote:
> > > Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
> > 
> > Vinod/Dan could you please pick this patch for 3.8?  Thanks!
> I will check and queue it up today

ping?  [ I can't find the patch in slave-dma.git tree. ]

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung Poland R&D Center
