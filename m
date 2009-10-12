From: Marc Zyngier <maz@misterjones.org>
Subject: Re: [PATCH] S3C: ide: Add Samsung S3C IDE controller driver
Date: Mon, 12 Oct 2009 10:55:38 +0200
Message-ID: <20091012105538.140abb1c@life-in-the-fast-lane>
References: <1254985168-21720-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from inca-roads.misterjones.org ([213.251.177.50]:46640 "EHLO
	inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754838AbZJLJHp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2009 05:07:45 -0400
In-Reply-To: <1254985168-21720-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: thomas.ab@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, Abhilash Kesavan <a.kesavan@samsung.com>

On Thu,  8 Oct 2009 15:59:28 +0900
thomas.ab@samsung.com wrote:

> +irqreturn_t s3c_irq_handler(int irq, void *dev_id)
> +{
> +	ide_hwif_t *hwif = (ide_hwif_t *)dev_id;
> +	struct s3c_ide_device *ide_dev =
> +			(struct s3c_ide_device *)hwif->hwif_data;
> +	u32 reg = ide_readl(S3C_ATA_IRQ);
> +
> +	ide_writel(reg, S3C_ATA_IRQ);
> +	return ide_intr(irq, dev_id);
> +}

On top of what Jassi already mentioned, please make this static.

	M.
-- 
Fast. Cheap. Reliable. Pick two.
