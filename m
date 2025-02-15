Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E85A1922DE;
	Sat, 15 Feb 2025 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739622259; cv=none; b=MX/4rufYajRbyAP3ypdIaxE9uROfzP846LnwUpujkFCajVAOt2PpmzVs1G4iQxoufhZIMF3piOvrPZmoQnGO+wJ5C2D0Vn6o5ZoZCcvGjVc0fXKTxBPP5a9BArmfc403eV/VhBb0k/krLtgxH6BCrT4FTKFbCR357g5QbSdz+OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739622259; c=relaxed/simple;
	bh=Pu4XB+Zy1T7B/2I57DxES1vrzAppfrCwi5m5W/WPHF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJMq5VYnprjsoh2jWP79Us5stGXruMC08hRif9IxpD3tMR2H3oLbnSkn9TMroYk724O0bQoWfK0S4wuJhemQunusS62H4jiAxA+c3kBM+jcbyMuTuhhWjR35U8jwp9ikjFWMql4pi9zxUKs1BJLE6hPwt49WQJZ+9tjzwMy27/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjC2U7It; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjC2U7It"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38ddfee3ba9so2292737f8f.2;
        Sat, 15 Feb 2025 04:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739622254; x=1740227054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UXbVdtIig5t0ncHRRGP/9I2f8qBOLx1rThseRvnVdE=;
        b=bjC2U7ItkawCO8QCxkFi9BgDlFnZ60cumm9klstA/mREe/xikSFEWmV18vW6N57o+A
         lCbgLzeEqITo6yESudPK3pn7z0cOBZ7UyyJYonKdU/tq1yD4bcNzYalv4aMBHx9UzAQ0
         yQry5fhl6H07ovaBVgLxOcEf58Wa9ZTMQxg7JR9t5Qq5N66KNYa/aHuGiPPpabI7i2G8
         TWO9C8JTY1/UJlN0dMQxi75+WdaUe+Pp/t558mqr/HjY+W3lBWz+Rljm51MC78ubOcv2
         ncUbq9fobjvSNKN7X9qWcCPUfgM3fh7fMTVDNx9Ak9JW1M1Px8wPJ8eVsLvcRhQLSpsy
         WWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739622254; x=1740227054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UXbVdtIig5t0ncHRRGP/9I2f8qBOLx1rThseRvnVdE=;
        b=KjxQVdsqtgdWt4s718bC4RQEw5z5FHp41BAwGt9UIhCLoG14iU4OZzskVLWdtLBDlV
         DrkUp2nZogBlbiKQZwUhERy7eeutGdRLDrHZ1KWd1J+cUlLnBZNbK45ahifjA7FyUPx/
         +WnSf7zm7NTN/ZIrWEjqnI8jYCwQxOg7neJncmTFsbPIA6mxZQu5qhQO9Wdc9Bkh4y+Z
         pC7CdzwpfzHzfKNzjGuSuCo79vY05e5SigKkcJV+GqeE+uxbsUgzZkrdvFXYNCWMrh+w
         T3d9UyJZ3bJ0rad7uPhdmnK8uW45/6phTCvYQBbjQYe0uRtpf9ONzm/B4hfafHfzOroK
         1Nxw==
X-Forwarded-Encrypted: i=1; AJvYcCUv3pSRsJijqTQVPoKo9ekxsguT+4YXwnDVUCdpbItDey3meW7hI+Edc/EgbeEEJBzq5oaUHNODV3uU2fdG@vger.kernel.org, AJvYcCWZRNuw4byW2z7hgSMWXD3W23PYNqySuKIL5qBMiVGB9sX/+EkUSv8hm0LJsscSW1R9Fwl6ipmBlVJA@vger.kernel.org, AJvYcCXFOBV9LqxRMp2/tEno3FuwzrzM9BrapH6nRyAPaIePiHmjtn8syif73+PWphh8dnP87s+kIbtspLuX2ZbKEq2PW4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLIXS+U7A9jOJzoQP1SHEPcFl9R8pLzTR+mz9fnOFB9RPVVotq
	SIp32M1rQODWRDbsaN6IEXbArlTpvGF5FhUBXZ3Y4hY6K3fgoi0V
X-Gm-Gg: ASbGnct7sGtfJ9VM41pNu1Lxlgf/4s9dtZnCNLHAePiull/+AKAJHdASHPd6DYKe66M
	+NvbIEWIXV+Vlqv5Xt24y4zbH00ZA9T+i8PlPN4mAjC0aJMKpbmcgD4Up+DN08g8e17IjlROXBh
	3uU3tUztBlK7JiMWbzvnF71DeaOCUlfGQUswde9Vo39kbbN28IKvr5TeTeK/CGrzfdCkBpPVBFV
	wEHsLsfcCVDiUKeQhUBrWwiXUNg6t8DajZGAhz/FnFU/4repwfj7fNaYSMzK8Xw7Cn6czMVdcNm
	B6+d4q32s5+b3zA5ufvDXXMfuuS1b7UTSefCj0zporLDKe56WnuNCeaYiroMt9baOi4=
X-Google-Smtp-Source: AGHT+IGmTv4OOgkCpR0N7S5UGI0ztXikYO3xupHaUrxXT7i2t0dhkLAloMagyk4Nzeo+E/beXj4i7g==
X-Received: by 2002:a5d:64ee:0:b0:38d:d223:f8e6 with SMTP id ffacd0b85a97d-38f33e7df9amr3703804f8f.0.1739622254191;
        Sat, 15 Feb 2025 04:24:14 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5b40sm7188175f8f.68.2025.02.15.04.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:24:13 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] dt-bindings: phy: add samsung,exynos2200-snps-eusb2-phy schema file
Date: Sat, 15 Feb 2025 14:24:06 +0200
Message-ID: <20250215122409.162810-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Exynos2200 SoC uses Synopsis eUSB2 PHY. Add a dt-binding schema
for the new driver.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../samsung,exynos2200-snps-eusb2-phy.yaml    | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml
new file mode 100644
index 000000000..d69a10f00
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,exynos2200-snps-eusb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SNPS eUSB2 phy controller
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+
+description:
+  eUSB2 controller supports LS/FS/HS usb connectivity on Exynos chipsets.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos2200-snps-eusb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: Reference clock
+      - description: APB clock
+      - description: Control PCLK
+
+  clock-names:
+    items:
+      - const: ref
+      - const: apb
+      - const: ctrl
+
+  phys:
+    maxItems: 1
+    description:
+      Phandle to USBCON phy
+
+  vdd-supply:
+    description:
+      Phandle to 0.88V regulator supply
+
+  vdda12-supply:
+    description:
+      Phandle to 1.2V regulator supply
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - vdd-supply
+  - vdda12-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/samsung,exynos2200.h>
+
+    usb_hsphy: phy@10ab0000 {
+        compatible = "samsung,exynos2200-snps-eusb2-phy";
+        reg = <0 0x10ab0000 0 0x10000>;
+        clocks = <&cmu_hsi0 CLK_MOUT_HSI0_USB32DRD>,
+                 <&cmu_hsi0 CLK_MOUT_HSI0_NOC>,
+                 <&cmu_hsi0 CLK_DOUT_DIV_CLK_HSI0_EUSB>;
+        clock-names = "ref", "apb", "ctrl";
+        #phy-cells = <0>;
+        phys = <&usbcon_phy>;
+    };
-- 
2.43.0

