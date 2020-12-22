Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA64C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Dec 2020 09:56:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DECAC23130
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Dec 2020 09:56:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgLVJ4H (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Dec 2020 04:56:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgLVJ4H (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 04:56:07 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C49C061793
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Dec 2020 01:55:26 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id d13so13858340wrc.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Dec 2020 01:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=H+z35rTiT8LMBG/frBLrxfpbjjUOH9PhJev+n4Wms8Q=;
        b=aMyEnbMn+8VCWNQPFDSE6JZrN89hgzp75tsGrUyynWrT3j6S1PuhNGAOMrb/gCLeqn
         4rAP3YMV8iQNqckFNd1/t74vH2C+/lODBskKcGkfY5V2fyO/qnVkx673ljHKcNRPWVtW
         kAwo+oTCeSHZU5pdfGbaISPZcfMQhmjFuHq4A0nRtLm2fTy6cKg2fKtAYPqiZv/jOH9Y
         B30QpCMjoEOLXg4HX37tOZCVRJeq4fyBwi8VuPsFuIrprBZWqZeUqfb+IjG3lF+zcSBH
         VdL95GmQKl0WMsXMmO1hULAmt+kHtSAEi6AooOvEYvjctETHa4dmfurt133YeGOOD38m
         ZIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=H+z35rTiT8LMBG/frBLrxfpbjjUOH9PhJev+n4Wms8Q=;
        b=AALg2H8fGNC6aZun21c9RAG4DjZdWqJAm8MLj12nbNwDAkf16r2/FQtf2ZBaRhDATu
         dQjrfZngZbdpypcID3L8IEHWgFzRbLGonAH1YgRX9na6fsMInugACRetnKBmPeG9yrJ3
         Weh29jd0b01GyunzD9X77dP+h9I4ajecy6hPPUVDrU2f4sdYPaDv1IeEWe0iSVBKqpYb
         RHqUjBAaUdB7PwW1VgWyYK7bR5LL1234a6Wcq8GGKlEGYU2F4rCKNGqUd93zGXCVPxmB
         8p2wZFR1qOCoHWsYalbykU6G0xt1yumfxrTslvqvtXpxZR5uNOAZ+pfX804AF0QbiDUR
         1ceg==
X-Gm-Message-State: AOAM530j5ASYcpP3X+9nl2PVH8kcdJRpUC01IeBJxp+3cjidZJ7sUUwT
        oxKVT0Pzy4+jyV62XmKGpXSxHQ==
X-Google-Smtp-Source: ABdhPJyQdEkR3oAhu7594tToVjHFVhiTjvNcUitYf22iGjFsC13l1RWfySnSLjYD4ZQpNL6AhOOxsg==
X-Received: by 2002:adf:828b:: with SMTP id 11mr22690551wrc.180.1608630925193;
        Tue, 22 Dec 2020 01:55:25 -0800 (PST)
Received: from dell ([91.110.221.175])
        by smtp.gmail.com with ESMTPSA id g191sm28554581wmg.39.2020.12.22.01.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 01:55:24 -0800 (PST)
Date:   Tue, 22 Dec 2020 09:55:22 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Timon Baetz <timon.baetz@protonmail.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 3/7] mfd: max8997: Add of_compatible to extcon and
 charger mfd_cell
Message-ID: <20201222095522.GC53991@dell>
References: <20201222070520.710096-1-timon.baetz@protonmail.com>
 <20201222070520.710096-3-timon.baetz@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201222070520.710096-3-timon.baetz@protonmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 22 Dec 2020, Timon Baetz wrote:

> Add of_compatible ("maxim,max8997-muic") to the mfd_cell to have a
> of_node set in the extcon driver.
> 
> Add of_compatible ("maxim,max8997-battery") to the mfd_cell to configure
> the charger driver.
> 
> Signed-off-by: Timon Baetz <timon.baetz@protonmail.com>
> ---
>  drivers/mfd/max8997.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
