Return-Path: <SRS0=lSeZ=2D=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06E4C5ED7C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5D432473D
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RWONLY0C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbfLMQAE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 13 Dec 2019 11:00:04 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41636 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727927AbfLMQAE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 11:00:04 -0500
Received: by mail-lf1-f68.google.com with SMTP id m30so2318092lfp.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2019 08:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6d355onEMaQLbFzGsPL3qOJq28B0iID9uA32I/OH8KY=;
        b=RWONLY0C20iDqzVgHJOMcG0CbIMsarnktxykVv3fzYeDcK6YbJdMcv6KZE7y0BCOlw
         kLoWcGHRdoHmerJ3dVsBoOp4+zwDg69u2Io0/U/CLa1xJvkhFLD8LWAP0muL6aVREdlr
         dq+PsPNZF/el3cTFU9c2TLiU19CHe1GqHUjhb9Ao2Js8Swj/6tWPBA7nCliYmQ2ENqoq
         hV/HLAOs2jFe5nVBnbYC33Yl1pAlomhdJeOm3hDAhsk430Id7SWzriiZyxqxlmZ3qMta
         g9H4lygWNPJQKBKl3RS5+yH5mlJUPdGNspRipjnSbgj5B4PwJcy9sof2EmJsR3mce3dI
         IgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6d355onEMaQLbFzGsPL3qOJq28B0iID9uA32I/OH8KY=;
        b=YLPzSLpRa/Vgn/KtbusuaBJUoxBpQd2GaM7/e+PemXH9pJFnmr8vFOHJM0p1yeajgB
         zE3zjFCeHaxEOnQ74X8z1LBDIfA4+UKC81xwGN3kwANaa9Fs4l95hslOyIV0mcfg0EEy
         8jJgV1MJ4bysuTnxl1S+4g6FxYhpJJUus4xQ06N5NulVhxKXu77/vuG0zPoK2+41CsC9
         5hQYAUVS5WG47TswH1FYI5T40RkcTALi0Zr5roZk/Ht0PySthEg5RtqD3Fa6m0iirrTI
         54V4Tih63FMro7nFEL7bofZyZwhzyqCV56n8AKP0MsSKixfYf//C0VAX3dGURwxrHtGg
         NaNw==
X-Gm-Message-State: APjAAAVDDatZKuJLV9rVkr7/cJ6qRHU+lcFV+vOd6t7se7BFJzLlR+uk
        9I/eunq0HVq04ql+Int+9DdoKeC4A9k6daIylJiXDGKdoPk=
X-Google-Smtp-Source: APXvYqyf9tBuza0aFqrtSUyxftprBtALJcGpe4oAZEEePdM+WgDYDegqUpqrrK70d4RPfcTRXsPPG2o1rKeoC2pjSzU=
X-Received: by 2002:a19:c648:: with SMTP id w69mr9309054lff.44.1576252802440;
 Fri, 13 Dec 2019 08:00:02 -0800 (PST)
MIME-Version: 1.0
References: <1576221873-28738-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1576221873-28738-1-git-send-email-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 16:59:50 +0100
Message-ID: <CACRpkdaQZZcaPtDfieGSP9wSow11Xv3K_x89bq=QeYGb2BhpHw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: Fix missing OF and GPIOLIB dependency
 on S3C24xx and S3C64xx
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chen Zhou <chenzhou10@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Dec 13, 2019 at 8:24 AM Krzysztof Kozlowski <krzk@kernel.org> wrote=
:

> All Samsung pinctrl drivers select common part - PINCTRL_SAMSUNG which us=
es
> both OF and GPIOLIB inside.  However only Exynos drivers depend on these,
> therefore after enabling COMPILE_TEST, on x86_64 build of S3C64xx driver
> failed:
>
>     drivers/pinctrl/samsung/pinctrl-samsung.c: In function =E2=80=98samsu=
ng_gpiolib_register=E2=80=99:
>     drivers/pinctrl/samsung/pinctrl-samsung.c:969:5: error: =E2=80=98stru=
ct gpio_chip=E2=80=99 has no member named =E2=80=98of_node=E2=80=99
>        gc->of_node =3D bank->of_node;
>          ^
>
> Rework the dependencies so all Samsung drivers and common
> PINCTRL_SAMSUNG part depend on OF_GPIO (which is default yes if GPIOLIB
> and OF are enabled).
>
> Reported-by: Chen Zhou <chenzhou10@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

What should this be applied on? It doesn't apply to my fixes
branch which is close to v5.5-rc1. Please rebase and resend
if this was not based on that.

Should this have a Fixes: tag?

Yours,
Linus Walleij
