From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH V2 RE-SEND 1/7] net: sxgbe: add basic framework for
 Samsung 10Gb ethernet driver
Date: Thu, 13 Mar 2014 05:53:09 -0700
Message-ID: <1394715189.3915.76.camel@joe-AO722>
References: <007a01cf3e89$3bbdf460$b339dd20$%an@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay0176.hostedemail.com ([216.40.44.176]:56660 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751032AbaCMMxN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 08:53:13 -0400
In-Reply-To: <007a01cf3e89$3bbdf460$b339dd20$%an@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Byungho An <bh74.an@samsung.com>
Cc: netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, davem@davemloft.net, ilho215.lee@samsung.com, siva.kallam@samsung.com, vipul.pandya@samsung.com, ks.giri@samsung.com

On Thu, 2014-03-13 at 15:55 +0900, Byungho An wrote:
> This patch adds support for Samsung 10Gb ethernet driver(sxgbe).
> - sxgbe core initialization
> - Tx and Rx support
> - MDIO support
> - ISRs for Tx and Rx
> - ifconfig support to driver
[]
> diff --git a/drivers/net/ethernet/samsung/sxgbe_desc.c b/drivers/net/ethernet/samsung/sxgbe_desc.c
[]
> +/* Set Time stamp */
> +static void sxgbe_tx_ctxt_desc_set_tstamp(struct sxgbe_tx_ctxt_desc *p,
> +					  u8 ostc_enable, u64 tstamp)
> +{
> +	if (ostc_enable) {
> +		p->ostc = ostc_enable;
> +		p->tstamp_lo = (u32) tstamp;
> +		p->tstamp_hi = (u32) (tstamp>>32);
> +	}
> +}

[]

> +static u64 sxgbe_get_rx_timestamp(struct sxgbe_rx_ctxt_desc *p)
> +{
> +	u64 ns;
> +	ns = p->tstamp_lo;
> +	ns += p->tstamp_hi * 1000000000ULL;
> +
> +	return ns;
> +}

This looks odd.

rx and tx timestamps are different clocks?

rx tstamp_lo resets every second but tx_stamp
is free-running?

Maybe this was supposed to be something like

	ns = p->tstamp_lo
	ns |= ((u64)tstamp_hi) << 32;

If not, maybe it warrants a comment around
here or on the descriptor definition

> diff --git a/drivers/net/ethernet/samsung/sxgbe_desc.h b/drivers/net/ethernet/samsung/sxgbe_desc.h
[]
> +/* Context descriptor structure */
> +struct sxgbe_tx_ctxt_desc {
> +	u32 tstamp_lo:32;
> +	u32 tstamp_hi:32;

[]

> +struct sxgbe_rx_ctxt_desc {
> +	u32 tstamp_lo:32;
> +	u32 tstamp_hi:32;
 
