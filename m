From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Please remind 'WARNING: about Samsung merge window over'
Date: Mon, 2 Aug 2010 10:22:33 +0100
Message-ID: <20100802092233.GB30670@n2100.arm.linux.org.uk>
References: <003401cb3206$d68a1fc0$839e5f40$%kim@samsung.com> <AANLkTimJvS0djVprEgCJ8k3_SYeaKc72NMNZNrRpqXHi@mail.gmail.com> <20100802073138.GB10608@n2100.arm.linux.org.uk> <AANLkTim1qtiYzvGKKRDcgt-Wds30qVX27GDMcnquOvBP@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:36965 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752846Ab0HBJWp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Aug 2010 05:22:45 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTim1qtiYzvGKKRDcgt-Wds30qVX27GDMcnquOvBP@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, kimty@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, nala.la@samsung.com, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

On Mon, Aug 02, 2010 at 05:35:37PM +0900, Kyungmin Park wrote:
> As the maintainer, he merged his features freely but others can't get
> the chance if the implementation is not fit his taste or company
> policy.
> 
> Look at the example.
> [PATCH v2 0/4] ARM: S5P: Support gpio interrupts
> http://marc.info/?l=linux-arm-kernel&m=127840208508625&w=2
> 
> We need the gpio interrupt support but he refused it since it used too
> many irq. Actually his board don't use this features.
> "It is because there are too many gpio interrupts and having support
> of all of them is unnecessary as realistically only few of them maybe
> used."

>From my count, there's already 144 IRQs, and you'll be adding 27*8 = 216
additional IRQs to that.  That's quite small compared to some platforms
which have in the order of 512 or even 1024 IRQs.

> And current kernel don't support the sparse irq feature. then it's
> reasonable to merge it first and revise it later.

sparse irq support has been queued for almost a month for the merge
window which has just this morning opened.  This doesn't help you if
you instantiate all your 360 interrupts though - just because you
don't _use_ an interrupt which has been declared as existing doesn't
reduce the size of the arrays.

> Another why FIMC support is missing? we modified it as his requested
> and send it properly.
> [PATCH v3 3/8] ARM: Samsung: Add platform definitions and helpers for
> http://marc.info/?l=linux-arm-kernel&m=127990218813931&w=2

This looks like it's been missed.  People get busy and miss things on
the mailing list, there's nothing special about that.

> [PATCH v3 1/8] ARM: Samsung: Add register definitions for Samsung S5P
> http://marc.info/?l=linux-arm-kernel&m=127990218613922&w=2

Kukjin Kim replied to this one with a point requiring an answer, but
nothing came back.

   "Looks ok...however, I'm still thinking whether really need all these
    definitions."

Seems to be a perfectly reasonable point to raise, and if there's no
reply to justify them...
