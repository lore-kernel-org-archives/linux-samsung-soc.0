Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD03EC56202
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Nov 2020 18:34:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53B7820656
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Nov 2020 18:34:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731484AbgKYSdo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Nov 2020 13:33:44 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34210 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730929AbgKYSdo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 13:33:44 -0500
Received: by mail-wr1-f67.google.com with SMTP id k14so912502wrn.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2020 10:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l/zOGeNXCN51LEZhOWDyBpjN4QyhvByAFUcnC9FU/o0=;
        b=efV/66wjn7k4gA9x+aMCx8w7Zkw0R1z4lFr0JaB69ldpxg2hP6miI02jUvy/L4yvyV
         YD9E78CBOx5nY2vqcI607fljbSissvl5CUAzJde4U4pxLVVXobJGpRjyajCG+yQT3bdW
         F5BLKluTsH+k5kZduOkmLf4bazAVQt/LH6lgKrWdTKGaA7WEY9Xjcpq1pTa8+ndwv5/9
         W1ntGPVl6zBg0yVUEyudoCOmBxygGXNumFeqasjZyvPi6FpMj2vTRkp3dRWwp/SBDIna
         E60Gt9zJl4H9xlNtvf6djhSrBq0wwjnGj4tWhZ00Q8N7ha35JuGAQCuKMxSe9rmpS3SO
         qJ5A==
X-Gm-Message-State: AOAM533kYnYjV5+aSPx4psW+p9nCxpk5jjhwwq65Ykn0EnMMXHi+xGoI
        in9swVfxgTKTWmuctSJouB8=
X-Google-Smtp-Source: ABdhPJyh6A8o8fovjjMbX237gx0i6FRf2slUY/iCPTs7DU7pR8Ulk35HS0KLn5dVhnuA3o9+s/3rUA==
X-Received: by 2002:a5d:4046:: with SMTP id w6mr5768252wrp.51.1606329222851;
        Wed, 25 Nov 2020 10:33:42 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id n126sm5383486wmn.21.2020.11.25.10.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 10:33:41 -0800 (PST)
Date:   Wed, 25 Nov 2020 19:33:40 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: make Samsung Exynos EHCI driver
 a module
Message-ID: <20201125183340.GA4113@kozik-lap>
References: <CGME20201124083321eucas1p2303f28fc17736bcdc5e626f463ed74c6@eucas1p2.samsung.com>
 <20201124083312.12356-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124083312.12356-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 24, 2020 at 09:33:12AM +0100, Marek Szyprowski wrote:
> Exynos EHCI driver is compiled as kernel built-in, but it requires Samsung
> USB2 Generic PHY driver to operate properly, which is compiled as module.
> Make the Exynos EHCI driver also a module, because having it built-in
> makes no sense. Exynos OHCI, which also uses that PHY driver, is already
> compiled as a module.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied.

Best regards,
Krzysztof

