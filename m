From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 25/25] ARM: pm: omap34xx: convert to generic
 suspend/resume support
Date: Wed, 22 Jun 2011 23:33:11 -0700
Message-ID: <20110623063311.GV23145@atomide.com>
References: <20110622150816.GT23234@n2100.arm.linux.org.uk>
 <E1QZPAo-0002XO-9G@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mho-04-ewr.mailhop.org ([204.13.248.74]:32861 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753653Ab1FWGdd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jun 2011 02:33:33 -0400
Content-Disposition: inline
In-Reply-To: <E1QZPAo-0002XO-9G@rmk-PC.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org

* Russell King - ARM Linux <linux@arm.linux.org.uk> [110622 08:24]:
> Convert sa11x0 to use the generic CPU suspend/resume support, rather
          ^^^^^^
Should be omap34xx above.

> than implementing its own version.  Tested on 3430 LDP.

Nice job with this series Russell!

Tony
