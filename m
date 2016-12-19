From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 1/8] soc: samsung: add exynos chipid driver support
Date: Mon, 19 Dec 2016 20:03:56 +0200
Message-ID: <CAJKOXPciOBSWFxcB-sYAXwFdyXqKzs=5duZBPjsL2gtt1Xz-cw@mail.gmail.com>
References: <1481375323-29724-1-git-send-email-pankaj.dubey@samsung.com>
 <1481375323-29724-2-git-send-email-pankaj.dubey@samsung.com>
 <CGME20161219120000epcas1p1904dfec707de0ce20341279f354d74dc@epcas1p1.samsung.com>
 <ceba534d-108d-9ac4-d29c-c2a55af49849@fivetechno.de> <9b64f5c0-e289-9091-c784-ae4bfad3caf5@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:46782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932468AbcLSSEE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 13:04:04 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
        by mail.kernel.org (Postfix) with ESMTP id 792D42034A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Dec 2016 18:04:01 +0000 (UTC)
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com [209.85.214.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F419D202E5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Dec 2016 18:03:58 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id 75so41496513ite.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Dec 2016 10:03:58 -0800 (PST)
In-Reply-To: <9b64f5c0-e289-9091-c784-ae4bfad3caf5@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "pankaj.dubey" <pankaj.dubey@samsung.com>
Cc: Markus Reichl <m.reichl@fivetechno.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, geert+renesas@glider.be, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, kgene@kernel.org, thomas.ab@samsung.com, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Mon, Dec 19, 2016 at 3:29 PM, pankaj.dubey <pankaj.dubey@samsung.com> wrote:
>
> Hi Markus,
>
> On Monday 19 December 2016 05:29 PM, Markus Reichl wrote:
> > Hi Pankaj,
> >
> > tested your patches 1/8 and 2/8 + Javiers diff for verbose output:
> > https://www.spinics.net/lists/linux-samsung-soc/msg56576.html
> >
> > on Odroid U3:
> > [    0.080178] Exynos: CPU[UNKNOWN] CPU_REV[0x20] PKG_ID[0x602d058] AUX_INFO[0x0]
> > on Odroid X:
> > [    0.080169] Exynos: CPU[UNKNOWN] CPU_REV[0x11] PKG_ID[0x1b0f6008] AUX_INFO[0x0]

Hmm.... this needs fixes.

Best regards,
Krzysztof
