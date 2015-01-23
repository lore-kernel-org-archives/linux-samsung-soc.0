From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: SAMSUNG: remove unused DMA infrastructure
Date: Fri, 23 Jan 2015 16:32:54 +0900
Message-ID: <0d8e01d036de$cd1242b0$6736c810$@kernel.org>
References: <2398692.KpvgzHd6no@wuerfel> <20150118142952.GP15411@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56183 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751121AbbAWHc4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 02:32:56 -0500
In-reply-to: <20150118142952.GP15411@intel.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vinod Koul' <vinod.koul@intel.com>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Kukjin Kim' <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, tomasz.figa@gmail.com, heiko@sntech.de, ben-linux@fluff.org, padma.v@samsung.comheiko@sntech.de

Vinod Koul wrote:
> 
> On Thu, Jan 15, 2015 at 04:16:03PM +0100, Arnd Bergmann wrote:
> > Everything uses dmaengine now, so there is no reason to
> > keep this around any longer. Thanks to everyone who was involved
> > in moving the users over to use the dmaengine APIs.
> Very good indeed :)
> 
> Acked-by: Vinod Koul <vinod.koul@intel.com>
> 
Very nice and thanks to you all guys.

I'll apply this clean-up in Samsung tree with Heiko's reviewed-by.

- Kukjin
