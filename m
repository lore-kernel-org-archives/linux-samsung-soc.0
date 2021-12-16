Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D592FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Dec 2021 23:04:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236815AbhLPXEv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Dec 2021 18:04:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236223AbhLPXEu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 18:04:50 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C26C061574
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 15:04:50 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id q21so413141vkn.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 15:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=62Uz9CtJjse1+mi3hhz9xxMLxgwHg1IYiyqR2g0WvAA=;
        b=oPpXX7fgyAeN9ysmwYzwz32+GFqY/Iii0AaKKKG+n0F9HkkkErU2yygWDqsaUCYycZ
         PcNZbJ12SXX3b3Ku2pVI0MO8fMqE5E7ZnTAgG8m/oSqCbVuVnCwPSgHfCP6PtW8k3QeN
         m640crZ1dsbJ0nS1wTE0RVThYDu93z94C8BXBYq4A1y+1pujPBnx/afeq5nwSzcA1aMU
         BbuSP5Mr1hR29FbnlS+jkOci7VnaFa2W/yi17LxpDiKDriiemUVO/gNl2Bc4Ewf8hLog
         NqD1KMoJHN4h8hcOO/JPmJzzFbg6N1ey9V8xhj7D87bcKMvi/NEsMJOKW7LmZbiMbR32
         8VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=62Uz9CtJjse1+mi3hhz9xxMLxgwHg1IYiyqR2g0WvAA=;
        b=5BEHxn3z8UODAfvidrG17F4BTkM8DWD/zC6tbh9YTzX4TBGnQ0Ky+SfG9rCy73m331
         1iKKdI/7oG4zCJOiMkgYAmVzJIqh9FiUq76wBmzOrxLsrYamUYj3PxC0S8ee9FeZH8pG
         YBuJdssqN0ysfRs+X/kPSCdhA6mZEEujYV00/az3AFNmc3SiwEFBi0hc5QlCobIagCh5
         5Im+RAkDsT9q0CIh7cF6wFqrsDZxSIuBDBESTtjFCD/JLEDuMYyzoQn74lpG99XZcyfZ
         55yggw5TlEyobqu/9kkeDMyvsc8J5DevHtLcax3HuQLgYKIpLYwEaNCthukvWR2PlLn+
         qt1Q==
X-Gm-Message-State: AOAM5315t3KHQxYdozSTLzkYEy9k3BjxkeeMijnX6JwFJHWEfPiJBIsi
        D6vcA0a7SqWEKQ23uSz1uUZy792YL0H50VGT++uL3A==
X-Google-Smtp-Source: ABdhPJw2TfUn4th8xuwGPyMcVF2I9HdXvfjfdX6cQIhp0D9opZOAXKvCtBGcWZWf6KrSbEYAnCgWoautwgTD+eidIEM=
X-Received: by 2002:a05:6122:c9b:: with SMTP id ba27mr176340vkb.14.1639695889846;
 Thu, 16 Dec 2021 15:04:49 -0800 (PST)
MIME-Version: 1.0
References: <20211212181057.20210-1-semen.protsenko@linaro.org> <YbuuFztynhVUcyTM@kunai>
In-Reply-To: <YbuuFztynhVUcyTM@kunai>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 17 Dec 2021 01:04:38 +0200
Message-ID: <CAPLW+4mB5=ZfVPBAyV+yMr6xZif_kqtPTwO_8dMmVXyntE-4yg@mail.gmail.com>
Subject: Re: [PATCH] i2c: exynos5: Fix getting the optional clock
To:     Wolfram Sang <wsa@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 16 Dec 2021 at 23:22, Wolfram Sang <wsa@kernel.org> wrote:
>
> On Sun, Dec 12, 2021 at 08:10:57PM +0200, Sam Protsenko wrote:
> > "hsi2c_pclk" clock is optional and may not be present for some SoCs
> > supported by this driver. Nevertheless, in case the clock is provided
> > but some error happens during its getting, that error should be handled
> > properly. Use devm_clk_get_optional() API for that. Also report possible
> > errors using dev_err_probe() to handle properly -EPROBE_DEFER error (if
> > clock provider is not ready by the time I2C probe function is executed).
> >
> > Fixes: c93ac09df2a8 ("i2c: exynos5: Add bus clock support")
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>
> Applied to for-next, thanks! But I needed to fix the Fixes tag?
>

Ah, sorry about that! I probably looked at some other tree. Thanks for applying!
