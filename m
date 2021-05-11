Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3817CC433ED
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 May 2021 12:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB5486191A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 May 2021 12:40:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbhEKMly (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 May 2021 08:41:54 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51219 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbhEKMlx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 May 2021 08:41:53 -0400
Received: from mail-vk1-f197.google.com ([209.85.221.197])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lgRgs-0002wg-V7
        for linux-samsung-soc@vger.kernel.org; Tue, 11 May 2021 12:40:47 +0000
Received: by mail-vk1-f197.google.com with SMTP id s80-20020a1f45530000b02901f936535cf4so1421568vka.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 May 2021 05:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PrBBhJGbjsmhZDFF8O0bml8Qz0d11xqc/seGdEasPHw=;
        b=TNliyC3Fpwbi8jd418kvVwLUl5iRsQMkAaN3EaImtpx4RSWv9HA9tKwbGKVOHFnM6v
         Fic+Ls+10qLCSN7zcTLOkRJLWtMp6Ef7S9PNhshH6Fjo/TKjsGgXt4S1miO7nh5EsLNq
         8Gc9HiUQSSAmc3i+YUKHn0pUjgXCMSQR+cJ4tJRrVk/JG0w0kbYA6s8/APrZjz3rstOK
         hGI7ZPuWAyVE/F9NPVpPYraXdj16fVfY2CjiT9ti3nEmmadnsTvdcJ/s/35aFvIFjMFo
         gYZRBSVh8Rs/Z1fAxYVArIIm8fntzSyy0PI5ID06EJzaZ2WYw0Y0cKlb5x4GOz+Ux4xC
         Z18g==
X-Gm-Message-State: AOAM53088ELTr2IpIdEAb3rYN0vyLfaiDh6Q7Gw5dkcGHUCrItzlKaNh
        cqWK+KAb4PL6rJ5ULlA5rfdS77QEAj5O6L/NIetNuZbBJFbZ6RBx+5UoQFTZcu9S2i/p28QB6cC
        fm3vFdioUOor3SC954wBwLfF6E614os02/86cfBXesb/v9swZ
X-Received: by 2002:a67:bc5:: with SMTP id 188mr23940529vsl.50.1620736845801;
        Tue, 11 May 2021 05:40:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpsSzE8+yaLV7z21WTm61RVHBgd5GIuSd1bUacFjdwJg53yKaDkNu4i27PfGrQ9TJS39xBtQ==
X-Received: by 2002:a67:bc5:: with SMTP id 188mr23940505vsl.50.1620736845580;
        Tue, 11 May 2021 05:40:45 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.2])
        by smtp.gmail.com with ESMTPSA id t18sm2204204vke.3.2021.05.11.05.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 05:40:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Itop Core
Date:   Tue, 11 May 2021 08:40:35 -0400
Message-Id: <162073682206.13221.757844834039243258.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
References: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 20 Apr 2021 18:49:33 +0200, Krzysztof Kozlowski wrote:
> The RTC on S5M8767 PMIC can wakeup the system from suspend to RAM.
> Add a generic property for this.

Applied, thanks!

[01/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Itop Core
        commit: a1972739c01612adee6bb0a0306ea29be0bb4955
[02/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Origen4412
        commit: 765210e19859fcd83dad26441a5c499c0fe27e28
[03/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Arndale
        commit: 0272619bde229386edf9f1358470e265628d1653
[04/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Odroid XU
        commit: 760ebb8a2529f92f772424c7ddc385a07a9e90a0
[05/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Midas
        commit: 7f23ea1265c3dc2cd5824f67498078fa23ede782
[06/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Odroid X/U3
        commit: 1178f7127a4679db9b70eb16737627f764d7a9c5
[07/11] ARM: dts: exynos: enable PMIC wakeup from suspend on P4 Note
        commit: 9614ae53753003e7a4ecf800db3da189c0f0acd5
[08/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Arndale Octa
        commit: 1d4203b1fa02fca97ca97484f2a43da187112ad1
[09/11] ARM: dts: exynos: enable PMIC wakeup from suspend on SMDK5420
        commit: a145cc05cb2ccbdde2621c91c7d56c3435d3a125
[10/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Odroid XU3/XU4 family
        commit: e4c9b60b271ce428d97577502be9393bdc46dd94
[11/11] arm64: dts: exynos: enable PMIC wakeup from suspend on TM2
        commit: d3f713e6b3ccb1bf8306aaff8b11fd30844db0cf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
