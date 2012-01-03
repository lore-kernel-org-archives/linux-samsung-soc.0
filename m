From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 09/12] ARM: EXYNOS: introduce
	arch/arm/mach-exynos/common.[ch]
Date: Tue, 3 Jan 2012 10:41:20 +0000
Message-ID: <20120103104120.GK2914@n2100.arm.linux.org.uk>
References: <1324385316-6052-1-git-send-email-kgene.kim@samsung.com> <1324385316-6052-10-git-send-email-kgene.kim@samsung.com> <20111223191935.GS2577@n2100.arm.linux.org.uk> <088101ccc1d8$d2023b00$7606b100$%kim@samsung.com> <08f401ccc469$9a93a800$cfbaf800$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:58212 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752125Ab2ACKlh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jan 2012 05:41:37 -0500
Content-Disposition: inline
In-Reply-To: <08f401ccc469$9a93a800$cfbaf800$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Nicolas Pitre' <nico@fluxnic.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Dec 27, 2011 at 04:31:52PM +0900, Kukjin Kim wrote:
> Kukjin Kim wrote:
> > 
> > Russell King - ARM Linux wrote:
> > >
> 
> > > It looks like there's some changes made to exynos stuff between -rc1
> > 
> > Yes, some bug has been fixed after -rc1...
> > 
> 
> Hi Russell,
> 
> It is not a bug fix after -rc1 in mainline and the changes are from Marc's
> commit db0d4db2 ("ARM: gic: allow GIC to support non-banked setups") and
> Axel's bug fixes on Marc's patch which are in your devel-stable branch.
> 
> If this patch is not on top of Marc's patch, you can meet conflicts when you
> merge the reset branch. Nevertheless, I'm sending the cleaned patch(7257/1
> and 7258/1) which can be applied based on your restart-cleanup so that you
> can apply this easily anyway and in addition, you can apply other
> patches(7254/1, 7255/1 and 7256/1) as well.
> 
> I think, expected conflicts when you merge your branches can be fixed and if
> any problems, please let me know.
> 
> As a note, since local common.[ch] which are not based on current samsung
> tree have been introduced, we will meet conflicts between this series and my
> tree and of course, I will fix then.

Right, so this is _still_ giving me problems.  7257/1 now applies.  7258/1
combines my patch "ARM: restart: exynos4: use new restart hook XXX WIP XXX
WHY IS THERE NO LOCAL HEADERS IN arch/arm/mach-exynos4 XXX" with an update
from you for the new common.h header, and my "ARM: restart: plat-samsung:
remove plat/reset.h and s5p_reset_hook" patch.

This is wrong - s5p_reset_hook is used by other Samsung platforms as well,
and its removal can only happen after _all_ the other platforms have been
converted.  If I place your exynos patchs before the other Samsung patches
(I'm keeping the platforms in alphabetical order) then things will break.

Please regenerate 7258/1 without my "ARM: restart: plat-samsung:
remove plat/reset.h and s5p_reset_hook" patch combined.

Thanks.
