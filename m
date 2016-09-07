From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 01/17] pinctrl: dt-bindings: samsung: Add header with
 values used for configuration
Date: Wed, 7 Sep 2016 23:18:39 +0200
Message-ID: <CACRpkdb9gq0Zez=_NW8XB6YKiJteC3GB12e-Wi9my52b4Q-C7A@mail.gmail.com>
References: <1472987060-28293-1-git-send-email-krzk@kernel.org> <1472987060-28293-2-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34487 "EHLO
        mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755453AbcIGVSk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 17:18:40 -0400
Received: by mail-oi0-f48.google.com with SMTP id m11so44505441oif.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Sep 2016 14:18:40 -0700 (PDT)
In-Reply-To: <1472987060-28293-2-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

On Sun, Sep 4, 2016 at 1:04 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
> Hard-coded pinctrl configuration values are scattered through DTS files.
> The numbers are difficult to decode by human, especially without the
> datasheet.  Additionally the drive strength differs between S3C64xx,
> S5PV210 and Exynos SoC families increasing the confusion.
>
> The header will help making this more readable and maintainable.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Take this with the rest of the changes into ARM SoC.

Yours,
Linus Walleij
