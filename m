From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 2/4] ARM: S5PV210: Powerdomain/Clock-gating Support
Date: Mon, 19 Jul 2010 10:02:41 +0100
Message-ID: <20100719090241.GB8641@n2100.arm.linux.org.uk>
References: <1279528236-6076-1-git-send-email-myungjoo.ham@samsung.com> <1279528236-6076-2-git-send-email-myungjoo.ham@samsung.com> <1279528236-6076-3-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:53046 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760216Ab0GSJDB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jul 2010 05:03:01 -0400
Content-Disposition: inline
In-Reply-To: <1279528236-6076-3-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org

On Mon, Jul 19, 2010 at 05:30:34PM +0900, MyungJoo Ham wrote:
> +static int powerdomain_set(struct powerdomain *pd, int enable)
> +{
> +	unsigned long ctrlbit;
> +	void __iomem *reg;
> +	void __iomem *stable_reg;
> +	unsigned long reg_dat;
> +
> +	if (pd == NULL)
> +		return -EINVAL;

If someone calls this function with a NULL pd argument, is it better
to ignore it, or better to use WARN_ON and get a backtrace so it can
be fixed?  I don't see much reason for this function to ever be called
with a NULL powerdomain argument.

> +
> +	ctrlbit = pd->pd_ctrlbit;
> +	reg = (void __iomem *)pd->pd_reg;
> +	stable_reg = (void __iomem *)pd->pd_stable_reg;

Why not ensure that the element in the structure is correctly typed to
start with?

It's good practice to avoid casts whenever-possible - they hide bugs.
