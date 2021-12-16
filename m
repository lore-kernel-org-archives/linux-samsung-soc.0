Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC3EC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Dec 2021 19:47:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241058AbhLPTrl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Dec 2021 14:47:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhLPTrj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 14:47:39 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D486C061574
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 11:47:39 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id b192so122885vkf.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 11:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NfeGz675bo0ZAQkD1KeicPK8T+9nudR2MVitSK3mkmI=;
        b=BhowvOlsjQ0sC/mAtZEVQ7CqisgZvneuyURY5COLjoEiosEeHD1ityN8relL+yTQLk
         ZEjTSThRMFuNWHSeB3mfAshATpgv28Kc2K8pVmszVrU8i5acbjAoHb0kqm0zZt025PWP
         C4fZiW+LNLnmJ6Vami2sLJobvwEoNlminL2hYEYqgFhkpL0v501a4kp3Ph4sZaFn86mW
         XZg3Dz9hiu4wUdavj+dRPc2q1F3SKPFsnC9jiziTveg2jW3OJxfx6UTPPPA6T321wZfg
         3jVg0OXIszHSHEd3CfeeiWs4GkTd4NkrYTqzfBNTiCh0GAWcQDxXL+wTh3xA8VUFBJ2w
         hf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NfeGz675bo0ZAQkD1KeicPK8T+9nudR2MVitSK3mkmI=;
        b=q/2Zz+U+/vPweas6GhbHpEu6M7rEQH0cdfBz8ZGEQo/dUjmvMTPKfN6evMF9A6E4qQ
         rGSqTZJlFDu4lEvWZMtufKDo/HKrZoUKIPFCHrBJKSL0e42ivRY/1P1THB3IgEzvC7aZ
         ujr6TNqXxcjrH9YxzOXtURf4vg3sePH9cdtXUUZIF967xCbYHLapu1LjtHTTg5qMt7sh
         GDyu7H3c5CbxZ3byLi19GfeXr8+bEVIvhVEguP/EdWIk52mC3KdjNH2lor8bkNJvZrD4
         JZUUXpIsB1Jf5vaTaaILhjwtyAulbOw2XkiS308bXMJ1O2vpgJrm3gQUSKOFpgwGowCb
         KY0A==
X-Gm-Message-State: AOAM532dkGJEim5OUOrQKLRsVDqKz2GA2lyQQnfdtbOng4QavR8CBWj2
        EJl1WT3aM6EEAU/MAAZn8ex/qZd1LR9u8NLLbU30IvAuf4Ar/Q==
X-Google-Smtp-Source: ABdhPJwBOX7xYFt8nvx7Ihazb7tPaF6woxVxl6yfCpvjDeCk/qlAfPInPy5Imr/zr+u/k9vC932UVin83BVZ2WFqwnY=
X-Received: by 2002:a05:6122:1306:: with SMTP id e6mr7233502vkp.13.1639684058230;
 Thu, 16 Dec 2021 11:47:38 -0800 (PST)
MIME-Version: 1.0
References: <20211215160906.17451-1-semen.protsenko@linaro.org>
 <20211215160906.17451-2-semen.protsenko@linaro.org> <Ybt78LP4KDYoQrDy@robh.at.kernel.org>
In-Reply-To: <Ybt78LP4KDYoQrDy@robh.at.kernel.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 16 Dec 2021 21:47:26 +0200
Message-ID: <CAPLW+4=z12N-WFDVfmyTZ2oj_X-+3gHTGaJ0CSTJ5JrM8fK2oA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: clock: exynos850: Add bindings for
 Exynos850 sysreg clocks
To:     Rob Herring <robh@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        David Virag <virag.david003@gmail.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hao Fang <fanghao11@huawei.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 16 Dec 2021 at 19:48, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 15 Dec 2021 18:09:00 +0200, Sam Protsenko wrote:
> > System Register is used to configure system behavior, like USI protocol,
> > etc. SYSREG clocks should be provided to corresponding syscon nodes, to
> > make it possible to modify SYSREG registers.
> >
> > While at it, add also missing PMU and GPIO clocks, which looks necessary
> > and might be needed for corresponding Exynos850 features soon.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  include/dt-bindings/clock/exynos850.h | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
>

No malice intended, just forgot to do so, sorry. Already added all
missing tags, will be present in v2 (gonna send it soon).
