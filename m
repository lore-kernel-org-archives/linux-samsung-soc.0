Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AB3C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Dec 2020 07:56:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C67622C7B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Dec 2020 07:56:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbgLUHzp convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Dec 2020 02:55:45 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:45412 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgLUHzp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 02:55:45 -0500
Received: by mail-wr1-f42.google.com with SMTP id d26so10024252wrb.12;
        Sun, 20 Dec 2020 23:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=znSQ7G6ShgfRAu0enyoUCiiiW1s/5uV//O9alA1Ox50=;
        b=qa+rxVd0ykTShEznZ/Jrw+/yMOR2DbwUg4TBcz5On8NPf4kTKaoSycv0g+9BehpTAj
         bBqCBtiufIlxHGk8j6dVJ0XynB5in0h9kZC44B0d64gUwZWUCg7AoaR6OqKpOa6aI8zI
         ac1FvAt2cyp092ZyefQWlOS6l7+7MrKuluirJvgba24pilf78hYMTd1ynJFKZyLhDlpw
         l3942leC3SfYo+jgTuAcAFZQyy/9lw0cZ4Q5CIfmjDmczTxIY4Xz0mTlI6vAP0L26c0p
         ALu0ARgplFWHuo+PzVjrmLJuxc5mJ0mQeVVMX4UH7RyOju6B2SW1WUnGQ8R9cI4nhEXu
         1MYw==
X-Gm-Message-State: AOAM531mRHsG/Qx/WupTfhwOiqsnVj1J69Jja/YO1H822Mlr7jL0mKlE
        kfHgkjnJX/kEy9hIr8Avl+o2ZV9fdwCFAw==
X-Google-Smtp-Source: ABdhPJyPWbZvdBSLqy/vD7OyJFbjO8pTTiS14rbwY6hPhCLGsIXE1BDLLnhujm3pteZCTnlcOi6l4A==
X-Received: by 2002:a5d:570e:: with SMTP id a14mr17079864wrv.126.1608537303051;
        Sun, 20 Dec 2020 23:55:03 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id a12sm28599181wrh.71.2020.12.20.23.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 23:55:01 -0800 (PST)
Date:   Mon, 21 Dec 2020 08:55:00 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: [PATCH 9/9] mfd: sec-irq: Do not enforce (incorrect) interrupt
 trigger type
Message-ID: <20201221075500.GA3386@kozik-lap>
References: <20201210212903.216728-1-krzk@kernel.org>
 <CGME20201210212938eucas1p1297b8503e9c059f2bc77c3a429a9114e@eucas1p1.samsung.com>
 <20201210212903.216728-9-krzk@kernel.org>
 <0f1509ef-9ae7-7a77-84b7-360b8f0071c7@samsung.com>
 <20201218142247.GA2847@kozik-lap>
 <52a1b7c6-c7f1-f5eb-09f6-d84663912db8@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <52a1b7c6-c7f1-f5eb-09f6-d84663912db8@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Dec 21, 2020 at 08:36:02AM +0100, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 18.12.2020 15:22, Krzysztof Kozlowski wrote:
> > On Fri, Dec 18, 2020 at 02:25:39PM +0100, Marek Szyprowski wrote:
> >> On 10.12.2020 22:29, Krzysztof Kozlowski wrote:
> >>> Interrupt line can be configured on different hardware in different way,
> >>> even inverted.  Therefore driver should not enforce specific trigger
> >>> type - edge falling - but instead rely on Devicetree to configure it.
> >>>
> >>> The Samsung PMIC drivers are used only on Devicetree boards.
> >>>
> >>> Additionally, the PMIC datasheets describe the interrupt line as active
> >>> low with a requirement of acknowledge from the CPU therefore the edge
> >>> falling is not correct.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>
> >> It looks that this together with DTS change fixes RTC alarm failure that
> >> I've observed from time to time on TM2e board!
> > Great! I'll add this to the commit msg.
> >
> > Thanks for testing.
> 
> BTW, while playing with this, maybe it would make sense to fix the 
> reported interrupt type for the PMIC sub-interrupts:
> 
> # grep s2mps /proc/interrupts
> 120:          0      gpa0   7 Level     s2mps13
> 121:          0   s2mps13  10 Edge      rtc-alarm0

I also spotted this. It's a virtual interrupt and I am not sure whether
we can actually configure it when the hardware does not allow to set the
type (the regmap_irq_type requires register offsets).

Best regards,
Krzysztof

