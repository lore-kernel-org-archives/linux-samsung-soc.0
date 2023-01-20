Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2620C27C7C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 17:31:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbjATRbl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 12:31:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbjATRbb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 12:31:31 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73B4A2968
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 09:31:21 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so1273775wmq.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 09:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JC33nkvOY9jllaeQeA877nEGh7EFhyBhoHxhC9ikSio=;
        b=ePFzI6jF5QJfJDiWdbL4WzhmMgUAt+JzcDfbRdufvGnU/DvyJmt7dMOrh5jA/ZkWoX
         VP3zy8a3qde3XULU1uFg+1j8ClQUg3vjJbJo1xg5ZPUPDZ5ZRaNcHpnf4qk0QjO2JIQA
         acgVvEPOc5F55b9w0P/U6i5kGEvn+tMJpQ1d2hibDs3kbSA7voRyZDNurnrxjJmxT7RV
         3gCS73wGfB15htucGR9S7LfN3ujDqGGPKf2am/nAlMA73j3ttTVhgfTh+lMLpW4+hSJB
         fkjKF1R9Na1RQyoKeZtpowx4GSL1/YocBcAjYK6VpfjfnK+TuHM+S8CyKlf7cP9GmgFg
         F1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JC33nkvOY9jllaeQeA877nEGh7EFhyBhoHxhC9ikSio=;
        b=KkSo5ypxjX67rUVXyUTadfW/ZXHs1XXqFIPDkKtDkUK5L+UxedgXmqPPlCZ9zveHA9
         bkoN8ARLtT3TtnSiGOcLRmB2ACR1NKtKqRTXmAfgCnjW1LZWgWFiuKS9QfrHt3eGS+F9
         sEwOFVkxzZRiJgDMXeXHnVNp5476UZLwfGTYFiZMhCJcssum43UoSiT4GzmTg1SYC6+B
         LmZ12A3rkB1m6zIiz4sUPsEATGsvYGrdjCj9cv1ItJzgaNTgo8NVZtYez1yFf7Szy25d
         5oUPahYfUSTx445JVeSTyVINSTwvwupBWshn9hPjvkAeEkPJwOTr49UzGuckvwj49KdF
         nnQw==
X-Gm-Message-State: AFqh2kqKZDzbyaKS1NNsTtxJSrQrhpNnVB6T1i65PCPXhiTq1mCsUuuA
        ybYJDKjKAxwvyncGlF75jpNVJw==
X-Google-Smtp-Source: AMrXdXui6w/iZmq/RJsnFzJp4F10SPSRvGEMGIQD0vSmX0FFM6XWOuOB2bpLwJVxRaXvIks+RBfaoA==
X-Received: by 2002:a05:600c:d3:b0:3da:23a4:627e with SMTP id u19-20020a05600c00d300b003da23a4627emr14507270wmm.6.1674235880481;
        Fri, 20 Jan 2023 09:31:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d22-20020a1c7316000000b003db0dbbea53sm2819179wmb.30.2023.01.20.09.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:31:19 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/6] arm64: dts: exynos: disable non-working GPU on Exynos7 Espresso
Date:   Fri, 20 Jan 2023 18:31:11 +0100
Message-Id: <20230120173116.341270-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Panfrost GPU drivers require clock but such was not provided in
Exynos7 DTSI.  The CMU_G3D clock controller was not upstreamed, thus
consider GPU as non-working and simply disable it to silence warnings
like:

  exynos7-espresso.dtb: gpu@14ac0000: 'clocks' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This patchset fixes remaining Exynos/Tesla ARMv8 dtbs_check warnings. No
more excuses for not running dtbs_check on new patches.
---
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index b846c0be90e3..829657c9c7ca 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -61,7 +61,6 @@ &fin_pll {
 
 &gpu {
 	mali-supply = <&buck6_reg>;
-	status = "okay";
 };
 
 &serial_2 {
-- 
2.34.1

