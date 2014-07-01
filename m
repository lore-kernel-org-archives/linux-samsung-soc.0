From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 08/17] ARM: S5PC100: no more support S5PC100 SoC
Date: Tue, 1 Jul 2014 08:55:49 -0400
Message-ID: <20140701125549.GG23978@titan.lakedaemon.net>
References: <1404210076-2362-1-git-send-email-kgene.kim@samsung.com>
 <1404210076-2362-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mho-03-ewr.mailhop.org ([204.13.248.66]:16709 "EHLO
	mho-01-ewr.mailhop.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753780AbaGAMz6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 08:55:58 -0400
Content-Disposition: inline
In-Reply-To: <1404210076-2362-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>, arnd@arndb.de

Kukjin,

On Tue, Jul 01, 2014 at 07:21:16PM +0900, Kukjin Kim wrote:
> This patch removes supporting codes for s5pc100 because no more used
> now.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
...
>  drivers/irqchip/Kconfig                            |    1 -

Acked-by: Jason Cooper <jason@lakedaemon.net>

thx,

Jason.
