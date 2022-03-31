Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8FDC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 31 Mar 2022 19:45:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240995AbiCaTrU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 31 Mar 2022 15:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238340AbiCaTrU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 15:47:20 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48AEA63526
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Mar 2022 12:45:32 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id r23so581095edb.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Mar 2022 12:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V/V3H/YddlNmLC3otY5ysv0Hx42DjQ8xOdVkZo+o4gY=;
        b=jo2POnUA1y7qcsUa7m/1/RGa1XfDwxxjJcsdQOWOarM4RsCHmIjj9nhaOcAlS9ga8+
         3cC62tSdSO1LzBUQG22g8Fzm/Echk3CTRUPuEPt8TZXdmHqPB2su6oyO6JHW4k5Z1uBS
         FDVYIR3TR8xh2L1LQw7+D1u+rKfYsDlBKs0lU2M7akmoAhQpLRNycA7jGLgNsLQppOwZ
         tUMfTRg0Gj8oAQ0lI1WO7mwlePOfvTgLVEl9vd2n+lo0cXuKMQ4RX+m2IW1KtjayDI5A
         l+Rd0hWTL2ZjqER8OyFS3Atq6j7z0ak/iT51tLl8hmxEZnnUPedb6l5dbBBlVDL0uWil
         snFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V/V3H/YddlNmLC3otY5ysv0Hx42DjQ8xOdVkZo+o4gY=;
        b=J5K9XcLZZfnRCEUt1lbkQjfydBybVmc97b1O8mA4wSTTIk5qBPKFWuWiH6pzm42crc
         8Pz9ECowSfUvmuSIxEbAHRtV5q8AeS/csrlpmCG56krcmpsrc6my6flUel1Fm98V+PXI
         WE/YAziMkt7abiutnZcon6vZDGu3ROJEoU8oSVHV6hc7uH0wknJ7n7IEFuY/TfunKfsX
         29+O5ZFmbsgUovf/1coxaUDBv9k9zSqpoZCC9aBX0W+W8nPtcM9l4SM4WFkmo7SpN/mq
         P6VWxjghR+KJDZkJ1Ba9DCHYUJSmmX55tUe+8AYsHKK/4xQ4zvREwAP6gHx5334bXPkS
         xe6g==
X-Gm-Message-State: AOAM531UcIVVr0DTrdfSDTr4L4PRbJof/W03zlhTUQ5MkTIV0RZL0Qnm
        N7xIGhJdH2PToYyfbHoChcUsSA==
X-Google-Smtp-Source: ABdhPJzntQeoOpg2WbfQOwk+SU8tmcnkadErLhQyWegHBPI4g+Wkew0XbhQZIxuvbRsrLiUC+Vymhg==
X-Received: by 2002:aa7:d517:0:b0:419:16c0:f313 with SMTP id y23-20020aa7d517000000b0041916c0f313mr18020465edq.379.1648755930844;
        Thu, 31 Mar 2022 12:45:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id a21-20020a170906275500b006d10c07fabesm129148ejd.201.2022.03.31.12.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 12:45:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ajay Kumar <ajaykumar.rs@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: samsung: staticize fsd_pin_ctrl
Date:   Thu, 31 Mar 2022 21:45:26 +0200
Message-Id: <20220331194526.52444-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

struct fsd_pin_ctrl is not used outside of the file, so it can be made
static.  This fixes sparse warning:

  drivers/pinctrl/samsung/pinctrl-exynos-arm64.c:773:31: sparse:
    symbol 'fsd_pin_ctrl' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 0d1b662c374c ("pinctrl: samsung: add FSD SoC specific data")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index d291819c2f77..cb965cf93705 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -770,7 +770,7 @@ static const struct samsung_pin_bank_data fsd_pin_banks2[] __initconst = {
 	EXYNOS850_PIN_BANK_EINTN(3, 0x00, "gpq0"),
 };
 
-const struct samsung_pin_ctrl fsd_pin_ctrl[] __initconst = {
+static const struct samsung_pin_ctrl fsd_pin_ctrl[] __initconst = {
 	{
 		/* pin-controller instance 0 FSYS0 data */
 		.pin_banks	= fsd_pin_banks0,
-- 
2.32.0

