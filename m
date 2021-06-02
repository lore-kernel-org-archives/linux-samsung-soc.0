Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E21C4708F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Jun 2021 13:24:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 348C3613DE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Jun 2021 13:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhFBN0U (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Jun 2021 09:26:20 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56246 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbhFBN0U (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Jun 2021 09:26:20 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1loQrM-0006S5-0X
        for linux-samsung-soc@vger.kernel.org; Wed, 02 Jun 2021 13:24:36 +0000
Received: by mail-ed1-f70.google.com with SMTP id v18-20020a0564023492b029038d5ad7c8a8so1402201edc.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Jun 2021 06:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZbqO9leiYLcpHf1/CeWaekIOBlRRyOOvjknnxl/dSpE=;
        b=nMwju3arzUD5FZtYoQhvZvmok9bwHFqDDqQnwurBl9DPXKlbhiEiAZvNGXmoElB7SQ
         PhrLBuSB2ET6zKd0Dm/DYXoXu7u/6a4xk/71Q3FvD7wllghOXaPzwm4gyOsiSmtYeVJe
         kNS7Cf1wnTSkrUxPu6pc1tJsSEXp9Gfd3C3FsfV2+2TH2iQkEaz0rqP4SJWFNmdPc7TP
         y75nokGymEMnR6PDs6BcbN4cz1qiXMfBXx3Fs0WK2StD/7vlzl/6xTCI3tsdcZA/IuEk
         ayJsn+oJKyTe/3szcFT5ao6966P/90+CwHbA9ViFZa+YlGbG4AO8V0/YU4YsMAZqE8G7
         a4/A==
X-Gm-Message-State: AOAM532ZSHokbIHiEJOMnieNC5jCRyikvCLBHQIB+prk+uShoym8Z1Nu
        4zkBFQcd25plgA94RGrBYt/YK3ksoaJY7t9VGbaPnfgGLVqmO1FgeLmmb1k9WF/pQTCSIYR4UDS
        bvb7G/5SQuHIX2DJlazwMkXXWgM4wY70xwYVAEsKz5u1Ahc90
X-Received: by 2002:a17:906:c00f:: with SMTP id e15mr36561524ejz.458.1622640275809;
        Wed, 02 Jun 2021 06:24:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtzGMwLAUU1O9hso14QGvyxJCgY0jrcJpE7S4rWWpRuQMT/j0VxL2N2oXQPuieX0XXAyNhoQ==
X-Received: by 2002:a17:906:c00f:: with SMTP id e15mr36561505ejz.458.1622640275665;
        Wed, 02 Jun 2021 06:24:35 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id bc4sm928548edb.63.2021.06.02.06.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 06:24:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, krzk@kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Exynos UFS driver
Date:   Wed,  2 Jun 2021 15:24:32 +0200
Message-Id: <162264024536.63589.10570196675573160566.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210531170057.7730-1-alim.akhtar@samsung.com>
References: <CGME20210531165414epcas5p1aae4ea3815fcbadad8b48a9210742489@epcas5p1.samsung.com> <20210531170057.7730-1-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 31 May 2021 22:30:57 +0530, Alim Akhtar wrote:
> Enable the Exynos UFS controller and PHY configs. They need to be
> buildin to ensure UFS devices gets detected on exynos7 and its
> variant boards.

Applied, thanks!

[1/1] arm64: defconfig: Enable Exynos UFS driver
      commit: 5be91fe8d91b3aed5192b763fd6f2d11c7cd354d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
