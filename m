Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984BEC5CFC2
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Nov 2023 21:21:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjKTVVQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Nov 2023 16:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjKTVVN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 16:21:13 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E6DF9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Nov 2023 13:21:08 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40b27b498c3so1243165e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Nov 2023 13:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515267; x=1701120067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qpEVgJq7U6LEzt1Olm8HzCpK4MlDCTD4JzdLATzhQg=;
        b=GFcVHHoVADDAMRKZDi7eIWLQ1+k1zWtP/lF3p5yicdqkcbBhiEFhmlx1uf5s/ujMdV
         n6ZUK3RjPD2g2x4HtNKh8jVkfVlFAFw6/Vpf+LaU9k1laE+YTlxmqjlvTITj1QPDd0KJ
         j+qBtXZrI5OcanOEB5kUlpgkHk9kcSct277Els4IHbRJPXEBozZ+uz/tGi/OYcX+wiMx
         YqOZErz06jgg4uI6zJAeWG4QQxeL7ipxVcNOpTZhODwz1JAPQDP/aeklp5f5k8ZszbJ9
         t6R1Yl618B5Njibzx8cpjF0Si2IMnwN/EMc5GKCEmY/rKPkbLZ9K01ddTjQI7RpX/Jc0
         OSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515267; x=1701120067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qpEVgJq7U6LEzt1Olm8HzCpK4MlDCTD4JzdLATzhQg=;
        b=B+7SXo0YPUsZPZqPJ2g14LPQmp9VrBr3Nfuxrd5wCaWzsZDWBxbaYdfxi2tA9XpUMD
         Ejwq6C3GBeOeU4HlEG8R6goLiVqyKuESHhwUJ9P1WuyVC6pNSlspPoPTDisF0gCSzrr7
         TI/hVVSzuZrY0KE4N2Ursl20q9EETMzh9c9D3BjabDnPB56Km3Xf8MG3iTRy+3rGXIWg
         pQDtz57Bf8mZ/Y6Oi8j1D0sacFuCMm2Wxq2mhIegvKrtOjS+qEIb886DfFMa6XnuGcD/
         VRMZIqum45zzOCXHg3qQjfQ0yq9O1zCihMNpYXBYn/SJbSFMuueQRAXhajeuDF4HrqiC
         PdcQ==
X-Gm-Message-State: AOJu0YzNWxm2U3z3ntsNjpbMrbEe+/yjYAsfL6JZgSx6OCzwGe59feeX
        RhAwJUZa5T5bT/+vu8UMN58LBQ==
X-Google-Smtp-Source: AGHT+IGwngSJjJdqLWZuEEIk+kjfAkOiSyMZu75UVaTltJMf/TL75YODZPYA8f3hciNNYrl5BzMV6Q==
X-Received: by 2002:a05:600c:190c:b0:408:4160:150a with SMTP id j12-20020a05600c190c00b004084160150amr6534688wmq.33.1700515266746;
        Mon, 20 Nov 2023 13:21:06 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:06 -0800 (PST)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, cw00.choi@samsung.com,
        alim.akhtar@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v4 01/19] dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
Date:   Mon, 20 Nov 2023 21:20:19 +0000
Message-ID: <20231120212037.911774-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add gs101-pmu compatible to the bindings documentation.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 28e2cb50d85e..ce1bba980961 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - google,gs101-pmu
           - samsung,exynos3250-pmu
           - samsung,exynos4210-pmu
           - samsung,exynos4212-pmu
@@ -35,6 +36,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - google,gs101-pmu
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
               - samsung,exynos4212-pmu
-- 
2.43.0.rc1.413.gea7ed67945-goog

