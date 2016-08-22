From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: Fix broken architected timer interrupt
 trigger
Date: Mon, 22 Aug 2016 11:26:33 +0100
Message-ID: <57BAD359.30707@arm.com>
References: <1470045256-9032-1-git-send-email-marc.zyngier@arm.com>
 <1470045256-9032-3-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:50655 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750839AbcHVK0k (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 06:26:40 -0400
In-Reply-To: <1470045256-9032-3-git-send-email-marc.zyngier@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Rutland <marc.rutland@arm.com>, Liu Gang <Gang.Liu@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Hou Zhiqiang <B48286@freescale.com>, Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>, Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Ray Jui <rjui@broadcom.com>, Tirumalesh Chalamarla <tchalamarla@cavium.com>l

Arnd, Olof,

On 01/08/16 10:54, Marc Zyngier wrote:
> The ARM architected timer specification mandates that the interrupt
> associated with each timer is level triggered (which corresponds to
> the "counter >= comparator" condition).
> 
> A number of DTs are being remarkably creative, declaring the interrupt
> to be edge triggered. A quick look at the TRM for the corresponding ARM
> CPUs clearly shows that this is wrong, and I've corrected those.
> For non-ARM designs (and in the absence of a publicly available TRM),
> I've made them active low as well, which can't be completely wrong
> as the GIC cannot disinguish between level low and level high.
> 
> The respective maintainers are of course welcome to prove me wrong.
> 
> While I was at it, I took the liberty to fix a couple of related issue,
> such as some spurious affinity bits on ThunderX, and their complete
> absence on ls1043a (both of which seem to be related to copy-pasting
> from other DTs).
> 
> Acked-by: Duc Dang <dhdang@apm.com>
> Acked-by: Carlo Caione <carlo@endlessm.com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Acked-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>

Any update on this patch? We have a workaround merged already, but it'd
be good to have the DTS fixed as well.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
