Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE237C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Oct 2021 14:23:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDD6361106
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Oct 2021 14:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbhJ1OZa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Oct 2021 10:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbhJ1OZ3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Oct 2021 10:25:29 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E24BC061745
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 07:23:01 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id f4so11862218uad.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 07:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3GojDRl0lhPijBHeCI2+QHmcQrK//DxoGwC4jAHi/Us=;
        b=I4kNYNidDOJOdRTpeS6ZtRVtbORy5aS5N6CxX+uPyWenW6db+HwJU47E9PacqSUkYj
         qHBI1XM/od4gHRo5i81E9ILb6SKC+eujmzzrxS8bkfeR3PTgKdfwn6u0CqlJ7rn9/Xeu
         59WuWYqKawG8Jsulh2rx7XIc7Y9yD3INZ8/4t1VY2623pk3jMHjfaSIJrOeTJKy2aTo7
         zs1wGc0uiYtvLHPttS+E5OtbNsD23e6VZoKQZ1xZ6nPcLeEeh7Uqgmbv8gmcY/D9/DMX
         5p9ViYsGJzxZdqwyO4PBMy4zooH+19Y5wcoRYUJJ1VqKCflyJ0OQGgh2M/dGAl7aWn7y
         n3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3GojDRl0lhPijBHeCI2+QHmcQrK//DxoGwC4jAHi/Us=;
        b=KcfgwZPDvQLT7sudZnKwjK7HrwyxeJKPSQ0vtxVbVdxsSZ5NQvfqJVsHfPHSPt9wNy
         IjEqRtl6gxxlIJlKwC9QPB21eJxyMXmzxzJS/vda44oSYYBypGzXBjs72VfItzwImxcD
         HSdIVt1d/vBpBeryozCchXJLHhD+tP5mnQsJm/twVTGA7RTtz2mOkk0HlwAx3Ap+PEvX
         J61tbn6h7NKsUx4m3ty7MyRROQdCyoXPN/eUH0ri9wohqbCF+N4ECdk+g/aUBPPZHksv
         ENdy0kglAHQ2rt77mSGMMafX4IUud1fBfGAEZ6jcFtj6KC/2zJp11cacxQQwS9Jzlb1j
         Widg==
X-Gm-Message-State: AOAM533tF6htxtqGLvPP3jhZ7XU6/fjk4YvZgxajdDCA0KvQg+t8xdQq
        p0vwwqrzPnXVhijgA+Pp26U3MCI9Qoviar+IU+dOQA==
X-Google-Smtp-Source: ABdhPJzyreIEFUtBY+FH6rI9UXKqn/URtyI9pjIR9kW9DoUCPHs2N/1eHoXRiWdKiA2HWLZAiNOvKlc5uTRSeCWMyBs=
X-Received: by 2002:a67:1781:: with SMTP id 123mr4698177vsx.1.1635430980648;
 Thu, 28 Oct 2021 07:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211026115916.31553-1-semen.protsenko@linaro.org> <8b3466f1-2b16-80ca-79c7-577860fc90aa@canonical.com>
In-Reply-To: <8b3466f1-2b16-80ca-79c7-577860fc90aa@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 28 Oct 2021 17:22:48 +0300
Message-ID: <CAPLW+4=YizLzdiZ1mdCGxvPCTYhNjeiomO=q=4Xk-ZxqqH++nA@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig: Enable MCT timer for ARCH_EXYNOS
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Will Deacon <will@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 26 Oct 2021 at 17:03, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 26/10/2021 13:59, Sam Protsenko wrote:
> > Some ARM64 Exynos SoCs have MCT timer block, e.g. Exynos850 and
> > Exynos5433. CLKSRC_EXYNOS_MCT option is not visible unless COMPILE_TEST
> > is enabled. Select CLKSRC_EXYNOS_MCT option for ARM64 ARCH_EXYNOS like
> > it's done in arch/arm/mach-exynos/Kconfig, to enable MCT timer support
> > for ARM64 Exynos SoCs.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  arch/arm64/Kconfig.platforms | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> +CC Marek, Marc, Mark and Chanwoo,
> Looks like duplicated:
> https://lore.kernel.org/lkml/20181018095708.1527-7-m.szyprowski@samsung.com/
>
> The topic stalled and I think this particular patch did not make sense
> on its own, without rest of changes from Marek. I am not sure, though...
>

Krzysztof, Marek,

That series looks nice, I'm quite interested in that being applied. Do
you think I can do something to help with that (e.g. rebasing,
re-sending on behalf of Marek, testing on Exynos850, etc)?

> Best regards,
> Krzysztof
