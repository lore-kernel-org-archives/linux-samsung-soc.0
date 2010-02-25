From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PULL] Pull request for for-rmk/samsung5
Date: Thu, 25 Feb 2010 20:53:01 +0000
Message-ID: <20100225205301.GG3101@n2100.arm.linux.org.uk>
References: <20100225000919.GA28433@fluff.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:48480 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933348Ab0BYUx2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Feb 2010 15:53:28 -0500
Content-Disposition: inline
In-Reply-To: <20100225000919.GA28433@fluff.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Thu, Feb 25, 2010 at 12:09:19AM +0000, Ben Dooks wrote:
> Sorry for the late request, but haven't been very well. Quite a bit of
> this update has been on list for a while, but only just been merged
> together into one tree.
> 
> This is the last of the Samsung updates that need to go via RMK, they
> are mostly plat-s3c/plat-s3c64xx and machine squashed and the new
> S5P6442 and S5PV210 code.
> 
> Included are some updates for the current code to avoid build or runtime
> problems with other updates such as via the ASoC tree.
> 
> I will be doing a seperate set of updates direct to Linus once these are
> merged to fix and outstanding problems, any updates such as S3C2443 clock
> rewrite and anything else not directly relying on arch/arm modifications.
> 
> There will also be a set of documentation updates to deal with the current
> shifts and outline anything else that needs to be done.
> 
> Anything urgent, please cc: me directly.
> 
> The following changes since commit ab5d97db1c6ced3e95c00d097931471707032b1f:
>   Ben Dooks (1):
>         ARM: SAMSUNG: Fix bad use of __initdata for s3c_register_clocks()
> 
> are available in the git repository at:
> 
>   git://git.fluff.org/bjdooks/linux.git for-rmk/samsung5

This gives me conflicts in arch/arm/Makefile and arch/arm/Kconfig.  I'll
need to investigate, which I'll do over the weekend.
