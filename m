Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A104E95A8F
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  8 Oct 2023 03:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344309AbjJHDgh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 7 Oct 2023 23:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344300AbjJHDgg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 7 Oct 2023 23:36:36 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F11C5
        for <linux-samsung-soc@vger.kernel.org>; Sat,  7 Oct 2023 20:36:35 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6c7bbfb7a73so2320219a34.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 07 Oct 2023 20:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696736194; x=1697340994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O46Z79/thQ1J3qOk74OlVCEf6C6SSN1l//6jVCg8hMY=;
        b=zNmONDL/Rio2cmoS1E9S64+48isst4YaPeRvvYGG5wH4h1H5OMjyYny3I3HDVzlifD
         FxfhyKPcs35hfheaJDS0IJOhwlz3RXuElxYuAEWGafN7M76vog4AL3NByF8cdWM6eSM8
         rxeoR59SO4GH6jcIy0slkUpEX1YVAL/iCF4DIDkWK2Np+TryncKSFO649NrMbGZ7uf2q
         s3rqjavv6gkhu4kX5jxuuBlB5/2lVQ6sfDI9Y78b32qteIJfz0Q17UzBMOte2gMPr5pr
         lVZMJhDHdjkvfQhdIbQhqSRntfbK5TPR0fRlT9AxwdZ5GWPt4kNJPtls9Jc4X4O81vPZ
         YTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696736194; x=1697340994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O46Z79/thQ1J3qOk74OlVCEf6C6SSN1l//6jVCg8hMY=;
        b=U6ck/UW2kRn+YHz7JqyZPQw9Juhej1C/aP/QxuiVuR8vdP1ZUlPffH+kdYKJIKvtId
         RNvEDiv0BR+Nlztoz7MoGJGxA29Vlb1egQwqZT8E3OwrmTKTM29FTIiX/y6JB8yan4Bb
         jK0SE4QcSaEmjxhkvtNzmkh9Gsz9xxb/4ik4f8GRaHdRMPX5ewubydH17p0Y4AqGAiM0
         bho/M6QZlKeX0Z8tg8LBL+dkKSiVkKOEIqn95woIodKuIsLzo7IWpRFoNBR26wSZk+fF
         sNFN8DczKiNh4Aq5YbOCxycg6Sg0Ni5X7jDfwddLGSrP89oytlkrlWHj1uPhOCyvf5si
         GrHA==
X-Gm-Message-State: AOJu0YwQK5NFOdiW3FK0gpUMhmPpZ4Qohks9yeYunWkbVk7wmo/JGmIq
        uNczk7qgINRtk1IUAsnaq7UKI/epohI+Jb0Qe9DeBg==
X-Google-Smtp-Source: AGHT+IF2WJna5aTcHCff9FDb3AFiiR1caqvPjH4/+qNmboSMrw0kS/evk2m4kO5zetYpq0utIAPz9A==
X-Received: by 2002:a9d:7a42:0:b0:6b9:4216:c209 with SMTP id z2-20020a9d7a42000000b006b94216c209mr12258669otm.12.1696736194435;
        Sat, 07 Oct 2023 20:36:34 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id c11-20020a9d684b000000b006c460c58b00sm1104080oto.2.2023.10.07.20.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 20:36:34 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH] arm64: dts: exynos: Add reserved memory for pstore on E850-96
Date:   Sat,  7 Oct 2023 22:36:33 -0500
Message-Id: <20231008033633.21304-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Reserve a 2 MiB memory region to record kmsg dumps, console, ftrace and
userspace messages. The implemented memory split allows capturing and
reading corresponding ring buffers:
  * dmesg: 6 dumps, 128 KiB each
  * console: 128 KiB
  * ftrace: 128 KiB for each of 8 CPUs (1 MiB total)
  * userspace messages: 128 KiB

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
index 8d733361ef82..d54c8fa55c09 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
+++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
@@ -59,6 +59,21 @@ memory@80000000 {
 		      <0x8 0x80000000 0x80000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		ramoops@f0000000 {
+			compatible = "ramoops";
+			reg = <0x0 0xf0000000 0x200000>;
+			record-size = <0x20000>;
+			console-size = <0x20000>;
+			ftrace-size = <0x100000>;
+			pmsg-size = <0x20000>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
-- 
2.39.2

