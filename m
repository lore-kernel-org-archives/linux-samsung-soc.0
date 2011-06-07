From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM:SAMSUNG: Move S3C DMA driver to drivers/dma
Date: Tue, 7 Jun 2011 17:35:42 +0900
Message-ID: <BANLkTinDBebMiK9Ezu=QDpC2+rChApd64Q@mail.gmail.com>
References: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com>
	<BANLkTintADbXSiV07VTMbFfmUV+4-q2-gw@mail.gmail.com>
	<BANLkTimjWNf3PxHXj3o5qubH5g7gMHjhFg@mail.gmail.com>
	<20110607081527.GB20929@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:63225 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752334Ab1FGIfo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 04:35:44 -0400
Received: by vxi39 with SMTP id 39so3371366vxi.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2011 01:35:42 -0700 (PDT)
In-Reply-To: <20110607081527.GB20929@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, root <alim.akhtar@samsung.com>

On Tue, Jun 7, 2011 at 5:15 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Tue, Jun 07, 2011 at 01:39:43PM +0530, Jassi Brar wrote:
>> Unfortunately, no. There are some features of Samsung's DMA API that
>> the drivers have come to rely upon.
>> Besides, I am not particularly a fan of the generic API. And IIRC,
>> neither is Ben Dooks, the designer of the
>> Samsung's DMA API.
>
> We are now at the point where this is non-optional. =A0If the generic=
 API
> doesn't fit what Samsung needs, then that needs to be discussed and
> whatever problems there are need to be resolved.
>
> Continuing the platform specific DMA APIs is not sustainable.
>
> I'm getting rather fed up with Samsung needing custom this and that, =
and
> refusing to use the generic infrastructure such as clkdev. =A0This at=
titude
> needs to change NOW.
>
> Fix your platform specific crap and start using the generic services.
>

I think Jassi is the right person to handle this one even though you
don't like the generic DMA APIs

1) since you become a member of linaro. it's role of linaro.
2) know the how to use the s3c-pl330 at sound (most user of DMA is
sound, SPI and MMC)
3) now you're the Samsung Sound maintainer

If we move the generic DMA APIs, it's also need to modify the its
consumer, sound and SPI.

Thank you,
Kyungmin Park
