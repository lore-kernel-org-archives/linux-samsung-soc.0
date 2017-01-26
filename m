From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/8] Pad retentions support for Exynos5433
Date: Thu, 26 Jan 2017 10:50:57 +0100
Message-ID: <CACRpkdawiAp3xqVd7J5ZAd2dQ=X09DGybyw0EVp=07w8-ccKfA@mail.gmail.com>
References: <CGME20170126083401eucas1p20b4794fe46ccf2189bf734f0d8e3c536@eucas1p2.samsung.com>
 <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:32802 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753332AbdAZJu7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 04:50:59 -0500
Received: by mail-io0-f177.google.com with SMTP id v96so34412420ioi.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2017 01:50:59 -0800 (PST)
In-Reply-To: <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Thu, Jan 26, 2017 at 9:33 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:

> Patches in this patchset depends on each other. They are order in such a
> way to make the changes bisectable.
>
> Patch #3 has runtime dependency on #1.
> Patch #5 has runtime dependency on #3.
> Patch #6 has runtime dependency on #4.
>
> This patchset also directly depends on the "Move pad retention control to
> Exynos pin controller driver" patchset:
> https://www.spinics.net/lists/arm-kernel/msg556074.html

Do we *have* to merge it runtime-bisectably?

I'm asking because we need a huge immutable branch
(I guess in the MFD subsystem) to deal with that.

It'd be great if I could just apply the pinctrl patches in
isolation, then Lee applies the MFD patches in isolation,
everything compiles in isolation but maye just work once both
pinctrl and MFD are merged upstream, as in linux-next
or Torvalds' tree.

That is one of the reasons why using a system-agnostic
syscon regmap lookup is so good, BTW.

Yours,
Linus Walleij
