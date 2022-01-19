Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FDCC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jan 2022 17:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344405AbiASRBP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jan 2022 12:01:15 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52116
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243513AbiASRBP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 12:01:15 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B80C23FFD0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 17:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642611667;
        bh=DsitdWyrjwAWvscnA5nwUVt0TQXqCXM23k2Tf31EYy4=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=D79HvQH3xbqg7euCnQasxq2FWu7klyaEN0YBiJT5jarFP/MpShs1zsjvsYVkfr1Xm
         m4YZkJv9UxLqQz57ZNkcG63QBOY6gTLSOBMk1hPK8JoPh8i8yWhe2qRwCYxXrBKErs
         9bu10pj2PfNA0yL2RVBexuSLEv1BjTPYiWozMbtBDuNzObYuAg3unANJKzzNLATmCw
         aebjSzU/v7q/rPtbVAhp0JTGICXvBg+P1/nV5lG5CSNssWopA7urImlzOcT6peGWSk
         AdlvaETKUST7EWP7yGjEnaBaHgSh06/+YizluEknhlLrtdraM6pNrd+jlUpDxnuua5
         0PvFyoVABi0LQ==
Received: by mail-ed1-f70.google.com with SMTP id j10-20020a05640211ca00b003ff0e234fdfso3190694edw.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 09:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DsitdWyrjwAWvscnA5nwUVt0TQXqCXM23k2Tf31EYy4=;
        b=hmPfFim5/ThjgQYfHzX6Ycrga/4BPL1jgbSEx2OQfBb4GLTedZ/CE0njom4IonghFp
         B+0lWR9zXEluGyZH91g/R0aoHcGbLQPrcr/wDdMtOSJ+KrcIzyt5o4bGJ9/IFvtwiAzs
         Xj+HEgj5etQgLi1hMokSOWxQYLQKozGGzo8QY28K0NgppXWObIKGtpywLvd+8/grAJTR
         a1WHtGsr34mwj66w39DrFxu1HOO5ZjIqLwRaHGAAljRNLKrWXVE+Zs7zjzoz3U5vx4Bz
         Xs3aHZ2n+XMtHLG4cIne03mgfZHXPGI36uMkiUjXIliiesaTQDqmI2o+7rHBb1EDgDn0
         x9bA==
X-Gm-Message-State: AOAM531z4ESn7ubNFvKOiUAMO5BGEYoovmY084OVEGRM4wthZ2/uREeS
        zc2J/PZkNj4FQ6cHuLMPps0SCR6f1AeVPfNDIwwbDwdjkMYjILnE2swS7UzHeYi85mHbJkaL8iO
        uynu51iR70oZKI9AWeylEgOFlGw5TrV3/s5dhZ4e6s2h4VrkPXJIIcQDIkpRM1Shk
X-Received: by 2002:aa7:d28e:: with SMTP id w14mr32087798edq.53.1642611667413;
        Wed, 19 Jan 2022 09:01:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyhnpS46ePzskaoSTeiKlHBBiCrPI1N2qHZbE92eCWdfUSfFp8D1OkXo3xWWwhcrEtVqXQLzR+2Mc1a01GT6g=
X-Received: by 2002:aa7:d28e:: with SMTP id w14mr32087767edq.53.1642611667167;
 Wed, 19 Jan 2022 09:01:07 -0800 (PST)
MIME-Version: 1.0
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
 <CAPLW+4n-1H5Yu3wQaus-UJ_VW_TjHrNUHaPCGCMURXg8EqxjyA@mail.gmail.com>
 <CAK8P3a1ou-ZdrXN0MHQoJ+gGbvhXT-e2qt96_f9M8VwrdX0pAg@mail.gmail.com> <CAOesGMgF3S5_XsWjEqq=-zfYXwOWFpFNA6afL81wceRUA_0FeQ@mail.gmail.com>
In-Reply-To: <CAOesGMgF3S5_XsWjEqq=-zfYXwOWFpFNA6afL81wceRUA_0FeQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date:   Wed, 19 Jan 2022 18:00:56 +0100
Message-ID: <CA+Eumj5sosSkCCANOVqN8fVUDFaSNtB7+f95o+FAp7w6rM4A=A@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
To:     Olof Johansson <olof@lixom.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 19 Jan 2022 at 17:53, Olof Johansson <olof@lixom.net> wrote:
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

Actually I have such, but to prepare a pull with them, I would need to
base it on some random Linus' commit, not on v5.17-rc1. Therefore I
wait for v5.17-rc1. Would you prefer different approach?

Best regards,
Krzysztof
