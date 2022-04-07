Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E565C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 19:23:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbiDGTZx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 15:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbiDGTZt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 15:25:49 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E50A273DC5
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 12:23:42 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id bg10so12953890ejb.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 12:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F8jh3aySWQnb7HDAbhAs/0sUcQxLP63pLiPbekNgjDk=;
        b=yRIm7uIDbSW+Sg1A2IhWkxOHGJVYcI3y7DB2yfTZcoVewxcnlALiBa7vyZkkmR38CV
         w+bOFE1HyCSDJhp5sZbXF+zDodx3h+lg8J2PKFWgT7OmShhoaaKCiYRXypSjtOQJauTc
         eWLIHo0EuMpbS9/3YMD8h91DBBiL4EFry0FOp+5/qRVSjLXQs4vA37UuZwQ4+NHbgHOY
         taTArVhqqNvkyG4R+/dEMfA2SxINkmf0NJh0hK6N1FqjN7Hs7A04KOf56QUGgsBO81Yt
         s6/JAo1m7QnUjLGjRBYAQXYh11W4WymB4ZJcSh3QrIYHo4117i+ioQUGTu9AI6XbEXqW
         J9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F8jh3aySWQnb7HDAbhAs/0sUcQxLP63pLiPbekNgjDk=;
        b=2Uv4b1fmr5i9y+lHFxyTap7pIbmjP6zamxxQAp6mmqRxzK6lnSUuHCmjSX2/6o1RDr
         fK3993nlCG+aHc4+z85V/NsfFEg6JcvXpmljp64KwCO0DwCttUAYMxkYvuu13s3d0R+w
         C6PptbSQo/BQgbe2SnMrD2a/qzfqp4GMv6Ey439z1UGMZhjU0vXlInuZvhpfswfE2Iqa
         AkC9/VJI03zLJ/i+vearvDQZICRB1b3c0ell01WNuMc8TE+ESeCoGoucOPib/Ns/7muy
         A74vWIhKt4jpPYNRqb2pMwrYutIQVoJdpy6CokDi86+G2ZjiHTSh9X9BCkcP6UoW5skZ
         37fA==
X-Gm-Message-State: AOAM532KfDkT/0dLAB/pr67/Lg0t6XpbmkJ2V7KrIjMFOSc2BVIfpV3l
        qHtBdo78fkJfcDZwFI1oXGnhoQ==
X-Google-Smtp-Source: ABdhPJzrWsOtA3cDQUOjCsx0X3xlU/Jjh6w2JQBPVga+/8xRbPxBvqcrPFrmzfSbC6oPJdzo5iI/Pg==
X-Received: by 2002:a17:907:3e1d:b0:6d7:1031:7e0 with SMTP id hp29-20020a1709073e1d00b006d7103107e0mr14482142ejc.580.1649359420885;
        Thu, 07 Apr 2022 12:23:40 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id x4-20020a170906b08400b006e493cb583esm7870340ejy.47.2022.04.07.12.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 12:23:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH] dt-bindings: usb: samsung,exynos-usb2: add missing required reg
Date:   Thu,  7 Apr 2022 21:23:38 +0200
Message-Id: <20220407192338.14849-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

"reg" property is required on Samsung S5PV210/Exynos EHCI/OHCI
controllers.

Fixes: 4bf2283cb208 ("dt-bindings: usb: samsung,exynos-usb2: convert to dtschema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>

---

Fix for commit in v5.18-rc1.
---
 Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
index 340dff8d19c3..9c92defbba01 100644
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

