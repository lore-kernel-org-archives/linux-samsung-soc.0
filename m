From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 00/18] ARM: use const and __initconst for smp_operations
Date: Mon, 24 Aug 2015 22:21:27 +0100
Message-ID: <20150824212127.GH7557@n2100.arm.linux.org.uk>
References: <1440390978-22796-1-git-send-email-yamada.masahiro@socionext.com>
 <CAOesGMjku09wsUmwooq2ZXLyV7CPfioi0oAV5EgvW_wE98VYeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMjku09wsUmwooq2ZXLyV7CPfioi0oAV5EgvW_wE98VYeg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "arm@kernel.org" <arm@kernel.org>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Gregory Clement <gregory.clement@free-electrons.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Kumar Gala <galak@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Jun Nie <jun.nie@linaro.org>, Ray Jui <rjui@broadcom.com>, =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, David Brown <davidb@codeaurora.org>, Scott Branden <sbranden@broadcom.com>, Hans de Goede <hdegoede@redhat.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Aug 24, 2015 at 02:12:06PM -0700, Olof Johansson wrote:
> Easiest of all would probably be to get the sub-arch patches into one
> release, then switch the prototypes and function definitions in the
> next. If you switch prototypes first you'll get a bunch of warnings,
> right?

Wrong way around. :)

If you change the sub-arches to declare the smp operations as const,
and try and pass them into a function which doesn't take a const-pointer,
you'll get a warning.  The core bits need to go in first before the
sub-arch patches.

I think the series has limited value - it allows us to (a) check that a
small quantity of code doesn't write to these things, and (b) allows us
to move the SMP operations structure from __initdata to __initconstdata.
It's still going to end up in the init region which is read/write in any
case, and still gets thrown away.

Given where we are, I don't think we need to rush this in during the
last week before the merge window opens, even though it's trivial.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
