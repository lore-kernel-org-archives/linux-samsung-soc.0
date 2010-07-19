From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 3/4] ARM: SAMSUNG SoC: Clock Framework: Flag Support
	for struct clk.
Date: Mon, 19 Jul 2010 09:57:30 +0100
Message-ID: <20100719085730.GA8641@n2100.arm.linux.org.uk>
References: <1279528236-6076-1-git-send-email-myungjoo.ham@samsung.com> <1279528236-6076-2-git-send-email-myungjoo.ham@samsung.com> <1279528236-6076-3-git-send-email-myungjoo.ham@samsung.com> <1279528236-6076-4-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:44092 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760216Ab0GSI5t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jul 2010 04:57:49 -0400
Content-Disposition: inline
In-Reply-To: <1279528236-6076-4-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org

On Mon, Jul 19, 2010 at 05:30:35PM +0900, MyungJoo Ham wrote:
> +#ifdef CONFIG_SAMSUNG_POWERDOMAIN
> +		if ((clk->flags | CLKFLAGS_BOOT_ON) &&

This is always true if CLKFLAGS_BOOT_ON is non-zero.

> +				!(clk->flags | CLKFLAGS_CANNOT_DISABLE)) {

This is always false if CLKFLAGS_CANNOT_DISABLE is non-zero.

> +		if (clk->enable && !(clk->flags | CLKFLAGS_CANNOT_DISABLE))

Always false...
