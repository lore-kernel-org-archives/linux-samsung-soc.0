Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F76C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 30 Jan 2021 14:42:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71F7F64E13
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 30 Jan 2021 14:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbhA3OlW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 30 Jan 2021 09:41:22 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:36394 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbhA3Okj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 Jan 2021 09:40:39 -0500
Received: by mail-wr1-f43.google.com with SMTP id 6so11757659wri.3;
        Sat, 30 Jan 2021 06:40:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=toyADgBs77KWMrUzGXORbm1xWjNSt2+HxxB19hddPcI=;
        b=pAOcwnLHj/9Bz77vdxgkXTOHOnyAlOn4lgvu5saI5VI9pSkOz/ZnHzM68frilf/6Xt
         Je5YDNjLVYgqemOCzLGKkKovyomCb7dX6rc0RbKvAWuen8pcsSX1qxlhwh4a/quv/eSU
         1hRnDR4QJBlg2GaD2XH5JgZkg6+8zadzSaBlSYeF5c1GJbUPfSVw/5EkQy2nApErYMwg
         EmkBNgQzTWmfB+OX8rFawqYMEQN5SXxGOEetr1kjQxu68kBPqOecGjB2JXsecYsFE75H
         luYqcnPZFntGr9brZyBkrxfIT1t3AapmAXHyTPYFDy1r7f6py33X7PGb7Xql0TVMTxNa
         CmYQ==
X-Gm-Message-State: AOAM532oBkWbTRvRjYfvg6mz9VHUpIYlV7bTyQOr+IRw2KK2t9MLn6k8
        W6wz1j1OgRnHfgIq+p97/g2vaiLutAU=
X-Google-Smtp-Source: ABdhPJyLdOEe0cgXKteJqWx4SPUTK5dGGTgaiP4yw555INCPsFAeiI+fpAkjeeJrl2+H3flWK+KoHQ==
X-Received: by 2002:adf:b78d:: with SMTP id s13mr9906129wre.344.1612017592360;
        Sat, 30 Jan 2021 06:39:52 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id z1sm18117238wru.70.2021.01.30.06.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 06:39:51 -0800 (PST)
Date:   Sat, 30 Jan 2021 15:39:49 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: use Exynos5420 dedicated USB2 PHY
 compatible
Message-ID: <20210130143949.aamac2724esupt7v@kozik-lap>
References: <20201120085637.7299-1-m.szyprowski@samsung.com>
 <CGME20201120085652eucas1p1da360ab03f5b5b02a197d0f1ee435737@eucas1p1.samsung.com>
 <20201120085637.7299-3-m.szyprowski@samsung.com>
 <20201120110503.GB26836@kozik-lap>
 <14102bab-33a1-45e0-0faf-883c7b1133a5@samsung.com>
 <CAK8P3a3QvbfYe5d_X4YcaRZaO4rykqoM_hm7nF-jwJGn0AQaug@mail.gmail.com>
 <20210127075902.esm3tukq4pwmdf3j@kozik-lap>
 <CAK8P3a0M_u=o0M7ppw4pBAYuvMNH=10RmJdLov5zPXf4+HYw4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a0M_u=o0M7ppw4pBAYuvMNH=10RmJdLov5zPXf4+HYw4A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Jan 30, 2021 at 03:14:22PM +0100, Arnd Bergmann wrote:
> On Wed, Jan 27, 2021 at 8:59 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Tue, Jan 26, 2021 at 11:44:26PM +0100, Arnd Bergmann wrote:
> > > On Fri, Nov 20, 2020 at 12:10 PM Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> 
> > > > It won't work easily with both compatibles, because in the 5420 variant
> > > > I've also changed the PHY indices (5420 has no device and second hsic
> > > > phy). IMHO the dts change can wait for the next release.
> > >
> > > I see this made it into the pull request now, but I had not been aware
> > > of the change earlier, and I'm slightly annoyed to have received it this
> > > way:
> > >
> > > - This is clearly an incompatible change to the dtb, and you all
> > >    noticed that because it would cause a bisection problem. As
> > >    a general rule, if a dts change does not work across bisection,
> > >    we should not merge it at all, because it causes problems for
> > >    anyone with external dts or dtb files.
> >
> > Hi Arnd,
> >
> > No, it does not create a bisection problem. The driver change adding new
> > compatible is already in v5.11-rc1.
> 
> What I meant is that you knew there would be a bisection problem
> if you had not delayed this patch.

Of course, there are tons of such examples and delaying a patch for DTS
is perfectly safe, sane and regular way to deal with it.

>
> > > - It would likely have been possible to define the new binding in
> > >   a backward-compatible way. I don't see a reason why the index
> > >   values in the binding had to change here, other than a slight
> > >   inconvenience for the driver.
> >
> > It does not matter since it's a new compatible and old one is not
> > affected. Nothing got broken before this patch, nothing got broken after
> > applying it via samsung-soc. No backwards compatibility is affected.
> >
> > > - If the change was really unavoidable, I would have expected
> > >   a long explanation about why it had to be done in both the
> > >   commit message and in the tag description for the pull
> > >   request.
> > >
> > > I've dropped the pull request for now, maybe this can still
> > > be sorted out with another driver change that makes the
> > > new compatible string backward-compatible.
> >
> > It's a different hardware. New hardware does not have to be compatible
> > with old hardware. However old DTB is still doing fine (although with
> > the original issue not fixed).
> 
> There are around ten boards including this file, and most (maybe all)
> of them are not newly added machines, so there is a good chance
> that there are existing users. You are right that you took care that
> the combination of an old dtb with a new kernel would not be any
> worse than before, and that is good. What is however missing is
> the consideration of the reverse: If anyone wants to dual-boot between
> old and new kernels, they are stuck with the old dtb and is missing
> the bugfix along with any additional changes that may get added
> in the future.

First of all, out of tree is not our concern. Let me quote DT guru, Rob:
"If it's not upstream, it doesn't exist."
https://lore.kernel.org/lkml/20201028152303.GA4041470@bogus/T/#m602ef29cade6f9ed49efd52159210d2a6813eec9

Second of all, out of tree DTB (so old DTB in your meaning) will work
perfectly fine (the same) and nothing is broken. So why I would need to
care about something which "does not exist" while I also do not break
it?

> The same is true if there are any non-Linux operating systems running
> on these. For instance, FreeBSD runs on Peach Pit, and if they
> were using the old dtb from Linux (I have not checked if they
> were compatible before this change), then booting with the latest
> dtb from Linux will require the same changes to their driver to avoid
> a regression.

If anyone takes kernel DTS and applies to his project, and then he takes
blindly the latter changes to DTS (but without earlier changes to
bindings! so he picks up only selective choice), then it's his
responsibility to be up to date. I am sorry, but I cannot take care
about any ridiculous and irresponsible idea in the world.

Seriously, do you expect us to think about out of tree unkown users of
an intree DTS when that *user does not follow bindings*?

It's the first time I hear it.

> I can live with an explanation of "we've looked at all the alternatives
> and decided to break old kernels with new dtbs in this particular
> case because ...", but I don't like the idea of silently changing dts
> in a way that breaks using them with anything but the latest kernel
> and arguing that it's not even worth debating.

There is no single need for intree kernel DTS to be backwards compatible
with old kernel. There is no single rule for it, either (because it's
not ABI). 

Best regards,
Krzysztof

