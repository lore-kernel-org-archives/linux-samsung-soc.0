From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 00/18] ARM: use const and __initconst for smp_operations
Date: Mon, 24 Aug 2015 14:12:06 -0700
Message-ID: <CAOesGMjku09wsUmwooq2ZXLyV7CPfioi0oAV5EgvW_wE98VYeg@mail.gmail.com>
References: <1440390978-22796-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440390978-22796-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "arm@kernel.org" <arm@kernel.org>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Gregory Clement <gregory.clement@free-electrons.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Kumar Gala <galak@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Jun Nie <jun.nie@linaro.org>, Ray Jui <rjui@broadcom.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, David Brown <davidb@codeaurora.org>, Scott Branden <sbranden@broadcom.com>, Hans de Goede <hdegoede@redhat.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Broadcom Kernel Feedback List <bcm-kernel-feedbac>
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Aug 23, 2015 at 9:36 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Currently, SoC code can not add const qualifier to smp_operations
> structures although they are never over-written.
>
> 01/18 and 02/18 add small changes to the ARM core to fix that.
> The rest of this series replace "__initdata" with "const ... __initconst"
> for each of SoC code.
>
> I split this series into per-SoC so that each sub-arch maintainer
> can easily give their Acked-by.  (Is this better?)

When you split, chances are each sub-arch maintainer will apply
instead of ack. If that's what you want, that's fine.

> Russell, Olof, and Arnd:
>
> How should this series be applied (if it looks good)?
> The first two are ARM-tree wide and looks like in the field of Russell.
> The rest are highly SoC-related.

Easiest of all would probably be to get the sub-arch patches into one
release, then switch the prototypes and function definitions in the
next. If you switch prototypes first you'll get a bunch of warnings,
right?


-Olof
