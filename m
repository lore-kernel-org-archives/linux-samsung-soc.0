Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33F43FFADC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 11:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550017; cv=none; b=n2Il9EMtTmWa4EhDa0qmqPTZdIgj0zgBpIJD1ml9FmbHG3KeiHfGjGQbcDyYPLtTCjzvdCfDRbt8U66qtlNAAkT3cyZRaJg7psVIElqF4VZtTdb16TW6l+x86y2HOmgw9kCEkeDkS5AJFT/6hKSEt471JeEB+m8AMDtpla1tCPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550017; c=relaxed/simple;
	bh=f8+OQO/DhVnwaHYN8tReceYFnWeQTCE+B4hgCfi/GOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qNbtmO+QVEditQC11mrVX1havJ+o0TYivmChyV51TnsZWbE/FrdHNp0BRt7p9fad5HVmX1KE269HnUkA4c/jnEbc4bHAjcRwKzji8RroWC1vg1jDqsMW40aHb9IxREW+lMClqhMF+njzsU0O4t2McA+44Sf6yLrPF4ODBMGhJ3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ij0fc6ZH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ij0fc6ZH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso4963765e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 04:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777550010; x=1778154810; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HmgXHjLeIkbk+Rv0NJChDX5ZVnbAwfmHTE3lyoBocNY=;
        b=ij0fc6ZHYcAICy5HRaSwNqbImSM4GpCfJlnKR34xk8OA3kI/1LINViqDo7FfQ07pAt
         SVaOO8nbQIkHeDe/F9X4XYabeFsHl2aCWvgTSaUTD/EwKQbSoO0+LyGmHIQIzSt1O9y5
         SeCd8ZTmaY79tbZDXvaHaN+7xy0AooHI4vG379BeMvrkoRGg/dYrSAEydqS6RPKCxds3
         izq/8UgsaEiGZfuTuzU9d5bHZKA3Z/8D8CXNeqtbMu8JzZgSP0PhdoMd7jbN8tQqMeEj
         xV45N3p9SBgoXJqyQbqDLBOApCr8h1ZqN9LjiPObP7HRpMSQlFA4tUYia88ocWXk8B3i
         T2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550010; x=1778154810;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmgXHjLeIkbk+Rv0NJChDX5ZVnbAwfmHTE3lyoBocNY=;
        b=iwYrVZsCfgcPcIfzmf8VZ65WvJftWsdMLhbBxzybz+aaIj1VQgRlJABr6u5+3lmFUx
         mGARLKuhT34b0P7WLBo1Q3glb0PXHCy+tcKu0K9bVN7j+6qnttSJ24reVdFPscxld+kU
         W2aFAR/Vsvh6+vj2CjFIX/uzmqnmVLDH2nkESNSiFWXPO5v3jB2fP98r7/JveEiRoxw8
         cqFW+wulXDPlc5COCJKbvaTjl5B/GYSPEBZBzRS2+g+bq4zK+D2NQiv1EjpdJf7dZFx1
         4Y7jtEKCBea/bhIC5cNzPWvSYOasG4y5VP0Epudqn3drwek5L4ruu3tY46YSavvqQz+Q
         Mt7g==
X-Forwarded-Encrypted: i=1; AFNElJ866Z2mikHh4DcNsDxHZ8w1pVjFE4ZG0lEmAf1vjgHRLY+mCUL2yWr2tVMwEcROzGD5S1882sTyzWgpV9HFl5mUIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl9s92jwYwQDzzu42clcWZ+I6r8neiW37DsQAAYNvW0mc2VER5
	Tp8MidzLqjTSr3+AoTyGZggSZN3CLexjVycRaL4k4r4NfTjLHC/5Nm2CNVwGYLChnms=
X-Gm-Gg: AeBDiev2VxAWygUp95vKlL7Xvqh5iG4ddUOrIbHDqJnw6ndgkMCxm2puf1N0GhMBwSG
	FCPuh/uWRdtcI+HFo6DhS8HjFY1RhnFUQJrt1vt60xht/gjiq+mS/RFVf8voePWZwJeqSVgGq2Y
	rQ6xXxRvmWCWs3Sgg41xejUzU0gcmm0oCzYPi2eBaTXXAAV9effESH8175P9UL2GeIAEecxlscX
	TJb/+1MyMgV5U9Y+hdIvuX//S9knmM7pnmOIAntfcvp90bECx1Ij9QU+fjPIwQ3X6gwFOoH/aS/
	lMNzif8Mt8GiBvlN6zs1pW2IjUOa2OGUqEVPGsXAfByfs89OMDXgYkrnv1/4F2+OBcRPINFKWvI
	BjhDK24w3X1Qd7+mRhEyAm6F3n1SIaYKmxGfBRnoPQs1wBKspYEuPIFIspXpikjzvP1AbnarwdD
	ze44b7hTrFlTm7JzSglK5cXJo2oMDZ2skxP82e2Q31Dyj3vyx0wGmXkOpUAY84CFHoAue79TE3M
	dhU4tixdCiIJToq8rJZ59OKaOyis70=
X-Received: by 2002:a05:600c:c117:b0:48a:6798:52e9 with SMTP id 5b1f17b1804b1-48a844a1528mr30995585e9.0.1777550009764;
        Thu, 30 Apr 2026 04:53:29 -0700 (PDT)
Received: from ltux.linaro ([2a00:2381:fd67:101:9e61:b264:2b8d:1e57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3058e5sm40886905e9.16.2026.04.30.04.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:29 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 12:53:27 +0100
Subject: [PATCH] clk: samsung: exynos850: mark APM I3C clocks as critical
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
X-B4-Tracking: v=1; b=H4sIALZC82kC/x3MSwqDMBAA0KvIrB2In1TpVaSLZBztoCQlI8Uiu
 XuDy7d5FygnYYVndUHir6jEUNDUFdDbhZVR5mJoTfswfWeQz1+IOlqD0hFSkkPI7bRH2hRnct4
 Po18a20MpPokXOe9+euX8BwC6cFluAAAA
X-Change-ID: 20260430-exynos850-i3c-criticalclocks-dcabb78bf154
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Brian Masney <bmasney@redhat.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

The Exynos850 APM co-processor relies on the I3C bus to communicate with
the PMIC. Currently, there is no dedicated PMIC consumer driver managing
these clocks, so the clock subsystem automatically gates them during the
initialisation. Once gated, any subsequent ACPM communication with APM
results in timeouts.

As a temporary workaround (and let's hope it doesn't become permanent),
mark both `gout_i3c_pclk` and `gout_i3c_sclk` as CLK_IS_CRITICAL ones to
prevent the clock subsystem from disabling them. This makes the ACPM
communication functional. This workaround should be reverted once a
proper ACPM PMIC driver is implemented to manage these clocks.

Cc: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index eb9c80b60225efa33d85f5f3c284eb8a63a48015..b143a42293f5a154f53a86d4e97e17a3e61164f3 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -686,10 +686,11 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_APM_APBIF_RTC_PCLK, 21, 0, 0),
 	GATE(CLK_GOUT_TOP_RTC_PCLK, "gout_top_rtc_pclk", "dout_apm_bus",
 	     CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK, 21, 0, 0),
+	/* TODO: Should be dealt with or enabled in PMIC ACPM driver */
 	GATE(CLK_GOUT_I3C_PCLK, "gout_i3c_pclk", "dout_apm_bus",
-	     CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK, 21, 0, 0),
+	     CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_I3C_SCLK, "gout_i3c_sclk", "mout_apm_i3c",
-	     CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK, 21, 0, 0),
+	     CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_SPEEDY_PCLK, "gout_speedy_pclk", "dout_apm_bus",
 	     CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK, 21, 0, 0),
 	/* TODO: Should be enabled in GPIO driver (or made CLK_IS_CRITICAL) */

---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260430-exynos850-i3c-criticalclocks-dcabb78bf154

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

