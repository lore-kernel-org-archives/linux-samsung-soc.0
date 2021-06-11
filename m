Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231B5C48BE0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Jun 2021 10:55:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A3D2613EE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Jun 2021 10:55:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhFKK5b (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Jun 2021 06:57:31 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55266 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231608AbhFKK5V (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 06:57:21 -0400
Received: from mail-wm1-f71.google.com ([209.85.128.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lreos-0003JD-MR
        for linux-samsung-soc@vger.kernel.org; Fri, 11 Jun 2021 10:55:22 +0000
Received: by mail-wm1-f71.google.com with SMTP id f22-20020a1c6a160000b029018f49a7efb7so5320578wmc.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jun 2021 03:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IEikORA+9IlJnF0YvYg8p8dwKjB9zbk4W/LxjuwnbtE=;
        b=M+TJ3umtWkNztbkdnsGVdATRfkEZWHTqkNPIXLeGJgNIQqfsAkyvS+nN+Z5ZZBzBd1
         kOkQRdH6cRTZ4bGO2mTVQEQ0imm2SukFXclLzIFhPyV3VZ1F/EOkyluzqKdRyP975ekE
         Wqlru11zZNJtfAEFdLYnD0Q3JzwW9Bh3xkG0MY50MEesnGRMzRC4LQuJu7Qp1SLcyPjF
         xauJB09ryJc1MpTDaZoD5cZ8E098BYdAC9h9DEr0kYdZxCdg95NFktZrmxbdumPryrc1
         Iy7u5hWSdiJZG4VPvAIPATEF6qDWj7IfmCK/tOLKLihow2VdBzJW/2oSEF+LEzsjntoR
         kAwA==
X-Gm-Message-State: AOAM533zxuRYlHin6IKJS6IOOSXFaOJVfTDoY8XiEk/TcUNP10BZUYvz
        6xSyEgsy7MWJPSdgjkqoVmpotYMxyfeShMj9BFRL4o7RlUcE8iAZplc0fjMYbXw3noSYo4WUma5
        +DEkmhwiVxrHVm7l0wBqVa8cEDSg2/Ws8BPMwVClaUvJvbkL8
X-Received: by 2002:a5d:5192:: with SMTP id k18mr3335052wrv.163.1623408922257;
        Fri, 11 Jun 2021 03:55:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxBOVrAgWrMvksXzVcm3VngRYi59NNwxINMUqi+VKe2j63vFriGnJdD/v1D3XMKILe4kl65Q==
X-Received: by 2002:a5d:5192:: with SMTP id k18mr3335043wrv.163.1623408922127;
        Fri, 11 Jun 2021 03:55:22 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id x18sm6575888wrw.19.2021.06.11.03.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 03:55:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: restore framebuffer support
Date:   Fri, 11 Jun 2021 12:55:18 +0200
Message-Id: <162340889140.38955.14961454115489970420.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210611100204.6240-1-m.szyprowski@samsung.com>
References: <CGME20210611100210eucas1p148dd8d15360269eeb8fb9eace94ba3b4@eucas1p1.samsung.com> <20210611100204.6240-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 11 Jun 2021 12:02:04 +0200, Marek Szyprowski wrote:
> Commit f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> changed the Kconfig dependencies, so COFNIG_FB is no longer selected in
> defconfigs. Restore support for it in exynos_defconfig, because most
> Exynos platforms had graphical console running on framebuffer device
> emulated on the Exynos DRM drivers.

Applied, thanks!

[1/1] ARM: exynos_defconfig: restore framebuffer support
      commit: 38f61ef1a0cefb4e3b37c3e7b16c0f68df34a3dc

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
