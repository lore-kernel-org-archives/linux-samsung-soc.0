From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4 03-1/13] DMA: PL330: Support DMA_SLAVE_CONFIG command
Date: Fri, 22 Jul 2011 15:59:35 +0200
Message-ID: <CACRpkdY3=3evfub=W-5hzW-MkYiTiCtO96egvdBamkrwOPyhWg@mail.gmail.com>
References: <1311158773-30314-1-git-send-email-boojin.kim@samsung.com>
	<1311158773-30314-3-git-send-email-boojin.kim@samsung.com>
	<CABb+yY2_XKyCr2mEzqd0bCYJk3U7+sg8Xz4b4ma2KB1BconYOw@mail.gmail.com>
	<20110721081138.GL26574@n2100.arm.linux.org.uk>
	<CABb+yY2obv5JMBiRSXS-4tSCYX+7nVVaA0Q7gurA+NndrGVuvA@mail.gmail.com>
	<CACRpkdaP5D=URqAXAytm9s2e9HRVMB-MzsKZeLJ9v6ktkJUCRA@mail.gmail.com>
	<CABb+yY2wTj5i-koQhD+dqNWaL4TvUYk1XP3YT0jE3oDZT57U4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:50867 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754479Ab1GVN7h convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Jul 2011 09:59:37 -0400
Received: by qyk9 with SMTP id 9so1301498qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Jul 2011 06:59:36 -0700 (PDT)
In-Reply-To: <CABb+yY2wTj5i-koQhD+dqNWaL4TvUYk1XP3YT0jE3oDZT57U4g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Boojin Kim <boojin.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

On Thu, Jul 21, 2011 at 4:28 PM, Jassi Brar <jassisinghbrar@gmail.com> =
wrote:
> [Me]
>> Therefore I introduced this to confine the different registers into
>> the driver itself and ask the DMA engine to transfer to a specific
>> address.
>
> While that does make sense, it makes mandatory the ritual of calling
> DMA_SLAVE_CONFIG mandatory for most of the cases.
> And I think the effort to set fifo_addr for peripherals is overrated.

Oh well. I beg to differ, maybe I'm poisoned by stuff like this:
http://en.wikipedia.org/wiki/Encapsulation_%28object-oriented_programmi=
ng%29
so let's say we agree to disagree on this then.

> Of course there are ways to set the direction... but whatever we do
> it can't really be changed from what h/w can only do.
> And that is my point. =A0Let clients not bother trying to 'configure'=
 what is
> the only supported option by h/w.

The interface is generic, and as is demonstrated in the U300 COH901318
and also I think ARM RealView and Versatile reference designs, the
DMA channel for the MMCI block is bidirectional, so you really change
the direction of the channel at runtime, it's not like I'm making it up
and introducing that possibility just for fun :-D

So the generic case is that you can request a direction for the channel=
,
and if the hardware doesn't support that, then NAK any tries to set it
to a direction which is illegal.

Yes, some abstraction but generalization does have a price, and I think
it's worth it.

Yours,
Linus Walleij
