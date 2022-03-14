Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BDEC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Mar 2022 18:20:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243746AbiCNSV2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Mar 2022 14:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243756AbiCNSV1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Mar 2022 14:21:27 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17783467E
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Mar 2022 11:20:16 -0700 (PDT)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 548C940031
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Mar 2022 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647282015;
        bh=3F2+CAuLP5QZLFRCTc5YKJtMfEWVhLlhzdIM3Py96Yo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=o/g0x/LPDRZnBOVMej65YdHFbrr4rtuf1ugwj/EbdyLqBzkhbcq8h69LHRbrBULZl
         56n49IYWfOLKHNQgN/EfXI5nbegDJyYwtfio16RH6d4hTvKIgzpmz1eNFhtikz9Ek/
         lMXjFKEDGXaPGmOLAsHYKTipYo0dBkAk2gKHRu3oAcXdMscbru1NOwiQRL5LlSX4nR
         Qhil2K4n+4hnGZUwMX0KMJMcARC4hL5qVPlmzOJR0gjCK9vd/nhCXNhkod0pS670R8
         LnDOCSX4fu8i2oREe0473rrUymAP3RD+HUg4o/ZargeT/Eb45ES3AF+KqaTd10bd40
         xipn+Cc57cLXA==
Received: by mail-ej1-f71.google.com with SMTP id ga31-20020a1709070c1f00b006cec400422fso8339066ejc.22
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Mar 2022 11:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3F2+CAuLP5QZLFRCTc5YKJtMfEWVhLlhzdIM3Py96Yo=;
        b=OM8/jhj6csNkdsGEdHwIwFwWYTC32wvC4mLIqsYr6unZmNb4oRdIcQU5q1GZMcjcXL
         RVr97jUXWTK6Zu22KqM9KZwyQ/bdejgyXUmXPKnr/usg1SYYhSa2Rc6gu+GIaLZ6ogYF
         wh46Mg9ryfz+Ul5SHBWFn33LxaqxNoN+WLeDW3GjbyoL8fdptxHOimuk1YpSQeNqP0Fj
         QIME0GmKeu/dWhagFmKUEWC4Jgjwug/dofQPeQ4Z1FzbAdeKBNWqRpmQB4TYj6NYMMxa
         Xs15SH7YdKfZPkPU314XI2Kwt7g71lMtQ6hE4VHjlYnozvd8RK07xsdxQjQNx+wZqLqI
         5ZnQ==
X-Gm-Message-State: AOAM531mpddu44etLQ0I5xp8RGZT3xiYUNSQDS6bUquPcUNCwFdSqIgW
        e/4KcQ3MVOypZZBR/JX9V0bSTHfKTVDB0QxXB1skDeKapn2bMMYLAa+MWLOs05K+WKCR7TXydy0
        dfRVZD8eLem5mgc2QkbrZBXHHLpUnB+9+vXG6g9ycj0+3Ok8s
X-Received: by 2002:a17:906:7953:b0:6da:951c:1173 with SMTP id l19-20020a170906795300b006da951c1173mr19830434ejo.465.1647282014952;
        Mon, 14 Mar 2022 11:20:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkcwlyOc0SXQwJvd/c10csYRaaMAinbSZyI/FaYE0QvgKDO1i/aLi/j5YzU3k9ZXqrCumxNw==
X-Received: by 2002:a17:906:7953:b0:6da:951c:1173 with SMTP id l19-20020a170906795300b006da951c1173mr19830421ejo.465.1647282014773;
        Mon, 14 Mar 2022 11:20:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id i25-20020a50fd19000000b0041614eca4d1sm8566449eds.12.2022.03.14.11.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 11:20:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 4/5] dt-bindings: usb: samsung,exynos-usb2: add missing required reg
Date:   Mon, 14 Mar 2022 19:19:47 +0100
Message-Id: <20220314181948.246434-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com>
References: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

"reg" property is required on Samsung S5PV210/Exynos EHCI/OHCI
controllers.

Fixes: 4bf2283cb208 ("dt-bindings: usb: samsung,exynos-usb2: convert to dtschema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Fixed commit in current next. If this should go as fix, I can split it
from the second commit.
---
 Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
index fbf07d6e707a..ef42c6fce73c 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
@@ -62,6 +62,7 @@ required:
   - interrupts
   - phys
   - phy-names
+  - reg
 
 allOf:
   - if:
-- 
2.32.0

