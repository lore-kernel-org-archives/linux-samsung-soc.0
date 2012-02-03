From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 02/13] ARM: SAMSUNG: allow the configuration of KERNEL
	HZ in plat-samsung
Date: Fri, 3 Feb 2012 16:13:43 +0000
Message-ID: <20120203161343.GN889@n2100.arm.linux.org.uk>
References: <016f01ccdc95$30279500$9076bf00$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:41200 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753719Ab2BCQN5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Feb 2012 11:13:57 -0500
Content-Disposition: inline
In-Reply-To: <016f01ccdc95$30279500$9076bf00$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Fri, Jan 27, 2012 at 10:44:20AM +0900, Kukjin Kim wrote:
> 
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

This patch really needs some kind of explanation.  It's far from obvious
from the casual reader why moving from a fixed value of 200Hz for the
kernel tick rate to a range from 32 to 1024 would be legal.

If 100Hz was possible before, and that's the architecture default, why
was 200Hz chosen instead?

And is 99Hz and 101Hz allowable?
