Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAD9C61D97
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 22:23:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbjAWWXt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 17:23:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233167AbjAWWXs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 17:23:48 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39ABE1025F;
        Mon, 23 Jan 2023 14:23:47 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id w11so1108650edv.0;
        Mon, 23 Jan 2023 14:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+5bO+lWD89GR1evsBX1z7xFkVso1S4GR3FB8mwTo4k=;
        b=q3R3mveKXdn4uJ64cZusX7blrGYp2dJl7R11YiLUuMc0+huoKvlPghpaXoPbx7LOD5
         f7tjPx7gvRvz3VaoyNWtcLEWUYK/fjsUace9cPfvIWKQOzG0IAObGTGwhtgGTeSfq8bz
         L8saLKtPuDIGp4gyvk9nBimsMoomMWodQDYDBxVvN/AXLajfXHc+Hw+ESjjqY5bojlL4
         j9GUcmROnpQ63VMuOJ6LjcmvS20PusonM57bvS7jY9/Fh3zDhj46YaFQlqBK2acX16JI
         BSJeHG1k/JLlQI5Wvx3YFMvklsoSSYfaT/8RkEJfYTrxSqtRetiBxyvh1Gt3xcCw36xe
         Ynag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+5bO+lWD89GR1evsBX1z7xFkVso1S4GR3FB8mwTo4k=;
        b=eW6qkmRZnEDUQBHlxjIaY7bHmed09gfwtXfuCnCiRTjf4CyNLdNulEo4s/WXTcJRlb
         VglL1HEYbneqAy3mbsshM1JIzVUSHEUCVK2GKTNPuyLs0XROOaLTmUE/S5jTVEiC/iqP
         LcNAW/5bBZqhGCLDrHZAdP6Vo6he/0eYhZGAjm1OlUFAB4i3OG2mSld3kADFtac1cJVn
         jT2rBJYnjI0nS40bR8HmqoiKUzmIcZJC8T3HY4NFyU4gNBCOCOjovIzVRYfVRR4SS9hL
         xxBJyBxkfkRo922ODZY8GqAZPq62KZz8Nwy6+meZ3oLl+5V16pVnqex4NZ4cXLMOKOvl
         dHNg==
X-Gm-Message-State: AFqh2kpDMaBsrSayXlZ/7gpZ9pIjY/cAClGI3B56IuV76IrQsSl3T4c7
        v/ZhT9NcczckGCicYMLXH7dDTHC7qC4=
X-Google-Smtp-Source: AMrXdXvSO0IyLPNMJR3iiw3rnDchFPgagImVepzeQIww70ZaipEBQXOolz5KRnekx/P97rYwpbk/UA==
X-Received: by 2002:a05:6402:401b:b0:46f:d386:117d with SMTP id d27-20020a056402401b00b0046fd386117dmr31299696eda.33.1674512625322;
        Mon, 23 Jan 2023 14:23:45 -0800 (PST)
Received: from localhost.localdomain ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id l19-20020a056402345300b0049f5ab4fa97sm256928edc.86.2023.01.23.14.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 14:23:44 -0800 (PST)
From:   Markuss Broks <markuss.broks@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Markuss Broks <markuss.broks@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S5 (SM-G900H)
Date:   Tue, 24 Jan 2023 00:23:27 +0200
Message-Id: <20230123222329.13994-2-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230123222329.13994-1-markuss.broks@gmail.com>
References: <20230123222329.13994-1-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add the compatible for k3g in the Samsung Exynos5800 boards section.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index faea33e4f731..deb2cf971871 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -171,6 +171,7 @@ properties:
               - hardkernel,odroid-xu3-lite      # Hardkernel Odroid XU3 Lite
               - hardkernel,odroid-xu4           # Hardkernel Odroid XU4
               - hardkernel,odroid-hc1           # Hardkernel Odroid HC1
+              - samsung,k3g                     # Samsung Galaxy S5 (SM-G900H)
           - const: samsung,exynos5800
           - const: samsung,exynos5
 
-- 
2.39.0

