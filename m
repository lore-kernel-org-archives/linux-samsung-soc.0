Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101F8C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 17 Oct 2021 21:25:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE7F760F48
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 17 Oct 2021 21:25:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242717AbhJQV1y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 17 Oct 2021 17:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235598AbhJQV1y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 17 Oct 2021 17:27:54 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35AE6C06161C
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Oct 2021 14:25:44 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id n7so5203763ljp.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Oct 2021 14:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g2pGBYqqagt5SCH7aam9HNgmEr9J7izYusM+0Gy1d7Y=;
        b=jdyj2h0cAQfZ0aDGxoBoFopeXKD+wix5llTIC8Imkl0AYyS1welKBCnSpILYBoeIT7
         R73o4A3mDli71iwcnzO/4VlWRYbZCT1buwBOwU/gTb8cB0ddi6+wqruB/knLJbIxJlhc
         OvcT2s/awZr6UD8PMY0jQqZuHI4G3fn+vAG5ok22UFhbtlVOs0zL1WmxEG4VRAi/3PcO
         sq/LdGEfw44PuOELgK+QUtOh9BOZg++4eKMm0H69D8P8dtyWJ+p1m2+ZBZ76OS5f4LjU
         2yQovf6fS2Ow4kJBj0jFzf6uPeOcRRlXB+YDeW+1w1U/1ONtqbJ00B46e8lf8cC4PMpn
         FIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g2pGBYqqagt5SCH7aam9HNgmEr9J7izYusM+0Gy1d7Y=;
        b=Xo3kkanYqyde+gt9b1zR6yR8SRKzdEpjiv1MTVNFMKvYkb01JBXHHQJ4QMDJpaPzk1
         fFf/RczPt+UCeHaoqUXCKAYszviovDXKRBeIglGPApimbUKOubIJJKSwBUtVbaF1wV5g
         YUhL1m3iycd4NLoGozA/3cYNfbdGkZ//tuIp/vs5w99aUUR6TtZWs/9ut/UQrruRIFRv
         Ke1SxMLArY4u7U0YBEGFNDyKT55SOSe/0iqd704bMaKuAajWGr+KhwbBf6kH2GmwZLHo
         qLGYi7OFBgDJO7a+CMfRb3H26ACBSnXCR/Vcz6+x2nsrn4RV79svee78f0ME1IzUGDuA
         C3IA==
X-Gm-Message-State: AOAM531zRwBxEc3EI0Ew8W8Jcd4in++smIgcPOvqEyqeU2BXJ2CuiFL7
        V8kLJDJi54Gtloa+4idTMA/zTc93OqhZsdOzQn6SNg==
X-Google-Smtp-Source: ABdhPJyl0gN85ogrzjMkmiL/3/hrKdEApUqz67PQ9/vYUycF2G08Zh+w5X7n2qtkxsRSoPiTdmS/oczHPp7lz9QP48w=
X-Received: by 2002:a2e:7f05:: with SMTP id a5mr27587697ljd.261.1634505940887;
 Sun, 17 Oct 2021 14:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211017171912.5044-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211017171912.5044-1-krzysztof.kozlowski@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 17 Oct 2021 23:25:29 +0200
Message-ID: <CACRpkdY4HXoVVmpCZxqJmQrheGpns0Q5MSeVkUhuPgykONPCOg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: support ExynosAutov9 SoC pinctrl
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Oct 17, 2021 at 7:19 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:

> From: Chanho Park <chanho61.park@samsung.com>
>
> Add pinctrl data for ExynosAuto v9 SoC.
>
> - GPA0, GPA1: 10, External wake up interrupt
> - GPQ0: 2, XbootLDO, Speedy PMIC I/F
> - GPB0, GPB1, GPB2, GPB3: 29, I2S 7 CH
> - GPF0, GPF1, GPF2, GPF3,GPF4, GPF5, GPF6, GPF8: 52, FSYS
> - GPG0, GPG1, GPG2, GPG3: 25, GPIO x 24, SMPL_INT
> - GPP0, GPP1, GPP2, GPP3, GPP4, GPP5: 48, USI 12 CH
>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> Link: https://lore.kernel.org/r/20211008091443.44625-2-chanho61.park@samsung.com
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>
> Hi Linus,
>
> Please apply it directly, I have only one patch in the queue.

OK patch applied!

Yours,
Linus Walleij
