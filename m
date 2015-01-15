From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: SAMSUNG: remove unused DMA infrastructure
Date: Thu, 15 Jan 2015 19:33:20 +0100
Message-ID: <1857858.copsapeGJt@phil>
References: <2398692.KpvgzHd6no@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:58886 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752247AbbAOSdf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Jan 2015 13:33:35 -0500
In-Reply-To: <2398692.KpvgzHd6no@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, tomasz.figa@gmail.com, ben-linux@fluff.org, padma.v@samsung.com

Am Donnerstag, 15. Januar 2015, 16:16:03 schrieb Arnd Bergmann:
> Everything uses dmaengine now, so there is no reason to
> keep this around any longer. Thanks to everyone who was involved
> in moving the users over to use the dmaengine APIs.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

very nice to see this finished :-)

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
