Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE26153810
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jul 2024 16:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721752394; cv=none; b=kHSUExt5KTm85Uipazh8y5W5jrbFyzFb7W8f6ZkGMyb0vI+sN5r+HyWdiqSKKrxwis0hc5PMSIO/1X6NBTKUFwtyo5hkhk663+SyulAVP+P71QvVDlPY36ZcTUTGDmyJxSla1AnGSkVL859hlvTgTZqyfVnyIxSwkt8Q1f4JtIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721752394; c=relaxed/simple;
	bh=Rlsm3g465sL7REjC1ICV1eiOlwWaRmEDM1DT0XXv+YA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NNxJ1178ZR6SAQBQLHAXIRm5/NXte4Z44s0h2BjNdzFG6I1aHBkVWmDQBWtklQDEmpOKA02OzUA5MKXET0/9heLlVT78GccHqKIKi9fU63qKfEk2HJBY07FmNXyiznjUleW7lcq4IDjsTRqOMyPdHIuTgrg0KCxmoC5JB5vTWkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/y2ICbV; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/y2ICbV"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-708cf5138b6so4367081a34.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jul 2024 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721752392; x=1722357192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RgQLREszlba2w2e3rfY3g/vnEu09NDSRrgY7DbqY56U=;
        b=x/y2ICbVqcUiU02XjFn/lUWlurBQ2umA/4pmmpitBbu6O1A+qVpdlbN4ziwSjR5QBZ
         PLJkhXvYcPFqoqtqYFlT8+Rf/IikHevM1xRQjtNL3EvC2ia0G/WZQ9i3PNtS1Sr54KoC
         QkTIkBjZEFG15PXcg4EOLw3m4wNeUG3lME/ZvXSNSSfqW4fNNaaeBH92nMTlf4eHz5t0
         kb/3dHoLwijLz3W3KubM7LDbxKYF14O8/m0V74ngylrnDrwXSJnku46uHz1sx45CnRfh
         HfKFFz16xjKgm6YxoE1mhGhX4/T3jpCP+jAHmkaej3WAFZQhTztSvjU0O00VbgwXBa0l
         RQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721752392; x=1722357192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgQLREszlba2w2e3rfY3g/vnEu09NDSRrgY7DbqY56U=;
        b=GumkmsraL7Dp3a0AyaZX8CqtZqU+kB316ILKdr29RdHOovk5UNzZqvnn0GLHR7WTY4
         7nGi+Mrq//SgAllNO6tpKtY+mLM6aUMAqzqyd+4wqyPdgtaCQu0T4SfXiqG/jQNCbSRU
         a7EHQ3DAp5uXOOBVGjPsQ8kw/7kcDBTQYA/r+MotVDqMugnK+omi4EU/EtTAna87SOFy
         BiUuVKMYj1PmoewcaXU1lznXa/ce6i5k1a1a0wDpntu4gb7AjerfW9cPO3iqOc4Om0Tx
         hiouEb2ohOQXcFjFViU+uMD/+Mf00UeP4X+Mf9ILR0g55mrkW9VF9PRb2Pchidu4WRAP
         rTRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4G+3Fo9pY2oZtf0Bu6SGqdtbprsTIpjWX0xGFvUnp4HdMI/MwYAryD1+sg0uNR8i0RFc8SmKLdGgQNtNqcXPloIf2p8VsCcsSh72ubHqVlU8=
X-Gm-Message-State: AOJu0YwY/aycE2mKvTDRrHk4V1+NjYWNjqdSiflj1WxhIUb5AqD6QNwp
	DYJ1tY6ghIh3pbncb9PeA3dU91/vIaucsHmW8QyiGp6ef79UrqkGFGlZmRsEqj0=
X-Google-Smtp-Source: AGHT+IGBpe6peQ8ESbWSihyzWm1b4sHXIw/4hvjia5dWTqI2J3ZsUT5UEo2Jo5H2dBkib0oiHWbtaw==
X-Received: by 2002:a05:6830:6f0b:b0:703:795b:f675 with SMTP id 46e09a7af769-709234ca4b2mr449959a34.28.1721752391805;
        Tue, 23 Jul 2024 09:33:11 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708f61913b8sm2059965a34.68.2024.07.23.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 09:33:11 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Mateusz Majewski <m.majewski2@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: exynos850: Add TMU clock
Date: Tue, 23 Jul 2024 11:33:10 -0500
Message-Id: <20240723163311.28654-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a constant for TMU PCLK clock. It acts simultaneously as an
interface clock (to access TMU registers) and an operating clock which
makes TMU IP-core functional.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 include/dt-bindings/clock/exynos850.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
index 7666241520f8..80dacda57229 100644
--- a/include/dt-bindings/clock/exynos850.h
+++ b/include/dt-bindings/clock/exynos850.h
@@ -358,6 +358,7 @@
 #define CLK_GOUT_UART_PCLK		32
 #define CLK_GOUT_WDT0_PCLK		33
 #define CLK_GOUT_WDT1_PCLK		34
+#define CLK_GOUT_BUSIF_TMU_PCLK		35
 
 /* CMU_CORE */
 #define CLK_MOUT_CORE_BUS_USER		1
-- 
2.39.2

