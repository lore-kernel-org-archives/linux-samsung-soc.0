From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: Please remind 'WARNING: about Samsung merge window over'
Date: Mon, 2 Aug 2010 17:35:37 +0900
Message-ID: <AANLkTim1qtiYzvGKKRDcgt-Wds30qVX27GDMcnquOvBP@mail.gmail.com>
References: <003401cb3206$d68a1fc0$839e5f40$%kim@samsung.com>
	<AANLkTimJvS0djVprEgCJ8k3_SYeaKc72NMNZNrRpqXHi@mail.gmail.com>
	<20100802073138.GB10608@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:63199 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752555Ab0HBIfm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Aug 2010 04:35:42 -0400
Received: by qwh6 with SMTP id 6so1340382qwh.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Aug 2010 01:35:41 -0700 (PDT)
In-Reply-To: <20100802073138.GB10608@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, nala.la@samsung.com, kimty@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>

On Mon, Aug 2, 2010 at 4:31 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Mon, Aug 02, 2010 at 03:24:13PM +0900, Kyungmin Park wrote:
>> Absurd !!!
>>
>> Did you mentioned that samsung merge window over before?
>> why it's reminder mail? it's unilateral notification at this time.
>
> It's standard Linux kernel development procedure.
>
> The merge window is not for new code - the merge window is for code which
> has already been merged by maintainers to submit it to Linus in an orderly
> manner and fixup any conflicts which may occur.
>
> New code which hasn't been reviewed by the beginning of the merge window
> and which hasn't been in linux-next for a _reasonable_ amount of time
> should wait until the following merge window unless there's a _very_ good
> reason to make an exception.

I don't complain the merge window procedure. Even though follow the
normal procedure, send the patches and reviewed before the merge
windows. it's not included at this merge window. Our team tries to
include some features but will wait next merge window. Frankly I'm not
sure our implementation can be merged since he focus on their the
latest chip but I want to cover the existing chips even though it's
not released outside.

As the maintainer, he merged his features freely but others can't get
the chance if the implementation is not fit his taste or company
policy.

Look at the example.
[PATCH v2 0/4] ARM: S5P: Support gpio interrupts
http://marc.info/?l=linux-arm-kernel&m=127840208508625&w=2

We need the gpio interrupt support but he refused it since it used too
many irq. Actually his board don't use this features.
"It is because there are too many gpio interrupts and having support
of all of them is unnecessary as realistically only few of them maybe
used."
And current kernel don't support the sparse irq feature. then it's
reasonable to merge it first and revise it later.

Another why FIMC support is missing? we modified it as his requested
and send it properly.
[PATCH v3 3/8] ARM: Samsung: Add platform definitions and helpers for
http://marc.info/?l=linux-arm-kernel&m=127990218813931&w=2
[PATCH v3 1/8] ARM: Samsung: Add register definitions for Samsung S5P
http://marc.info/?l=linux-arm-kernel&m=127990218613922&w=2

I want to listen other maintainers opinions.

Thank you,
Kyungmin Park
