From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: arm: Explicitly mark Samsung Exynos SoC
 as unstable
Date: Fri, 31 Aug 2018 16:02:00 +0200
Message-ID: <CAJKOXPfi8_G9LcjVCJU+N6BNwQSvkVOrBuqeqxsx_EihzU+cpQ@mail.gmail.com>
References: <20180830180205.18121-1-krzk@kernel.org> <20180831104048.GA6545@jack.zhora.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831104048.GA6545@jack.zhora.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Shyti <andi@etezian.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org, pankaj.dubey@samsung.com, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Seung Woo Kim <sw0312.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, s.nawrocki@samsung.com, alim.akhtar@samsung.com, arnd@arndb.de, olof@lixom.net
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 31 Aug 2018 at 13:18, Andi Shyti <andi@etezian.org> wrote:
>
> Hi Krzysztof,
>
> On Thu, Aug 30, 2018 at 08:02:05PM +0200, Krzysztof Kozlowski wrote:
> > Samsung Exynos SoCs and boards related bindings evolved since the initial
> > introduction, but initially the bindings were minimal and a bit incomplete
> > (they never described all the hardware modules available in the SoCs).
> > Since then some significant (not fully compatible) changes have been
> > already committed a few times (like gpio replaced by pinctrl, display ddc,
> > mfc reserved memory, some core clocks added to various hardware modules,
> > added more required nodes).
> >
> > On the other side there are no boards which have device tree embedded in
> > the bootloader. Device tree blob is always compiled from the kernel tree
> > and updated together with the kernel image.
> >
> > Thus to avoid further adding a bunch of workarounds for old/missing
> > bindings, make development of new platforms easier and allow to make
> > cleanup of the existing code and device tree files, lets mark some
> > Samsung Exynos SoC platform bindings as unstable. This means that
> > bindings can may change at any time and users should use the dtb file
>            ^^^^^^^
> you have a typo here, other than that I agree with the patch:
>
> Acked-by: Andi Shyti <andi@etezian.org>

Thanks for spotting this.

Krzysztof
