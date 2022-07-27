Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1281C00144
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 02:16:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233855AbiG0CQg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Jul 2022 22:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbiG0CQf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 22:16:35 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBBEE3C176
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 19:16:33 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-31f443e276fso43199607b3.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 19:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dVN886NSrhQs8UWcwxaCPHANRVdx/m1bEPjAIN2GoxU=;
        b=GjkAHE5qR37LBJVes25IDRzw02yBl1adJiKjgbAj6FShHvOdjwfz78fltGk1xlzovC
         uwLhYx4fFuZp3QWHsGSvAXWaoq8EFp7PeFaXSMnvG7yxhZdKDDFlJereIUDZQns8h5I+
         V58kR3heJaQqGz0rMaQQ/zKGX45W3r720h1gluPDtnn9qaAkxBni08RmBRPsB8w/CdEp
         QxIr787KZucoU6ES4FEW/8dt27JadkSsdISlSG1WodhxdWG6F1DQJvYxBcWabL5ysU1D
         pzmk7hhNkcyUIN3ATMp1FSYkXJias/sOiSvv7vKwpc4DkvA5MrRGJxjrzCgYkldrAFlt
         8Dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dVN886NSrhQs8UWcwxaCPHANRVdx/m1bEPjAIN2GoxU=;
        b=t5d1yDFGsgPiNGqYvTogyvwDBd35DOLX7diyLDbCm2S8aGJOFxYyXWUQOpTmU4Hvv0
         H3Ftj04WDbRZfm4G3Lj2yhjnfXL1sJEjift37Q4Yv5ey2CgbYic3kXC0jrWa1ioh/tKd
         x882P9iT+R70pbsqDOMKf1xrvb/dX1qudsqkvmJOzZwHLd0ONSsc4uHJdxWEqq20D5Dt
         +AJO92zhuoL22gFar4sX0IK7rT5C1wBkEjxmPUfVPhzQkCclkpevC2RmrqtgJakiq8RK
         CCmRXeA1MHmzAYfMTEDE2RuwMBwRJRN2XWZoKmbST5/ym/GAWQFjE9Oi9fJnGqxm1Jnq
         GLDQ==
X-Gm-Message-State: AJIora+y6wHzIQDyWvi70p/M9WNi2qXTwoBTdK5I/eaRQ0ahr7s2ETpv
        gAbKwwJURsVhpuXP+g5Hxp/JO54zceROSrUHbkA93g==
X-Google-Smtp-Source: AGRyM1shFIftgpaxzZdS4kTpLlP5M16qJKmX4KJ/sZiobJ0XSiBFR7JGQsYQPUGcISQ9B3sW42W/eq2EFfD3Ddj/6ac=
X-Received: by 2002:a81:4807:0:b0:31e:7002:46cc with SMTP id
 v7-20020a814807000000b0031e700246ccmr17615235ywa.83.1658888192913; Tue, 26
 Jul 2022 19:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220727013403epcas2p452b5f66597b4298b7a573393927ac96e@epcas2p4.samsung.com>
 <20220727013349.3056826-1-saravanak@google.com> <000001d8a15c$da89d980$8f9d8c80$@samsung.com>
In-Reply-To: <000001d8a15c$da89d980$8f9d8c80$@samsung.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 26 Jul 2022 19:15:56 -0700
Message-ID: <CAGETcx8W8kveuW9Wk7kQEMJuKUHZUk2wA2B39Uy0CJL6UYVFzg@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: samsung: Finish initializing the gpios before
 registering them
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jul 26, 2022 at 7:02 PM Chanho Park <chanho61.park@samsung.com> wrote:
>
> > Subject: [PATCH v1] pinctrl: samsung: Finish initializing the gpios before
> > registering them
> >
> > As soon as a gpio is registered, it should be usable by a consumer. So, do
> > all the initialization before registering the gpios. Without this change,
> > a consumer can request a GPIO IRQ and have the gpio to IRQ mapping fail.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
>
> Make sense for me and I tested this on my Exynos Auto v9 SADK board.
>
> Reviewed-by: Chanho Park <chanho61.park@samsung.com>
> Tested-by: Chanho Park <chanho61.park@samsung.com>

Thank you!

-Saravana
