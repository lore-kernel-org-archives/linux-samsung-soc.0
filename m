Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0ECCC2D0E4
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 15 Nov 2020 21:22:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A91F0238E6
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 15 Nov 2020 21:22:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbgKOVWs convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 15 Nov 2020 16:22:48 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53956 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbgKOVWs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 15 Nov 2020 16:22:48 -0500
Received: by mail-wm1-f68.google.com with SMTP id p22so22034831wmg.3;
        Sun, 15 Nov 2020 13:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=E8F1KBcq3wqB/AX7hk4SXWs/ZOv1252yR3BPS3sn6jk=;
        b=nHsB58IqiZbboFByJSh8HCvzMAdc72GHnhrfQ24tiCMqba7nBMq5ez+jccY3aPHdCb
         GHSuFG4lomoFpjG4QEP55ZDeFgeqf4fbgRozWT/tGVqfZDpDNoxYP68Jfu5kf8wJiT2/
         11Uh3Nn7O/UssH25hHNCh3hV8L21u1ZpMuL3H9D30RljQJKVaulh4kNLMNJN2sU1NMit
         3xk09A5SLP9ABozmGVIQn08MSniht876+R0+D+ZkthXRyEyvKICrKU1ZrGTzM44056es
         ugKwqvaN9JGhBW22CWSYg5snjwnkbVf6C9Xa5x2ZUnyCSkWhUFi8eH1dSTcPi5SrkSW3
         TMfg==
X-Gm-Message-State: AOAM533I++gUxYbhfioIb0jCgFP9XzE4oJ3yYIQVo8mSra3KYqAJaZRK
        bpvpn3JUmMmYqcbpibXXMyc=
X-Google-Smtp-Source: ABdhPJxVzdr3WnJQfmaqduN9ThfRgM6DL7TzVigvCYXGzbgD4DSBeRfYlGS4AbMAE365gBeoOPe2Pg==
X-Received: by 2002:a7b:c394:: with SMTP id s20mr12008741wmj.40.1605475366055;
        Sun, 15 Nov 2020 13:22:46 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id k20sm17046944wmi.15.2020.11.15.13.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 13:22:44 -0800 (PST)
Date:   Sun, 15 Nov 2020 22:22:43 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martin =?utf-8?Q?J=C3=BCcker?= <martin.juecker@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/5] ARM: dts: add Samsung's exynos4412-based p4note
 boards
Message-ID: <20201115212243.GA346171@kozik-lap>
References: <20201113212525.13455-1-martin.juecker@gmail.com>
 <20201113212525.13455-3-martin.juecker@gmail.com>
 <20201115103251.GB4587@kozik-lap>
 <20201115174843.GA33100@adroid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201115174843.GA33100@adroid>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Nov 15, 2020 at 06:48:43PM +0100, Martin Jücker wrote:
> On Sun, Nov 15, 2020 at 11:32:51AM +0100, Krzysztof Kozlowski wrote:
> > On Fri, Nov 13, 2020 at 10:25:23PM +0100, Martin Jücker wrote:
> > > The p4note family contains a couple of variants of the Galaxy Note 10.1
> > > tablet with mainly different modems. The GT-N8010/GT-N8013 is the wifi
> > > only version.
> > > 
> > > Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> > > ---
> > >  arch/arm/boot/dts/Makefile                    |    1 +
> > >  arch/arm/boot/dts/exynos4412-p4note-n8010.dts |   17 +
> > >  arch/arm/boot/dts/exynos4412-p4note.dtsi      | 1132 +++++++++++++++++
> > >  3 files changed, 1150 insertions(+)
> > >  create mode 100644 arch/arm/boot/dts/exynos4412-p4note-n8010.dts
> > >  create mode 100644 arch/arm/boot/dts/exynos4412-p4note.dtsi
> > > 
> > > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > > index ce66ffd5a1bb..55ffee2b20f8 100644
> > > --- a/arch/arm/boot/dts/Makefile
> > > +++ b/arch/arm/boot/dts/Makefile
> > > @@ -197,6 +197,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
> > >  	exynos4412-odroidx.dtb \
> > >  	exynos4412-odroidx2.dtb \
> > >  	exynos4412-origen.dtb \
> > > +	exynos4412-p4note-n8010.dtb \
> > >  	exynos4412-smdk4412.dtb \
> > >  	exynos4412-tiny4412.dtb \
> > >  	exynos4412-trats2.dtb
> > > diff --git a/arch/arm/boot/dts/exynos4412-p4note-n8010.dts b/arch/arm/boot/dts/exynos4412-p4note-n8010.dts
> > > new file mode 100644
> > > index 000000000000..9f559425bd2c
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/exynos4412-p4note-n8010.dts
> > > @@ -0,0 +1,17 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Samsung's Galaxy Note 10.1 - N801x (wifi only version)
> > > + *
> > > + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> > > + *		http://www.samsung.com
> > 
> > Here and in other files - why did you remove your copyright? My comment
> > from previous version: "If it is true, then include the copyright of
> > original work as well."
> > 
> > Best regards,
> > Krzysztof
> > 
> 
> Hey Krzysztof,
> 
> in the second response you wrote that "usually we keep the copyright of
> original file",

Yes, we keep it, in the sense: "we do not remove it". However on top of
it you can add your copyrights.

> I understood this as only the Samsung header as it is
> done for the midas, i930x and n710x. A lot of it is basically the same
> but with changed gpios. I really don't need my copyright up there if
> it's not strictly necessary.

Your copyright is not required, it's anyway coming through contribution
and Git history. If you don't need it, I'll apply the patches as they
are.

Best regards,
Krzysztof

