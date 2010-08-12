From: David Miller <davem@davemloft.net>
Subject: Re: [RFC 9/9] crypto: Add Samsung crypto engine driver
Date: Thu, 12 Aug 2010 15:32:08 -0700 (PDT)
Message-ID: <20100812.153208.48514514.davem@davemloft.net>
References: <4C129341.2060407@gmail.com>
	<AANLkTi=FKAdC9AwPR41MUBUjBZ2Zf1qv1DSQ+EnMHu7d@mail.gmail.com>
	<4C63DF4C.1020501@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:34005
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754518Ab0HLWbv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Aug 2010 18:31:51 -0400
In-Reply-To: <4C63DF4C.1020501@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: mcuelenaere@gmail.com
Cc: kmpark@infradead.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au

From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Date: Thu, 12 Aug 2010 13:47:24 +0200

> The main issues still remain (DMA not working at all and FIFO not
> working for some (T)DES transfers). Additionally, I couldn't get
> tcrypt to test the s3c-sss driver for some reason, it always picked
> the standard AES/TDES/DES driver (even though s3c-sss has a higher
> priority and succeeded the self-test).

I forget the details of your driver, but were your encryption algorithms
implemented async?

tcrypt can validate async crypto algorithms, but cannot performance
test them just yet.  I can performance test async hash algorithms,
for which I added the code for a few months ago.
