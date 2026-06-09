Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4164D2EC5
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jun 2026 17:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026774; cv=none; b=b7i/gUd2D2vFDBeGe1llegSkrxjNUzDOWalX/57TKZZv4MGi654sBfNCFIiZDYkITaQMNx5zMq5So09w9FgC5BcmQRZaaN+ujm5RvNWasZ+E004e6jSyK3faVolpUKnnnNgOzP8BuzgNduNesOGlpQp92RDifACMomtWAXkjXzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026774; c=relaxed/simple;
	bh=RpRMvW5iYap9UdQ+48wHOpbTlFeKShOI8IiDuea9S2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WspTgEV+RuzcT3QgPIiMHRp5p2hpCldw14ugALs52KZuGBqeFV/9Qc7iCD+ibGZy0ELkOnmdCm7nW7OHOCjsd73prjo2Mma6Jvtrrgu9LA1tg22oWoJ4xiFWx8Rac7xFxZ8VR61IbRtqwWDJm+0tKNzJZFMbJL2w/vnSyP/6sCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sMZwXyU6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sMZwXyU6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso67645895e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jun 2026 10:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026772; x=1781631572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=sMZwXyU6cB45yigqPfA1/O7Jt1M3cHgeh6SDT2jO+ogWZ7Z1Vlbm0d38O700hO010E
         Y+I6DQOiwZfphQIR3LlRF2l7eh0fTsf7aw62aDLC+UgIQzzLc/DBqoR7ew4gA2+r2OUn
         4RvtYEEr+04Plt4abqGlfcCTSHnB7AAbMJiKWznuSjybUbrMAypIhAJw3VmF/BCBh08e
         9iFzoxnmqN3DgYXBuzTNlmDzG3yEQMF0LEBrnFHbTjnxhOdFKNoR1ci7ypGd6dX7/tk3
         0fS2Nk9+LTxgacNnnW7L9s2MTTjklLNe3Kxp5GRayYq6eLfOE/4eth3a/WJxBpUuXmsN
         F8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026772; x=1781631572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=PlSPmdMBg1rmTouw8gmeWejImR5EnrEyVD5XbZyEcMIT0j2UDQHdn+1W91upyU7iWX
         8KHzSwRw1PTFj5RDto7YFPIpWs9wx3+JTwG3Q8LRTkT5No9yEmP1uFOWBMooPUZ9MHAg
         BHC4GpEzkShI9WltEy+j6kUfFk0mk7WKCk0qTMlBY5Kv+A2ueziYYJapT7Sj0T1BC1qb
         IRnyxl5/3EHzQRf4LicvEGAvyjOJRQHvNv/orVdTZpaE4FVAUIwD8Wj1O0smCS2Sk2GB
         hPhrlK9CJnRa5dY+1PRUyMKqNyoHnx3BCy5fD9S6bPBOYTY61wf/wp/ibDRvoAS55gr5
         HSMg==
X-Gm-Message-State: AOJu0YzUy4p382jtZ6Cx2+kTtXSdRBJpovaYsLcupjyhwQop90vgUrh7
	jB9IiPXJYJj5XTMCjw/OXQrGdiAB9UU128qmYLC+NdErzSlHejhNNkgR1KpU3zWXs/nAciobbbg
	4Q0BfyKY=
X-Gm-Gg: Acq92OHhYR7tfJz3IFTzS7rbUiiiYyKZIdRZsJg8q3kH8irbNpe+F7FRhygw6pD5g0Q
	ZK/WUSRNgnCTfpOk/9hd0ZyHW9Zf0AS1RiMrDRb7iI34URO5armWEHQ116dcUZ29Rr7nznnqk3P
	kgxl63TKmznMnOajs2APs4Bjr/TOxZr8+mzrz2DROVy0XBiZ0EWRiPiCUcygO7gJKx04IFodJnR
	BdUkwCuqofJmgQXPU9coXGcSrbOaRrl1Moxnhc9VNlQWvE3zEq5mTETf0E+0TrYVBrR2YT2VbLm
	Ilvb9nYkNO4Rp7Ct0VBvaE6EK5C8MOTqrJjgnkmsGey8bPYoyfeQmumQreeHXJlsJiBMD4PWiDN
	age4oxxBcontEO/kKqEmXOcj7d7gLKJ4F2DKlbcpJlUs3TqgpwywQf849lgfvLUiraS02s8DVg1
	rm2yFw7GgdmpCnRHof7a0VigJKL2b0Lc09kBaQQSIgzgZMT934MMLARae1+W3b5DR/G+nBjaNvN
	QR8LXvtR0+XGeJcSgm1Yq4ImG8=
X-Received: by 2002:a05:600c:1396:b0:490:d946:47cf with SMTP id 5b1f17b1804b1-490d94647e9mr41460835e9.4.1781026771736;
        Tue, 09 Jun 2026 10:39:31 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm593605215e9.9.2026.06.09.10.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:39:31 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 09 Jun 2026 18:39:23 +0100
Subject: [PATCH v5 1/6] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-exynos850-cpuhotplug-v5-1-8422cf80d43b@linaro.org>
References: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
In-Reply-To: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

The PMU interrupt generation block introduced for the Google GS101 is
actually a standard Samsung Exynos IP block found in older SoCs, such
as the Exynos850, and is not exclusive to Google SoCs. To accurately
reflect its origin, move the schema file to under soc/samsung/
directory and rename it.
Concurrently, add the new "samsung,exynos850-pmu-intr-gen" compatible
string to the bindings. Support for this block is required to enable
power management features like CPU hotplug and idle states on Exynos850
platforms.
Also, move this file under Exynos850 SoC in MAINTAINERS entry.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../samsung,exynos850-pmu-intr-gen.yaml}                          | 8 +++++---
 MAINTAINERS                                                       | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
similarity index 70%
rename from Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
index 2be022ca6a7d..df23467d0e0e 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen.yaml#
+$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Google Power Management Unit (PMU) Interrupt Generation
+title: Samsung Power Management Unit (PMU) Interrupt Generation
 
 description: |
   PMU interrupt generator for handshaking between PMU through interrupts.
@@ -15,7 +15,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: google,gs101-pmu-intr-gen
+      - enum:
+          - google,gs101-pmu-intr-gen
+          - samsung,exynos850-pmu-intr-gen
       - const: syscon
 
   reg:
diff --git a/MAINTAINERS b/MAINTAINERS
index 86ca9297edab..498ca30a00c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10952,7 +10952,6 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
@@ -23652,6 +23651,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+F:	Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h

-- 
2.51.0

