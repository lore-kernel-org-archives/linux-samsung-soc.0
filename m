Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141AC43147
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Mar 2026 00:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398400; cv=none; b=pSOMz5erf+kor6iNSlDL5HdQiDPQlS9WlU5Z53C68T+x2Z8TBYaVmLYaIwioa7YSVY/qgE3oAK43gbbjqs2oVuYFE74HT64dcluhEt2WEV3478s2+3M6p679xdVhxheoTvu5hc9HRSQWwPezOxnaFGSQh1XKHglEBJe77O0ic28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398400; c=relaxed/simple;
	bh=HFIgrWvt4+PejNB2udAhjDCQWsy3aJQEKvjmdaokDjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W8P9FtQcUh1Brta71m4mhYGDK0dfbn2/DVKYyAA9+2C6zWv5OjoJCm1MlxTT8KpRqmuLDkyCNATDCKOmZZWDCMAwQQscX/tU0itlj8tZGSRQK+yiJRVyfpg47F203JBVpwd3XKeFNjpioxynHHgCLGmVlwAxcqbzNZ4xp180ISU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SvRatgyi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SvRatgyi"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fb14227cso19729665e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Mar 2026 17:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774398397; x=1775003197; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OR5AmQ5C+PwxUk96HWSvSEr+oIE5VPNLRZ7Lt5xbH4o=;
        b=SvRatgyiY5Vytqe0Ci+W6WExQoC1iwmXH4vfVLnVnhPlSXRC61XCnWoi+ZVTmhiPi6
         H5oHvHSsEJYNbHNQhIMSNQ0tZl7h46gqk/Na+9+cenL04TbG50PZ5HtEBDJQ0MWyYAYO
         5qhIZ3IfZCsXz562/9hcxgMn/DYZ+P9/KtFAHF89I9J4+m2VJboJeGlYZzwNxjDvVkx4
         TK3S2+ZQOLpmkDxEXehxh/o3IUKnHCXLITKCXYzUqP0dYfqWnL7aiN4T3bISSy/q5FIx
         mDjcQFS2upOKxNItMjR+IQRHGI/ZHt9tY7Zn/7liBQpLyMb/YeRhwUIyLVP+B0wppuTV
         KG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398397; x=1775003197;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OR5AmQ5C+PwxUk96HWSvSEr+oIE5VPNLRZ7Lt5xbH4o=;
        b=gpolj0+sn90+GxTJd/MFd7telCYFqzbUGODGDmlXuD3Epbsi+Ib4asQvYn8xGwWZTD
         ak37ylprYJ7Oh4OdALtDBnwWHinIK/a+PwiczvgJCWrPOTe20JX1a/t+9nsiZ1xqohqd
         1lk4K0423Uz7RX+dQu5RcJeXr/h+89JNK3M5aQ8MnFVFkqHeFD/IEFSWB48l/vKkqbDZ
         c2dukgHqfu7lAcYDYuwQp6DVXcD7omKCXdOnW0IKhBVtd21+xL+KVXEzw5mpyBLyTwVw
         eX6Qsc8JvXpMLkUB2/y/mYHX8WV/OGmqM0+2cV2O5LHZciEr9rVruVRI/wXSFuzYXSYI
         533A==
X-Gm-Message-State: AOJu0Yws1rDSI57AC+Zz673NZn5DRNxwbkrnninDFsrClB42jOaiBvQ7
	hr8zB2WbtfqLqUWT2M16E/O3Vix2R0bKSEjEwkh9H0u+6yvmr46Dv5AAmQSxMEHKra8=
X-Gm-Gg: ATEYQzxFx+elYfOQg6tHMVW/+cKlODAAdUSyWm1F+9SXXAWsgAGPZmrafC90Z+IiF/e
	XY8ZAE8czm8UPhGngMhaxan2/QNeg0hURVevGQyVIwwVfPgsuu1ypm13amNkOnKA7FQT0lyBgLB
	qsUqnDbx96dIVE2aEc23RoQLjc/mZlbppigTmHlO2xjsreCu+xEhD4ArZdVjV04yqoAcSlnAsFa
	il0i2MP+JOyfV5OJw1ePwdWmvEkY3UAx+CsogD0MRFo4uRLAI6HrJ6wpxnIB1Ur4UwVao9UKH5H
	BhAMvDLim65WfT68pgQGAIiDfvBRkWA5bR8gqL+lJ+Zfex0fhrbJ2deM6pH/d9mNI6wVIc+GDdT
	M46seqpd4WauE6TZX/78Ktc/+p11T8xfptEZYeD1xXtGfDUc+6BhtLHhiwmb4BULzAl3hJ252Lh
	c3Z1R9sRu+YsIS/P8Ij9D4pDU74b/wKhvjPkCwnJeVrno8bhkm0+23wU5yrKv4Hh22tTcWe1Ozg
	gKgIlojf/GISe0=
X-Received: by 2002:a05:600c:190e:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-4871604c856mr22473085e9.20.1774398397416;
        Tue, 24 Mar 2026 17:26:37 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b85082842sm7233704f8f.20.2026.03.24.17.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:26:36 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Mar 2026 00:26:32 +0000
Subject: [PATCH] arm64: dts: exynos850: Add syscon-poweroff node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-exynos850-poweroff-v1-1-34c19c06e74d@linaro.org>
X-B4-Tracking: v=1; b=H4sIALcrw2kC/x3MQQqAIBBA0avIrBNMM6SrRAupsWbjhEIZ0t2Tl
 m/xf4WMiTDDJCokvCgTx4a+E7AePu4oaWsGrfSojLYSyxM5O6vkyTcmDkH60fbWmME556GFZ8J
 A5Z/Oy/t+INkMlGQAAAA=
X-Change-ID: 20260325-exynos850-poweroff-a6515334888a
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Without poweroff node Exynos850-based board continue to draw current
(around ~60 mA with my test setup) after poweroff. Kernel also reports
different lockup problems and RCU stalls warnings continuosly after
last kernel messages about hardware being switched off.
Turns out we missed a write to PMU's PS_HOLD_CONTROL (PMU + 0x30c)
register that actually switches the SoC off.

Add poweroff node that implements this.

With this change the current draw after power off is in range of few
milliampers and lockup messages are no more.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index cb55015c8dce..3881f573ec08 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -215,6 +215,13 @@ pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
 
+			poweroff: syscon-poweroff {
+				compatible = "syscon-poweroff";
+				offset = <0x30c>; /* PS_HOLD_CONTROL */
+				mask = <0x00000100>;
+				value = <0x0>;
+			};
+
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
 				regmap = <&pmu_system_controller>;

---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260325-exynos850-poweroff-a6515334888a

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

