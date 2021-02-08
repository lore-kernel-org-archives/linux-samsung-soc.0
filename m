Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD6FC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Feb 2021 23:11:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5898C64E82
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Feb 2021 23:11:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhBHXLb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Feb 2021 18:11:31 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:39909 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhBHXLb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 18:11:31 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5895FE0005;
        Mon,  8 Feb 2021 23:10:40 +0000 (UTC)
Date:   Tue, 9 Feb 2021 00:10:40 +0100
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
Message-ID: <20210208231040.GF351084@piout.net>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
 <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
 <YCGBIvRfoP0BeyrP@builder.lan>
 <20210208184230.onhlioflyylkx6xo@kozik-lap>
 <CAK8P3a3bsw8p2Geyo-vh1AJUfMQCCf3kpa_YB+tKmcvWHqRcEw@mail.gmail.com>
 <20210208213537.GA351084@piout.net>
 <CAK8P3a0QRcQM4rH9HgVMOHa_eATXsjRbGDXuMO7FgnA8OgPk0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0QRcQM4rH9HgVMOHa_eATXsjRbGDXuMO7FgnA8OgPk0Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/02/2021 23:14:02+0100, Arnd Bergmann wrote:
> On Mon, Feb 8, 2021 at 10:35 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > On 08/02/2021 20:52:37+0100, Arnd Bergmann wrote:
> > > On Mon, Feb 8, 2021 at 7:42 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > Let me steer the discussion to original topic - it's about old kernel
> > > > and new DTB, assuming that mainline kernel bisectability is not
> > > > affected.
> > > >
> > > > Flow looks like this:
> > > >
> > > > 0. You have existing bidings and drivers.
> > > > 1. Patch changing bindings (with new compatible) and drivers gets
> > > >    accepted by maintainer.
> > > > 2. Patch above (bindings+drivers) goes during merge window to v5.11-rc1.
> > > > 3. Patch changing in-tree DTS to new compatible gets accepted by
> > > >    maintainer and it is sent as v5.12-rc1 material to SoC maintainers.
> > > >
> > > > So again: old kernel, using old bindings, new DTB.
> > > >
> >
> > I don't think forward compatibility was ever considered. I've seen it
> > being mentioned a few times on #armlinux but honestly this simply can't
> > be achieved. This would mean being able to write complete DT bindings
> > for a particular SoC at day 0 which will realistically never happen. You
> > may noteven have a complete datasheet and even if you have a datasheet,
> > it may not be complete or it may be missing hw errata that are
> > discovered later on and need a new binding to handle.
> 
> You do not have to write the correct DT for this, the only requirement
> is that any changes to a node are backward-compatible, which is
> typically the case if you add properties or compatible strings without
> removing the old one. A bugfix in this case is also backward-compatible.
> 
> The part that can not happen instead is to write a DT that can expose
> features that any future kernel will use.
> 

But I think we are speaking about the other way around were you would be
e.g. removing properties or splitting a node is multiple different
nodes following a different understanding of the hardware.
And in this case, any rework of the bindings will be forbidden, like
32b7cfbd4bb2 ("ARM: dts: at91: remove deprecated ADC properties") will
break older kernels trying to use the new dtb.
761f6ed85417 ("ARM: dts: at91: sama5d4: use correct rtc compatible") is
an other case.
I'm not sure want to keep the older properties or the older compatible
string as a fallback for this use case.

> > > However, once the firmware is updated, it may no longer be possible to
> > > go back to the old kernel in case the new one is busted.
> > >
> >
> > Any serious update strategy will update both the kernel and device tree
> > at the same time, exactly like you already have to update the initramfs
> > with the kernel as soon as it is including kernel modules.
> > I would expect any embedded platform to actually use a container format,
> > like a FIT image that will ship the kernel, DT and intiramfs in a single
> > image and will allow to sign all parts.
> 
> Embedded systems that do this have no requirement for backward
> or forward compatibility at all, the only requirement for these is bisectability
> of git commits.
> 

Yes and I can't see any drawbacks in this approach.

> > > A similar problem can happen with the EBBR boot flow that relies on
> > > a uefi-enabled firmware such as a u-boot, while using grub2 as the
> > > actual boot loader. This is commonly supported across distros. While
> > > grub2 can load a matching set of kernel+initrd+dtb from disk and run
> > > that, this often fails in practice because u-boot needs to fill a
> > > board specific set of DT properties (bootargs, detected memory,
> > > mac address, ...). The usual way this gets handled is that u-boot loads
> > > grub2 and the dtb from disk and then passes the modified dtb to grub,
> > > which picks only kernel+initrd from disk and boots this with the dtb.
> > >
> > > The result is similar to case with dtb built into the firmware: after
> > > upgrading the dtb that gets loaded by u-boot, grub can still pick
> > > old kernels but they may not work as they did in the past. There are
> > > obviously ways to work around it, but it does lead to user frustration.
> > >
> >
> > Are there really any platforms with the dtb built into the firmware?
> > I feel like this is a mythical creature used to scare people into keeping
> > the DTB ABI stable. Aren't all the distribution already able to cope
> > with keeping DTB and kernel in sync?
> 
> I think most traditional PowerPC systems fall into this category, most

My understanding was that the traditional PPC systems had a small device
tree and usually are not affected by driver changes but I may be wrong.

> systems that boot using UEFI+grub (as I explained), and anyone who
> uses a distro kernel on custom hardware with their own dtb.
> 

Aren't the ones using a distro kernel with a custom dtb more concerned
by backward compatibility (i.e. new kernel with old dtb) rather than old
kernel on new dtb? If they have an old dtb, an old kernel, and update to
a new kernel, backward compatibility will ensure this continues to work.
If then they work on updating their dtb, they still have the old one and
can make the distribution match dtb and kernel. This is already handled
properly by debian and I guess the other distributions as it is anyway
already matching kernel and initramfs.

This is what I have on my NAS:

$ ls /boot
config-4.12.0-1-marvell  initrd.img-4.12.0-1-marvell  uImage.bak
config-4.13.0-1-marvell  initrd.img-4.13.0-1-marvell  uInitrd
dtb                      initrd.img.old               uInitrd.bak
dtb-4.12.0-1-marvell     lost+found                   vmlinuz
dtb-4.13.0-1-marvell     System.map-4.12.0-1-marvell  vmlinuz-4.12.0-1-marvell
dtbs                     System.map-4.13.0-1-marvell  vmlinuz-4.13.0-1-marvell
initrd.img               uImage                       vmlinuz.old

So dtbs and kernels are already matching even when the dtbs didn't
change between 4.9 and 4.13.

I don't have any solution for the UEFI+grub use case but I will also
question the sanity of doing that ;)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
