Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6741DC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Apr 2022 12:21:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346004AbiDKMXT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Apr 2022 08:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbiDKMXR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Apr 2022 08:23:17 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90261C132
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Apr 2022 05:21:03 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id bh17so30438798ejb.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Apr 2022 05:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RWDiMWfhIWr53FwXEogy4euvp8PAvtGehm8/baIndcM=;
        b=zQpR9VZ+woJvNm5syngZCOBKwr61vOpjGU9a4vz+/8zEiU57r4DunLKIktFy6+XJOY
         rHZC+TmG68NnXuKeXCGRNoJeyGNbsVWhdcjj8WjAsQmCLb4dp9ysubH/dHqKRovadDlE
         x0FujnVPvMz5nyYyxT98DpK2RyMqbKeKIRRCABEm5v7fsb6W1u/w7QXoWMSngRY7jIUU
         /xCqP+AYXVqsQ7sRPyRMuRJ8u3OLMMY2bW9p+5wjBVlXXpB9t3DLN0Q/W6xBPK/3c8rc
         dQwFZ0V/hsyYTs9Gaw8hhxTMrAnzyuZltzbKevnbBsYWBfIwY1tDyOAd1jRHFX4Q5IKY
         qvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RWDiMWfhIWr53FwXEogy4euvp8PAvtGehm8/baIndcM=;
        b=CkJLboVitfoYIAfOb0YVZ5rtARKlcUNWTNadqfHoTZghyV/I9LV22vxwekF/iXBzkJ
         RfbH+wKko44UgWit2uPLTROzp89PVM0zlzbwm5P1GOSOrHFJ7JoFxzghAp90GcM5+eem
         TjmAdkZCk6p04S6bLt/pU2n8sLJ/LXG4GZDylPO+9pOp0vLdffVLeDgrr787hTyM5ND+
         a4pLnwUe0zmLZsU+q6t4OCqv4XsLfXeNJ+Uy/9aD+Q88wrRU0h82deRACR1y1NheCxpD
         e+O3o+6zTl60ZT9Irfd+AKNNAb7FeYa21+yQsT3SUqy+5fcYYH5zWO2TaHHWBDVv3NEO
         ROEA==
X-Gm-Message-State: AOAM531eT1au08lTCwi5WUmcKbuUx/Ye9zhtfp4QkHcNPZy3l6TJSmk3
        4MkMVQBdchRHwZXnC4rjNZsoOA==
X-Google-Smtp-Source: ABdhPJzoWPcAyK9l16OvBAmj/RtOilX6prVo8h/I1VXPgagIcmmB9cRqHlnw49UNvIPQhNfGzSvvNA==
X-Received: by 2002:a17:906:68c2:b0:6b4:9f26:c099 with SMTP id y2-20020a17090668c200b006b49f26c099mr30356381ejr.41.1649679662257;
        Mon, 11 Apr 2022 05:21:02 -0700 (PDT)
Received: from [192.168.0.192] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id w6-20020a170906d20600b006ca00cb99e0sm11790596ejz.34.2022.04.11.05.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 05:21:01 -0700 (PDT)
Message-ID: <4513324d-3dba-fd21-2a7f-9f1b9ef535cc@linaro.org>
Date:   Mon, 11 Apr 2022 14:21:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <maz@kernel.org>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/04/2022 12:35, Andy Shevchenko wrote:
> Switch the code to use for_each_gpiochip_node() helper.
> 
> While at it, in order to avoid additional churn in the future,
> switch to fwnode APIs where it makes sense.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c  |  8 +++---
>  drivers/pinctrl/samsung/pinctrl-s3c24xx.c |  2 +-
>  drivers/pinctrl/samsung/pinctrl-s3c64xx.c |  4 +--
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 30 +++++++++++------------
>  drivers/pinctrl/samsung/pinctrl-samsung.h |  2 +-
>  5 files changed, 22 insertions(+), 24 deletions(-)
> 


Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
