Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017CCC433E9
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  6 Feb 2021 19:48:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDAE164E0D
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  6 Feb 2021 19:48:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhBFTst (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 6 Feb 2021 14:48:49 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:42955 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhBFTsl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 6 Feb 2021 14:48:41 -0500
Received: by mail-ot1-f52.google.com with SMTP id q4so751111otm.9;
        Sat, 06 Feb 2021 11:48:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8mVMNF4fRsyTZazYCsaAIH58/5IMUtcIzDAOPD4XiLo=;
        b=R7AgR3EvwypHb0F2brBXz0ZAB82ZRwLdUFWS8Ipry1qAJ3JDp+1z5qC0iTb8eTUgeP
         tQT6gKaCf7if3/qIjn+qOjGVx8MVBYivczGkt6RwHa2tZT4WGHyMCvv/4hXdBkSdAxe9
         0jCjCibZwp4/WbveJqMoDKCHoOLuKD6TGGBjAegOKhshEwJF2HS3A8Nmj/RgZkqz4zTv
         RUL2eBrqqjSDmScEA5iFWB6JRlBJ6PLZ3QnfYnSLMoXi5/BqPcKSMgzEikYRkOU2y2BY
         s7NGkmnpPcQ/MFTHrLdAUSMaSzjKx0MnHPTRu7aK63Zajzill0Uy/lV8vr5Q1Ss0swXQ
         rYQg==
X-Gm-Message-State: AOAM531knbpEapYKzaHq0xJHR8ACxKkJY7uWgYhMDXigg66G7uFA9tha
        T+cKnjPwdHLJNtm01TCX2JuH7pY4AzAHzDCRkDQ=
X-Google-Smtp-Source: ABdhPJw745S8LM8O3h8fPOXwjE6gI72k4oPqS5/xYZ9eVQi+tWwpGN5S3rTWZsDTboMo0cSPFheifgB+2yBBK2ArvyU=
X-Received: by 2002:a05:6830:15cc:: with SMTP id j12mr7710395otr.145.1612640880368;
 Sat, 06 Feb 2021 11:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20210125191240.11278-1-krzk@kernel.org> <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap> <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
In-Reply-To: <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 6 Feb 2021 20:47:49 +0100
Message-ID: <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
To:     Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
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
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Arnd,

On Sat, Feb 6, 2021 at 3:36 PM Arnd Bergmann <arnd@kernel.org> wrote:
> That said, I'm still not happy about the patch we discussed in the
> other email thread[1] and I'd like to handle it a little more strictly in
> the future, but I agree this wasn't obvious and we have been rather
> inconsistent about it in the past, with some platform maintainers
> handling it way more strictly than others.
>
> I've added the devicetree maintainers and a few other platform
> maintainers to Cc here, maybe they can provide some further
> opinions on the topic so we can come to an approach that
> works for everyone.
>
> My summary of the thread in [1] is there was a driver bug that
> required a DT binding change. Krzysztof and the other involved
> parties made sure the driver handles it in a backward-compatible
> way (an old dtb file will still run into the bug but keep working
> with new kernels), but decided that they did not need to worry
> about the opposite case (running an old kernel with an updated
> dtb). I noticed the compatibility break and said that I would
> prefer this to be done in a way that is compatible both ways,
> or at the minimum be alerted about the binding break in the
> pull request, with an explanation about why this had to be done,
> even when we don't think anyone is going to be affected.
>
> What do others think about this? Should we generally assume
> that breaking old kernels with new dtbs is acceptable, or should
> we try to avoid it if possible, the same way we try to avoid
> breaking new kernels with old dtbs? Should this be a platform
> specific policy or should we try to handle all platforms the same
> way?

For Renesas SoCs, we typically only consider compatibility of new
kernels with old DTBs, not the other way around.
However, most DTB updates are due to new hardware support, so using the
new DTB with an old kernel usually just means no newly documented
hardware, or new feature, is being used by the old kernel.

In case there was a real issue fixed, and using the new DTB with the old
kernel would cause a regression, and we're aware of it, we do make sure
the DTS update is postponed until the corresponding driver update has
hit upstream.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
