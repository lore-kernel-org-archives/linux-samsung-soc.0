From: Vinod Koul <vinod.koul@linux.intel.com>
Subject: Re: [PATCH 1/4] DMA: PL330: fix locking in
 pl330_free_chan_resources()
Date: Fri, 30 Nov 2012 23:37:53 +0530
Message-ID: <1354298873.7077.76.camel@vkoul-udesk3>
References: <1351504796-24788-1-git-send-email-b.zolnierkie@samsung.com>
	 <1351504796-24788-2-git-send-email-b.zolnierkie@samsung.com>
	 <CABb+yY3DJ8saXGmXO31nQjtmqObpJxf5-Zwv4YhkJLv6EA=Tfw@mail.gmail.com>
	 <201211301159.31098.b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:48017 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751030Ab2K3S06 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Nov 2012 13:26:58 -0500
In-Reply-To: <201211301159.31098.b.zolnierkie@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, rob.herring@calxeda.com, dinguyen@altera.com, pawel.moll@arm.com, t.figa@samsung.com, kyungmin.park@samsung.com, Dan Williams <djbw@fb.com>

On Fri, 2012-11-30 at 11:59 +0100, Bartlomiej Zolnierkiewicz wrote:
> > Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
> 
> Vinod/Dan could you please pick this patch for 3.8?  Thanks!
I will check and queue it up today

-- 
~Vinod
