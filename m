Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288BFC7EE43
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Jun 2023 14:07:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240062AbjFIOG7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Jun 2023 10:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239898AbjFIOG5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Jun 2023 10:06:57 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 005723584
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Jun 2023 07:06:55 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51494659d49so3088370a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Jun 2023 07:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686319614; x=1688911614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ez83xrnUgbw0MAP7/4bHfz4IcI1smRL2ein9QCNd6Q=;
        b=MWLzBqFecgIKNf1kgPAbYdebxEuEwkAqBZ/e49ZS5gOtgYOKtpD8LQ66Vnv9LPxiJF
         Mo9RX6D+aYNPiN9nEWemYZ6fCyB7Hqdx00XbM3YtyU6iX6l3saQ6vFZCasD2zN5AKmli
         wHWkF3yxP8aqdzkMYYz+zxRIdZFMgMBPLMI99CLY3WSQOqFCjvgSoqxOo2E9jPdueDAg
         TdG04blH0/lMwU9GRTQpsDIE+hyW/ePw7XJHVgV4b9z3jvWj6PpTE/AN2OPP1MMFGs/H
         qFE96ooOh70XorMN5d40jzSzZRDM+LU0W+0oU8GvzDStCIxJHYaW9lHRgC3vDieyK1lT
         sqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686319614; x=1688911614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ez83xrnUgbw0MAP7/4bHfz4IcI1smRL2ein9QCNd6Q=;
        b=cGBxoKSvjBWcZjsGvETEXAgraGck1PzELaYLbZfJgGnBxwADHux7HSMJ0L3v3LVJCz
         19B4R+nXFF8VHG5rcU3GvBGl2o0UoDo5v4yljGe/0uYEbIxX1Vb60CCzNBnVuWBayMD7
         ryOI+WHmO3vyND7m496aCc2LvYh6gMUliLX97X72r9MCtDnwNhceUuP/oiK/S3W7TTN0
         R0tZ5MIf+swuoPij8OFsuOw5LRHcqMgl/SH0P1PXvg4vcTpp7crpj8OS3XyR64aJm1Z0
         7V8yI/Slz/cy8ZL5HWQTTUXEjDBHfpjCPeqWGT3V/fhJKwBt3HAJekdS+HawSUX8EyDB
         3avQ==
X-Gm-Message-State: AC+VfDw4SBCXcR2VBn5I8a4UV+7RA683sM8AamU5GhZ0JnCpzQSp4O4t
        PiGv/K7wURddGSoo38blbLsvsQ==
X-Google-Smtp-Source: ACHHUZ6eNQSN6PIFn6NAH6sD5EEzqacvW4Z3scV2BWSPG/097RqqphuqnMSNGCi9/N3LutXcW3LILw==
X-Received: by 2002:a17:907:2d06:b0:973:da59:7c91 with SMTP id gs6-20020a1709072d0600b00973da597c91mr2053621ejc.51.1686319614494;
        Fri, 09 Jun 2023 07:06:54 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id kf10-20020a17090776ca00b00965f6ad266bsm1307695ejc.119.2023.06.09.07.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:06:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: ufs: samsung,exynos: drop unneeded quotes
Date:   Fri,  9 Jun 2023 16:06:51 +0200
Message-Id: <20230609140651.64488-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
index a9988798898d..88cc1e3a0c88 100644
--- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
@@ -54,7 +54,7 @@ properties:
     const: ufs-phy
 
   samsung,sysreg:
-    $ref: '/schemas/types.yaml#/definitions/phandle-array'
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     description: Should be phandle/offset pair. The phandle to the syscon node
                  which indicates the FSYSx sysreg interface and the offset of
                  the control register for UFS io coherency setting.
-- 
2.34.1

