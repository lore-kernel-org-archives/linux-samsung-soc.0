From: David Miller <davem@davemloft.net>
Subject: Re: [RFC 9/9] crypto: Add Samsung crypto engine driver
Date: Sun, 27 Jun 2010 21:57:25 -0700 (PDT)
Message-ID: <20100627.215725.226777011.davem@davemloft.net>
References: <4C129341.2060407@gmail.com>
	<20100626.210728.90806559.davem@davemloft.net>
	<4C27309B.7010905@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:33587
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752907Ab0F1E5N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jun 2010 00:57:13 -0400
In-Reply-To: <4C27309B.7010905@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: mcuelenaere@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au

From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Date: Sun, 27 Jun 2010 13:06:03 +0200

> I'd go with a threaded interrupt handler in that case then, or do
> you also consider this as too much overhead?
> 
> I'll do some performance comparisons of threaded interrupt handler
> vs normal and go with the fastest.

Yes, best to just measure it in order to decide which is best.
