Return-Path: <SRS0=b06D=C2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371A6C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 17 Sep 2020 07:41:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00BD5208DB
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 17 Sep 2020 07:41:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n9IUahF4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgIQHlN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 17 Sep 2020 03:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgIQHlM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 03:41:12 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072A2C061756
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Sep 2020 00:41:11 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x69so1115881lff.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Sep 2020 00:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KzGRfdSlTsnA6ugMb6NVstzypnemez8bSdibR9WaXZI=;
        b=n9IUahF4nx7eVElB/b5yWlOaTpw9Io8kHvS+30WVF70Vvg5Rs4hKZ7sjWxfbQXCL6U
         HknbOUTOEMlKX8yT9+2zjSIvUrlhFXl6wOHqUopLSO3WaKLX2wJXbImMlr6kHNkdXflD
         WPlirGqKCrNnSytHO+6HX3dHHHypAzcaWjAWw5/gS2dFyRNCyUbAlSVqC3VkElPX2DZ9
         UO0U4136FDAdV6SdfKKHfhd1ptDfdmFMjIG4VZLwtWJJnUkee3hs4kmm0xC/cmttQvUr
         PTbBysSr02mkeQO1rIPMPimPK15nN/p1pYu1DUyruNPcK1vjY2rwqm8MfM7t7cE1oPCQ
         5kAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KzGRfdSlTsnA6ugMb6NVstzypnemez8bSdibR9WaXZI=;
        b=pCxo0Z3oF2rVz+5lrl3Txtx8IxcGNCmG4/mXSfc3I9uxX4EX9mcm39yVC1G3X2Tidf
         wP36cU4Jc7sLvTqmNf4OVJVvaZQH8M0CniXQFAQtHG18k47C+YM/tKC+c/xurMgDw5pX
         9pkXvkYdubE8NtnMM23WKn3vFIbvIO407XCmeeh7a5tmXEO+HLshpJs/n80C1op9hB37
         vkwhKsetLTsB4hV8LfJXJ23cou2F6/NXZpPEsHIWAp29KBPEqz7zpOcii427Wh7pb7Ex
         ETKgf8Ko8PQ2l+JUvgq2UgRiCEVmlvKQAeMCcspY4UvazpXqWdmabIqnJSrA6ymDNIyL
         kbmA==
X-Gm-Message-State: AOAM531S66/Ka04oYy7/GILjf/gFiMwr161jzCJykt0GRlUmH4ACA8kd
        gv9/W8rf6GNPuml/VV8Uv4+z3pzuZKaTFzQqPPU+Vw==
X-Google-Smtp-Source: ABdhPJw0G6CbvuXojTz0DEQfjC8hW/vyZAE4oeQjTVpHpNO2gXIiI69QIvEFy8ZZF35IJs0vUQ1miDcDwk3aoGuHm0Y=
X-Received: by 2002:a19:6c2:: with SMTP id 185mr8308729lfg.441.1600328467251;
 Thu, 17 Sep 2020 00:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200901144324.1071694-1-maz@kernel.org> <20200901144324.1071694-9-maz@kernel.org>
 <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
 <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com> <933bc43e-3cd7-10ec-b9ec-58afaa619fb7@nvidia.com>
 <3378cd07b92e87a24f1db75f708424ee@kernel.org>
In-Reply-To: <3378cd07b92e87a24f1db75f708424ee@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Sep 2020 09:40:56 +0200
Message-ID: <CACRpkdYvqQUJaReD1yNTwiHhaZpQ9h5Z9DgdqbKkCexnM7cWNw@mail.gmail.com>
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard interrupts
To:     Marc Zyngier <maz@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sumit Garg <sumit.garg@linaro.org>, kernel-team@android.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Saravana Kannan <saravanak@google.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 16, 2020 at 5:11 PM Marc Zyngier <maz@kernel.org> wrote:

> Can you try the patch below and let me know?

I tried this patch and now Ux500 WORKS. So this patch is definitely
something you should apply.

> -                       if (is_frankengic())
> -                               set_sgi_intid(irqstat);
> +                       this_cpu_write(sgi_intid, intid);

This needs changing to irqstat to compile as pointed out by Jon.

With that:
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
