Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE41A5B92;
	Sat, 15 Feb 2025 12:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739622263; cv=none; b=IzxVGqts4HABY/mbG00V4JSLbR1nIBcdMRsD8g7FwLS+KS1rtgS5gDGF2qD9dFpla+cEuneRQC9ec9cnR3q/kE3CbXBmJpehWeC8jvvIz1WfMEpK45xsWwW2dyPyPErrGAg+fq17yfGWaW8xQlF3/vQqSvo8SsDMKuKTY+Ruohk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739622263; c=relaxed/simple;
	bh=9uszAYVJtwngcnEE0dgojClRftNwRdSh8kdBlRNtphE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kha3E+Jl+rL/ysR/2y327ez06cjAZ4ht/gl9SgItx1kOhLNjk0wVuEDdEll1s3qv5+19pQrlwk535gi8GA9L5Jjt6qqgIzHVueka0kHL2ajIAsaswXfpwLLtHth8tF8i4bhk9bR4vMN3aDTAvZEp1h1S7wRX02CgLhSWqJKNkeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJykW9GP; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJykW9GP"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f26a82d1dso1260253f8f.2;
        Sat, 15 Feb 2025 04:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739622255; x=1740227055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvM8beBW0+j4a9DqUfRhNLS0/sPUgWj2CrOTeza38CI=;
        b=UJykW9GPi9BOXQYFUSJdyXWS2WNjWBXneCDG3uJKm7K2rmlcJS6hCJVbqW+ce6sW2i
         tviKh5MiMfVvRz8+9i+t3bOPQu7kqMdhIpTUjImOEV1LoUG8ETCnJLSXK20yPPH/Z86g
         Kl8VATqDtqN+JirF13jDOZF8Qiages0Qdz2/myG5Zh9/UefDgJJaEkQCeQfHeCap2ZCr
         yl3fwUFSZq6N58jLZ3QzJVv4W8FMuiaH2SdZNf85irpbTK+83hReNZzfU9jg4TzrPbyt
         vffJW5jBio+g+FrHdLKIfZf5OOiRoynV2R1h9hJcpAX2Tu+0oJ7KHFftKrv7BO2ixGd9
         Jb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739622255; x=1740227055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvM8beBW0+j4a9DqUfRhNLS0/sPUgWj2CrOTeza38CI=;
        b=gw8ysKbENHwXmSnGWAWpmeNhWT7j0jVdowTj1C07ZX2wZWmNwcuBC0JVj0tig8+T+P
         PgUDlei+rXjmqxwZpdxai1fbDxpaWxY67JNsPfY0qWaqIbKzh5wmqMrmDCU8ggEzDLbd
         OpiGYP/Uk5CLTvwVPE+3Uw5EYNLm4MrkT0tSHgiwyZPaPk5g/ZCzzo2X05hLEDXx1ORm
         PEOBPCsqDk/5bar205Z8WEqjjU5NpFPDrVSg3HVnlNOtop3vC4gaS5+HITVAngCkLkqO
         ExugxpxONS8YotZyh7UMvELMU4iKKF2uRwY/xfxzccEGq46oVROARQNMGTEGRIsTTyU/
         AvzA==
X-Forwarded-Encrypted: i=1; AJvYcCUBO1y5jH7p2EeAfLnHA73x0w/jj9UUAASPngCsv3WUpDGzextYHlxjMLCud1ieV5gTjN9undfF0m3sI70x@vger.kernel.org, AJvYcCVanowBY8eb5flm4p6/ZPU4voQDCifMlVKkz08/qiSybk9bFqcIHoBl6fd8h2L3Zp1CtDw1IWKmfbSlH79ha3l+tdA=@vger.kernel.org, AJvYcCXQjkHfcVkjtDf6uKmA9ZfpG6OJWCM+xSaHntn8MG1W1tTOECjW+G1zzdxavYawYgJhvufUa69J3N1V@vger.kernel.org
X-Gm-Message-State: AOJu0YwoCQEFVY+eR/wUsjG3p+4M8w/XYgfg7R1GofXBEF5FPQXV41NI
	xsYjd+talpEjq/86llL8tcjiVEa4WWEIRTUDy9bl4kUsDznjc+tv
X-Gm-Gg: ASbGnct1VNDjCWDOtueY7J/Q0HMGZVsXszHMivMdlwJfJnKcY415spcYZdOVJI8cHBP
	xfXAfFLGFpKhlLVeyx+oi39vRkcQSdMA44fUfef4lsr1534Q1ySQjXeomnZj1CBGZWJV7Z4fiA7
	rzIQRt5joi9nsdv4zDwtY6G8GwXsaTvcQoR5QH20+6DVwiVb1fKgKkBzwlrYv4BCij1vAdNqQ52
	HRhebCuAPf85Sm5Oxu9quk89yjZV83f6UIGdjXZ7aJSpEwdgDL8JKnfwxSTdyqHc/qCzZ/HQO7I
	JDKtqBkZQv9d50FbxCtMYkWp1iIl0jCNQ+a/QwggEZx2AjUhh7IyhfCDnUNvzPxYCbo=
X-Google-Smtp-Source: AGHT+IHRj3ctJwmFgu0FqPPD2xs6RgkuS/hjPZ4U863BoKmIKTy4qe9wWajhFwMjyim4BV4BthvZRA==
X-Received: by 2002:a05:6000:18a9:b0:38c:5dcb:312e with SMTP id ffacd0b85a97d-38f33e7f9a9mr4019150f8f.0.1739622255398;
        Sat, 15 Feb 2025 04:24:15 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5b40sm7188175f8f.68.2025.02.15.04.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:24:15 -0800 (PST)
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
Subject: [PATCH v1 2/4] dt-bindings: phy: add samsung,exynos2200-usbcon-phy schema file
Date: Sat, 15 Feb 2025 14:24:07 +0200
Message-ID: <20250215122409.162810-3-ivo.ivanov.ivanov1@gmail.com>
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

The Exynos2200 SoC has a USB phy controller block that controls the
usage of USB phys. Add a dt-binding schema for the new driver.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../phy/samsung,exynos2200-usbcon-phy.yaml    | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
new file mode 100644
index 000000000..468dc1560
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Exynos2200 USB controller phy
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+
+description:
+  USB controller manages phy selecton for UTMI and PIPE3
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos2200-usbcon-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: apb
+
+  samsung,pmu-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle for PMU system controller interface, used to
+                 control PMU registers bits for USBCON PHY
+
+  vdd1p9-supply:
+    description:
+      Phandle to 1.9V regulator supply
+
+  vdd3-supply:
+    description:
+      Phandle to 3V regulator supply
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - samsung,pmu-syscon
+  - vdd1p9-supply
+  - vdd3-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/samsung,exynos2200.h>
+
+    usb_con_phy: phy@10aa0000 {
+        compatible = "samsung,exynos2200-snps-eusb2-phy";
+        reg = <0 0x10aa0000 0 0x10000>;
+        clocks = <&cmu_hsi0 CLK_MOUT_HSI0_NOC>;
+        clock-names = "apb";
+        #phy-cells = <0>;
+        samsung,pmu-syscon = <&pmu_system_controller>;
+    };
-- 
2.43.0

