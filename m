From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/3] net: sxgbe: Added condition for non fix_burst mode
Date: Mon, 12 May 2014 00:54:35 -0400 (EDT)
Message-ID: <20140512.005435.605591103659625618.davem@davemloft.net>
References: <003b01cf6b2a$e8c81960$ba584c20$%an@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:54925 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752614AbaELEyh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 00:54:37 -0400
In-Reply-To: <003b01cf6b2a$e8c81960$ba584c20$%an@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: bh74.an@samsung.com
Cc: netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, ks.giri@samsung.com, vipul.pandya@samsung.com

From: Byungho An <bh74.an@samsung.com>
Date: Fri, 09 May 2014 11:03:45 +0900

> -		reg_val |= (pbl << SXGBE_DMA_TXPBL_LSHIFT);
> +		reg_val |= pbl << SXGBE_DMA_TXPBL_LSHIFT;

This has nothing to do with the change you are making.
