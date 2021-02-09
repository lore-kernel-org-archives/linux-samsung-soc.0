Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A656C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Feb 2021 08:26:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABF0464EBD
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Feb 2021 08:26:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhBII02 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Feb 2021 03:26:28 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:44031 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhBII0X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Feb 2021 03:26:23 -0500
Received: by mail-ot1-f44.google.com with SMTP id l23so5094150otn.10;
        Tue, 09 Feb 2021 00:26:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lNbh7LjdqrFqGa+5oSbQ+cwJwgupwerGD92n/ai+/tU=;
        b=tDnkh+Z2uOKzpazeibINCPldl3NxomqdRafaJCaHyKcHP/ASGcsa/UJRP4bPSgxPfs
         UzbzRghkBHcyk8clqIwwW+Je5Jk/FXbjmqElQJLNxqlcTVttQMniWLTKDGq/5qPCWj4L
         8GQAp0CvRi6iyXI/NOboJF1iUl9aYy58b6eWtGV+YvjbxKE6h0TkP3KaCLi3xJRQY3in
         vB2nJqyPfchZfSCRPFbzkxkrhz1VdcOv6cbNEnsC6Lvo6nBuOm4DsSelYMjg7+bPrekZ
         fqqXMnsyKuNl+7xKgDvFLYrKZPYdfY6PUPz1PmeCJ+ahgiuFgIWJEsufIhr8pkxDSi4d
         Ps+g==
X-Gm-Message-State: AOAM5314QsdmSgnQECtNkpjnM4p0HH/mza5fehO+d7nN9yNukYHQtISG
        W1Bh882f0TffhRFlhHeaibnTImioHfMAc3BPCbE=
X-Google-Smtp-Source: ABdhPJyHYllDbGGarpfEfSMLq+6yFSlPIZ/1ViJwMsZFWXHFp6l5RgUa1BlE4L4SlzEI1vlM0qByA8Z7RtWYZngawdw=
X-Received: by 2002:a9d:77d6:: with SMTP id w22mr4174886otl.145.1612859142032;
 Tue, 09 Feb 2021 00:25:42 -0800 (PST)
MIME-Version: 1.0
References: <20210125191240.11278-1-krzk@kernel.org> <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap> <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
 <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
 <YCGBIvRfoP0BeyrP@builder.lan> <20210208184230.onhlioflyylkx6xo@kozik-lap>
 <CAK8P3a3bsw8p2Geyo-vh1AJUfMQCCf3kpa_YB+tKmcvWHqRcEw@mail.gmail.com>
 <20210208213537.GA351084@piout.net> <CAK8P3a0QRcQM4rH9HgVMOHa_eATXsjRbGDXuMO7FgnA8OgPk0Q@mail.gmail.com>
 <20210208231040.GF351084@piout.net>
In-Reply-To: <20210208231040.GF351084@piout.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Feb 2021 09:25:31 +0100
Message-ID: <CAMuHMdUSRZ+Fho4OG3xZayzOrFnJXxomT3q16vu_Jai6Lb7hxg@mail.gmail.com>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Alexandre,

On Tue, Feb 9, 2021 at 12:10 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 08/02/2021 23:14:02+0100, Arnd Bergmann wrote:
> > On Mon, Feb 8, 2021 at 10:35 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > > Are there really any platforms with the dtb built into the firmware?
> > > I feel like this is a mythical creature used to scare people into keeping
> > > the DTB ABI stable. Aren't all the distribution already able to cope
> > > with keeping DTB and kernel in sync?
> >
> > I think most traditional PowerPC systems fall into this category, most
>
> My understanding was that the traditional PPC systems had a small device
> tree and usually are not affected by driver changes but I may be wrong.

They were much simpler than a modern SoC, with most functionality
implemented by modularity (e.g. PCI devices, I still like 'compatible
= "pci1186,100"'[1] ;-)
And the bindings were simple and stable (i.e. they did exist before the
platform was shipped).

[1] http://users.telenet.be/geertu/Linux/PPC/pci/ethernetAT4/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
