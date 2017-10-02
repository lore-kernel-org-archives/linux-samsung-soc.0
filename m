From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/3] ARM: dts: exynos: Add support for Hardkernel's
 Odroid HC1 board
Date: Mon, 2 Oct 2017 18:54:38 +0200
Message-ID: <20171002165438.lkp6iotmxuvn3bvn@kozik-lap>
References: <1506684783-9722-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170929113314eucas1p250037030204ab9d0f936afa6f660923f@eucas1p2.samsung.com>
 <1506684783-9722-3-git-send-email-m.szyprowski@samsung.com>
 <20170930172320.trklynm33x2ra75g@kozik-lap>
 <5166bb0e-41f9-a010-70ae-161abb26382d@samsung.com>
 <CAJKOXPek9ZOZaWzD=pP2pJDdKzmdF3ZQJLL=R-AVKOTMCEJyTQ@mail.gmail.com>
 <3167245f-af6d-3919-e471-9a0f5ba214d6@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36987 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751951AbdJBQym (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 12:54:42 -0400
Received: by mail-wm0-f68.google.com with SMTP id 196so1605897wmp.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Oct 2017 09:54:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <3167245f-af6d-3919-e471-9a0f5ba214d6@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Mon, Oct 02, 2017 at 08:59:34AM +0200, Marek Szyprowski wrote:
> 
> 
> On 2017-10-02 08:44, Krzysztof Kozlowski wrote:
> > On Mon, Oct 2, 2017 at 8:34 AM, Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> > > Hi Krzysztof,
> > > 
> > > On 2017-09-30 19:23, Krzysztof Kozlowski wrote:
> > > > On Fri, Sep 29, 2017 at 01:33:02PM +0200, Marek Szyprowski wrote:
> > > > > Odroid HC1 board is based on Odroid XU4 board, but it has no HDMI,
> > > > > no eMMC, no build-in USB3.0 hub, no extension port pins, and no GPIO
> > > > > button. USB3.0 ports are used for build-in JMicron USB to SATA bridge
> > > > > and Gigabit R8152 ethernet chips. HC1 uses only passive cooling.
> > > > > 
> > > > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > > ---
> > > > >    arch/arm/boot/dts/Makefile                         |   1 +
> > > > >    arch/arm/boot/dts/exynos5422-odroid-core.dtsi      | 443
> > > > > +++++++++++++++++++++
> > > > >    arch/arm/boot/dts/exynos5422-odroidhc1.dts         | 217 ++++++++++
> > > > >    arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 428
> > > > > +-------------------
> > > > Please experiment with -M (maybe -M20%?) and -B so this would be
> > > > detected as rename. It might create much simpler patch thus making the
> > > > review easy (one could see that the changes are just movements).
> > > 
> > > I didn't manage to generate different patch with those options. I have
> > > however checked that odroidxu3/xu3-lite/xu4 dtbs are exactly the same after
> > > applying this patch (using dtx_diff tool).
> > Then it looks like the same issue as here:
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2017-January/477315.html
> > 
> > You are using some ancient git (v1.9.1) which was released more than
> > three years ago. March 2014. As Andi pointed in that thread - he had
> > no problems with -M and -B on newer version.
> 
> 3 years old software is not really an ancient software - it a stable version
> from LTS distro. Unless you need some newly added features it is imho fine
> to
> use for your DAILY work. Anyway, I've just checked with git v2.14.2 and it
> generates exactly the same diffs.

I also experimented (including -C and --find-copies-harder) but indeed
git did not want to detect the copy. Anyway thanks for trying and
confirming with dtx_diff.

Best regards,
Krzysztof
