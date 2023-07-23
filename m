Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C60C001DF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jul 2023 13:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbjGWNTg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jul 2023 09:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjGWNTg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jul 2023 09:19:36 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FAA10C7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jul 2023 06:19:33 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbab0d0b88so26900955e9.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jul 2023 06:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690118372; x=1690723172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxKGN5SUivNz+ligYrmWT0BW3UDY3UHFVrq/Gy6pOrM=;
        b=TeXKvpfxHyL7htn+rjDHaupCyknovawCuk5PA1SA7Ntp1u56kIUN32nOA+OjXR5gTT
         aRObbBarli+wBusROTpJiJ9KCfw7rk/o5+UPpjPW3PpNBO8Pmjc0CrVMmT99JBBXSjaJ
         QJyuxUMo/UZtCdEOMlkeqP/QnyYzAGaNwKAq6f7phiRg77CA6fP8L5DXlLCOCVXW0KbP
         5eLrrY08w6kdUWvnu/wVx9JshN+guajvNrH/NiKYd27lCEhyPjIPmhuqWcUDjBvXr7qW
         VatjF02Ai2Y57EcOEhcToGa96XqRmahPBCc9uxMbHg4sIQnm0w0f9BX0I+kYKbrpBzgk
         Fc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690118372; x=1690723172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxKGN5SUivNz+ligYrmWT0BW3UDY3UHFVrq/Gy6pOrM=;
        b=eNaLPSu7Z1N7EGh6m0poYrCO4yzQLXepr/UpTmhUEUa9yHz1TIfLV7fmPWXxrg3GYw
         QxZwRKziWYBOUngkMmcLQOYcP9JreP0geITnCjlSFrQzlqzhYUAP1EwmcbhcS5sm0mpX
         qZKAsGCjwsJ+35TQ/5rnkhQmCH+a2eI0UHVeeyt7ivoDbUx7P7NEBM9jl4KYT5OxG3/C
         PuRZyjpoJqbwpZBH/bUYFYktEfldivrbkeNucmQL/44JhPU2CPapEu37UwWoCeuyJdjA
         pv9tin0gTMNOSbaYWMJ97EzyJ8hPzA5Gaw5MICbd9HiRpBOafGUJjKkji6XMn7KPfz9B
         SAfg==
X-Gm-Message-State: ABy/qLYJHKqVnpGx64H58hIrxNtqKshKjKR9zAavil3gXlDsqwxAdt3G
        wZd/wH4wEATecPrAfEhmXgOtww==
X-Google-Smtp-Source: APBJJlG7G2NBT/RCN58YIlYPpGzshVCKmMSd3YJ5rW+vc1J8zD/+ky6sxLp75IuhRiCGEBhUE8JiCw==
X-Received: by 2002:a5d:4eca:0:b0:314:2736:ba3e with SMTP id s10-20020a5d4eca000000b003142736ba3emr9328519wrv.3.1690118372184;
        Sun, 23 Jul 2023 06:19:32 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d49cf000000b003143765e207sm9700257wrs.49.2023.07.23.06.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 06:19:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, arm@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 1/3] MAINTAINERS: soc: reference maintainer profile
Date:   Sun, 23 Jul 2023 15:19:22 +0200
Message-Id: <20230723131924.78190-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Mention the SoC maintainer profile in P: entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

---

Changes in v3:
1. None

Changes in v2:
1. Add Rb tag.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3dfa40abc885..7624eb231b65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1570,6 +1570,7 @@ M:	Olof Johansson <olof@lixom.net>
 M:	soc@kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+P:	Documentation/process/maintainer-soc.rst
 C:	irc://irc.libera.chat/armlinux
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	Documentation/process/maintainer-soc.rst
-- 
2.34.1

