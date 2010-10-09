From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 3/3] ARM: S5PV310: Add external interrupt support
Date: Sat, 9 Oct 2010 11:16:46 +0100
Message-ID: <20101009101646.GC20975@n2100.arm.linux.org.uk>
References: <1286450698-12029-1-git-send-email-jongsun.han@samsung.com> <1286450698-12029-4-git-send-email-jongsun.han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:38617 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754381Ab0JIKRH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Oct 2010 06:17:07 -0400
Content-Disposition: inline
In-Reply-To: <1286450698-12029-4-git-send-email-jongsun.han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jongsun Han <jongsun.han@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, Jongpill Lee <boyko.lee@samsung.com>, ben-linux@fluff.org

On Thu, Oct 07, 2010 at 08:24:58PM +0900, Jongsun Han wrote:
> +static unsigned int s5pv310_irq_split(unsigned int number)
> +{
> +	u32 ret;
> +	u32 test = number;
> +
> +	ret = do_div(test, IRQ_EINT_BASE);
> +
> +	do_div(ret, 8);
> +
> +	return ret;
> +}
> +
> +static unsigned int s5pv310_irq_to_bit(unsigned int irq)
> +{
> +	u32 ret;
> +	u32 tmp;
> +
> +	tmp = do_div(irq, IRQ_EINT_BASE);
> +
> +	ret = do_div(tmp, 8);
> +
> +	return 1 << ret;
> +}

These are a silly use of do_div().  do_div() is for 64-bit modulus/division,
not 32-bit.  If you want to do 32-bit, then use the normal C maths.

What the above equates to is:

        tmp = irq % IRQ_EINT_BASE;
        ret = tmp % 8;

However, I don't think you want to do modulus operations there at all.
What I think you actually want is:

	return 1 << ((irq - IRQ_EINT_BASE) % 7);

noting that the compiler will optimize this to a subtract and bit-wise and
operation.

For the former:

	return ((irq - IRQ_EINT_BASE) / 8);

noting that the compiler will optimize this to a subtract and shift.
