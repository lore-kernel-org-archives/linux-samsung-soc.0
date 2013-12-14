From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH CRITICAL] ARM: s3c64xx: dt: Fix boot failure due to double
 clock initialization
Date: Fri, 13 Dec 2013 21:50:29 -0800
Message-ID: <CAOesGMgj1mOp+TnazcEd98NPdTQ=Mm-zbD4jMuAeZfx8V9MPzQ@mail.gmail.com>
References: <1386964779-29457-1-git-send-email-tomasz.figa@gmail.com>
	<201312140400.16794.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:51291 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751088Ab3LNFua (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Dec 2013 00:50:30 -0500
Received: by mail-qc0-f174.google.com with SMTP id n7so2199824qcx.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2013 21:50:29 -0800 (PST)
In-Reply-To: <201312140400.16794.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

On Fri, Dec 13, 2013 at 7:00 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Friday 13 December 2013, Tomasz Figa wrote:
>> Commit
>>
>> 4178bac ARM: call of_clk_init from default time_init handler
>>
>> added implicit call to of_clk_init() from default time_init callback,
>> but it did not change platforms calling it from other callbacks, despite
>> of not having custom time_init callbacks. This caused double clock
>> initialization on such platforms, leading to boot failures. An example
>> of such platform is mach-s3c64xx.
>>
>> This patch fixes boot failure on s3c64xx by dropping custom init_irq
>> callback, which had a call to of_clk_init() and moving system reset
>> initialization to init_machine callback. This allows us to have
>> clocks initialized properly without a need to have custom init_time or
>> init_irq callbacks.
>>
>> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
>
> I see of_clk_init(NULL) getting called on two other ARM platforms:
>
> $ git grep -w of_clk_init arch/arm
> arch/arm/kernel/time.c:         of_clk_init(NULL);
> arch/arm/mach-keystone/pm_domain.c:     of_clk_init(NULL);
> arch/arm/mach-mvebu/armada-370-xp.c:    of_clk_init(NULL);
> arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c:        of_clk_init(NULL);
>
> Are the other two platforms ok here?
>
> I assume that mvebu is fine since Sebastian would have noticed breaking
> that one and it has a custom init_time function, but keystone seems
> broken in the same way as s3c64xx. Santosh, can you have a look?

Yeah, and Free Electrons also sent two systems to Kevin so he has them
in his boot test setup, and they're still happy there. Keystone lacks
such coverage though, so Santosh will need to check.


-Olof
