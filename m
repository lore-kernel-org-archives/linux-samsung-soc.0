From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 6/7] ARM: EXYNOS4: Add save/restore for more ARM
	registers
Date: Wed, 22 Jun 2011 15:54:52 +0100
Message-ID: <20110622145452.GR23234@n2100.arm.linux.org.uk>
References: <1308732405-16664-1-git-send-email-kgene.kim@samsung.com> <1308732405-16664-7-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:43992 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757939Ab1FVOzR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 10:55:17 -0400
Content-Disposition: inline
In-Reply-To: <1308732405-16664-7-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jaecheol Lee <jc.lee@samsung.com>, ben-linux@fluff.org

On Wed, Jun 22, 2011 at 05:46:44PM +0900, Kukjin Kim wrote:
> From: Jaecheol Lee <jc.lee@samsung.com>
> 
> This patch adds save/restore for Power Control Register and
> Diagnostic Register.

NAK.  Please see my further suspend consolidation patches posted earlier.
I've also recently (last few days) moved these further forward and this
code no longer exists in this file (all it contains is the early
resume stuff.)

My guess is that these two registers are samsung specific, and so they
should be saved and restored by higher level code (eg, a syscore_ops
for exynos4 specific stuff.)
