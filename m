From: Chanho Park <chanho61.park@samsung.com>
Subject: Re: [PATCH 3/7] DMA: PL330: Add DMA capabilities
Date: Tue, 5 Jul 2011 04:50:41 +0000 (UTC)
Message-ID: <loom.20110705T062807-134@post.gmane.org>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com> <1309781915-31549-4-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:60447 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752449Ab1GEEux (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 00:50:53 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1Qdxb2-0001OX-9U
	for linux-samsung-soc@vger.kernel.org; Tue, 05 Jul 2011 06:50:52 +0200
Received: from 210.94.41.89 ([210.94.41.89])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2011 06:50:52 +0200
Received: from chanho61.park by 210.94.41.89 with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2011 06:50:52 +0200
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Kukjin Kim <kgene.kim <at> samsung.com> writes:

(snip)

> +		if (slave_config->direction == DMA_TO_DEVICE) {
> +			if (slave_config->dst_addr)
> +				peri->fifo_addr = slave_config->dst_addr;
> +			if (slave_config->dst_addr_width) {
> +				i = 0;
> +				while (slave_config->dst_addr_width != (1 << 
i))
> +					i++;
> +				peri->burst_sz = i;
> +			}
> +		} else if (slave_config->direction == DMA_FROM_DEVICE) {
> +			if (slave_config->src_addr)
> +				peri->fifo_addr = slave_config->src_addr;
> +			if (slave_config->src_addr_width) {
> +				i = 0;
> +				while (slave_config->src_addr_width != (1 << 
i))
> +					i++;
> +				peri->burst_sz = i;

pl330 dmac only supports 1/2/4/8/16 bytes burst size.
If some bad D/D doesn't use powers of 2 width,
dmaengine is going to infinite loop.
You'd better check it instead of running loop.
