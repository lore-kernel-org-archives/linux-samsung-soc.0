Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C06C433E6
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  3 Jan 2021 16:12:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58F0D208D5
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  3 Jan 2021 16:12:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbhACQLs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 3 Jan 2021 11:11:48 -0500
Received: from mail-wr1-f50.google.com ([209.85.221.50]:35975 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbhACQLs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 3 Jan 2021 11:11:48 -0500
Received: by mail-wr1-f50.google.com with SMTP id t16so28479890wra.3;
        Sun, 03 Jan 2021 08:11:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LoifgCsUDIwflzPuXwDuBrp+Q41jOLu3pS1GGq+9N7E=;
        b=BBHI5rdwSf2WqCehtMbvkRZTX/01NiMk7fJ9AXheT7PQy3T6OxcMEMHh6QxPHfeVHJ
         /Y0op89Mhih+KhFYsFJszeRZSu3UumyFbex6JTLY/ba6+/3YMMqqDFD8tPjchzEO48bC
         lfgFvkBNBag4UKkOZ5/5dKJov0Xb1TV3Iq60sx9VlmkQcb1c8Jw0imwitgo/FXVavJfd
         0FP/x8hpynHXWXFNV64rzr3cIfP+QArUvcdKA7bd1P21yfpbuAN5LumW5QjyQSnWGbI3
         AnfuBtQGG4G/AbUB27FBf+9bBbpb+gFASiqJjZ2bK7SFh6CwzHCmrtsgopuQhr4o8/yZ
         gxkw==
X-Gm-Message-State: AOAM532PPxwE4Bv3k6onL3Qza0sIhAewukcDMXaD8NtjQBAwP8gNiKDK
        LonkbFX1z0AYrwp0xop3dB0=
X-Google-Smtp-Source: ABdhPJwK1Vq17lYOO/eXKz6RZzHQZ/wg2vlqJdnkoA1y8NgsTvP5rj0hbhdN0RtXD63f/YP7QCJZlw==
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr79601546wrq.189.1609690265883;
        Sun, 03 Jan 2021 08:11:05 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id c10sm90453622wrb.92.2021.01.03.08.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 08:11:04 -0800 (PST)
Date:   Sun, 3 Jan 2021 17:11:03 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] soc: samsung: exynos-asv: handle reading revision
 register error
Message-ID: <20210103161103.GB7799@kozik-lap>
References: <20201207190517.262051-1-krzk@kernel.org>
 <20201207190517.262051-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201207190517.262051-3-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Dec 07, 2020 at 08:05:15PM +0100, Krzysztof Kozlowski wrote:
> If regmap_read() fails, the product_id local variable will contain
> random value from the stack.  Do not try to parse such value and fail
> the ASV driver probe.
> 
> Fixes: 5ea428595cc5 ("soc: samsung: Add Exynos Adaptive Supply Voltage driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/soc/samsung/exynos-asv.c | 8 +++++++-

Applied.

Best regards,
Krzysztof

