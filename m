Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24AAC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Feb 2021 21:41:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AB5B64DD4
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Feb 2021 21:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236930AbhBHVlu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Feb 2021 16:41:50 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:50519 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236573AbhBHVkm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 16:40:42 -0500
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id CD5613A3E8E
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Feb 2021 21:37:07 +0000 (UTC)
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B154B4000A;
        Mon,  8 Feb 2021 21:35:37 +0000 (UTC)
Date:   Mon, 8 Feb 2021 22:35:37 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Message-ID: <20210208213537.GA351084@piout.net>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
 <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
 <YCGBIvRfoP0BeyrP@builder.lan>
 <20210208184230.onhlioflyylkx6xo@kozik-lap>
 <CAK8P3a3bsw8p2Geyo-vh1AJUfMQCCf3kpa_YB+tKmcvWHqRcEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3bsw8p2Geyo-vh1AJUfMQCCf3kpa_YB+tKmcvWHqRcEw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello,

On 08/02/2021 20:52:37+0100, Arnd Bergmann wrote:
> On Mon, Feb 8, 2021 at 7:42 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > Let me steer the discussion to original topic - it's about old kernel
> > and new DTB, assuming that mainline kernel bisectability is not
> > affected.
> >
> > Flow looks like this:
> >
> > 0. You have existing bidings and drivers.
> > 1. Patch changing bindings (with new compatible) and drivers gets
> >    accepted by maintainer.
> > 2. Patch above (bindings+drivers) goes during merge window to v5.11-rc1.
> > 3. Patch changing in-tree DTS to new compatible gets accepted by
> >    maintainer and it is sent as v5.12-rc1 material to SoC maintainers.
> >
> > So again: old kernel, using old bindings, new DTB.
> >

I don't think forward compatibility was ever considered. I've seen it
being mentioned a few times on #armlinux but honestly this simply can't
be achieved. This would mean being able to write complete DT bindings
for a particular SoC at day 0 which will realistically never happen. You
may noteven have a complete datasheet and even if you have a datasheet,
it may not be complete or it may be missing hw errata that are
discovered later on and need a new binding to handle.

> > Another case is where out-of-tree user of bindings, e.g. FreeBSD, takes
> > new DTS (at point of #3 above or later) but did not take the bindings.
> > Such system would be broken but it's their fault - they took DTS without
> > taking the bindings (which were there already for one release!).
> 
> The particular boot flow that I am worried about here is when the dtb and
> kernel are not updated in sync. Traditionally this happens when the dtb
> is contained in the firmware image or generated by the firmware, as would
> be the case on any server class system, but also on embedded systems
> that can run an upstream kernel but without having the dts contributed
> into the kernel sources.
> 
> When you have this case, you can install a working system, and install
> an upgraded kernel without problems. You might then want to update the
> firmware as well, in order to take advantage of the features implemented
> in the kernel kernel that require a DT description. Again, no problem.
> 
> However, once the firmware is updated, it may no longer be possible to
> go back to the old kernel in case the new one is busted.
> 

Any serious update strategy will update both the kernel and device tree
at the same time, exactly like you already have to update the initramfs
with the kernel as soon as it is including kernel modules.
I would expect any embedded platform to actually use a container format,
like a FIT image that will ship the kernel, DT and intiramfs in a single
image and will allow to sign all parts.

> A similar problem can happen with the EBBR boot flow that relies on
> a uefi-enabled firmware such as a u-boot, while using grub2 as the
> actual boot loader. This is commonly supported across distros. While
> grub2 can load a matching set of kernel+initrd+dtb from disk and run
> that, this often fails in practice because u-boot needs to fill a
> board specific set of DT properties (bootargs, detected memory,
> mac address, ...). The usual way this gets handled is that u-boot loads
> grub2 and the dtb from disk and then passes the modified dtb to grub,
> which picks only kernel+initrd from disk and boots this with the dtb.
> 
> The result is similar to case with dtb built into the firmware: after
> upgrading the dtb that gets loaded by u-boot, grub can still pick
> old kernels but they may not work as they did in the past. There are
> obviously ways to work around it, but it does lead to user frustration.
> 

Are there really any platforms with the dtb built into the firmware? I
feel like this is a mythical creature used to scare people into keeping
the DTB ABI stable. Aren't all the distribution already able to cope
with keeping DTB and kernel in sync?

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
