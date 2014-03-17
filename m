From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH V3 2/8] net: sxgbe: add basic framework for Samsung
 10Gb ethernet driver
Date: Mon, 17 Mar 2014 17:18:25 -0400 (EDT)
Message-ID: <20140317.171825.1118518563919818497.davem@davemloft.net>
References: <00bf01cf4221$95373150$bfa593f0$@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:43278 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751022AbaCQVS1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Mar 2014 17:18:27 -0400
In-Reply-To: <00bf01cf4221$95373150$bfa593f0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: bh74.an@samsung.com
Cc: netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, siva.kallam@samsung.com, vipul.pandya@samsung.com, ks.giri@samsung.com, ilho215.lee@samsung.com

From: Byungho An <bh74.an@samsung.com>
Date: Mon, 17 Mar 2014 13:43:37 -0700

> +static void sxgbe_tx_timer(unsigned long data)
> +{
> +	struct sxgbe_tx_queue *p = (struct sxgbe_tx_queue *)data;
> +	sxgbe_tx_queue_clean(p);
> +}

A empty line after local variable declarations please.

> +	SXGBE_FOR_EACH_QUEUE(SXGBE_TX_QUEUES, queue_num) {
> +		struct sxgbe_tx_queue *p = priv->txq[queue_num];
> +		p->tx_coal_frames =  SXGBE_TX_FRAMES;

Likewise.

> +	SXGBE_FOR_EACH_QUEUE(SXGBE_TX_QUEUES, queue_num) {
> +		struct sxgbe_tx_queue *p = priv->txq[queue_num];
> +		del_timer_sync(&p->txtimer);
> +	}

Likewise.

Please audit your entire submission for this problem.
