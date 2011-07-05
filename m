From: Chanho Park <chanho61.park@samsung.com>
Subject: Re: [PATCH 5/7] ARM: EXYNOS4: Use generic DMA PL330 driver
Date: Tue, 5 Jul 2011 02:36:38 +0000 (UTC)
Message-ID: <loom.20110705T042344-883@post.gmane.org>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com> <1309781915-31549-6-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:51606 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752423Ab1GECpH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 22:45:07 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1QdvdK-00046P-Lo
	for linux-samsung-soc@vger.kernel.org; Tue, 05 Jul 2011 04:45:06 +0200
Received: from 210.94.41.89 ([210.94.41.89])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2011 04:45:06 +0200
Received: from chanho61.park by 210.94.41.89 with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2011 04:45:06 +0200
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Kukjin Kim <kgene.kim <at> samsung.com> writes:

> +struct dma_pl330_platdata exynos4_pdma0_pdata = {
> +	.nr_valid_peri = 32,
> +	.peri = pdma0_peri,
>  };

(snip)

> +struct dma_pl330_platdata exynos4_pdma1_pdata = {
> +	.nr_valid_peri = 32,
> +	.peri = pdma1_peri,
>  };
> 

I think you'd better use ARRAY_SIZE(peri) instead 32 for nr_valid_peri
because dma channels can be sparse.
