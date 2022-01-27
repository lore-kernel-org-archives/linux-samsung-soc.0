Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EF2C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 27 Jan 2022 16:58:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238593AbiA0Q6o (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 27 Jan 2022 11:58:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238588AbiA0Q6n (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Jan 2022 11:58:43 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690E6C06173B
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Jan 2022 08:58:43 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id m90so5923437uam.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Jan 2022 08:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NLme/433a58T3gIWlGpAxVQvTCuWVACc4YberEGmNIo=;
        b=n4tu/+nNP4sEfAGdjNkGA8312svbJGWvOq3ODIrTp+85ZWThNRiIQcmPRAHPFMEGcZ
         AnpTvSveHY8Ol4KruPifGwItn9RrKCgy5t8tgQC36XoC7fvtg7UDWNx2psvGwUNtmiOw
         eFfco4CV2kzR2PzJA6JhfGPBoOe9JlFtXeaC7sBwAAKCUf70Yf0NzMkc0AxD2mBnunmx
         R1eWgyBf5ebB8zWi+qOlGykYFGt/4HY/vT3ZO7dsKkMfrwoVE7XCRWwgGDLeNWO18SMC
         Sw4N8+PGicSF4dXqP4KCOtwLwHRGmRUYz23MQd7ke9InPniZEFQ46ngW5ZpLtVu7efJ0
         y8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NLme/433a58T3gIWlGpAxVQvTCuWVACc4YberEGmNIo=;
        b=szfM5ajekk/UrCaBJ8I4nqRn/af2z9kMP/oeh5Ecwi85874qsRB3uSsQ7pcjH6OyNN
         4b+edJlAnR+RPFqdfhi1V+J49M44Cwge1pVrdFisCG7LuphGR8TDWSGffUfGKlgytYvk
         XpOVuXvDiOggobBN5B+MBXjpj1E7CDP/T2RO0wTpjaoMmHjayWP66vp9JGS6emPagYLH
         G4OY9pekYmHU0nbjqdL0jwapCOZrrNjXCdqzgAf4EsxZ5DpjP5wk1Q9d1s0Gruk8Nox5
         pwLy/MPO2RfbG/1NPT3QZySYV109gQc1+phH4kDre0gMmhaks7rW8dfaCdUCVBvh8kge
         lakg==
X-Gm-Message-State: AOAM532XLs0g0bOCyj8XvsDnvhvtlukgxL4H5/c7qk93OP8t/7doooQe
        zaGmXxsKrJ3EXt2i3JOtoec7KWCg+G1FbIbZFkCdB9q1wx24y5CY
X-Google-Smtp-Source: ABdhPJzwFTP8csKGvfIkyuRmgp50a7Rns//kBNw/6IfQvYWQsGNmGo4LNmG4xqeN7TBOaXBMw4coKQzECPGabRB9MzM=
X-Received: by 2002:a67:c094:: with SMTP id x20mr1948297vsi.57.1643302722493;
 Thu, 27 Jan 2022 08:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com> <cb11d2e0-dd03-9a48-74f3-0a22f49f16b5@canonical.com>
In-Reply-To: <cb11d2e0-dd03-9a48-74f3-0a22f49f16b5@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 27 Jan 2022 18:58:30 +0200
Message-ID: <CAPLW+4=Hj-vamn5EoV-SmB5JwEbuik9hF2XuhB+tU11GwXPQdg@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 27 Jan 2022 at 11:33, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 27/12/2021 12:29, Krzysztof Kozlowski wrote:
> > Hi,
> >
> > Second pull with DTS for ARM64, on top of previous pull.
> >
> > Best regards,
> > Krzysztof
> >
> >
> > The following changes since commit 51b1a5729469cef57a3c97aa014aa6e1d2b8d864:
> >
> >   dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850 (2021-12-20 10:35:32 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.17-2
> >
> > for you to fetch changes up to a1828d772e0738c30a383a7d335aded2f2baf908:
> >
> >   arm64: dts: exynos: Add initial E850-96 board support (2021-12-22 12:31:13 +0100)
> >
> > ----------------------------------------------------------------
> > Samsung DTS ARM64 changes for v5.17, part two
> >
> > Add initial Exynos850 support and WinLink E850-96 board using it.
> >
> > ----------------------------------------------------------------
> > Sam Protsenko (2):
> >       arm64: dts: exynos: Add initial Exynos850 SoC support
> >       arm64: dts: exynos: Add initial E850-96 board support
> >
>
> I'll send all this as v5.18 material, so this pull-req can be skipped.
>

Krzysztof,

As clock changes are merged in mainline now, do you want me to re-send
those two dts patches using corresponding clock constants, instead of
hard-coded numbers?

>
> Best regards,
> Krzysztof
