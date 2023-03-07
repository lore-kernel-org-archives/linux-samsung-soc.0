Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF94C6FD1A
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Mar 2023 17:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbjCGRls (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Mar 2023 12:41:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbjCGRla (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Mar 2023 12:41:30 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F03A6BE8
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Mar 2023 09:37:29 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id i3so14930999plg.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Mar 2023 09:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678210648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o3zPHvN5mm4IalrCf6zpCmyS4kHEJ7HoGLzRUhQSOoA=;
        b=o2ytZ6qS0PtfXoLYe5TafISzM6/h2NxL3pqfUqiGJeoJyjjcLmWruuJ3X0G/cQZI/Y
         GA8IYvcfCRsdkKAPInrw3325Sv6gVIjQvQZMQxeDW96heslTnIO2xfDZjDmjHC8W6S8x
         8Z/2W26QDYD+sh27LwKdicEwMxzzwNiKSCkfYYiyxDmhqDTlfyv/GgQVFNeN9y63ynUc
         FJWQqXZIYzZfNoOQhPSUGyELPnY1YZET2qLKlry8+WtVnxDK6ZPqoUCsVZmIiYTHYfmu
         AdbkopUuQy/vh3LicKLoQLp/1cN+bszEMZwG8pn13IbJ1xhfs2KAVC1bJolPRpetFKGQ
         3vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678210648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3zPHvN5mm4IalrCf6zpCmyS4kHEJ7HoGLzRUhQSOoA=;
        b=i8zhYy+6Jpz8CkReEeVbiM2tjWRCirU7I9UCJ3bzq3ZK2wgxPWRHQ9vBKWUaJxlA6O
         LJsNNKiQWwcBiq37bWNmcqtcjsUB3Zbr55iSZvfvzLFaaAb+m3dMc6F8KW9u8xXuGWFu
         Kvo43f55GCegSkeEQxKs6+/Hc1ykUMRwR0PzSJAj4CUKRwJ5MKaEMUtTubW4z5NQOTUt
         22dX6Kv4TtFg0vn9Db5Au2iCV+wCP1bzbWJcstovL1sC9sN6vHsm8CGVj5YVpqZk1YHO
         zn+RJXPrQ0woxbk6LJRTOd5bjPZPaAXZfd/TDz8T+UKzKaVz+pwHoWXxYS04b9QHNc8v
         DJKA==
X-Gm-Message-State: AO0yUKX5tiVwmWwpSuoSJkgEaPMzQO4v7htyFm3prkqLXwmo2aDnkw8K
        KhFT/uHnc4oFvOK+3Mzu9Dp3fNQzzMKWvu1izov6BA==
X-Google-Smtp-Source: AK7set+Kh/juOXVGFGBZq6ZQe/2ECYCsr+2HZ6cR5iMeJ5OSD5b0x9Znktqaib7dBWyXbAGUvwFiALZMirOESQVRZNg=
X-Received: by 2002:a17:90a:9295:b0:233:fa52:828e with SMTP id
 n21-20020a17090a929500b00233fa52828emr5658345pjo.1.1678210648212; Tue, 07 Mar
 2023 09:37:28 -0800 (PST)
MIME-Version: 1.0
References: <20230223042133.26551-1-semen.protsenko@linaro.org>
 <167811290503.11716.15730246749418548221.b4-ty@linaro.org>
 <48c8a0cf-08dc-a831-33ef-3b8e32eef2d3@linaro.org> <CAPLW+4=9Vwxd4upa3j_cKtRrNyyx_XCz+TgOOziMguEonbHb0g@mail.gmail.com>
 <3a27febc-4d4e-1cfd-45dc-6ade4f25ca13@linaro.org>
In-Reply-To: <3a27febc-4d4e-1cfd-45dc-6ade4f25ca13@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 7 Mar 2023 11:37:17 -0600
Message-ID: <CAPLW+4nZF2POmD1kRUDktn2_gUWH_e84Lnqx=8qhuqbSnrdJ2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] clk: samsung: exynos850: Add missing clocks for PM
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 7 Mar 2023 at 01:47, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 06/03/2023 19:55, Sam Protsenko wrote:
> > On Mon, 6 Mar 2023 at 09:51, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 06/03/2023 15:28, Krzysztof Kozlowski wrote:
> >>> On Wed, 22 Feb 2023 22:21:27 -0600, Sam Protsenko wrote:
> >>>> As a part of preparation for PM enablement in Exynos850 clock driver,
> >>>> this patch series implements CMU_G3D, and also main gate clocks for AUD
> >>>> and HSI CMUs. The series brings corresponding changes to bindings, the
> >>>> driver and SoC dts file.
> >>>>
> >>>> Changes in v2:
> >>>>   - Rebased all patches on top of the most recent soc/for-next tree
> >>>>   - Added A-b and R-b tags
> >>>>   - Minor fixes
> >>>>
> >>>> [...]
> >>>
> >>> Applied, thanks!
> >>>
> >>> [1/6] dt-bindings: clock: exynos850: Add Exynos850 CMU_G3D
> >>>       https://git.kernel.org/krzk/linux/c/067ba1605806e52118bb598afb357718df9f0e19
> >>> [2/6] dt-bindings: clock: exynos850: Add AUD and HSI main gate clocks
> >>>       https://git.kernel.org/krzk/linux/c/e289665ed0d6df9fca3ebc128f1232d305e4600b
> >>> [3/6] clk: samsung: clk-pll: Implement pll0818x PLL type
> >>>       https://git.kernel.org/krzk/linux/c/a6feedab8ab9a9e4483deb0bcc87919d92c88b7e
> >>> [4/6] clk: samsung: exynos850: Implement CMU_G3D domain
> >>>       https://git.kernel.org/krzk/linux/c/c5704a56893b4e77e434597c7c53d878bb3073b0
> >>> [5/6] clk: samsung: exynos850: Add AUD and HSI main gate clocks
> >>>       https://git.kernel.org/krzk/linux/c/d8d12e0d079aff4b1d8079a0a55944c0596f1d67
> >>> [6/6] arm64: dts: exynos: Add CMU_G3D node for Exynos850 SoC
> >>>       https://git.kernel.org/krzk/linux/c/ad8f6ad9a4f219950df65731a8ff91baa022c4b0
> >>
> >> And builds are broken. Please mention in cover letter or commit
> >> dependencies and ordering...
> >>
> >
> > Just checked all most recent commits on your for-next and next/clk
> > branches. Seem to build fine for me. AFAIR I checked all patches in
> > that series, and I guess there shouldn't be any issues if you apply
> > those in the same order they are numbered inside the series. Or you
> > mean you have some clash between different series? Anyways, I'm glad
> > to help, but I'd need more details on where exactly the problem is (or
> > maybe you already fixed it?).
>
> The builds were failing after I applied everything to respective
> branches (so DTS separate). I did not notice that your DTS and driver
> (both) depend on bindings header constant. This requires special
> handling. It actually always required, because it was going through
> different trees. Now it goes through my tree, but I still need to handle
> it. I reworked the branches and force-pushed, thus you did not see the
> exact issue.
>

Thanks for explaining this. Next time I'll provide the dependencies
info in my patch #0.

> Best regards,
> Krzysztof
>
