Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E825192B84
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2024 19:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719430995; cv=none; b=eXB6hN16aaCpDfy/dnK6BivyLFSTHGwSwt2fqzyZAofOBXZS9Rs9g0e9VochQvPS1lpuXnB120Hws/eniN7c5Uf4ez/VY7j/KjDuoj6aQhzssIEP3lS42/rox9SlRYwW93KlHpKT4c1dsoD6MaajxonNKddtL2XDznua+qYB8EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719430995; c=relaxed/simple;
	bh=QWIFihsVD1gKqEZxXoCvx6MZhkayfkQXDw2BS2+6928=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TfVGJRbPHpskm2QQwJZ7TR6ILznGh2z1OZ+6V0hTpyZfgdOC3w6f3bWf3ePZn5RGKhUDCP/eMSDtLXRVsCRDMKHkePKYwWcN48wI7uhdWC2O1kQkDjTAmykpMi4yE2DzVuJMUxHVIZhBfO09L6N/U+HZ0AbElhkyrvneX97Tru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AG8uE/iP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AG8uE/iP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-424720e73e1so56888025e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2024 12:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719430992; x=1720035792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itjEXOXzQyQKcMZI8QbOfOw29V9GALUONSBPehBlPuM=;
        b=AG8uE/iPAn59Mx6J5sisOyyGnGJtDzYyrcDMuaCfzw2Cbouv+SY1+r7HU66fB53dG6
         XZXn6w9Iwt9fYkeHM+p5DA8xLvPUhlRSUS+N2OmDMa5V4uukQLzBRmq9kVo7kE6vgUeL
         peenJT2gQYjmjcKEtW5qsJ3N8APvF4nnPwvuxA/aKqYnxQt0uTch+P+hJhqjeMD0ofY/
         mmfomjswZ6rPVAm9Q7HNStS8NgplY9sJ8S2CpiaIw++lir6TdmGByyp1JES9wG7PeyEW
         dV9C2fTGyDnxhrncEB2IWhf3wnb8bfM12DocWea5RUBLZHHJIKtErK6VDOPhxfe7hzvR
         oidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719430992; x=1720035792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itjEXOXzQyQKcMZI8QbOfOw29V9GALUONSBPehBlPuM=;
        b=xKszBffUyLJIn1cLeKGL5xlblvUntUga8rB7Ke5RrRfZMlyPOam4CdReofH4V90/4O
         cHZ8OxIf5PAlkk2BgiBlanE3s8fnhsIdWb/nFaPVpszjqeJ2Wf/zy5H8uiTIGpbtnSxz
         LqLZl+eLevW3bwF4RCKWGt/FtK6V+2MGd8bB2KFAnXUTh70hUd07LjivJ6YZy2GNqiOW
         tdHACigsTQeKAqfh4+f04yku+5Hfe5LZcznG+0dpSB3bzWh4D8PPjUr1Cf2HeIVYyfTK
         2x7HTXqyRK5ZGwRoZoQR+mEy4w7bmnL8IE3WHfgsuT8R/WHkqARMFei2f4ECJrccX/yU
         o3ww==
X-Forwarded-Encrypted: i=1; AJvYcCUeOEIw6oIJilrTs5RPCjKBc4naLWwzscO67ysykz9UJqwgC7wG1e/TopsQ3t9vtv12dPgk8VRb2ZCOr5AG/JnJXDbHmsmbJdbFvCCBpVB/M3I=
X-Gm-Message-State: AOJu0YxOvfnuzR+Xt4ipG5DWrVN+mIz8nNqEKHTY1FMsazNN+jM0qX0M
	zxD79cED38A4+1m0Hb4puMQDTtDKEyBTOYbhp4Dk0JA6ZIY2TaaM9+S6lY2sWss=
X-Google-Smtp-Source: AGHT+IHfX7OcBD6RtAgL4xteSdf1Nw93HCLkwb+4A6AZaX/B1Vh/4GYCHbWGaSDfQ4ZAgSMPHvr94Q==
X-Received: by 2002:a05:600c:3011:b0:424:ac9c:7228 with SMTP id 5b1f17b1804b1-424ac9c7c26mr20195405e9.4.1719430991709;
        Wed, 26 Jun 2024 12:43:11 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:24d9:a20a:2de5:8eda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c837eb2bsm36728905e9.39.2024.06.26.12.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 12:43:10 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 2/3] soc: samsung: exynos-pmu: add support for PMU_ALIVE non atomic registers
Date: Wed, 26 Jun 2024 20:42:59 +0100
Message-ID: <20240626194300.302327-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
In-Reply-To: <20240626194300.302327-1-peter.griffin@linaro.org>
References: <20240626194300.302327-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not all registers in PMU_ALIVE block support atomic set/clear operations.
GS101_SYSIP_DAT0 and GS101_SYSTEM_CONFIGURATION registers are two regs
where attempting atomic access fails.

As documentation on exactly which registers support atomic operations is
not forthcoming. We default to atomic access, unless the register is
explicitly added to the tensor_is_atomic() function. Update the comment
to reflect this as well.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c            | 16 ++++++++++++++--
 include/linux/soc/samsung/exynos-regs-pmu.h |  4 ++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 624324f4001c..5556acc7c092 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -129,14 +129,26 @@ static int tensor_set_bits_atomic(void *ctx, unsigned int offset, u32 val,
 	return ret;
 }
 
+static bool tensor_is_atomic(unsigned int reg)
+{
+	switch (reg) {
+	case GS101_SYSIP_DAT0:
+	case GS101_SYSTEM_CONFIGURATION:
+		return false;
+	default:
+		return true;
+	}
+}
+
 static int tensor_sec_update_bits(void *ctx, unsigned int reg,
 				  unsigned int mask, unsigned int val)
 {
 	/*
 	 * Use atomic operations for PMU_ALIVE registers (offset 0~0x3FFF)
-	 * as the target registers can be accessed by multiple masters.
+	 * as the target registers can be accessed by multiple masters. Some
+	 * SFRs don't support this however as reported by tensor_is_atomic()
 	 */
-	if (reg > PMUALIVE_MASK)
+	if (reg > PMUALIVE_MASK || !tensor_is_atomic(reg))
 		return tensor_sec_reg_rmw(ctx, reg, mask, val);
 
 	return tensor_set_bits_atomic(ctx, reg, val, mask);
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index aa840ed043e1..f411c176536d 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -657,4 +657,8 @@
 #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
 #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
 
+/* For Tensor GS101 */
+#define GS101_SYSIP_DAT0					(0x810)
+#define GS101_SYSTEM_CONFIGURATION				(0x3A00)
+
 #endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */
-- 
2.45.2.741.gdbec12cfda-goog

