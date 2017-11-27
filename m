From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 1/2] ARM: BUG if jumping to usermode address in kernel
 mode
Date: Mon, 27 Nov 2017 14:32:19 +0000
Message-ID: <20171127143219.GF31757@n2100.armlinux.org.uk>
References: <20171125113302.GY31757@n2100.armlinux.org.uk>
 <CGME20171125113437epcas2p4f1fcbe7dc2375f08410576ba826bc188@epcas2p4.samsung.com>
 <E1eIYiX-0007t0-AH@rmk-PC.armlinux.org.uk>
 <83b9ac11-a01a-c407-ed46-a62ac5037431@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:32854 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752224AbdK0Oce (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Nov 2017 09:32:34 -0500
Content-Disposition: inline
In-Reply-To: <83b9ac11-a01a-c407-ed46-a62ac5037431@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Alex Shi <alex.shi@linaro.org>, "Jon Medhurst (Tixy)" <tixy@linaro.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>

On Mon, Nov 27, 2017 at 03:27:03PM +0100, Marek Szyprowski wrote:
> Dear All,
> 
> On 2017-11-25 12:33, Russell King wrote:
> >Detect if we are returning to usermode via the normal kernel exit paths
> >but the saved PSR value indicates that we are in kernel mode.  This
> >could occur due to corrupted stack state, which has been observed with
> >"ftracetest".
> >
> >This ensures that we catch the problem case before we get to user code.
> >
> >Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> 
> This patch brakes kernel booting on Exynos 4412-based Odroid U3 board:

"brakes" are what you have on a car. "breaks" is the verb, which is
what you mean here.

It's known as of this morning, and I have a patch going through the
build testers at the moment.

Just replace the 0xcf in these with PSR_I_BIT | 0x0f.

Also wonder why your platform is running with SCR.FW clear...

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
