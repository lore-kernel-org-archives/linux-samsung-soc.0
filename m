Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691752D59E8
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Sep 2026 04:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321950; cv=none; b=LqUg8lY6O5NUMJwsSLsQP8NHIusjLHt71M+hzgdb4ilLWZQtyJHk5C0LxkFaSzuZvhrPG0YRGbq6/kEAGkiHMqgbmzEOtwbuBQNJp1s5CVZqobvZUMpVP1QUlX/Eb3VKYrTmSwRdQdHuU8JzoCvorxW9qMV3SaOL3B6Y2+D5FBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321950; c=relaxed/simple;
	bh=KzPHLtt4kfKkTPXcS5nhIPUGns0eQ8i2OaZ+FybtnV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ac2QUWHrcxr+ykP/tp8GrXlHm+1eF5ETALSMM0b25NyvqZuEajGNedxjwZc42yg0xjJjyiVINHS1T/8gg7iStPPeHDrrlKQXMzgeqszY2V9h5XfPIFdft8C4T7dDJdVtSw+Q4Dijm4M/D6XjI3oKXOZndqhRN0lhnnPfOYAeq8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iMPqKvjx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iMPqKvjx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so5737765e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Sep 2026 21:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788321947; x=1788926747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QouME4t0AL3EJvqTOq4K6OtxPVBm5ADgp3Dr3ti6+Os=;
        b=iMPqKvjxy2X1nKSMEC9qPRrvAdUdyLvVmIDsGMAsFqKZPpIl0wo80Nc6HPa2hlgHnk
         Zr/OKvwqr0jxrc6VsKbKn7pcji6VtnhlDEG1oPN81ZOexGa3BIwTVJucbxta1BAehr8C
         0gKpeqsJj83iQqbIdEpCSGEiqg/7h86qfZ4gzAY0GddZXkFMeVkmARCDOST05NuXjHBl
         B3SatQ1/j09c0RW6xaorGmZqhNe//hylWejLx99wH+ElIXHs/6acDLTutodj0LBm7SVt
         bd6zzQEyz69zil3gKFSKxDkGdHf2pMRxm/K6XQJn3/F7BgLsGc9342rqlnnR/bLHVP/1
         S1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321947; x=1788926747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QouME4t0AL3EJvqTOq4K6OtxPVBm5ADgp3Dr3ti6+Os=;
        b=RtsEOBLsw2qqhXoBQt1sKwqWlVXQkeG0uP8yAjqVCuDQku6+8mRCi0OJ4jBnFFGTwc
         p1Rn13/FaVK5kCsILe3osg2xisAs+fkBbmezUpmRAE9SVX+U23UfS/IGNA0F+dFSEEoR
         V/v6aqpjX2xeSwdi0WtBOCOCr5S2K9RCHS38xO2mhGgmN/nnmg0HNJo2Ot7z8zMZY/Sg
         iUIjRzd+O7jpJ3Ji5HA0OuY2HnDt1kYmW39LvztwNjPpmdeIfXTo4ou9hUy2lsIzc5Ym
         Wcwt5nOPqnX8qxjWrErUOHPyu9j6ay1jR3xTy19Nf8Zt2RftlZEZ0gO2tZYPuhvowR8l
         AWwA==
X-Gm-Message-State: AFuF++mpvTMBhVHMhXgdMkXC5Jy5LVSiWZhQYKaW4mqlo3XrJqbjkCKC
	oErTNAkimFZLe56xk/Wv3ayS3aLXmaUVohgWOq7fex+3RWidjGEUIJ1KTZHgx0NO/jJpxV8TYE6
	BQsT8
X-Gm-Gg: AR+sD11QQk5lfU2kzhWFqIWajVzUQ2yKF53EKDqXgWzZS6FgqYdiba/Ti5lwaiz6GyW
	9ShFl4X5gfMpWiqAePe1lH7gKM4Nl5+P8qPsrb7X3UFymoQbXAgch4bPSaXW1WT7gyoHLvkotam
	yXOSuRu2Mx0QzkRbc7V+epGwkPYfSg780aDzLBj+okXcduY6klSKGyMaNA/uJZnvVRxchV0xBeS
	3MuzgXlPDpfG7M0e4OK4dAFhi+TBc8K2ibxcB54gXcAoLm3/Tpgv+UVNK/5+SzwTr5SnHtehVOY
	HFv04D0weTiH1+rquidUhkk/shEDVEG+130cnfRSGDix3f6hprJTNpY9YBwNnTG56/SRWB9CRW4
	4DFMpDWanSUF0QVV0w7QTTm8+gTIhoBcQXFenrRJcAQtDhsM9Tm/sIq5Mx9B1gzcgleQum2Gf2H
	1FoY/dqAodSPxcDD7dCi5au/DvOd7Say9DljWNgK0fAE8q1l8+KFaVJROFs86+FlG7vbVI9xbFO
	KnRsSNWWhb9oD9BApFWrKEKl10VKCPsW6w25TJ9nc8Ke5gqdzdX
X-Received: by 2002:a05:600c:46cc:b0:49c:cb6a:1687 with SMTP id 5b1f17b1804b1-49ce5812d7cmr29059215e9.4.1788321946697;
        Tue, 01 Sep 2026 21:05:46 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm42979395e9.0.2026.09.01.21.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:46 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 02 Sep 2026 05:05:38 +0100
Subject: [PATCH v6 1/6] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-exynos850-cpuhotplug-v6-1-a85bb55bb118@linaro.org>
References: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
In-Reply-To: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
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
index eb4e5a61056e..554246ef6d91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11172,7 +11172,6 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
@@ -24297,6 +24296,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+F:	Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h

-- 
2.51.0

