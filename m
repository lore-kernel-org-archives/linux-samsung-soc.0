Return-Path: <SRS0=lSeZ=2D=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD0EC341BB
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2DFE24796
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lm3EUMhH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbfLMQDs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 13 Dec 2019 11:03:48 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40796 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727974AbfLMQDr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 11:03:47 -0500
Received: by mail-lf1-f68.google.com with SMTP id i23so2334235lfo.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2019 08:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kvwPLR8XH8zayvVN3UCZB+7bnWFYQS/MV8OjCwXgshE=;
        b=Lm3EUMhHLF/p5ts9CtLbB2fyDZXRoWjputOXrBtc8w7ehCGKjKtMXvoPrTasEbwr9L
         Q3AtGb4t5b12A4UETL2BUWgG5Cn3ExxVW9Yl6AUo8cXmMYvCfobKGRsZm6pxrhmK0a9z
         6zhXvlJpLeBhB8oPfsi5pCryXMJx1gJbvGiSkKx+RtK40sUMHfAm6omvG+NKM8ZxMty/
         w20SMAR0w64D3FA4cvC4PtT51ker8sPYcr61mC8aVoUs/PGoA1VNm+lQDmAsk/4duDpA
         C1NaXWrGkDcKqm5BN9O+v2tClo6BGzebqA+UgrlOucQnwmsRGpCP/fmpfk0BdXurfeE0
         TwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kvwPLR8XH8zayvVN3UCZB+7bnWFYQS/MV8OjCwXgshE=;
        b=RsDW8y/BKNnHBbxwBDz+1Wfva6SPP1WY+uldwYGbyn0M9dYQBXUNaAL+abrShIJc3C
         yjM9Vi5DsJwUKYKqn8WGLLrJauFYTwE5uTDfMGxzW2wbF1/vAxZaex7ORTU2/XUbZ/SE
         9ycPUZhGPLdsfYH5yM+BTk2lf0unms/fhLaRIRZc6uyKPQL2jF/2gbJwoDcb7gt9P0yD
         IOxEJfFaEAuqAms+MiPzX8deok35TEsM+Ve/uZ4nPLorm/NhplHXGZ6kuP3heqzAAQ6J
         CF7BLgKozaQv7r7qnQ/m6varGMkZPllPQCSmXlRyyxJQMq5DEFQpH/O6lOuYjzBXBrnH
         FKlQ==
X-Gm-Message-State: APjAAAUXO33m7zDx4oANrBvqy1R686oPqQ86iInnjWkbUlfJ17ovbPXA
        0nbHQck+47q4cbGC9na0yPimV62I9KCH5F4ALLxCEg==
X-Google-Smtp-Source: APXvYqzlUqj1JYbmvToLn4WKba8fTKOUKLwpvrIjGBIxwKCLtbdTwf4N8ZSiv2/s71Wmfh8n29zU9ltAma3PI2ii6Ck=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr9176651lfi.93.1576253025593;
 Fri, 13 Dec 2019 08:03:45 -0800 (PST)
MIME-Version: 1.0
References: <20191209163937.8156-1-krzk@kernel.org> <20191211182739.GA6931@kozik-lap>
In-Reply-To: <20191211182739.GA6931@kozik-lap>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 17:03:33 +0100
Message-ID: <CACRpkdYX+-GWvUhhXvJiJ1bCib-qjyEvZ0qYB35q+OT7hy=56Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: samsung: Enable compile test for build coverage
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Dec 11, 2019 at 7:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Mon, Dec 09, 2019 at 05:39:36PM +0100, Krzysztof Kozlowski wrote:
> > The Samsung pinctrl drivers require only GPIOLIB and OF for building.
> > The should be buildable on all architectures so enable COMPILE_TEST.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  drivers/pinctrl/samsung/Kconfig | 8 +++++---
>
> Applied both to my tree. I'll send them to you Linus later in pull
> request (unless 0-day catches some build failures).

Ah I see OK that's fine, forget my comments about not being able
to apply patches then, I'll just wait for the pull request :)

Yours,
Linus Walleij
