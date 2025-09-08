Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C5430ACF9
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Sep 2025 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757337188; cv=none; b=ne/vDN6qduOcuoLROU1RdNFyWKaMsouO8l/yh68iJtVaIjlky7JyAHwPqJpwg3wUjr/W7wXvJa9K7BdzS620wGcj2QmmQiMS5FCokJIHZefay44gxBBEzjG0+fytTBPUXxD/vuwy3qleTL1EsxccHLMEBl+bpd2HzS2NlEXjWss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757337188; c=relaxed/simple;
	bh=r9B8eJrWR/g38PUeQ9J2wFXWREa48OIMpTY6cZptlBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HY+eUbmygnoBhg90M/zCfG1zymSb98SIpJS9IH9KZ4z48Tqec+qq58VoaMdpvkXpvTnjKKjhm9SfXYPByXtW+5svOu67tVVzgBbmBUT0I1LvxM4/PQ+XZNC7JurdwWrAkQ8eg3o+Nvr2q6SNIHVOpPMESh9P44py3OlBRhScmwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gfYgd4/m; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gfYgd4/m"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so26832775e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Sep 2025 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757337184; x=1757941984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HX1P98lL0ntVTFobuHZJG04rSny4tquvD0IzM102LdE=;
        b=gfYgd4/mMQtSOhMVWToxxh3TVJ5Ttd4tiKfBFq3/plCL4xqF4FqEtMRXWDmASYsZNv
         1W5WdCcLPvjtpdqg+hL/24jZa2tKC/jEfopUTgEpFQZDXygZbev/2HYFMVjvv+VFcQfB
         k8wHoFAnN8mXzChyZHGYGJH3TdfaJf9XqnFfvgtioine3k/ouSD6aLqpaQvFWiVPrAl5
         8fZTS9+kCEYX9JQWxBgrxyAn6deGUAyGMflM1C+BRiYsE2EBexxJDIwOpPc1O0IsljI+
         I+04QdD8Hl7XpjGrDEBq/3/EnVPuyhqY6BhzNMQhLHJgB82NAawPeXcK/XJhlnE1cjZ8
         UwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757337184; x=1757941984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HX1P98lL0ntVTFobuHZJG04rSny4tquvD0IzM102LdE=;
        b=IZ+hIpg2qzmHmytTVUE9d0pH3+FmKuiJhnIhArGUIoKK8O3k6olvRVJgJG/RuHzOF4
         cbv3KKOF9S/UqXzwx3Gdc1N/Dvczi3dlhU/XQd3+rvp4j5wZsTm3A2AExddriw4Svixp
         kdbYx1kYDbAJG3yEzcHIWrAYeMzT5ZumOO/XbZpuef2lVtLK7PZbr5pFr1GXbow9Mne+
         pAjeyT23H6bSyoUcXdEshtskAE1thUHjpgiI9q40FLxLCU9BEbo67r7C8KliZ9/YiCYJ
         W1lQRMr5b+YvlfSfa20CB5yViXSSo5Jd4Xen3fFBD5LNuGKXIfZPfuy0DU7TATlW4gYt
         j3rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCa2s30opc/D0oxL0p80r12MHQuaLs11Q5L/gCad2iJNeGNd/RIxL/IlnOEuNAODvrDOo9cecNm11pMHhQ8KQcqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLy9yS0yBmZjrsLUkueiGpb6b8rHA9ncKM7EdsL8pd5ZrmCAe4
	lHDqssKRsW0P20TUh9lLiTbZPFVRjGAiW10gKXKAipnZBk6eV1iV08ZWPU1xko2U4NhhBq4NS9c
	dnH1f
X-Gm-Gg: ASbGncskd135mnNuA6FI+ltTY/VrK+2VSKx7WJKkcXUCYQtlVYeWWBKA97NEm7C5243
	0CshkGF0FiSrylntv1JeWGMK0D23G77T5MxZ7mk+ALLLUEfosq6tF8qqo3+JJ+N8XmY3zrGCJ9c
	K8Nu676paCwEcl/pEqqe+lP4hu4TD0t3avLyx+/gt/0Vps8WZwnLA3smS1VErSpPm1fUQJhuPeE
	QgbKTIuK3KMYvTpoPmjuXOLxHNdvWsIcPVKiS8JwqKKwc+m7ChT61tBzYTe2hKkRwkKWqDu8+2z
	AVI/CNe4MzEM9nav+xBO2h3STn+cI4OFRkAl4dNdzc/c5Dl+W9VIRgWoKR03+MK0fvJrQm2F8Ic
	sTu0U4o8bEywTfbHh9Bnlr6bn5e7NuwSmjvpZcHpzJuT6nWjSxERSfriEkxsebOd1oBg5gjYyJh
	lTgEz7+eJ5DmAt
X-Google-Smtp-Source: AGHT+IHrei69SE3S2Wo3PhQL3nGzDL0r6xFLtoIiPAj8bXHlYe0awD9SWK429eaX/ZmPsA2F6T6ySQ==
X-Received: by 2002:a05:600c:354f:b0:45c:b61a:b1bd with SMTP id 5b1f17b1804b1-45dde220a2emr74636385e9.18.1757337183601;
        Mon, 08 Sep 2025 06:13:03 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fb9dbfsm41650181f8f.43.2025.09.08.06.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:13:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 08 Sep 2025 13:12:46 +0000
Subject: [PATCH v4 5/5] arm64: defconfig: enable Exynos ACPM clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-acpm-clk-v4-5-633350c0c0b1@linaro.org>
References: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
In-Reply-To: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757337178; l=820;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=r9B8eJrWR/g38PUeQ9J2wFXWREa48OIMpTY6cZptlBw=;
 b=9ggP3KUVS2zT7FryKyHNIZtbBh3Rqan9vA/aNkZzb27KJvR7ycYAxiFo0bkteyhSCJ1SQvT4Z
 n+0HD5LlcvUD4LkTHTo1imFXIzH7ED6AZ4JOBehLysGJoPG0239vgL0
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366cd12ae212a1d107660afe8be6c5ef..4255bc885545fb3bb7e9cf02760cac35bf2872fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1445,6 +1445,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m

-- 
2.51.0.355.g5224444f11-goog

