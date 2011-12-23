From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 07/12] ARM: S5PV210: introduce
	arch/arm/mach-s5pv210/common.[ch]
Date: Fri, 23 Dec 2011 19:14:48 +0000
Message-ID: <20111223191448.GR2577@n2100.arm.linux.org.uk>
References: <1324385316-6052-1-git-send-email-kgene.kim@samsung.com> <1324385316-6052-8-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:39243 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754139Ab1LWTPG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Dec 2011 14:15:06 -0500
Content-Disposition: inline
In-Reply-To: <1324385316-6052-8-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Dec 20, 2011 at 09:48:31PM +0900, Kukjin Kim wrote:
> This patch introduces common.[ch] which are used only in the
> arch/arm/mach-s5pv210/ directory. The common.c file merges
> the cpu.c and init.c which are used commonly on S5PCV210/S5PC100
> SoC and the common.h local header file replaces with plat/s5pv210.h
> file.

Note that the patch system does _not_ deal in any way with replacing
patch comments.  Comments added against a patch already submitted
to the patch system containing an attributation get _added_ to the
initial comment.

So, it ends up looking like this:

ARM: 7248/1: S5PV210: introduce arch/arm/mach-s5pv210/common.[ch

This patch introduces common.[ch] which are used only in the
arch/arm/mach-s5pv210/ directory. The common.c file merges
the cpu.c and init.c which are used commonly on S5PCV210/S5PC100
SoC and the common.h local header file replaces with plat/s5pv210.h
file.

Comments from Kukjin Kim:

 Subject: [PATCH 04/12] ARM: S5PV210: introduce arch/arm/mach-s5pv210/common.[ch]

 This patch introduces common.[ch] which are used only in the
 arch/arm/mach-s5pv210/ directory. The common.c file merges
 the cpu.c and init.c which are used commonly on S5PCV210/S5PC100
 SoC and the common.h local header file replaces with plat/s5pv210.h
 file.

 ---
 Changes: fixed missing ']' at the end of the subject

Cc: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

which I think you can agree is not good.  If you want to _change_ the
initial comments, please resubmit the patch entirely.
