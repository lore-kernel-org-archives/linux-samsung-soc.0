From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V2 3/8] ARM: EXYNOS4: Add support PM with external GIC
Date: Fri, 1 Jul 2011 22:21:44 +0100
Message-ID: <20110701212144.GF21898@n2100.arm.linux.org.uk>
References: <1309485457-13305-1-git-send-email-kgene.kim@samsung.com> <1309485457-13305-4-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40553 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755209Ab1GAVWA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Jul 2011 17:22:00 -0400
Content-Disposition: inline
In-Reply-To: <1309485457-13305-4-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jaecheol Lee <jc.lee@samsung.com>, ben-linux@fluff.org

On Fri, Jul 01, 2011 at 10:57:32AM +0900, Kukjin Kim wrote:
> From: Jaecheol Lee <jc.lee@samsung.com>
> 
> Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Why not fix arch/arm/common/gic.c to save and restore the GIC state
itself?

You really need to start thinking bigger than just Samsung with this
stuff - we can't have SoC people addressing these obviously common
issues within their own code and duplicating it across all SoCs.  We
_need_ you folk to start thinking about implementing common support
where its needed.
