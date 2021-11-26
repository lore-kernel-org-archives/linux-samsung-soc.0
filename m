Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BEAC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 26 Nov 2021 23:08:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343608AbhKZXLg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 26 Nov 2021 18:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbhKZXJg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 18:09:36 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDB6C061746
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Nov 2021 15:06:23 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id e3so44531124edu.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Nov 2021 15:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+dZaITcZBt90z1oqsumsEwuslKh6nLTGZIBE5hBYKeg=;
        b=EzV6k65lbx7QcXkxyIKCcXDzVI7ORoNHi+4xgPC08pVwHsCOFP/rIzoQ6BCYfAqLv7
         s4Q5hpq+jhvBKYtldNczh8PeWDtJr7346xm8MMsVnB1sKMl4e97PQL+Z4EpDkCt62QIU
         YbaspfNgfDqRERxNS6JzBF2hs4VRWkYyh50MypdHtk6G8gEuD0kqwoYrJlOZqZwM1BxG
         oMOG1PsZkglohrcOcVpifju9osdmY2yM1jZcYaeRC358efOMgjWGyVKZXrUemQeadL3/
         sZCjD7oO2uHhr0K2mB1VaGQq7eyvbFvoOAzVGff6TTV4UnOIgINFDWNUkHNaVoodfcMp
         KTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+dZaITcZBt90z1oqsumsEwuslKh6nLTGZIBE5hBYKeg=;
        b=w88CRznDlEHaPyWUTKERYf01tZPvVpEhOChsCB0GqjsSIvrdaQRx/xoBPLUwT7Ibj6
         BbkgUhhjOnHVmOv3YWxAbQs5Ms5VoT3hF6+zDbCAdKipYryrdxaegBhX5tHCgTdfEAXZ
         ZSDUqeeQfXQiE5EV9tckZydSbr6bza5pB6M1YWU/QIWYgE4vOFNPHrJca5Uz1sah6PPE
         ozAXJhSxAvILC3kPV0uZSdy8ZFjwmXr7DsIa7JWPsTl63nAFt80jFfnKtijPYGwdLWAv
         d4RdFA3WOBuZzD0dQaX742ikMPclXaeJ1gl4UaUrGxKKWVgI6HLfR+MKumD9ksnlSUfJ
         uCfQ==
X-Gm-Message-State: AOAM5306wrst1tZSAanTl3v0zqftUa52fTkyvjlMHIxazsUccouRf/PC
        mc6HvhK5SqVOjeuZbpjdAz63ag==
X-Google-Smtp-Source: ABdhPJz4vlmWEyXRQtVC4Lj1sj+KYn4XcVXuDojzatks16AzF0kHPL72CAQHiH8jbtLLC3JWHD5pVw==
X-Received: by 2002:a17:906:730b:: with SMTP id di11mr42281246ejc.97.1637967981599;
        Fri, 26 Nov 2021 15:06:21 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id sd2sm4241198ejc.22.2021.11.26.15.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 15:06:21 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: syscon: Add samsung,exynos850-sysreg
Date:   Sat, 27 Nov 2021 01:06:20 +0200
Message-Id: <20211126230620.478-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document Samsung Exynos850 compatible for system registers.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 5de16388a089..fdd96e378df0 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -57,6 +57,7 @@ properties:
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
               - samsung,exynos5433-sysreg
+              - samsung,exynos850-sysreg
               - samsung,exynosautov9-sysreg
 
           - const: syscon
-- 
2.30.2

