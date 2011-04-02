From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: Suspend: Fix build error on ARCH_S5PC100
Date: Sat, 2 Apr 2011 10:19:04 +0100
Message-ID: <20110402091904.GH8482@n2100.arm.linux.org.uk>
References: <1301710155-16373-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:49573 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755317Ab1DBJTU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Apr 2011 05:19:20 -0400
Content-Disposition: inline
In-Reply-To: <1301710155-16373-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Sat, Apr 02, 2011 at 11:09:15AM +0900, Kukjin Kim wrote:
> The current mainline codes of ARCH_S5PC100 can not support
> suspend to ram. So needs this for preventing build error.
> 
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> Oops, I missed this in my previous patch.
> 
> As I know, firstly ARCH_S5P64X0 will support suspend to ram
> then ARCH_S5PC100 will do it. But right now, we need this.

I'd much rather do this a different way - let me know if this means
the SoC based dependencies can be dropped.  Patches to follow.
