Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC65CDB46E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Oct 2023 14:03:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378664AbjJLODv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Oct 2023 10:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378591AbjJLODv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 10:03:51 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6898D6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Oct 2023 07:03:48 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d8a000f6a51so1074829276.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Oct 2023 07:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697119428; x=1697724228; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=puIzhyS5gW8rbBXjq7G5YhTTPZWWF1R9uTZ424mIyo8=;
        b=Gy88XDvvmkXt+pXJa4u5QHliGDqbu6a4N7qgkEOzNtirQ3cRHpgJstqW/Ih3HderE6
         E948rl30Mcpi9qsC2I8KpD8ca9SoL+HpKhtd1DJFhND3BWiAzdyAUy+HW+8+RUdS68ss
         vrymLykl7dN2WI/agPO7Nj2TzfNEhd6+xgLjo7QP6cGEAIfSEaupeTk9eKG+kAQLWLig
         JkCHNViDQpeasr8lAD3gVs0gV52CbcBC99Df2hgvg5sb8YQfoVkx5CF80x0X3kIR70cZ
         1QJxUA06eZdaqlTFg0v7KviQe3pQ+btL2XXzKUJUdeQrtHY0UyYnokhjlC1iKefiex74
         0sWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697119428; x=1697724228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puIzhyS5gW8rbBXjq7G5YhTTPZWWF1R9uTZ424mIyo8=;
        b=fY5eekjT4C3eT6ffB6OEsEFyD6kDmIqWjRxvkahy9+egn97asfCU7XbGcOtCcJ+5Tk
         VSqzcflFo4TciNNJisA5ULnl99HoW1UXNBUf6L2scG3/GxFU+6uu4ZpPlB1RdYsvk9tv
         lfpC6WzxBnWtyP4/1zgcLxlxQZhgSG+c0ZTGF6rZzrX6lVWiVhwYCgfkkPpLQo+tVrAq
         X10aUDi9aGY7huxTeTuaWbr8mVt+DGP8hObZmT2Ti+FYrw9aIZ+4y95+tZ+gZ3XG9sDw
         iyqWMy9oqGXPRepLzTo1bqYYuRQlHx82nQ4tfrmgoCkLMHELrPjr9fAQ+WVp2uvjDiqC
         QalA==
X-Gm-Message-State: AOJu0YxdFfCF04ynFJakGcAHxpyAO2LKCv40Q+rDcb6z2pkps5MiIHnD
        8uCu2gns0cCbGjpuEMkaWW8Uwd3iGriGKOOQu3x6Ag==
X-Google-Smtp-Source: AGHT+IEGxOAHYxFWe5zN7VMnBZpra60R5/a8mbnM6JL9voxiaeBEv75YfHq+VJXGhKSFvI92pIjqpWnDeQDRoREZX68=
X-Received: by 2002:a5b:40b:0:b0:d5c:1b9b:6f5a with SMTP id
 m11-20020a5b040b000000b00d5c1b9b6f5amr20283517ybp.44.1697119427708; Thu, 12
 Oct 2023 07:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-17-peter.griffin@linaro.org> <ccd0d092-8ae5-4033-96cf-5ba37e175e0c@linaro.org>
In-Reply-To: <ccd0d092-8ae5-4033-96cf-5ba37e175e0c@linaro.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Thu, 12 Oct 2023 15:03:35 +0100
Message-ID: <CADrjBPpUt-PShY4Wm9UWK7ZxujYsm7DoNUY67tzUMAp33BVY=w@mail.gmail.com>
Subject: Re: [PATCH v3 16/20] tty: serial: samsung: Add gs101 compatible and
 SoC data
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Thu, 12 Oct 2023 at 07:26, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/10/2023 20:48, Peter Griffin wrote:
> > Add serial driver data for Google Tensor gs101 SoC.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> > index 07fb8a9dac63..26bc52e681a4 100644
> > --- a/drivers/tty/serial/samsung_tty.c
> > +++ b/drivers/tty/serial/samsung_tty.c
> > @@ -2597,14 +2597,22 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
> >       .fifosize = { 256, 64, 64, 64 },
> >  };
> >
> > +static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
> > +     EXYNOS_COMMON_SERIAL_DRV_DATA(),
> > +     /* rely on samsung,uart-fifosize DT property for fifosize */
>
> It's an optional property, so you cannot rely on it.

Is it possible to make it a mandatory DT property for certain SoCs?

>
> > +     .fifosize = { 0 },

I can update this to 256, and we can add more sizes as we enable other
UARTs I suppose.

What's the purpose of having fifosize specified in DT and in *_serial_drv_data?

Thanks,

Peter
