From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/2] regulator: add device tree support for max8997
Date: Fri, 9 Dec 2011 14:17:21 +0800
Message-ID: <20111209061720.GF26952@opensource.wolfsonmicro.com>
References: <1323361659-11835-1-git-send-email-thomas.abraham@linaro.org>
 <1323361659-11835-2-git-send-email-thomas.abraham@linaro.org>
 <1323361659-11835-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:36422 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751752Ab1LIGR1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Dec 2011 01:17:27 -0500
Content-Disposition: inline
In-Reply-To: <1323361659-11835-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, rpurdie@rpsys.net, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, dg77.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Rajendra Nayak <rnayak@ti.com>

On Thu, Dec 08, 2011 at 09:57:39PM +0530, Thomas Abraham wrote:

> +Required properties, if interrupts are delivered to host system:

These are just optional properties, really.

> +- interrupt-parent: Specifies the phandle of the interrupt controller to which
> +  the interrupts from max8997 are delivered to.
> +- interrupts: Interrupt specifiers for two interrupt sources.
> +  - First interrupt specifier is for 'irq1' interrupt.
> +  - Second interrupt specifier is for 'alert' interrupt.

What if the two are connected to different interrupt controllers?

> +    For LDO's:

Extra '.
