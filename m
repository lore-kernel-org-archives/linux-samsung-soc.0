From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: dts: fix split memory bank for SSDK5440
Date: Thu, 20 Dec 2012 16:35:41 -0800
Message-ID: <CAOesGMhVxidvs6Ywxzb=aK0GB0=bJMVfC7BWhXUQiPgeCpndbA@mail.gmail.com>
References: <1356030217-5472-1-git-send-email-kgene.kim@samsung.com>
	<CAOesGMg03Yn=fDr1XqmbBUs=eZO0_8=iti1LUiJ6CX5n1Bm45g@mail.gmail.com>
	<1464138.NEt7mMkYJc@flatron>
	<20121220234146.GF14363@n2100.arm.linux.org.uk>
	<01f801cddf12$9f95c350$dec149f0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:46165 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751344Ab2LUAfn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Dec 2012 19:35:43 -0500
Received: by mail-ie0-f170.google.com with SMTP id k10so5499395iea.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Dec 2012 16:35:43 -0800 (PST)
In-Reply-To: <01f801cddf12$9f95c350$dec149f0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, KyongHo Cho <pullip.cho@samsung.com>

On Thu, Dec 20, 2012 at 4:32 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Russell King - ARM Linux wrote:
>>
>
> [...]
>
>> >
>> > > What's the actual bug caused by this? The description is vague.
>> >
>> > The kernel panics early on NULL pointer dereference in memory
>> > initialization.
>>
>
> (Cc'ed KyongHo Cho)
>
> Yeah, correct. The size of memory bank should be under section size and
> current section size is 256MiB on EXYNOS. So if we don't change the section
> size, each memory bank should be under 256MiB. If not, as Tomasz said,
> kernel panic happens in mem_init().

That's a bug somewhere, the device tree should describe the hardware,
and not necessarily the massaged format that the kernel wants it in to
not trigger a bug.

So I don't want to see this patch merged, I want to see a proper fix
instead, please.

There are also already other exynos platforms and device trees with
more than 256MB in the memory node. Changing all of them this way
seems unreasonable.


-Olof
