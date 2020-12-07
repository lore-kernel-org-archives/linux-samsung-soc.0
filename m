Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28944C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Dec 2020 08:10:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9D7C225A9
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Dec 2020 08:10:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgLGIKu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Dec 2020 03:10:50 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40206 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbgLGIKu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Dec 2020 03:10:50 -0500
Received: by mail-wm1-f65.google.com with SMTP id a3so12748378wmb.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Dec 2020 00:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DweZ6eDzzdfyi60VdXw8O7c7KjR5QC9YMkXps47tX1E=;
        b=tRXy9bB572QNL4owJmo+YMZrVXAVt8OZ9eN6M62S2WIwYw+XicthBVVU9n4BChZG67
         I9wPZJy+yNJ/ljsVAMdVdPht2G8Sre3ZqTQenSY9It5LzjZZI2+E0VxzLm7xgzAFAAox
         gQ0LloSo3adfycvhMz6d3f2SCIav8LJlS4SKC1kB7n2HUQA4QamlZsRSRHvh117F31GE
         SEEn6+YkhScpmlO8IBTBLI44NUxrFlPMyJtSbfAWzddmOe6+5d56OUgqWaxO/HZGiUjJ
         Fm6tHZWpZdeNagiieG7bN/IHFSQu5I5PwIQhxDg38RBoaS5RHhTF5mLWEvRA5JjEESoO
         PiPA==
X-Gm-Message-State: AOAM5312GOFmcFlbtW5WZzlIj1H+h7LJElJmUEjQzxPgFvKL86WPWHQG
        8Sblbn9EgDViICC1GjCRc9s=
X-Google-Smtp-Source: ABdhPJyKh6lfTbLeI8krA9C8nr1CxQ4nE3Mw7xPEKFp5Q373mQ4xppG5aU+dXzOK2llawRZitemykA==
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr16917541wmj.88.1607328607942;
        Mon, 07 Dec 2020 00:10:07 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id w5sm15073770wrm.29.2020.12.07.00.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 00:10:06 -0800 (PST)
Date:   Mon, 7 Dec 2020 09:10:05 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] soc: samsung: asv: don't defer early on not-supported
 SoCs
Message-ID: <20201207081005.GA6278@kozik-lap>
References: <CGME20201207072939eucas1p1029a121730bbc0f3e120c607ec5e3002@eucas1p1.samsung.com>
 <20201207072928.20010-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201207072928.20010-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Dec 07, 2020 at 08:29:28AM +0100, Marek Szyprowski wrote:
> Check if the SoC is really supported before gathering the needed
> resources. This fixes endless deffered probe on some SoCs other than
> Exynos5422 (like Exynos5410).
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

If it really causes endless deffer, then also Cc stable.
Fixes: 5ea428595cc5 ("soc: samsung: Add Exynos Adaptive Supply Voltage driver")

There is one more problem here - on Exynos5410 or anything else with
such chipid node, this will cause -ENODEV probe failures. It should not.
Simply, it should not match for them.

This could be achieved with another compatible, but it won't really
describe the real case here, because it is not Chip ID which is
different. The CPU and bus voltages are different, the SoC is different.
Maybe this should not match to chip ID at all?

Best regards,
Krzysztof
