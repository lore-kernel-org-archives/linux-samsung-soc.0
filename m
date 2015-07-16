From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2 06/13] irqchip: kill off set_irq_flags usage
Date: Thu, 16 Jul 2015 21:34:39 +0100
Message-ID: <20150716203439.GN7557@n2100.arm.linux.org.uk>
References: <1436711211-18223-1-git-send-email-robh@kernel.org>
 <1436711211-18223-7-git-send-email-robh@kernel.org>
 <alpine.DEB.2.11.1507121737030.20072@nanos>
 <20150716132632.GK7557@n2100.arm.linux.org.uk>
 <87pp3rj3uj.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:47609 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756135AbbGPUey (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jul 2015 16:34:54 -0400
Content-Disposition: inline
In-Reply-To: <87pp3rj3uj.fsf@belgarion.home>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, arm@kernel.org, Alexander Shiyan <shc_work@mail.ru>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-rpi-kernel@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>

On Thu, Jul 16, 2015 at 09:32:20PM +0200, Robert Jarzmik wrote:
> For PXA I must admit I don't yet know. I know lubbock has an UCB1400, but I
> don't have it working yet, so I can't foresee the problems yet.

The UCB1400 is an AC'97 device which is quite different from its
predecessors, and is not supported by the UCB1x00 driver.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
