Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B074C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Dec 2020 08:27:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9638227C3
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Dec 2020 08:27:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgLGI0o (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Dec 2020 03:26:44 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38002 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgLGI0o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Dec 2020 03:26:44 -0500
Received: by mail-wr1-f65.google.com with SMTP id r7so602111wrc.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Dec 2020 00:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OT3LJhK376YHq759ZIBxj0R+A1zFTU6Zz17w5tmFbbg=;
        b=KiYB6cvLIUzDdCDXnvuQB4sL79xpIns4KGd6WVpyRIikPFjZOwpZk6lYZ/8KLz1jYb
         rJBrQNy4Q+WpO+zZbSQoCLviTCm8Tr2rM6kctyUXZsPPUTs1/ONL16yQCK85HKBrAHXX
         gJW9m2QEHw74FmuZNKioo2qfX/6m7Y/EAH1+kr9lxIsfp5xtgnrjsMHFPMtXzR7ULb6h
         1viHDMy58u+4RCcbSchYCRwfPV+6RM+EqboAzNLjQbj160NJbZ9tkZIng1QXvrE0+leK
         hApV42T8AtVA3AwI8p8b6yXy/lu/P0Q3Uzee15TSIkJMZikgLrDIMDySpatySsLomIC7
         zEpA==
X-Gm-Message-State: AOAM531JXvkPqwA4fTm0OUVBC9Gs4jvblSAoyeKFlZXHetXLVnRP6CAK
        O5eM/MxDX3ON/tjTQl0D8rwnzYCaOxg=
X-Google-Smtp-Source: ABdhPJx+fDF/wGcFiHZ/hQTj74emhd75P7JIEaQ5HCH5fZAym9LJhcvHl9ClTNZbsIJEWkIIDGUm5w==
X-Received: by 2002:a5d:4004:: with SMTP id n4mr18273077wrp.230.1607329562278;
        Mon, 07 Dec 2020 00:26:02 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id s133sm13770503wmf.38.2020.12.07.00.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 00:26:01 -0800 (PST)
Date:   Mon, 7 Dec 2020 09:25:59 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] soc: samsung: asv: don't defer early on not-supported
 SoCs
Message-ID: <20201207082559.GA7148@kozik-lap>
References: <CGME20201207072939eucas1p1029a121730bbc0f3e120c607ec5e3002@eucas1p1.samsung.com>
 <20201207072928.20010-1-m.szyprowski@samsung.com>
 <20201207081005.GA6278@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201207081005.GA6278@kozik-lap>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Dec 07, 2020 at 09:10:05AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Dec 07, 2020 at 08:29:28AM +0100, Marek Szyprowski wrote:
> > Check if the SoC is really supported before gathering the needed
> > resources. This fixes endless deffered probe on some SoCs other than
> > Exynos5422 (like Exynos5410).
> > 
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> If it really causes endless deffer, then also Cc stable.
> Fixes: 5ea428595cc5 ("soc: samsung: Add Exynos Adaptive Supply Voltage driver")
> 
> There is one more problem here - on Exynos5410 or anything else with
> such chipid node, this will cause -ENODEV probe failures. It should not.
> Simply, it should not match for them.
> 
> This could be achieved with another compatible, but it won't really
> describe the real case here, because it is not Chip ID which is
> different. The CPU and bus voltages are different, the SoC is different.
> Maybe this should not match to chip ID at all?

There is another solution which I was checking few days ago (for
different reason) - merge Chip ID driver with ASV. We get rid of the
arch_initcall() and always bind to Chip ID node. If SoC revision
matches, we run the ASV-specific code.

Best regards,
Krzysztof

