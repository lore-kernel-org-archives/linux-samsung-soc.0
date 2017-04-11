From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [GIT PULL] mfd: exynos-lpass: Pinctrl dependency
Date: Tue, 11 Apr 2017 12:57:16 +0100
Message-ID: <20170411115716.ahvcgwexaud2hhv7@dell>
References: <1490256207-10061-1-git-send-email-m.szyprowski@samsung.com>
 <20170328154217.5405-1-krzk@kernel.org>
 <20170403101824.rpvkqzyigonyi77p@dell>
 <CAJKOXPeVOMBZxXeh7=oXbgnxSrUtHa86eAtP2BppY=G4Uygarg@mail.gmail.com>
 <20170404095054.7m6nf6bxweskabuu@dell>
 <20170404095751.GA28977@kozik-book>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:35284 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751248AbdDKL5V (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Apr 2017 07:57:21 -0400
Received: by mail-wm0-f44.google.com with SMTP id w64so61544670wma.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Apr 2017 04:57:20 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170404095751.GA28977@kozik-book>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

On Tue, 04 Apr 2017, Krzysztof Kozlowski wrote:

> On Tue, Apr 04, 2017 at 10:50:54AM +0100, Lee Jones wrote:
> > On Tue, 04 Apr 2017, Krzysztof Kozlowski wrote:
> > 
> > > On Mon, Apr 3, 2017 at 12:18 PM, Lee Jones <lee.jones@linaro.org> wrote:
> > > > On Tue, 28 Mar 2017, Krzysztof Kozlowski wrote:
> > > >
> > > >>
> > > >> Hi Lee,
> > > >>
> > > >>
> > > >> This is dependency for mfd/exynos-lpass driver changes from Marek Szyprowski.
> > > >> That's a material for v4.12 and I will be pushing this later to Linus Walleij.
> > > >
> > > > This does not work, and *may* still break.
> > > >
> > > > The only way to guarantee the order of the patches is to have them
> > > > *all* as part of the pull-request.  Not just some of them.
> > > 
> > > What do you mean exactly? If these two patches come through my tree
> > > first, then everything will work fine because they do not break any
> > > other stuff.
> > > 
> > > If you pull it and apply the rest on top, then it should also work
> > > without problems because your history will contain everything needed
> > > in proper order.
> > > 
> > > In both cases bisectability is preserved. Did I missed something?
> > 
> > Okay, so you're suggesting that I rebase MFD *on-top* of your PR.  That
> > does work for me because I insist on being able to re-work my tree at
> > any time.  However, be aware that some Maintainers do not work this
> > way, thus *normally* you will have to send PR containing all of the
> > dependant patches.
> 
> You could either rebased on top of this PR or merge it before applying
> rest of patches. It does not matter because in both cases all dependant
> patches will be after the dependency. Also in both cases you will be
> sending them in your PR.
> 
> You can then rebase your stuff as well, keeping only the external
> commits untouced and merged.

Right.  As I say, it does work for me because I always rebase MFD
patches on-top of the immutable branches.

What time trying to say is that, some Maintainers treat their master
branches as stable once they get pushed, so this style of "pull this
and apply it as a base for patches already in your tree" pull-request
will not work for some.

> Really, that does not differ from all your stable immutable branches you
> have been providing for other folks.

No, this is different.  When I create a pull-request it always
contains *all* of the dependencies, so it can be pulled in before or
after any other patches.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
