Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46368C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Mar 2022 19:09:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243607AbiCBTK2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Mar 2022 14:10:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240647AbiCBTK1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Mar 2022 14:10:27 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3DCCA30B
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Mar 2022 11:09:43 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 074F13F1E6
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Mar 2022 19:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646248182;
        bh=1Pctha4u8cVsEs4xlPwZrQ0r0d0EgFOKH6VlIF019go=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=d9fKJV6WKlErwGZXvnHI5cQLpsSCdATNIzBRmXEx4ILLiHUiRZ3qUKcrErd3GkWPn
         QnMfGWtVT/MJIbTAev+/JcQ7E6LHi0MWinbD/0igWgv4CG5wDOw+XRYW9GPNmL7jc5
         dlmjPajdVZnX5VqyzuV+t2P0a2d+y8NJreMEsQQ/xUCsZ677p4FZjjSV0Xu4Ep8UCs
         QHqVmServ5BM8t38G6l79hffCa4gSbcSY3l8pmbCNTqcBXaPR+pmY5Dqsn+ijrbgI7
         seC+kOG3pqb6R8hWw2HxyZ9UBFsnNigq8qxttiInuAhjnGcTuBUiUybO85qSBL89LB
         i27BFevq000bA==
Received: by mail-ej1-f72.google.com with SMTP id f1-20020a1709064dc100b006da6dfb4185so1139317ejw.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Mar 2022 11:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Pctha4u8cVsEs4xlPwZrQ0r0d0EgFOKH6VlIF019go=;
        b=YOwPq6aB3w/eqnGtAeJEcu6CCCQermnDSgud8v7LC0ECaVrLvyKuls4jsWLu74BYCq
         gsxtQAE/09kGxobHzBxnP10sCs75C5+xs9xZqB6nUtvf0atQZuNlHfbluIe3qlwK4AuM
         RsF8BNfN/Hdlt3JmpzeRqjT6arZZQDXbq30wGZ1ulPlfF1t3snt0nWrZ9RBfjQV9GVUM
         EGgZdEHbFMqaO/jWBkYGy5Ea99/WHLGRmkRSwYyjFPBEE+TDS7breY9+VnEJG0cfkWve
         twedPt+61aj1B/kLaP1UqjZLICDqWOucBPOsfHeo4dBUZm2zhYpWRXJ/RWffUNep13i8
         kZ6g==
X-Gm-Message-State: AOAM531YArcmfBcCBjalb7XN01V3ZzveOyvIxsrE2DfQTaVl/euFkBtb
        7jjV2bqZozGlA09k9ck8nm7DnlEcPMjH/raKrvlGKRKujKKXbiElNoF+UOdnFe4K1xySCAX/7uf
        QIY1wvMNj2+NzJBXOwWGsmRDhfYmozYoculx5EDej2d4RbEP/
X-Received: by 2002:a05:6402:84f:b0:412:d1ef:c7df with SMTP id b15-20020a056402084f00b00412d1efc7dfmr31300304edz.210.1646248181715;
        Wed, 02 Mar 2022 11:09:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDGPYMBaxMOOCVnAW4INeW16OrKR4ttdMLBJjB9fEpj5paXubHN6QFYEcgOLOtV5F3eRKfIw==
X-Received: by 2002:a05:6402:84f:b0:412:d1ef:c7df with SMTP id b15-20020a056402084f00b00412d1efc7dfmr31300284edz.210.1646248181557;
        Wed, 02 Mar 2022 11:09:41 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id u9-20020aa7db89000000b0041372781e69sm8216383edt.52.2022.03.02.11.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 11:09:41 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] usb: dt-bindings: samsung: convert to dtschema
Date:   Wed,  2 Mar 2022 20:09:36 +0100
Message-Id: <20220302190938.6195-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Greg,

Could you pick these up?

Changes since v1
================
1. Drop DTS patches (applied),
2. Add tags.

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  dt-bindings: usb: samsung,exynos-dwc3: convert to dtschema
  dt-bindings: usb: samsung,exynos-usb2: convert to dtschema

 .../devicetree/bindings/usb/exynos-usb.txt    | 115 ----------------
 .../bindings/usb/samsung,exynos-dwc3.yaml     | 129 ++++++++++++++++++
 .../bindings/usb/samsung,exynos-usb2.yaml     | 117 ++++++++++++++++
 3 files changed, 246 insertions(+), 115 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/exynos-usb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml

-- 
2.32.0

