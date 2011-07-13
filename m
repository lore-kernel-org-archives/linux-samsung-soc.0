From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V2 01/12] DMA: PL330: Add support runtime PM for PL330
	DMAC
Date: Wed, 13 Jul 2011 10:07:54 +0100
Message-ID: <20110713090754.GH23270@n2100.arm.linux.org.uk>
References: <1310546857-6304-1-git-send-email-kgene.kim@samsung.com> <1310546857-6304-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:42600 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965050Ab1GMJIT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Jul 2011 05:08:19 -0400
Content-Disposition: inline
In-Reply-To: <1310546857-6304-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Boojin Kim <boojin.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Dan Williams <dan.j.williams@intel.com>, Liam Girdwood <lrg@ti.com>

On Wed, Jul 13, 2011 at 05:47:26PM +0900, Kukjin Kim wrote:
> @@ -688,7 +691,8 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>  	pi->mcbufsz = pdat->mcbuf_sz;
>  
>  	res = &adev->res;
> -	request_mem_region(res->start, resource_size(res), "dma-pl330");
> +	request_mem_region(res->start,
> +		resource_size(res), dev_name(&adev->dev));

The convention that we've been using is:

10004000-10004fff : mb:aaci
  10004000-10004fff : aaci-pl041
10005000-10005fff : mb:mmci
  10005000-10005fff : mmci-pl18x
10006000-10006fff : mb:kmi0
  10006000-10006fff : kmi-pl050
10007000-10007fff : mb:kmi1
  10007000-10007fff : kmi-pl050
10009000-10009fff : mb:uart0
  10009000-10009fff : uart-pl011
1000a000-1000afff : mb:uart1
  1000a000-1000afff : uart-pl011
1000b000-1000bfff : mb:uart2
  1000b000-1000bfff : uart-pl011
1000c000-1000cfff : mb:uart3
  1000c000-1000cfff : uart-pl011

The parent resource uses the device name.  The child resource is the
driver name.  That (a) avoids useless duplication of data in /proc/iomem
and (b) is more informative when you look at /proc/iomem about what's
where.
