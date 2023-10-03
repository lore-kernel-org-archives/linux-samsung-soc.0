Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10439E75428
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Oct 2023 06:26:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjJCG0N (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Oct 2023 02:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjJCG0L (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Oct 2023 02:26:11 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A575BCC
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Oct 2023 23:26:04 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53447d0241eso817289a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Oct 2023 23:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696314363; x=1696919163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c710rMXRJtQsAS1egW/2uLl7LYicngvteWzVMsEFcEI=;
        b=OuKEoa5Uc3r+VQcTzDCn7ggfbuPhWV+f1N1W7sJ6751VRP02FYLfcdiS7voQ621IN/
         29fknQDxWdzgstZ1xhgaHRM/YrnkgpIRI7lC8dPMUGkmxQwBAqi9GodentKBA2jAVAoX
         c8XO+ifvaicCIQopJHO6FD4ucpcR/y0fP0ig/38iCXk5LSGMjBQRDtUcu4bt2yz7IPf6
         zNo+M7ld1XdbBDeqLHj6CtJwGWC6PXSih6NVnWPi3O1yttu1sWXxb8C1SJ6m8XDpVsIl
         8BKr/+vmlvkT88gCY7OW9ipXzACeMQ3cHvRA9jPyzUc3fsB2NY7iTQhmq5o8N/Oo5RhS
         kM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696314363; x=1696919163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c710rMXRJtQsAS1egW/2uLl7LYicngvteWzVMsEFcEI=;
        b=FeCIRUr+2bzfPU1Yn0FUTnXDHYNhOreCx4SlCktoW2oYaecEbUNcbhKK2ewfwxxURO
         Q+ikOyaYsVYu0Txgd9Yq5/doc5l8QPwdzFa4k8W6y60pDM1w8OdFmdwv+KaotC7h2kP4
         dtbCimYNGS3Zq32MU95+6az4XFYW/yKqg+0MLhQz9v/byBi76FuDWzivHPe7RkoUIRk0
         Na5cBKgX5/1uF3Fbx/3iil/eO8ibVeZ39vHEQQYcmxgiA4BkPRciBN9PC4/e7fzhU8GB
         17Ng996fqCStab1Hr1iSp7HPb96y6mMAU6MtCsQkmWAlskfyntB4LwOvedc+dMFoH30M
         YDUA==
X-Gm-Message-State: AOJu0YzFcz6qHVgx2ruQ2d6BSDGZBfNLZsjj7/BsUmPlbDDA2r6N8cE1
        +iO3Uu7n5v5pf17/n3i76P90pA==
X-Google-Smtp-Source: AGHT+IFpGrS+CSmSmtzYO31SzcCN3RQHf6SHQNXxxxaHAQEi3PYXJTZ7e4G5bfpDlj1DrT4KMijAHQ==
X-Received: by 2002:a17:907:7788:b0:9ae:793f:2010 with SMTP id ky8-20020a170907778800b009ae793f2010mr12327776ejc.42.1696314362865;
        Mon, 02 Oct 2023 23:26:02 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id fy17-20020a170906b7d100b009adca8ada31sm487583ejb.12.2023.10.02.23.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 23:26:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: exynos_defconfig: replace SATA_AHCI_PLATFORM with AHCI_DWC driver
Date:   Tue,  3 Oct 2023 08:25:58 +0200
Message-Id: <169631435597.9647.9591583253316120162.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928202724.340420-1-m.szyprowski@samsung.com>
References: <CGME20230928202728eucas1p11a2f2850382ec2327bdd3514837123ec@eucas1p1.samsung.com> <20230928202724.340420-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Thu, 28 Sep 2023 22:27:24 +0200, Marek Szyprowski wrote:
> Commit 33629d35090f ("ata: ahci: Add DWC AHCI SATA controller support")
> moved support for "snps,dwc-ahci" compatible (present in exynos5250.dtsi)
> to separate DWC AHCI driver, so reflect this change in exynos_defconfig.
> 
> 

Applied, thanks!

[1/1] ARM: exynos_defconfig: replace SATA_AHCI_PLATFORM with AHCI_DWC driver
      https://git.kernel.org/krzk/linux/c/966e2ec6ef3fa786defe07ebca6795f284dde5b0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
