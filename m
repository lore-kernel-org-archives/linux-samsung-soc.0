From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Remove an always false dev->of_node test
Date: Wed, 7 Sep 2016 22:11:31 +0200
Message-ID: <CACRpkdaYeoLaiYfbtr4QF-H2z-zjfa-JjEX_4cUtUZQ13VyxeQ@mail.gmail.com>
References: <1472731140-18034-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:34770 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754639AbcIGULd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 16:11:33 -0400
Received: by mail-oi0-f41.google.com with SMTP id m11so42155948oif.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Sep 2016 13:11:32 -0700 (PDT)
In-Reply-To: <1472731140-18034-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Thu, Sep 1, 2016 at 1:59 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:

> samsung_pinctrl_probe() can be called only after matching
> the driver by the compatible string so this already implies
> a non null dev->of_node.  Remove the always false test
> and related error trace. While at it drop another error log
> in case of memory allocation failure - any errors are logged
> by the memory subsystem.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Patch applied with Krzysztof's review tag.

Yours,
Linus Walleij
