Return-Path: <SRS0=odV2=C7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BFBC4363D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 15:57:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C8FF2388B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 15:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600790231;
	bh=GFbvZo8YdYmnjYOB7nFfXL1WeZICwV/G0hv27J459kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Yv+O/r5Mx1hzR6hfqVk0yyQ1PaPe6CPFoSIcGMnDeLBjMNfyETHLHZT7D9nMNwP5O
	 NcSLZ+e9slqGRhIZKALE3cmKKJgxIFubxdfwBre/pM9Ft+KG51TOepPZsOiMG5KlIi
	 U208nXqBbxgIBeY/PzVQLFsgio9KmjjkctEfbKyA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgIVP5K (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Sep 2020 11:57:10 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:40001 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgIVP5K (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 11:57:10 -0400
Received: by mail-ej1-f65.google.com with SMTP id z22so23592790ejl.7;
        Tue, 22 Sep 2020 08:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sERBe70Mn/s4g1duy0j0yN11x3Ks4EdvrlFMkdpqRYU=;
        b=gdx0VcqiR+Jph8khncoEJ/XVs2/hFWcFMQwDiBmIyqITg9WiVUN08OnAjSRtP0Y00I
         uSBytkcG0yQqQRO2qL1+iScyLB1JHcPYOsuolnr9v/JlXWTJ2u29rE/QKP1greFImVG4
         wMZH7Q7jwIoHwngFMX5n5J0QCX9ttrjx/3GDiUNwt0UP24hSG2yNt/G8eb9UvBxmckqz
         rljgG9XkdeBJ/+eAn8u7j++FZLOE5whXE3ldax0XCvy0sthYWbebMXbtsOok+X/a8MVI
         9Qx3a1QVp4P7WCqxUKoCLOAAItBSqW+XCbnhfYHFyfyZAdXR6DxM/3fkDHSvPyFIPCm9
         8VWw==
X-Gm-Message-State: AOAM530626KXf+bua4wZACqAoA4CkfN6+w15DZItmsRhsJlwuF+qdY5H
        4SHEGcsNEatrEU+yey3MFy0=
X-Google-Smtp-Source: ABdhPJx8NxfXDC6lJn3W2A8rdpFB8klB1mSGI7I0Z2Vwbyot9dGPKKj50qx/B3J0tVWKDrQaPzmYOQ==
X-Received: by 2002:a17:906:b146:: with SMTP id bt6mr5512551ejb.287.1600790228544;
        Tue, 22 Sep 2020 08:57:08 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
        by smtp.googlemail.com with ESMTPSA id bx24sm11577039ejb.51.2020.09.22.08.57.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Sep 2020 08:57:07 -0700 (PDT)
Date:   Tue, 22 Sep 2020 17:57:02 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: revert "add input clock to CMU in
 Exynos4412 Odroid"
Message-ID: <20200922155702.GA5580@kozik-lap>
References: <20200921174818.15525-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200921174818.15525-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Sep 21, 2020 at 07:48:18PM +0200, Krzysztof Kozlowski wrote:
> This reverts commit eaf2d2f6895d676dda6c95a652b58594f2887720.
> 
> The commit eaf2d2f6895d ("ARM: dts: exynos: add input clock to CMU in
> Exynos4412 Odroid") breaks probing of usb3503 USB hub on Odroid U3.
> 
> It changes the order of clock drivers probe: the clkout (Exynos PMU)
> driver is probed before the main clk-exynos4 driver.  The clkout driver
> on Exynos4412 depends on clk-exynos4 but it does not support deferred
> probe, therefore this dependency and changed probe order causes probe
> failure.
> 
> The usb3503 USB hub on Odroid U3 on the other hand requires clkout
> clock.  This can be seen in logs:
> 
>     [    5.007442] usb3503 0-0008: unable to request refclk (-517)
> 
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 1 -

Applied.

Best regards,
Krzysztof

