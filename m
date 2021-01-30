Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8559EC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 30 Jan 2021 16:37:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C00564E10
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 30 Jan 2021 16:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhA3QhN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 30 Jan 2021 11:37:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:41448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231645AbhA3OPU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 Jan 2021 09:15:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D587464E10;
        Sat, 30 Jan 2021 14:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612016079;
        bh=/AtKtrrlHyDG0AseYvAsw71LNNAIpYYpMeX9pgP0Vpo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=g0l4ddoYWA0QkPsO8Cq38BNF/ZbalNBvbBXJGsTfrOiy/gDCWyLwwAeBNmSNY46Mp
         ads3ysJd6KUUP4cqOJ26u+eZRtphOT3TeXd0Qnz7sgOfVZwspQzjwnBb3mzXAP6Xy3
         A22TlejztU6Fc3spju+GI5xsWi0YWurObsuZiCXVk8A34N28O+ARizwQZ3w8QkFbJG
         YGNv9VUNB5S1P7yApLnuFmqG/qStX40jl6gBvBa7jqCkEc5z4wcggoD09RY5uBOlH2
         BEP7xzV3gCLPK1WkqaXuOZtlVTsPTKsjfSyrSgxwzo7mDVaTscDalF3aT7zNiF+Soy
         0M1UxfaqGxqpw==
Received: by mail-oo1-f44.google.com with SMTP id q3so3080507oog.4;
        Sat, 30 Jan 2021 06:14:39 -0800 (PST)
X-Gm-Message-State: AOAM530JgpCkB53yoBSd4mC4mGBIsDHFsq2CpWWP1uwDrF6hVVbPnxjW
        QIMaOnKxzyd5UXTjUllXSYvEjoUPpMOO48Vkhp8=
X-Google-Smtp-Source: ABdhPJyZ2H9rQbIwdiTimJPeKWXhNMuD4YorZtcLr1sWnqLLmHfEB0DyubkgQ4cGgAd5woECqHY3XqKKdctnrj6Tfv4=
X-Received: by 2002:a4a:88c9:: with SMTP id q9mr6580670ooh.26.1612016079179;
 Sat, 30 Jan 2021 06:14:39 -0800 (PST)
MIME-Version: 1.0
References: <20201120085637.7299-1-m.szyprowski@samsung.com>
 <CGME20201120085652eucas1p1da360ab03f5b5b02a197d0f1ee435737@eucas1p1.samsung.com>
 <20201120085637.7299-3-m.szyprowski@samsung.com> <20201120110503.GB26836@kozik-lap>
 <14102bab-33a1-45e0-0faf-883c7b1133a5@samsung.com> <CAK8P3a3QvbfYe5d_X4YcaRZaO4rykqoM_hm7nF-jwJGn0AQaug@mail.gmail.com>
 <20210127075902.esm3tukq4pwmdf3j@kozik-lap>
In-Reply-To: <20210127075902.esm3tukq4pwmdf3j@kozik-lap>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Sat, 30 Jan 2021 15:14:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0M_u=o0M7ppw4pBAYuvMNH=10RmJdLov5zPXf4+HYw4A@mail.gmail.com>
Message-ID: <CAK8P3a0M_u=o0M7ppw4pBAYuvMNH=10RmJdLov5zPXf4+HYw4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: use Exynos5420 dedicated USB2 PHY compatible
To:     Krzysztof Kozlowski <krzk@kernel.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jan 27, 2021 at 8:59 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Jan 26, 2021 at 11:44:26PM +0100, Arnd Bergmann wrote:
> > On Fri, Nov 20, 2020 at 12:10 PM Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> > > It won't work easily with both compatibles, because in the 5420 variant
> > > I've also changed the PHY indices (5420 has no device and second hsic
> > > phy). IMHO the dts change can wait for the next release.
> >
> > I see this made it into the pull request now, but I had not been aware
> > of the change earlier, and I'm slightly annoyed to have received it this
> > way:
> >
> > - This is clearly an incompatible change to the dtb, and you all
> >    noticed that because it would cause a bisection problem. As
> >    a general rule, if a dts change does not work across bisection,
> >    we should not merge it at all, because it causes problems for
> >    anyone with external dts or dtb files.
>
> Hi Arnd,
>
> No, it does not create a bisection problem. The driver change adding new
> compatible is already in v5.11-rc1.

What I meant is that you knew there would be a bisection problem
if you had not delayed this patch.

> > - It would likely have been possible to define the new binding in
> >   a backward-compatible way. I don't see a reason why the index
> >   values in the binding had to change here, other than a slight
> >   inconvenience for the driver.
>
> It does not matter since it's a new compatible and old one is not
> affected. Nothing got broken before this patch, nothing got broken after
> applying it via samsung-soc. No backwards compatibility is affected.
>
> > - If the change was really unavoidable, I would have expected
> >   a long explanation about why it had to be done in both the
> >   commit message and in the tag description for the pull
> >   request.
> >
> > I've dropped the pull request for now, maybe this can still
> > be sorted out with another driver change that makes the
> > new compatible string backward-compatible.
>
> It's a different hardware. New hardware does not have to be compatible
> with old hardware. However old DTB is still doing fine (although with
> the original issue not fixed).

There are around ten boards including this file, and most (maybe all)
of them are not newly added machines, so there is a good chance
that there are existing users. You are right that you took care that
the combination of an old dtb with a new kernel would not be any
worse than before, and that is good. What is however missing is
the consideration of the reverse: If anyone wants to dual-boot between
old and new kernels, they are stuck with the old dtb and is missing
the bugfix along with any additional changes that may get added
in the future.

The same is true if there are any non-Linux operating systems running
on these. For instance, FreeBSD runs on Peach Pit, and if they
were using the old dtb from Linux (I have not checked if they
were compatible before this change), then booting with the latest
dtb from Linux will require the same changes to their driver to avoid
a regression.

I can live with an explanation of "we've looked at all the alternatives
and decided to break old kernels with new dtbs in this particular
case because ...", but I don't like the idea of silently changing dts
in a way that breaks using them with anything but the latest kernel
and arguing that it's not even worth debating.

       Arnd
