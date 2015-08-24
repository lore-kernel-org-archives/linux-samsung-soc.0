From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 00/18] ARM: use const and __initconst for smp_operations
Date: Mon, 24 Aug 2015 14:44:21 -0700
Message-ID: <CAOesGMgayep0EgCAdDWSujmiycDqtFUb0iKg-aioJqyzHRectA@mail.gmail.com>
References: <1440390978-22796-1-git-send-email-yamada.masahiro@socionext.com>
	<CAOesGMjku09wsUmwooq2ZXLyV7CPfioi0oAV5EgvW_wE98VYeg@mail.gmail.com>
	<20150824212127.GH7557@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f178.google.com ([209.85.160.178]:34275 "EHLO
	mail-yk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752361AbbHXVoW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 17:44:22 -0400
Received: by ykdt205 with SMTP id t205so137080506ykd.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Aug 2015 14:44:21 -0700 (PDT)
In-Reply-To: <20150824212127.GH7557@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "arm@kernel.org" <arm@kernel.org>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Gregory Clement <gregory.clement@free-electrons.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Kumar Gala <galak@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Jun Nie <jun.nie@linaro.org>, Ray Jui <rjui@broadcom.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, David Brown <davidb@codeaurora.org>, Scott Branden <sbranden@broadcom.com>, Hans de Goede <hdegoede@redhat.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>B

On Mon, Aug 24, 2015 at 2:21 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Mon, Aug 24, 2015 at 02:12:06PM -0700, Olof Johansson wrote:
>> Easiest of all would probably be to get the sub-arch patches into one
>> release, then switch the prototypes and function definitions in the
>> next. If you switch prototypes first you'll get a bunch of warnings,
>> right?
>
> Wrong way around. :)
>
> If you change the sub-arches to declare the smp operations as const,
> and try and pass them into a function which doesn't take a const-pointer,
> you'll get a warning.  The core bits need to go in first before the
> sub-arch patches.

Ah yes, my bad.

> I think the series has limited value - it allows us to (a) check that a
> small quantity of code doesn't write to these things, and (b) allows us
> to move the SMP operations structure from __initdata to __initconstdata.
> It's still going to end up in the init region which is read/write in any
> case, and still gets thrown away.
>
> Given where we are, I don't think we need to rush this in during the
> last week before the merge window opens, even though it's trivial.

Agreed. So if you pick it up for 4.4, we'll get the rest for 4.5.


-Olof
