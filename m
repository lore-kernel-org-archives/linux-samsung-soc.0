Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6038436136
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706607511; cv=none; b=VMvApO3hG7pLT7Qoniyy42wMwvZkzfUtzKwYzkSinlGs/39Z74moeJOPFAoDBMCrbnkFH6TobN65pcyNxePzD2FL+1ScNJaedtGPq/yGaq3/Rgi1vsL/8uiUebytH+DEypJexlLFi+mjiayfmgV4NvRE7Dxm6lEyBQKtJusTD3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706607511; c=relaxed/simple;
	bh=58eLDdc3Mi5y5crU5alxkaqtGm0JqjwC9iMw45+tlD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pL2Px0t0V5h0iL7Le3oPAGjPjMPAq2z7JM2LvNhg1zRcSVakEMw4wyzRctZ9Lme69h3p8RoveLgsHYTL+HnIk6xOEB/ZzSntEcKKEZTReVtUsvmegFCcL2gS7yF6lSdrFOnztAza/fFxHSrbgVjJZbxjr2aZM+KnQ0Hqw2wzd4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nFfKRWJb; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nFfKRWJb"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55eed368b0bso3880555a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 01:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706607507; x=1707212307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z705+SHTSj/VSK3FgDpPeHNjW30UFZiT02gadyZNGK8=;
        b=nFfKRWJbKgxLWhyUsWV+vSCliacQLQKzi3PAF6Nc8c06DSl8ybFhmKJ47pW11FjBs5
         DlaRppflSwrb4LZizsvW+yTFdXtvRnFBI/B+XdaiM/PnXwnu8csCOxbbC7vEL9JSUBLT
         VNmyevGRClVCGqgZ/ZSTylIQknWEzZ/+G1rkPKIv4EC++KTjUiX0+xcv1eJBX/qmC2jv
         pWnJh0BoAD4D/PQHyQG8FDKWHk2/Rdts4Msc8zaxPV/g7rNUIbpg4qB00dwlhyf0vKwg
         iOCbHmvR7IxdIIgH+kmFbj3QBx3HGjBNtvqKpajNoGZK+LrIAIDVkpXoNyivINKN7/Hj
         ZiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706607507; x=1707212307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z705+SHTSj/VSK3FgDpPeHNjW30UFZiT02gadyZNGK8=;
        b=VZ/PsoYMGzQaby2opYK9JxR+18d+uxNCZQfjw5owJCrVPAyU/sbfcRTT+3KqTgc9xf
         wBM8vlflSPK9uRKky80BHkvMiC7JlkjQDOVvBayLaBNsLHYHXieHC4MrP30eM6kZWA+q
         wvRuHp9S3NbJzxeZpiSUmH0GEUYum9eNWt1YWSqY9CVcOwZGeD7P+/+28oiEnb8uyhkF
         ENdpvZBywRJ8tGWziOa6ODpPj/MS6uKBf84ofN72+GaOw5ZsqwBkOAPFDOF01n4dhWuQ
         k3vwj8DtZzBx2AuofOaVAK2aKUIMn/PmBrFheVIc0L+J8X5fSO6kkkc962NByvxUzGhg
         nL5Q==
X-Gm-Message-State: AOJu0YyLKoj6EfjBzlajUhwm2/eQf2zr+iJv8FcNunY2V/TVp1w+DmQr
	JrDS5ELcoXU+2MD4QrD6dF/Y8TtiZYvCFWiN5eWk7cHh6RROpoCYA81gYkXsqaA=
X-Google-Smtp-Source: AGHT+IFi7R6rGOIyVBaQx5RvUZ9n04l0vwkfwKqczrdhe8L2eBuu/DQhZhkDLCMWnDTWBH6N8cffeA==
X-Received: by 2002:a05:6402:2054:b0:55f:18fa:eb59 with SMTP id bc20-20020a056402205400b0055f18faeb59mr938270edb.16.1706607507526;
        Tue, 30 Jan 2024 01:38:27 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id q10-20020aa7cc0a000000b0055ef56f4575sm2281225edt.39.2024.01.30.01.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 01:38:27 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 1/6] clk: samsung: gs101: gpio_peric0_pclk needs to be kept on
Date: Tue, 30 Jan 2024 09:36:40 +0000
Message-ID: <20240130093812.1746512-2-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240130093812.1746512-1-andre.draszik@linaro.org>
References: <20240130093812.1746512-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This pclk clock is required any time we access the pinctrl registers of
this block.

Since pinctrl-samsung doesn't support a clock at the moment, we just
keep the kernel from disabling it at boot, until we have an update for
pinctrl-samsung to handle this required clock, at which point we'll be
able to drop the flag again.

Fixes: 893f133a040b ("clk: samsung: gs101: add support for cmu_peric0")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

---
v2: collect Reviewed-by: tags
---
 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 4a0520e825b6..61bb0dcf84ee 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -2848,7 +2848,7 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC0_GPIO_PERIC0_PCLK,
 	     "gout_peric0_gpio_peric0_pclk", "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPIO_PERIC0_IPCLKPORT_PCLK,
-	     21, 0, 0),
+	     21, CLK_IGNORE_UNUSED, 0),
 	/* Disabling this clock makes the system hang. Mark the clock as critical. */
 	GATE(CLK_GOUT_PERIC0_LHM_AXI_P_PERIC0_I_CLK,
 	     "gout_peric0_lhm_axi_p_peric0_i_clk", "mout_peric0_bus_user",
-- 
2.43.0.429.g432eaa2c6b-goog

