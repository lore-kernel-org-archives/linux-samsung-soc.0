From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] ARM: SAMSUNG: remove unused DMA infrastructure
Date: Sun, 18 Jan 2015 19:59:52 +0530
Message-ID: <20150118142952.GP15411@intel.com>
References: <2398692.KpvgzHd6no@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:19200 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750857AbbARObS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Jan 2015 09:31:18 -0500
Content-Disposition: inline
In-Reply-To: <2398692.KpvgzHd6no@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, tomasz.figa@gmail.com, heiko@sntech.de, ben-linux@fluff.org, padma.v@samsung.com

On Thu, Jan 15, 2015 at 04:16:03PM +0100, Arnd Bergmann wrote:
> Everything uses dmaengine now, so there is no reason to
> keep this around any longer. Thanks to everyone who was involved
> in moving the users over to use the dmaengine APIs.
Very good indeed :)

Acked-by: Vinod Koul <vinod.koul@intel.com>

-- 
~Vinod
