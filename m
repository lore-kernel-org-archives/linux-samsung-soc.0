From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 0/6] Pad retentions support for Exynos5433
Date: Tue, 28 Mar 2017 11:22:59 +0200
Message-ID: <CACRpkdY1snu8tNaUW4hR7zvMSMv10wUoeAnv28Ag=NJuHAS-Pw@mail.gmail.com>
References: <CGME20170323080346eucas1p216eec41325d220774ecec05b397e83a6@eucas1p2.samsung.com>
 <1490256207-10061-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:38366 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753110AbdC1JXU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 05:23:20 -0400
Received: by mail-it0-f51.google.com with SMTP id y18so11761287itc.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Mar 2017 02:23:19 -0700 (PDT)
In-Reply-To: <1490256207-10061-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Thu, Mar 23, 2017 at 9:03 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:

> This patchset is a next step to add support for all power domains on
> Exynos5433 SoCs. This patchset contains patches for Exynos pin control
> driver and Exynos LPASS MFD driver, which are needed to make the
> platform ready for adding power domains support.
>
> Patches in this patchset have runtime dependency. They are order in such
> a way to make the changes bisectable (mfd lpass changes should be applied
> after pinctrl patches). Other dependencies mentioned previously in v3 of
> this patchset has been finally merged to v4.11-rc1.
>
> Patches have been rebased on top of linux v4.11-rc3.

Pinctrl development is based on -rc1.

I expect Krzysztof to figure out and apply the patches to his Samsung pinctrl
branch and forward to me, all looks OK to me.

Yours,
Linus Walleij
