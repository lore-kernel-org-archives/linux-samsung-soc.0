Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C6AC4167B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Dec 2021 01:46:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbhLQBqZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Dec 2021 20:46:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbhLQBqX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 20:46:23 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D36C061757
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 17:46:21 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id z7so1423178lfi.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 17:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cxvNEtCPBXzjljfYxRKeW/Fan3oOoMNu2DZyjmhfjvA=;
        b=J2cmMX9yPq/Ya7mojZVUDevjq9DPnp9gmygKFrXo4+8Lbp6Y30nK3Os3dMx3BjYL4W
         ZUO5ZZURskVs7Oe6xseXFUyy3+Z3Ow4Lx06Z0guEYJUPZIz2Fjx+XoVgfQAT4mUs+8QR
         ppb0M7NixWLO3PffJ4j2H+ACbL5w7xEMO1yDIXyPm6WkDUk/gTNkcBbACPBjevtsf/7r
         rksTvt/RSOxmwSE8NaVdGllK28XKotYt99OfphVMts39W/m+DnSEj8KiDVgYZhJnAx4w
         kp4OJtae2qPnRaAtJs7VvTIoi/Rs/wiXNSTV6JWl/vpaVynTKV8BrLGGuZSXIJtleaxD
         WaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cxvNEtCPBXzjljfYxRKeW/Fan3oOoMNu2DZyjmhfjvA=;
        b=NUPm5JwJ7645Ehi1TmcCe92NGSixczBQo276awavB64yeZp7hKAXWq90sHataxPwSJ
         Th4zPxGBs5O26sTRwyhtu5psXtiT2l6GjEx2aGszWdVcgHRTrSlcCMYXlphvcRamxti+
         jZfTs2dW9kBnLB2KT/J7ZDkNhZOn9A060zMwGR5Ggo8QsXhAuar80m1ZH1SegphXBXkz
         T6pSSaLE9+a2FJD8/9UI7A5ypr2ph5qwPisrDqM7xgrEuUbvBb2zQ5Fry9TqaCa21kmg
         yu/zH+kzQ05M4ly2smHPJU39fEGOQz89bGac45qAZOHx3vkQN3lkMPpEcnDS/t/wFs0t
         2l9w==
X-Gm-Message-State: AOAM532gBAIkjeoT5kGUIBc+cKtEM19ZGiNRHQ+V+0CzwrDHda4sKz0c
        ui+vI4ay7w3HCFqGTafGITv4zGfw/nkVYIKR
X-Google-Smtp-Source: ABdhPJzAwjbT//kCiYNb9F5m6aaC2cNrCdyFupPxliFHi8QSIQiEBD1odDhPdbAaJERTspo4oW9jSA==
X-Received: by 2002:a05:6512:3b11:: with SMTP id f17mr845275lfv.374.1639705579331;
        Thu, 16 Dec 2021 17:46:19 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id r10sm1431021ljg.116.2021.12.16.17.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 17:46:18 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 3/7] dt-bindings: Add vendor prefix for WinLink
Date:   Fri, 17 Dec 2021 03:46:09 +0200
Message-Id: <20211217014613.15203-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217014613.15203-1-semen.protsenko@linaro.org>
References: <20211217014613.15203-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

WinLink Co., Ltd is a hardware design and manufacturing company based in
South Korea. Official web-site: [1].

[1] http://win-link.net/

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - (none)

Changes in v2:
  - Added Ack tag by Rob Herring

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4698213611db..25f94c723cbc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1328,6 +1328,8 @@ patternProperties:
     description: Wiligear, Ltd.
   "^winbond,.*":
     description: Winbond Electronics corp.
+  "^winlink,.*":
+    description: WinLink Co., Ltd
   "^winstar,.*":
     description: Winstar Display Corp.
   "^wits,.*":
-- 
2.30.2

