Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DD21B85FA;
	Thu,  2 Jan 2025 20:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735850454; cv=none; b=nTQqBra4pJVYYOVuNNOG9mC5dkiWy0c5L1/qywoVwRXG/+SvSB+NP6qzS8SzkPR8IklQ8dwFs96JVqFLwtFXlIJaLiCQsYX15lpvqRIqbbNStpa2qFPR4bfLYOAPA5RKwpYLmLqai4CDvm7Nw55NyKjEXvMPDS1X+jyyAB3AxyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735850454; c=relaxed/simple;
	bh=Y2zSlKcxBcgELmFbycp8JHsKqzYyxi8BzDcZB8360uY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d16oB1XknqKrC8jCPP5HkM17zo0RUgw4HZe1BF3QwnNRKsP2cUHxOPQ3kemEV48H4xBFpa+GAPEWRdKt+Fpa26YRMfmRL2+8rifRV/rV8L5BpgrYloo4ws/zwO+f6s2VZnz/WoAd+SmjU3DhGbfZb3NIc9RLJXAdhFx7Q7loMiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIfR4Fra; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIfR4Fra"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so16364493a12.2;
        Thu, 02 Jan 2025 12:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735850451; x=1736455251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmY76TFyzj2il9epOaYcMs/IMVJsV0h7xrRhDa5+gs4=;
        b=dIfR4FraE3nURKLtDGs249+Yhxd3lBRCTDg0O1VjNWwB9eNIkUzctH3d+le0TmzkW/
         DS14OaBZF917W7iO1IdnHeZj7IgeDGmmd3L6cqabHio0af71+b1BNQkOi9SFd+RX59dO
         EtvsHLnIN7l2YsmXPAzVSq+ahYhLYHs+W2tGISwpc8BWuSwc03Jhcc2LSWGSkFMksBvB
         vn5S6dU2pgYYxXfAYUMQotcBgnTk8wgxujqsW5LMd51TwR7PQCwnnsJAtedx/y32rI1L
         EVd7o98XTgxVkUX7zGZ8YfgrYqQgBUBNmMkbgzJIc8bq9w6Zjl6SJ53H4fWkyqrqcn9u
         MMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735850451; x=1736455251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rmY76TFyzj2il9epOaYcMs/IMVJsV0h7xrRhDa5+gs4=;
        b=HqOxz3vlO2GqMws6qZVcIt1udfc23Cl7iYCnpwK30eEKhW/TU4r1bW9rsGNpwmGh0q
         8LeC1JElrxmSysmo5yt+dgcpHQePcWFNkcCYYHJ5eJdrJhIm7pKeSlgD9N0Jy5lyhpsK
         2U+rTiMTrU3gwYtLk9vWBMsAqOxs7gAQqWg+3f3LP4806uwdJdaETxFut0wEeWcNEZy7
         EKWM6viwztrgv7izFyp+IWW9wTLwqIY811ZBDYRa8StN58ATFHi3zBzIXQwtmVMv03Tm
         vuBR7pE7496oU7ceag+LQLkY3Cnw5CSR7dAu9UVCfZqsaIuBZ02WI3umuP7fWudyZynL
         rEhg==
X-Forwarded-Encrypted: i=1; AJvYcCX88gPRd3aS8i1NsgGFAGBumhbxsAONO4yVhicz6yKWiGuoZX4PIbe1hCt4OvPqM324CQuzdzAdtob6Y9dBfF2c9nI=@vger.kernel.org, AJvYcCXt7/y9h063MrLpt8fb5joi2SETxD5OGGHyzhAaYFFaO4FR857laOw1uPf9zcusavzAmUjlnP0XPS1nrLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/jxV8X5OdNOAP5fNkMi55e8xRDUQz7UGkPMV2r/Weedx6IW/d
	dzW0nuWK+Lug2h4KTTsRQORUPy5TCyAVwUJbdXY75W/gle43Hkdx
X-Gm-Gg: ASbGncsKo1zsGnVdvDVdRUzLoR1iPs+kRDeDSbhp5wQHD5rYabkg0MtgOIAjDnljRVw
	qcMMco6/R24BBrqMpOKJrg/x/MdH+6jVRkOnjJuhQCBGKKAj9QzBeyRaNq0JnGZ2jk/Fd7IaqiX
	m7eFJIgpKNprBWcquweZwbzMMor9ZXhj+dI0uWJqUvbToAF3JV12dhvkFK236bdJemch7GlIeRT
	bi1GACdgnnYKxt7yUnuqOOpIMMP0pV3TVXmV4BpkHApAC/Vxr1tpOM2U16g0UBnTEo2umpz4H4W
	OuurMC873AI=
X-Google-Smtp-Source: AGHT+IE5T9x2LokF/7UC1tURsDfuW1k26Innzw0G2AdhWMic7tozgkLbmExTBk9HOsPRH2vw7/EYyA==
X-Received: by 2002:a05:6402:27d2:b0:5d0:c697:1f02 with SMTP id 4fb4d7f45d1cf-5d81ddc0609mr101355271a12.17.1735850450777;
        Thu, 02 Jan 2025 12:40:50 -0800 (PST)
Received: from ivaylo-T580.. (85-118-76-61.mtel.net. [85.118.76.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe490asm1814251866b.98.2025.01.02.12.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 12:40:50 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
Date: Thu,  2 Jan 2025 22:40:14 +0200
Message-ID: <20250102204015.222653-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add constants for choosing USIv1 configuration mode in device tree.
Those are further used in the USI driver to figure out which value to
write into SW_CONF register. Modify the current USI IP-core
bindings to include information about USIv1 and a compatible for
exynos8895.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/soc/samsung/exynos-usi.yaml      | 22 ++++++++++++++-----
 include/dt-bindings/soc/samsung,exynos-usi.h  |  8 +++++++
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index f80fcbc31..50db63a8a 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -11,11 +11,21 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description: |
-  USI IP-core provides selectable serial protocol (UART, SPI or High-Speed I2C).
-  USI shares almost all internal circuits within each protocol, so only one
-  protocol can be chosen at a time. USI is modeled as a node with zero or more
-  child nodes, each representing a serial sub-node device. The mode setting
-  selects which particular function will be used.
+  The USI IP-core provides configurable support for serial protocols, enabling
+  different serial communication modes depending on the version.
+
+  In USIv1, configurations are available to enable either one or two protocols
+  simultaneously in select combinations - High-Speed I2C0, High-Speed
+  I2C1, SPI, UART, High-Speed I2C0 and I2C1 or both High-Speed
+  I2C1 and UART.
+
+  In USIv2, only one protocol can be active at a time, either UART, SPI, or
+  High-Speed I2C.
+
+  The USI core shares internal circuits across protocols, meaning only the
+  selected configuration is active at any given time. USI is modeled as a node
+  with zero or more child nodes, each representing a serial sub-node device. The
+  mode setting selects which particular function will be used.
 
 properties:
   $nodename:
@@ -31,6 +41,7 @@ properties:
           - const: samsung,exynos850-usi
       - enum:
           - samsung,exynos850-usi
+          - samsung,exynos8895-usi
 
   reg:
     maxItems: 1
@@ -106,6 +117,7 @@ if:
       contains:
         enum:
           - samsung,exynos850-usi
+          - samsung,exynos8895-usi
 
 then:
   properties:
diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
index a01af169d..5fbeb426b 100644
--- a/include/dt-bindings/soc/samsung,exynos-usi.h
+++ b/include/dt-bindings/soc/samsung,exynos-usi.h
@@ -9,6 +9,14 @@
 #ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
 #define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
 
+#define USI_V1_NONE		0
+#define USI_V1_I2C0		1
+#define USI_V1_I2C1		2
+#define USI_V1_I2C0_1		3
+#define USI_V1_SPI		4
+#define USI_V1_UART		5
+#define USI_V1_UART_I2C1	6
+
 #define USI_V2_NONE		0
 #define USI_V2_UART		1
 #define USI_V2_SPI		2
-- 
2.43.0

