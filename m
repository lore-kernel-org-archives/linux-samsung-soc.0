Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFA7C77B7C
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 13 May 2023 09:02:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235540AbjEMJCl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 13 May 2023 05:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbjEMJCk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 13 May 2023 05:02:40 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B224EEB
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 May 2023 02:02:39 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-96ab81aa68dso246176866b.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 May 2023 02:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683968558; x=1686560558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HXSOlaN4/Bv4YilVOwCC/M+d+MgGbw/gHZ0ONLamDV8=;
        b=vc7Ye+F6KjYi1P1vwEMBbV3cPmrH6ynQnOLsQ7R7QCKXSaLinreMF0ZgD6bMjEji8V
         epvXfMgat8BsqAH+NcBWFA6+OxvsoTMIvjqI1hToBTWofTVZe1lB+8W4r8pNra6nILBz
         rmPfib0MFYhJFHvHpDq5+nTemLpz4nQO5j5mPA487EpXrCqOsrXUvJMdsWL4M3LdCDgE
         fltXOnDB89luilEPvDsZtOGrEy8OK2/VAlOr90Bqw+KzsFlCVVmFPzMqrYvNeZZafvCF
         1/jdxZhTXAaAxJq1hyZXVNFpq0uiGgZc+ShOqCJbcePM6xEbAk4CEK1KmVkN8plzkh3r
         vEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683968558; x=1686560558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXSOlaN4/Bv4YilVOwCC/M+d+MgGbw/gHZ0ONLamDV8=;
        b=YKH0sKKzLnQ0T+OAxMbFWi84z2ghRPm+qyOP3HCWIgqvEsjMypbksXe7U99avZDLZa
         L/PFR7Rlen9O/yt796dHHmc9z/+LTHS5Ln5bit3hjDbRCrhe7ydgP9osOLW/qrj7l3Vv
         V6o2fqhOxC4wh+S0I12FwhQu8rlytTn1DQ/jp4jBS4i0H2iFglgiwCj4lmBvJPLtCUuk
         k7krIo4XMI154svw2Q1pokcqJxCSBr9rMh2YsFFYTguNliQGftktWMh4DUVfrXTUXwkQ
         qASaG+5P+XEbxieXBDZiQkO32i+Fu3CrfYBKtWpECq09c902mJEf6aLb/OcqETHhHhqv
         5q5Q==
X-Gm-Message-State: AC+VfDyieX/tK7tK60If6JdIgyp2nwIRPO4lFRqajn9Ym9eCf2PNYp3v
        7TcO8kjF53ovk8m+5dzTV19RYydGz2F/iK4EeuLZRg==
X-Google-Smtp-Source: ACHHUZ67161rnDoLfMuLThXGPyOgzGXRs8UQzENpp+61zaIgMeOcqx8yp7rZWHiV3lazI+uGB7v95g==
X-Received: by 2002:a17:907:7214:b0:96a:c661:fa1 with SMTP id dr20-20020a170907721400b0096ac6610fa1mr2653328ejc.46.1683968557696;
        Sat, 13 May 2023 02:02:37 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:1d0:810a:586c:c5ba])
        by smtp.gmail.com with ESMTPSA id jx26-20020a170907761a00b0096629607bb2sm6504247ejc.98.2023.05.13.02.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 02:02:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: MAINTAINERS: drop Krzysztof Kozlowski from Samsung audio
Date:   Sat, 13 May 2023 11:02:28 +0200
Message-Id: <20230513090228.4340-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Remove Krzysztof Kozlowski from maintainer of Samsung SoC Audio drivers
and change the status to maintenance (no one is reality being paid for
looking at this).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c7082004ac55..746ec43ff244 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18581,10 +18581,9 @@ F:	Documentation/admin-guide/LSM/SafeSetID.rst
 F:	security/safesetid/
 
 SAMSUNG AUDIO (ASoC) DRIVERS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-S:	Supported
+S:	Maintained
 B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
-- 
2.34.1

