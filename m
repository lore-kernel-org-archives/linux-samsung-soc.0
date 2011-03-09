From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 2/3] ARM: EXYNOS4: Suspend to RAM Support
Date: Wed, 9 Mar 2011 08:23:19 +0000
Message-ID: <20110309082319.GC605@n2100.arm.linux.org.uk>
References: <1299636521-4831-1-git-send-email-jc.lee@samsung.com> <1299636521-4831-3-git-send-email-jc.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:52118 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753904Ab1CIIXd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Mar 2011 03:23:33 -0500
Content-Disposition: inline
In-Reply-To: <1299636521-4831-3-git-send-email-jc.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaecheol Lee <jc.lee@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

On Wed, Mar 09, 2011 at 11:08:40AM +0900, Jaecheol Lee wrote:
> This patch adds support suspend to ram for EXYNOS4210.
> As a note, this includes function of outer cache flush
> because it is used before entering PM.

This should be updated to use the generic CPU sleep support, found in my
tree.
