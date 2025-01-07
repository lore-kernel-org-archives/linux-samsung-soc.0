Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686301DF995
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jan 2025 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736255426; cv=none; b=LFUrYLnX63irkb9TLERp2SA13u3WeQGIs78MZrCm4KiVQPr5JZbLyiLua6F+VlTs7bK6bZNQAKgZ89LpzqxYcRJ7bfEQCHfqlI5OmPxHJelZEa7haIm1FMJBrQeqFaFlch30H9qPDO+HeBsYm/IIJ5TNmbjzSKAyCsT/7MAPyqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736255426; c=relaxed/simple;
	bh=ZSVfHvcyonMMaAuHxLoTsm3svmwPbJluMG1JO7rk65k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CQ+G8CZIBEyU54+eWsXYPbCJDJT9R9ay/qSmlzxfkyLxPQZlzQWH2G3XiypmyhBjgqLWTv+buBch/xF7iwEK9qEINygq7Opf9ewaqw18++/LRGsl43KhwNT8HjHcFxs3/C6ckdj6gIoJkRirMuWyZh5/cOppNr6576SQv/OGZl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RInHeiDj; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RInHeiDj"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e44a1a2dso1791199f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jan 2025 05:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736255423; x=1736860223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T66eNQvkCk8ULvCPWitWaVVqgBtMU9sicY2LjyOUOVo=;
        b=RInHeiDjnH+WvBxRlr+gVSHftNWwS1mS7TpIcUqboHLJtkMjQODvRVjfdvKv0dnbtC
         vEHqXYkiS0EBBIdYItYbYForUasMfWd56E493K7Aor0lKhXb0va+kK0IG9SdXHwDhTQ7
         2d6955dcnbHnRv3sVNNxoEP85G8QNZNLF6ZdoyhIQuX41FYuTa/ESm9W2wh4qxhWK4Bh
         +bxjYkBRPHB3IC6RtyvmA6/NqGSq3CK/bvHbZQcaP4jAhXG4pXlSL8yFW7L9xicTyseP
         qqkFJtzcTJB1yMjSv6Hai37gGqGHcLE/MEKwsYtwp4pCYDP+9J9TgqCAHLF0ZOw5qFjn
         ucog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736255423; x=1736860223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T66eNQvkCk8ULvCPWitWaVVqgBtMU9sicY2LjyOUOVo=;
        b=uX6veFXeF35B79afKssd13SD416RsKle5nbF6nLltwcZAlj/obYaHVqjkPGoUVit13
         1JbVMiZfF4muwp27vYul7inyViKdjzgODDzj7OiuG4PS42LU8lVwVY6pY5cWgehikzuX
         by1TH2onvui6Hj5uT2tpzSRrJEYRqYgJO7YxnVj/EYGuK6HyjomIikTcoG2m/OJ2gseQ
         ImXf2Zjr7hEZEO8qa24dSFvbVzbOVQiB3t5YVRRJMAMD9lzoufbOZxMp+5jCMbJlUO9w
         /+/fzS0+k8VchpKg4bKtxO1HUDbt/lkzTG49aUlwM/osuo8Y4LggARUdlm2pjeKJr8sJ
         PU9w==
X-Forwarded-Encrypted: i=1; AJvYcCWspjDLAXEDO9EIa4q1h0KybQC/xF7y35DxZWzyPm92yPe66pDqwU/aM9ps4TPcDpFc3BFyD9APrLA3bBtljdg+3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjf1/xSn0M64X2Pn3ajEIZ8mSShX68ZVOTeMnmdxNv3PHQJJor
	fEPSdNnBMaKV/AT2tW6hoQAfao8JPYc+EHOZo72C9njY421rAX7cSGGYuw6cdRA=
X-Gm-Gg: ASbGncv3oBpng81ErwEkvF8A08WjiYoEcuzqkurSvS4TrfGpYa5Uu1FjgzZdxAVIQVy
	5e5VBvnnjp3mWX1gCtLbFizCFkCP21y9gpkrwe2ghj1iwYc2MUUhOoUAtUxb8lqnqoWUlDJ/omW
	1F8rt2F4I6eaIh3eGXmU84JB18tX8ZGe71wompDDuqC6dBHCwdBp9bSCpvnN/kSnptzI3bIEPra
	LDas8fqLKDtiTYDfuagZQ3NfwGeta6xe/jmHd9AUJmVuDlNG9aldyn+wJmgm3P/N0lz3S0=
X-Google-Smtp-Source: AGHT+IGJtRYkKYFK2PfPatv3vBYhYEZyX64bizP7nth8eSlErNUm+QXw16gIId4ACUxbkB0wlK9AkA==
X-Received: by 2002:a5d:6d0f:0:b0:385:ebbf:8736 with SMTP id ffacd0b85a97d-38a223f7484mr20095420f8f.9.1736255422748;
        Tue, 07 Jan 2025 05:10:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4bbsm593719505e9.32.2025.01.07.05.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:10:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: ufs: Correct indentation and style in DTS example
Date: Tue,  7 Jan 2025 14:10:19 +0100
Message-ID: <20250107131019.246517-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/ufs/renesas,ufs.yaml  | 16 +++++------
 .../bindings/ufs/samsung,exynos-ufs.yaml      | 28 +++++++++----------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/renesas,ufs.yaml b/Documentation/devicetree/bindings/ufs/renesas,ufs.yaml
index f04f9f61fa9f..1949a15e73d2 100644
--- a/Documentation/devicetree/bindings/ufs/renesas,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/renesas,ufs.yaml
@@ -50,12 +50,12 @@ examples:
     #include <dt-bindings/power/r8a779f0-sysc.h>
 
     ufs: ufs@e686000 {
-            compatible = "renesas,r8a779f0-ufs";
-            reg = <0xe6860000 0x100>;
-            interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 1514>, <&ufs30_clk>;
-            clock-names = "fck", "ref_clk";
-            freq-table-hz = <200000000 200000000>, <38400000 38400000>;
-            power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
-            resets = <&cpg 1514>;
+        compatible = "renesas,r8a779f0-ufs";
+        reg = <0xe6860000 0x100>;
+        interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 1514>, <&ufs30_clk>;
+        clock-names = "fck", "ref_clk";
+        freq-table-hz = <200000000 200000000>, <38400000 38400000>;
+        power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+        resets = <&cpg 1514>;
     };
diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
index 720879820f66..b4e744ebffd1 100644
--- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
@@ -112,19 +112,19 @@ examples:
     #include <dt-bindings/clock/exynos7-clk.h>
 
     ufs: ufs@15570000 {
-       compatible = "samsung,exynos7-ufs";
-       reg = <0x15570000 0x100>,
-             <0x15570100 0x100>,
-             <0x15571000 0x200>,
-             <0x15572000 0x300>;
-       reg-names = "hci", "vs_hci", "unipro", "ufsp";
-       interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
-       clocks = <&clock_fsys1 ACLK_UFS20_LINK>,
-                <&clock_fsys1 SCLK_UFSUNIPRO20_USER>;
-       clock-names = "core_clk", "sclk_unipro_main";
-       pinctrl-names = "default";
-       pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
-       phys = <&ufs_phy>;
-       phy-names = "ufs-phy";
+        compatible = "samsung,exynos7-ufs";
+        reg = <0x15570000 0x100>,
+              <0x15570100 0x100>,
+              <0x15571000 0x200>,
+              <0x15572000 0x300>;
+        reg-names = "hci", "vs_hci", "unipro", "ufsp";
+        interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock_fsys1 ACLK_UFS20_LINK>,
+                 <&clock_fsys1 SCLK_UFSUNIPRO20_USER>;
+        clock-names = "core_clk", "sclk_unipro_main";
+        pinctrl-names = "default";
+        pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
+        phys = <&ufs_phy>;
+        phy-names = "ufs-phy";
     };
 ...
-- 
2.43.0

