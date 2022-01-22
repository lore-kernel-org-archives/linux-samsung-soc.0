Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4236C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 22 Jan 2022 12:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbiAVMiV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 22 Jan 2022 07:38:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiAVMiV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 22 Jan 2022 07:38:21 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13EAC06173B
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Jan 2022 04:38:20 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id b16so21904089uaq.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Jan 2022 04:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k4uslepZlx+doJxsNKmyezSBQMtw/R3k+N4S5l4lrBo=;
        b=BsOpApkNdWIaU/sRtOQjwh4eUZx+LBSaRTuxHUaQyNWCQyCl8bai1Wx1qwWnoNC27H
         UMptAV67VXy6USh28okTjWJFOwzkUvxxcLMSLabutXTFPFkNtnBbMa7eeEuwDF9073we
         fZ42v9DyP2u9LYxoNaoBkYFla0cFFWJTgKvbYKo6jtRIKNaRM4r9fnxMTi2N2LASC/k9
         X39719sqIGKXjMPBleMQhBU6ZNT6uQtRYekkR4ZsEjG8s5q28dme/sNuxTeRGLrTi/+J
         rYybXofWvCBIJpgUyR+L0PKRAlkQvadEp4ZKYSPYub9VCRQ08Tx0DtOa0OrsEetEIl6F
         +IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k4uslepZlx+doJxsNKmyezSBQMtw/R3k+N4S5l4lrBo=;
        b=uQciE3W2o14CwgtLNAMFCTUaQxr4/re0L6B3W+sDZ/B5yY0m078ev46tw/+1TQkgzA
         hg+Ag2KMomptHFvN0cr3XNFBgr180oFTHvHJ9XcJG27f6SqqlkP9HAZi352fCv0XLj5j
         PHocYbxOVzKhZ2fVLHKPVd/UAO7dKApAbP9z1vERx42JjzOsEnyIP8z5SnElBSopYy0K
         JCzVapvHh20OULelklgolSU2do6LUxxOVFx1V44W3zt9dodwV7/z52XO+bVtF+VVo32U
         I2zqLW8p5xeh/PNw6zEf4Na/WhmeaoMbgh90bZkKI4EXb3ECgKNxqIfDZH0FABnITUSe
         wniQ==
X-Gm-Message-State: AOAM531u3YL9A/MouUVfCQPyzu5zFvQebQtuvK6X3zIIyjtPyb2Od1OO
        UMamMnTaYxdI19azcw18D8dyVvLOFPNcVlbhfcgMXg==
X-Google-Smtp-Source: ABdhPJxAkMtrFRW4Pnd6Ntwnglxpjg12Vi1yx2PNmdt/WUzgwtaT1gqfGWUrAGaiAKvIFUvMWfcsFCo1mDlwWWDzqJ0=
X-Received: by 2002:a67:c093:: with SMTP id x19mr1768383vsi.20.1642855099794;
 Sat, 22 Jan 2022 04:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
 <CAPLW+4n-1H5Yu3wQaus-UJ_VW_TjHrNUHaPCGCMURXg8EqxjyA@mail.gmail.com>
 <CAK8P3a1ou-ZdrXN0MHQoJ+gGbvhXT-e2qt96_f9M8VwrdX0pAg@mail.gmail.com> <CAOesGMgF3S5_XsWjEqq=-zfYXwOWFpFNA6afL81wceRUA_0FeQ@mail.gmail.com>
In-Reply-To: <CAOesGMgF3S5_XsWjEqq=-zfYXwOWFpFNA6afL81wceRUA_0FeQ@mail.gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sat, 22 Jan 2022 14:38:08 +0200
Message-ID: <CAPLW+4k8=ymx56R7bKOt8kMVG_uUgrTsCkVd5wiY_rkYq8dYbQ@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc:     arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 19 Jan 2022 at 18:53, Olof Johansson <olof@lixom.net> wrote:
>
> On Wed, Jan 19, 2022 at 8:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, Jan 19, 2022 at 4:11 PM Sam Protsenko
> > <semen.protsenko@linaro.org> wrote:
> > > On Mon, 27 Dec 2021 at 13:30, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> > >
> > > Hi Olof, Arnd,
> > >
> > > Just want to check if it's possible for those patches to be applied in
> > > v5.17? Sorry for the noise, but that's important to me.
> >
> > I can see that Olof merged merged this into the "arm/late" branch in
> > the soc tree,
> > so I assume he still plans to send it in the next few days.
>
> Yep, will be sent up today most likely.
>

Thanks for detailed answer! Glad to hear it's still a possibility.
Please let me know if you need any actions on my side (like rebasing,
etc).

> > With the timing over Christmas, I sent out the large bulk of the
> > contents (anything
> > I merged before Dec 23) last year, and Linus already merged it, the rest ended
> > up in the "late" branch.
> >
> > As usual, there is no guarantee that late changes make it in, but I have seen
> > no indication of any problems so far.
>
> Correct. Been sitting on it for a while in case there were fixes
> coming in for the first pieces that got merged, but in traditional
> fashion I'm guessing those will start to show up a few days after the
> late branch gets merged. :)
>
>
> -Olof
