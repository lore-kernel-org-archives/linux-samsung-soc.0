From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v3 1/2] clocksource/arm_arch_timer: Force per-CPU
 interrupt to be level-triggered
Date: Sun, 12 Jun 2016 11:12:40 +0100
Message-ID: <20160612111240.7dc99322@arm.com>
References: <1465235791-7064-1-git-send-email-marc.zyngier@arm.com>
	<1465235791-7064-2-git-send-email-marc.zyngier@arm.com>
	<5759DB58.5070906@gmail.com>
	<20160610082952.4f20d732@arm.com>
	<575AFB4A.3030508@gmail.com>
	<20160611104100.7475689e@arm.com>
	<CANe6Qb_sx8_rRHZG1PR=A+cgxqYTzreZ0rD01X-gtEDb=h1cVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:46432 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750755AbcFLKMv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Jun 2016 06:12:51 -0400
In-Reply-To: <CANe6Qb_sx8_rRHZG1PR=A+cgxqYTzreZ0rD01X-gtEDb=h1cVQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <bjdooks@googlemail.com>
Cc: David Daney <ddaney.cavm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Hou Zhiqiang <B48286@freescale.com>, Liu Gang <Gang.Liu@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mingkai Hu <Mingkai.Hu@freescale.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Michal Simek <michal.simek@xilinx.com>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com, =?ISO-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Ray Jui <rjui@broadcom.com>, Tirumalesh Chalamarla <tchalamarla@cavium.com>, Rob Herring <robh+dt@kernel.org>, Yuan Yao <yao.yuan@nxp.com>, Wenbi

On Sat, 11 Jun 2016 13:02:44 +0100
Ben Dooks <bjdooks@googlemail.com> wrote:

> out of interest, do you have a list of what the problems are?

The trigger configuration for per-cpu interrupts silently fails
(because set_irq_type cannot deal with them). Which means we're relying
on whatever configuration the firmware has left in there. Also, the
kernel defaults to considering the interrupt as edge.

What saves most platforms so far is that they are using a GIC:
1) Most GIC implementations have their PPI configuration as RO, which
   means that we can't get it wrong.
2) If using a fasteoi handler, there is no significant difference in the
   flow between edge and level (we're relying on the HW dealing with it,
   so (1) is critical).

If your GIC allows PPI configuration to be written and firmware gets it
wrong, you'll miss interrupts. If you don't have a GIC, all bets are
off.

I've queued a number of patches to solve this, which I hope to send to
tglx tomorrow (after looking at this weekend test run).

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny.
