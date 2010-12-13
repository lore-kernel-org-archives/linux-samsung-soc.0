From: Abhijeet Dharmapurikar <adharmap@codeaurora.org>
Subject: Re: [PATCH 0/5] ARM: GIC: cleanup
Date: Mon, 13 Dec 2010 09:23:29 -0800
Message-ID: <4D065691.9010802@codeaurora.org>
References: <20101205113311.GC9138@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254]:36435 "EHLO
	wolverine01.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752611Ab0LMRX3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Dec 2010 12:23:29 -0500
In-Reply-To: <20101205113311.GC9138@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Anton Vorontsov <avorontsov@mvista.com>, Bryan Huntsman <bryanh@codeaurora.org>, Colin Cross <ccross@android.com>, Daniel Walker <dwalker@codeaurora.org>, David Brown <davidb@codeaurora.org>, Erik Gilling <konkers@android.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, Olof Johansson <olof@lixom.net>, Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>, Tony Lindgren <tony@atomide.com>

Sorry for being late on testing this out. The patch series and works on 
the msm 8660.

Acked-By: Abhijeet Dharmapurikar <adharmap@codeaurora.org>


Russell King - ARM Linux wrote:
> This patch series cleans up the GIC code, consolidating some of the
> per-platform practices into the common GIC code.
> 
> One notable change is to the initialization methods - we used to
> require platforms to pass in the address of the per-CPU interfaces
> despite them always being identical between all cores.  This was
> nonsense, as even in the extremely unlikely event that they were
> different, we aren't storing them in a per-CPU manner.
> 
> The GIC initialization methods are now simpler: one call to gic_init()
> from the boot CPU, and a call to gic_secondary_init() as each
> secondary CPU starts - and no need for platforms to keep track of
> the address anymore.

--
"Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum."
