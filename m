Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4219EE49B3
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 19 Aug 2023 03:18:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244663AbjHSDR5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 18 Aug 2023 23:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244685AbjHSDRg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 23:17:36 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DEA94218
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Aug 2023 20:17:35 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3a7f74134e7so1082386b6e.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Aug 2023 20:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692415054; x=1693019854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSHQ+AygjgxqH5HVmvaPgTOe33eIHrHGDBC7hTH/La8=;
        b=C34abAMhDmVjj+X6tuU7eWDd92FEWuhS5gRSP/sa+1L4FcZLCHkBgX6kMHXhQ0T+vQ
         EyvCTzZaD6hyYCUXRBpz2uZ4m445iJ6+S4gdz4KUYK/LlS10Y82FzCx7K48KoYuKcS0M
         M2E4yaNXDzYzKuHIkKyvAbtS5nRz0yNxHwooagrJsYP6UFO/FKuiSu6sDWZ7dw5VGMhu
         jr4ZTIB0FWTw7p43ZSzKqd0g/pC81IDADqP+JzwZK0XZ+xR3UGZnKRuY+oakOPABXmkW
         eOEK+7HAtEqwzYqoglQigMBv3WeQclG90iYHmVKWAlDtHDLSnQwbR/srhZ3ui1uvwKb+
         2wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692415054; x=1693019854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSHQ+AygjgxqH5HVmvaPgTOe33eIHrHGDBC7hTH/La8=;
        b=DtCZBa8lN2Un0E0GeckRCLvsBl0PgFecTWwNUJD8UBcZt2pCi2+7oGX0ENkuFENfq7
         hmkKhvf+fkwyhP1j0wiP+9A076B/S0m9e5vWFpdsuVA65Mz4O9affYAAcATRbePqb9+E
         qidtawyHbkojEOwSHWoFNkud+cxflT3ZvSfwoJTAr2eikXa9BgWJPj0T3iNozpz42lMP
         3xD4m3xe1UduvKRHOOqb+0O+D5zt2WNp1UJMXrkjsOhBmuRsz3pzylb93uPMOgOYx1eQ
         Uf1PA+n3m2oEAhdp1YXZFt3Y5Qc+TkDy+XW3df829zGLigORmX295oilYclTsF6I1w+t
         aNQw==
X-Gm-Message-State: AOJu0YxAnvNwrJF++yoW8peasmOLcsNNvQInLmVkWdhUMK1Y8s/s4pgU
        cTVExp971f7ogU1muLG9ukjKsQ==
X-Google-Smtp-Source: AGHT+IERSFZA2QdkLI3yWfYNxqRffzPPNjLP1datCDevdQ8JNtPW/yFsN0fkEWcyHCH5hK0MtlKi0w==
X-Received: by 2002:aca:f045:0:b0:3a7:56a1:9bbe with SMTP id o66-20020acaf045000000b003a756a19bbemr1326198oih.45.1692415054421;
        Fri, 18 Aug 2023 20:17:34 -0700 (PDT)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id bj38-20020a05680819a600b003a74933a1e2sm1496699oib.46.2023.08.18.20.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 20:17:33 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     JaeHun Jung <jh0801.jung@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/8] dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos850 support
Date:   Fri, 18 Aug 2023 22:17:25 -0500
Message-Id: <20230819031731.22618-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230819031731.22618-1-semen.protsenko@linaro.org>
References: <20230819031731.22618-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document Exynos850 compatible. USB 2.0 DRD PHY on Exynos850 has two
clocks (ref and phy), which is already described in bindings.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 5ba55f9f20cc..452e584d9812 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -29,6 +29,7 @@ properties:
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
+      - samsung,exynos850-usbdrd-phy
 
   clocks:
     minItems: 2
-- 
2.39.2

