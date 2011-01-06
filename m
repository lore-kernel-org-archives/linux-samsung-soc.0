From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC 2/5] ARM: P2V: avoid initializers and assembly using
	PHYS_OFFSET
Date: Thu, 6 Jan 2011 09:08:55 +0000
Message-ID: <20110106090855.GR8638@n2100.arm.linux.org.uk>
References: <20110104202052.GE24935@n2100.arm.linux.org.uk> <E1PaDOv-00023d-Gi@rmk-PC.arm.linux.org.uk> <20110106085145.GB26617@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110106085145.GB26617@pengutronix.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Pitre <nico@fluxnic.net>, Daniel Walker <dwalker@codeaurora.org>, Eric Miao <eric.y.miao@gmail.com>, linux-arm-msm@vger.kernel.org, "Hans J. Koch" <hjk@linutronix.de>, linux-samsung-soc@vger.kernel.org, Bryan Huntsman <bryanh@codeaurora.org>, Amit Kucheria <amit.kucheria@canonical.com>, Sascha Hauer <kernel@pengutronix.de>, Kukjin Kim <kgene.kim@samsung.com>, David Brown <davidb@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jan 06, 2011 at 09:51:45AM +0100, Sascha Hauer wrote:
> As Russell noted this conflicts with the current i.MX branch. In current
> i.MX branch we have:
> 
> -       .boot_params = PHYS_OFFSET + 0x100,
> +       .boot_params = MX51_PHYS_OFFSET + 0x100,
> 
> PLAT_PHYS_OFFSET should be defined to MX51_PHYS_OFFSET, so it shouldn't
> matter which solution to the conflict we choose.

I've actually dropped my modifications to this files as your change
to them makes more sense longer term.
