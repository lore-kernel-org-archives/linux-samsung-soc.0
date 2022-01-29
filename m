Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E25C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 29 Jan 2022 17:53:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352761AbiA2Rxp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 29 Jan 2022 12:53:45 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58768
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1352786AbiA2Rxj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Jan 2022 12:53:39 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 917E43F4B6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 17:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643478818;
        bh=91aS3XOwWU5WTC4z2AKsnFVg6zaKlD32D1AoEn9HL0o=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=u5mZq2z8q+FBU0s7kUhjxNb5/czpA8YrDXnKvORnAR1A4tJQaaZoB9hCCfTMV1tMT
         sF3bUC+hokul+j6JYP3Njq+3gCeuIJ4bLrGOSnKl1993j//pCDBmsPB9TOoMal+rrS
         mnUe2BfuNa9hfp07bENfu3XzdEi083y+V2qkfDbMsrerRHSNv1KdLDDDkKWwpmLd9t
         l4xKvfKVl89SkZ9xMwqSCFtg5Uu9SIWbMukhJ3rUTSfTFnKmT0UDzmaAzHozTcnUSN
         QPW3Xp7BnL0D8K2kzba+tAxDlnLywZvY6rn3vTE9KxtDeUMDyfWZQtyo82SWi8fDmn
         SgkSLDMRfzo7Q==
Received: by mail-ed1-f70.google.com with SMTP id f21-20020a50d555000000b00407a8d03b5fso4653449edj.9
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 09:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=91aS3XOwWU5WTC4z2AKsnFVg6zaKlD32D1AoEn9HL0o=;
        b=xzuplOlrR+s1UdOPNhU9sBmD8EZn/BSJjXnFuqplOQ6S/gaFIcVp48mSzkgjnb8iwn
         Flb1aMhJ4RLBl6uZJykAeVnN1atL9WsDG48MikTvSD0bXA/lxIq+5ZDUJjtcDHLzJ0yv
         z2fYFoQSnMnSfsb7OYUf4l7d7BvcWYrpBao6W91HKiSzx6ol138ujmCYqnQO5KPYyDrW
         W917o42+7kklT/6R7ZRfHdi/ojmJ+GYGtzHSdIqiWu/Wn2gn0ZW1+lBOCp0l6neyWBY5
         LpwSsBN3PSMs/oFT1sqCaF0EsRfyu2oG65TEygUz5KSKKKED3EhKk/FJUiQnYPym3jMs
         cfrg==
X-Gm-Message-State: AOAM530VBFqkGx1fGJutFXBZR7RY30ws6cF4KVTgfeMprox/jKubzO1/
        23z5oOPT6tG/V8lszvSZ/9lxmbROgBV3iMEtwTaGSOqBNDTCYY+pncG4mheAFI4JofcYhgkjunE
        PCG9JF7TrB/SEudgf6zVC1yNIBD43+dI1ozycIRmimO6NRle4
X-Received: by 2002:a17:907:a421:: with SMTP id sg33mr11650266ejc.108.1643478817853;
        Sat, 29 Jan 2022 09:53:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVNBn0kTfD4ogoNz392MYFzdBWozh3HfQi6t0ug4M8C7NNR8mOzvuDFSeROfurwcbyoSTatw==
X-Received: by 2002:a17:907:a421:: with SMTP id sg33mr11650253ejc.108.1643478817711;
        Sat, 29 Jan 2022 09:53:37 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id s12sm11236266ejx.184.2022.01.29.09.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 09:53:37 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 3/5] mfd: exynos-lpass: Drop unneeded syscon.h include
Date:   Sat, 29 Jan 2022 18:53:30 +0100
Message-Id: <20220129175332.298666-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220129175332.298666-1-krzysztof.kozlowski@canonical.com>
References: <20220129175332.298666-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

syscon regmap is not used since commit addebf1588ab ("mfd: exynos-lpass:
Remove pad retention control").

Fixes: addebf1588ab ("mfd: exynos-lpass: Remove pad retention control")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/exynos-lpass.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index 99bd0e73c19c..166cd21088cd 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -15,7 +15,6 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
-- 
2.32.0

