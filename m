From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 06/13] pinctrl: samsung: Fix samsung_pinctrl_create_functions
 return value
Date: Thu, 26 Jan 2017 10:06:17 +0100
Message-ID: <CACRpkdZZ9Qb994Cj4Du+9wHy2_SQvpOCpWYmJr1ks+DyUwyunA@mail.gmail.com>
References: <CGME20170119134907eucas1p126b668fe7e8054da6c4233d3ab345ba5@eucas1p1.samsung.com>
 <1484833733-16082-1-git-send-email-m.szyprowski@samsung.com> <1484833733-16082-7-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:35010 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753130AbdAZJGS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 04:06:18 -0500
Received: by mail-it0-f50.google.com with SMTP id 203so126470474ith.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2017 01:06:18 -0800 (PST)
In-Reply-To: <1484833733-16082-7-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Thu, Jan 19, 2017 at 2:48 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:

> Return proper error code in case of memory allocation failure.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Patch applied.

Yours,
Linus Walleij
