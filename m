From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: SAMSUNG: Removed redunt zreladdr in Makefile.boot
Date: Fri, 3 Sep 2010 08:42:47 +0100
Message-ID: <20100903074247.GG26319@n2100.arm.linux.org.uk>
References: <1283470043-16050-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:51305 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752430Ab0ICHnB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Sep 2010 03:43:01 -0400
Content-Disposition: inline
In-Reply-To: <1283470043-16050-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Fri, Sep 03, 2010 at 08:27:23AM +0900, Kukjin Kim wrote:
> Because can be calculated ZREADDR now, removed redunt zreladdr
> definitions in each Makefile.boot of Samsung architectures.

I'd suggest holding off on this.  CONFIG_ZRELADDR has a few problems
at the moment that need fixing - and if there's no movement to fix
them, it'll be reverted.
