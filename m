Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F45C8300F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Dec 2020 20:01:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 154EE22242
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Dec 2020 20:01:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404433AbgLAUA5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Dec 2020 15:00:57 -0500
Received: from mail-ej1-f68.google.com ([209.85.218.68]:37813 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404423AbgLAUA4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Dec 2020 15:00:56 -0500
Received: by mail-ej1-f68.google.com with SMTP id f9so6822916ejw.4;
        Tue, 01 Dec 2020 12:00:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ry+p3Xlkjcxyj00Ax2Z1EhprSHrtPidMwJQr8rkF5ns=;
        b=khrwjoMHxDxOV4YjYigU0Z9ZGILx1RrjsNU9yNqbq1rnUADt4ePuYnt0T6f6siR2jl
         oXVBQW8G7ZJDrNLpbcfT4PALXuhW24SY5ZgBk/S5kWqCMZD6qpV1tZNIwRhP3rdTaopd
         VgN8koL/3XSgj4d+YCUefRjz/Ylqe6i/3Ibg4pFqajB+qVbiUSjZUAVWEobl4JKkPY86
         TADcot5+d9vOBrk5ISlGX9RPHqt7xWhkshNlRcpAgQFykvolY1D1uW9UTVN1R/1cPWZO
         Sybk/5hlCK2mVDp8slRZq4xOSDEI2AOvEUZQzS5fXjDJH3VGEs1EVkaoAZl2nEAW5YzO
         aNfA==
X-Gm-Message-State: AOAM531GsJtZMUn+SUaXcabBvR/T7KR5rf55KZj93AEoc/kT+5VYBkrG
        5cY2R1qeur77o0Acc6Llsro=
X-Google-Smtp-Source: ABdhPJxvhAFpsLjqu/qb302C5p6pab4WLoUi1KWyb0QrYtwTHdVg719GPW0wfOVQiyrhpw5ohvr6gg==
X-Received: by 2002:a17:906:c289:: with SMTP id r9mr4502048ejz.311.1606852814447;
        Tue, 01 Dec 2020 12:00:14 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id y6sm344321ejl.15.2020.12.01.12.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 12:00:13 -0800 (PST)
Date:   Tue, 1 Dec 2020 22:00:11 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH] phy: samsung: Fix build break in USB2 PHY driver for
 Exynos5420 SoCs
Message-ID: <20201201200011.GA2435@kozik-lap>
References: <CGME20201201170918eucas1p2a34ca6e90ec710400a7a5d7121197d85@eucas1p2.samsung.com>
 <20201201170905.16153-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201201170905.16153-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Dec 01, 2020 at 06:09:05PM +0100, Marek Szyprowski wrote:
> Exynos5420 variant of USB2 PHY is handled by the same code as the
> Exynos5250 one. Introducing a separate Kconfig symbol for it was an
> over-engineering, which turned out to cause build break for certain
> configurations:
> 
> ERROR: modpost: "exynos5420_usb2_phy_config" [drivers/phy/samsung/phy-exynos-usb2.ko] undefined!
> 
> Fix this by removing PHY_EXYNOS5420_USB2 symbol and using
> PHY_EXYNOS5250_USB2 also for Exynos5420 SoCs.
> 
> Reported-by: Markus Reichl <m.reichl@fivetechno.de>
> Fixes: 81b534f7e9b2 ("phy: samsung: Add support for the Exynos5420 variant of the USB2 PHY")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Vinod: this a fix to the patch merged yesterday. If you want me to resend
> a fixed initial patch, let me know.
> ---
>  drivers/phy/samsung/Kconfig            | 7 +------
>  drivers/phy/samsung/phy-samsung-usb2.c | 2 --
>  2 files changed, 1 insertion(+), 8 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
