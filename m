Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CFF24E4A4;
	Fri, 25 Apr 2025 13:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587674; cv=none; b=u/DWgW9TwpCkzAkvcRI1xsIL6Mo8tWRqtLCh8iujQdPooQsIAIXzjzmW/nnRW3kalVGAOiESRw7i16WSKRG8OsxJE+LxmCsjf2GeXgP9f+4ZLVaqBG/yTfD4ua0uBIm1E62DB1d0X+grpN3dl9Rg8nvceSiq3I3Xq0MrLdT6BL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587674; c=relaxed/simple;
	bh=ZkfzYmz3JkFYajGr75Njj+Gw1BtC6v129KifENwZdIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qhoJB4DLLeTreMJPuOE9e278+CLz/CsE9Zgoki9+0AmNAHrJRQjg0l8FCVdXwOEizuc5KvyOCCQtr8B+rDl6rzw8gd6F64FP7AKLMVJaD/F6Rj7fgZ4xmWSLTWIRsflTUSARug+Y620ClYlSEqkGH1AeaC9Oy10goNSVNPM82XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxX4zEi5; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxX4zEi5"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22c33677183so23393585ad.2;
        Fri, 25 Apr 2025 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587672; x=1746192472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AC/bTYB+vaGGLBaxi2S8Pkok8Y8UeFyQeznhV9/zsFo=;
        b=VxX4zEi5hMqhs3ENTMKzyhV/bX7YZtlLtqNokl98g63Fsfan5SYxndbnPYxyVCworz
         sDZF6aC4wC5yXzdOvsW4eEV+B4zFPjdfGTQNgVoLKbBrT11JzShobpbjlYl/R8duM12C
         Snqv03bPBGkYJC2K/0DRCC5ltX0LHvwN7FXufWy40OEoJe8hFhG1/gg9HEj6l21lAHGw
         7ymM8MhPtOZivtRTw3KBrSaV5lOD/eB5NIB9zqSTtgIR326scb/eGe4A3uDsWEG2uCX9
         rks4KkVPGZe7VvrZNrqN9vmR7cepuiZi+wideAwMe0av3H/tY/DF22C08bSjKueUKLwd
         MyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587672; x=1746192472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AC/bTYB+vaGGLBaxi2S8Pkok8Y8UeFyQeznhV9/zsFo=;
        b=hBv3g/e2v9d4bVBwDIHh8thIvWujPnLUEGfZxly1p/QL0phy8kUUygVb7lvZDTwcVq
         ipiGkbTyMYzWw2jruAwkAcyAiuWNWOVL70kMRLpACvlgRgEIZ2ae1KTh9wCZR8gDS/pf
         7xv+TqnQlRHUMOmWSi9A4oYqWR/1DWmz9NuHl/7yaYPeWTqf08qnGtXbmuQupbwgB4vZ
         34wiSRX4C5qKNgTf4rwMYso6dpjvTfhl1OiKPK/b3mjQ/6+Ilqir0Hn+jo4DUzy03Zk0
         uEr9O1VhRaLBzLNDdiucicuwm8sZRfoe5Z2dKalZoaDTX/tGd5l9ojuJ3lQJNWhbvgRw
         nSKw==
X-Forwarded-Encrypted: i=1; AJvYcCVOJzNpHNhU0eED69FoK8b3YqEtHDd8YpZXhM1W9o8MyrMJLRjCpvqLB5nORxP9TlyXDycTrAY562XO@vger.kernel.org, AJvYcCVXr5+7Gd106iqzETzCljsgRNvu+bVsBejW9FwVkAPXeo0M2FvA1XwqQVHsAXj5gJWmJ926JQdtKCpQrmjhDAAE67w=@vger.kernel.org, AJvYcCVoHD6lAhT99gwDAbT745etSOTa8MD0pSbJ3bXTtvfdgcNm124FcR0lCb78noP4fQfjqhJHZ9Q1RNxR@vger.kernel.org, AJvYcCX0yvsCMeFf6dCZVpYU8oTZkYiNtumAoV+MxCPNqpXdWWpK2wkyqCU4uvxYRLyPeFR28ZkNp1r3aYtAr5ry@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ScRtyuw7YAu7OAHE1NL+umFd5vT1JkVJqKCdqUqF+RosTVTZ
	7sxJU5SUcLWa5lCKvLgf5yhvE5+aVho/KSsHJfaCjOFKY2dL03Xg
X-Gm-Gg: ASbGncs9RdNp+TICoG4XUh4mjw+v5ew8f3NMSCEXrq1kTbd6BMeTjXlbUrju9p8mMOf
	Xh+ftnvcXFBOXo8WhTe2ZkVcIFAE/oQNgv7hNwuTuBnX9qxuCGwJcmJdPkEnA6+HyQdfNvQUeEu
	JoR8etWIi5kPUaOHBx/EPH3QG0PKTO7bnEB8t70w+ehGE0uQLDniDRdgRK13MaSAJDIWtHjU3QE
	VQUyHwJKqR7R3LXhd2HCwFEMgZEceuy3iKMYYQBU/ZDeHfTJ2ocf1jC5kmiDqdrvC6+X146rIKA
	u+u+LnRwzYB1aMCsk0JtiggrJNevMydI8vZ9co5n8JGKp+xKmIkz4Q==
X-Google-Smtp-Source: AGHT+IHWMSy+gCNd9b3APCkHLWMGa1W1be504gb3RjvrlpnKuAoazKcK7AEzjGj95QEQ1p5LsXvDnQ==
X-Received: by 2002:a17:902:ceca:b0:223:67ac:8929 with SMTP id d9443c01a7336-22dbf15ccf9mr39564125ad.0.1745587671876;
        Fri, 25 Apr 2025 06:27:51 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:27:51 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org (open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 01/10] dt-bindings: clock: Add RTC clock binding for Maxim MAX77686
Date: Fri, 25 Apr 2025 18:56:21 +0530
Message-ID: <20250425132727.5160-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425132727.5160-1-linux.amoon@gmail.com>
References: <20250425132727.5160-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree schema for the RTC clock in the Maxim MAX77686
family of PMICs. This binding defines the 32k clock generator
block, which includes three 32.768kHz crystal clock outputs
controllable via I2C.

The detailed binding information can be found in the MFD DT binding
documentation at bindings/mfd/maxim,max77686.yaml.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../bindings/clock/maxim,max77686.yaml        | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/maxim,max77686.yaml

diff --git a/Documentation/devicetree/bindings/clock/maxim,max77686.yaml b/Documentation/devicetree/bindings/clock/maxim,max77686.yaml
new file mode 100644
index 000000000000..72f11309f033
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/maxim,max77686.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/maxim,max77686.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX77686 family clock generator block
+
+maintainers:
+  - Anand Moon <linux.amoon@gmail.com>
+
+description: |
+  Binding for Maxim MAX77686 32k clock generator block
+
+  This is a part of device tree bindings of MAX77686 multi-function
+  device. More information can be found in MFD DT binding
+  doc as follows:
+    bindings/mfd/maxim,max77686.yaml for MAX77686
+
+  The MAX77686 contains three 32.768khz crystal clock outputs that can
+  be controlled (gated/ungated) over I2C. Clocks are defined as
+  preprocessor macros in dt-bindings/clock/maxim,max77686.h.
+
+properties:
+  compatible:
+    enum:
+      - max77686-rtc
+
+  "#clock-cells":
+    const: 1
+
+  clock-output-names:
+    maxItems: 3
+    description: Names for AP, CP and BT clocks.
+
+required:
+  - compatible
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    max77686_osc: clocks {
+        compatible = "max77686-rtc";
+        #clock-cells = <1>;
+        clock-output-names = "32khz_ap", "32khz_cp", "32khz_pmic";
+    };
-- 
2.49.0

