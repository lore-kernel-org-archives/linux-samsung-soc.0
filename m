From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH V8 2/7] net: sxgbe: add basic framework for Samsung
 10Gb ethernet driver
Date: Thu, 20 Mar 2014 17:33:38 -0400 (EDT)
Message-ID: <20140320.173338.1960242211982744557.davem@davemloft.net>
References: <012d01cf4461$77a062f0$66e128d0$@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:52233 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932328AbaCTVdl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Mar 2014 17:33:41 -0400
In-Reply-To: <012d01cf4461$77a062f0$66e128d0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: bh74.an@samsung.com
Cc: netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, ks.giri@samsung.com, siva.kallam@samsung.com, vipul.pandya@samsung.com, ilho215.lee@samsung.com

From: Byungho An <bh74.an@samsung.com>
Date: Thu, 20 Mar 2014 10:25:59 -0700

> +config NET_VENDOR_SAMSUNG
> +	bool "Samsung Ethernet device"
> +	default y
> +	depends on HAS_IOMEM && HAS_DMA
> +	select PHYLIB
> +	select CRC32
> +	select PTP_1588_CLOCK
> +	---help---
> +	  This is the driver for the SXGBE 10G Ethernet IP block found on Samsung
> +	  platforms.

The vendor sub-section does not necessarily need these select and
depends statements.

These should be put only in the individual driver entries.
