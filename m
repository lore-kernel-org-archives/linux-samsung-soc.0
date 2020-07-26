Return-Path: <SRS0=+B38=BF=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B29BC433E1
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 26 Jul 2020 22:37:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6889D20715
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 26 Jul 2020 22:37:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iNadD80I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgGZWhq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 26 Jul 2020 18:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbgGZWhq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 26 Jul 2020 18:37:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9EBC0619D2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2020 15:37:45 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v4so5501022ljd.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2020 15:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GpwOccBGYJpOpejj8LGvoGKhI+wr9+pa+RZ9Hp5UCyA=;
        b=iNadD80IPgOf3bhhB7SDd6GKj3H+1+4alVP+Ffn+LPUXErddmDBoOk9K83lZmBHJph
         r+/zFAlf+vnQhl2ZkuGEmds9lsqPdmoh3QoKaSqj8uHvY5fO/+3ZDxkA7vtne677n8tA
         gIfsloGmVAUJSfgiZsz8zHsRWudlEzztGCL/gj6XGwOkBn9HXyeI/tbgwhWXsXgf/fbe
         BQ9bnnnPLfJgcFqpai9IledZDeG7F8q5Tuufl6yo/2T6TCn3nlqvbpPWUs4byoFDkmgu
         v9CBsff6vo+oDfOybz+sp0EDIpxCDqrNNL5AjcJcTX7n5HqCWPRVuzRerHlBqxQVA5ow
         m9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GpwOccBGYJpOpejj8LGvoGKhI+wr9+pa+RZ9Hp5UCyA=;
        b=auITJ52ccoIE2EWxd4s53oGzL5XXG0dNL4IPbDOCwpHDvpfqfl+7rbc9P7jz5awnHf
         JSSdkrk2vpio0i7HwsDmRLDP8h1gFZW7U8wBT86AL/Dj+dpWkVncxUq59DwpebIF/cXu
         Dko/CVYcAXO2TobP3DNUDrSpMI/5yvnOreEM8cDmoLnOJcuujwdNszXp+mCZ4Te7vUCm
         JYK4+Pu0sKzplEBE6uXPyk6+5DZa3JcoWObXyvmur7CFzJmpvY6YB9tdLNdAK1B2+pSE
         DY1sNYEJILkaKfUT6igxkfVLolEDZT4dW9RGBMup/yzC356eXo1JEO8ftBn5nUhcOF51
         irug==
X-Gm-Message-State: AOAM5316oejwnFW5NV17cnIQ1x/WncSD8tRzpfaQhfCD80TWkwHo9cUu
        fhiVTOJzMeD1Cp2H6pObzzJreufOEF+EPLklmFgzMQ==
X-Google-Smtp-Source: ABdhPJxmd9QUe9VTvRu3V0FXazi56yvP4h8Uxx2eBEqtTPbBeG6J64+i3U7BvSmPzjaXb02KI2iaDoGaEnBxDnrUw5E=
X-Received: by 2002:a2e:90e:: with SMTP id 14mr1813189ljj.293.1595803064397;
 Sun, 26 Jul 2020 15:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200720145412.24221-1-krzk@kernel.org>
In-Reply-To: <20200720145412.24221-1-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Jul 2020 00:37:33 +0200
Message-ID: <CACRpkdaPUbPmt9LK9qmek-zyDd9QNWTpW6QuPW9DRptFhNX1PQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: Use bank name as irqchip name
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jul 20, 2020 at 4:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> From: Marek Szyprowski <m.szyprowski@samsung.com>
>
> Use the bank name as the irqchip name. This name is later visible in
> /proc/interrupts, what makes it possible to easily identify each
> GPIO interrupt.
>
> /proc/interrupts before this patch:
> 143:    0     exynos4210_wkup_irq_chip   7 Edge      hdmi
> 144:    0     exynos4210_wkup_irq_chip   6 Level     wm8994
> 145:    1     exynos4210_wkup_irq_chip   7 Edge      max77686-pmic, max77686-rtc
> 146:    1     exynos_gpio_irq_chip   3 Edge      3-0048
>
> /proc/interrupts after this patch:
> 143:    0     gpx3   7 Edge      hdmi
> 144:    0     gpx3   6 Level     wm8994
> 145:    1     gpx0   7 Edge      max77686-pmic, max77686-rtc
> 146:    1     gpm2   3 Edge      3-0048
>
> Handling of the eint_wake_mask_value has been reworked, because each bank
> has now its own exynos_irq_chip structure allocated.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>
> Hi Linus,
>
> I have only one patch queued for Samsung pinctrl. Can you apply it
> directly?

OK patch applied!

Yours,
Linus Walleij
