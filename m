Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C752C7618E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 Apr 2023 09:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbjDUJ5r (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 Apr 2023 05:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbjDUJ5m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 05:57:42 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7FCAF03
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Apr 2023 02:57:40 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-504eb1155d3so10623375a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Apr 2023 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682071059; x=1684663059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Js5v1t4KKnCssImdfdgDTmPMhwTRtlT+yhAUL5IKccM=;
        b=gcv0aLa2GGY9gGt5yZH+k1fb+BL8NDxwHwPBapEkU9AqJsWo56kLftbQt7YVSrIkOq
         wBK+IJTFCF6l2Bb60apK+xD8BCvTYfAPZkcRfW/S3rRYAW0EaYo73irxPnQkmtyDuXJD
         XNUKQULVdtoXQlNfvlC/JaDjnMTZmhG9Vi5plGmcqRSgB2R2xk3h2ITPCceSqObkCmaH
         RtQhoFOPDWphrmVGF87NykoyyOAKCjndvrLGA0obYmve8wjU3NTMKDt4AOI+JExCLAQa
         wBwrjVO+8NzZ6CBu6+yLj25nZ5iDCslBD4qeM7Gvwy9jqr/yGauBPc4XhJNFstlgLNqs
         XG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682071059; x=1684663059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Js5v1t4KKnCssImdfdgDTmPMhwTRtlT+yhAUL5IKccM=;
        b=M3UYd8+X86fMo3eg2oOhPQ9NHIevpd9W2bS/ES9mIfWvoeJXcI0+3Jd0opr98JGTMd
         1ArAvGWp1JUGVhyQj0Gy2zQuTpGxM2fiJe2B3Ue0OMh5wwJmeIClUNYnIXl+B9NcToEr
         2EGpAv+jh4RXQMfpQT6Qha3/kH1GwcPTT6rrbiuv1zaxtECjOZeXwxoMfUaqBx4uGU0E
         C6STi2Z7v+rJsjbhUZIVoW7dDiQnHo905ceyiHXgN0WXhPtH/E4yVkAQ++f7mfu18DwS
         25/DNrK7W4Xzt0snDBvx71Rnna07SkIZ2GlVVMN++blDEIMO0qocQcdGE8fNrZPNf9oq
         rpMg==
X-Gm-Message-State: AAQBX9cFdgUy9VNQj/QVe8kZPvemy3vsxCLlphResvkjtHY7A/ukp+9i
        VdXrw/btZbyLgeY8CH9leVQcYA==
X-Google-Smtp-Source: AKy350ZixIK8ktBnRps+cQbP6PThFK5nahFtaZy5IB68hFKhBMjU0XhVYLDuYrLXtxvJteJt+QntTA==
X-Received: by 2002:a05:6402:1353:b0:504:9e79:e86f with SMTP id y19-20020a056402135300b005049e79e86fmr4041444edw.18.1682071059033;
        Fri, 21 Apr 2023 02:57:39 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:668b:1e57:3caa:4d06])
        by smtp.gmail.com with ESMTPSA id f7-20020a05640214c700b004fa380a14e7sm1686062edx.77.2023.04.21.02.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 02:57:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Jonathan Bakker <xc-racer2@live.ca>,
        Pawel Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] ARM: dts: s5pv210: re-order MFC clock names to match Exynos and bindings
Date:   Fri, 21 Apr 2023 11:57:20 +0200
Message-Id: <20230421095721.31857-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421095721.31857-1-krzysztof.kozlowski@linaro.org>
References: <20230421095721.31857-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Align the order of two MFC clocks with Exynos4 DTS and MFC bindings

Link: https://lore.kernel.org/r/20230328114729.61436-1-aakarsh.jain@samsung.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/s5pv210.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index fbe7f3d17f41..d9436bbf77c8 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -452,8 +452,8 @@ mfc: codec@f1700000 {
 			reg = <0xf1700000 0x10000>;
 			interrupt-parent = <&vic2>;
 			interrupts = <14>;
-			clocks = <&clocks DOUT_MFC>, <&clocks CLK_MFC>;
-			clock-names = "sclk_mfc", "mfc";
+			clocks = <&clocks CLK_MFC>, <&clocks DOUT_MFC>;
+			clock-names = "mfc", "sclk_mfc";
 		};
 
 		vic0: interrupt-controller@f2000000 {
-- 
2.34.1

