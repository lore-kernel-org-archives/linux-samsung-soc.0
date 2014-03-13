From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH V2 RE-SEND 1/7] net: sxgbe: add basic framework for
 Samsung 10Gb ethernet driver
Date: Thu, 13 Mar 2014 06:02:23 -0700
Message-ID: <1394715743.3915.79.camel@joe-AO722>
References: <007a01cf3e89$3bbdf460$b339dd20$%an@samsung.com>
	 <1394715189.3915.76.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay0122.hostedemail.com ([216.40.44.122]:56378 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751032AbaCMNCa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 09:02:30 -0400
In-Reply-To: <1394715189.3915.76.camel@joe-AO722>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Byungho An <bh74.an@samsung.com>
Cc: netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, davem@davemloft.net, ilho215.lee@samsung.com, siva.kallam@samsung.com, vipul.pandya@samsung.com, ks.giri@samsung.com

On Thu, 2014-03-13 at 05:53 -0700, Joe Perches wrote:
> Maybe this was supposed to be something like
> 
> 	ns = p->tstamp_lo
> 	ns |= ((u64)tstamp_hi) << 32;
> 
> If not, maybe it warrants a comment around
> here or on the descriptor definition
[]
> > +struct sxgbe_rx_ctxt_desc {
> > +	u32 tstamp_lo:32;
> > +	u32 tstamp_hi:32;

or maybe these would be better renamed like:

	u32 tstamp_nsecs;
	u32 tstamp_secs;

btw2: I still think using

	u32	foo:32;

is asking for gcc to generate bad code.
