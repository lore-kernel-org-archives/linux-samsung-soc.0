Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FA923504B;
	Mon, 25 Aug 2025 02:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756090550; cv=none; b=En8G7KyuD8N4uoKCZQr5f8utriwM17OtleNM60Ui395ubaEQdKUMAX9hpBLgH6OTZOe7f63x0ACm/bghoNOEW8O1k7GxTc+gPEqji3XIlccMkI8TFwyu+apAfIjbfVfqX6w1dpTznVUDP9uSVxGHEOSSk7nZVi4Agxa2IsRQ8Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756090550; c=relaxed/simple;
	bh=2df2g9IN7oOC0sfykEjTkphnVetjockwFMLZy2LuxV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QvniKaFSpNyiNtH46h39Ni9MUoBHdfnFWHhuS+UJ+1yQE3qzcz41gNLja2orCxyE9twcvzH80BHb8DAkk6KLsZvPWyq0ZGkp8w8J7fB42cSUXdjCg39ZkJUOZNBO6X6cb/72Y97AkL3UnS6Fxh7fjmI7i132LgMImUsB/ZZAlHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHJ+moBY; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHJ+moBY"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b113500aebso30553191cf.0;
        Sun, 24 Aug 2025 19:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756090547; x=1756695347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jA+TakLrLswEnKzwE110Y/lnrwYFveR3hSJusF8B4Y8=;
        b=NHJ+moBYw7TkCRCo32lVV6PaZTzp7ce5AUVEOMZ3OFqc5exLWQeQ/m8tRFrEZK1lTp
         nKl2srcbYgbMzEqrg+FaPL5hiy5AcB4HSFdwlEFSP1Qwl5D+QbWw12Xy93GUHcwckGbw
         f8RIrJuhkF9ybOBAvX/1RbB/uu2Qdv081iD8LSt4CHifAc6QpwZwINcnHy8Nne90ezBY
         rgk8gVISRulTWwepu8KTloOs+ljg1sYJdAAi7eRkiu/NtMRSqP2/0Zg3+OKlqKYqVSbm
         h17vlKESZZEj7jsWpB3dVMyYFV8b8QwKoVSsVjmB7Bt952Mn7bgw0l/it69BclEQcG1p
         ffqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756090547; x=1756695347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jA+TakLrLswEnKzwE110Y/lnrwYFveR3hSJusF8B4Y8=;
        b=FXi9hq/CXY7hmcedDNntex8gCMBtc+uzowGy7wwBxCpN+cUVqc3wID2jbUThkp9+7s
         VQnQp2lXagym0QD4kHolnmOzCOcLu0GjRio6UMjtkA99eDyZ2JBSrErFILHpFXYidHRl
         hZS5a6C8IlFbCiJfH+IDaRhxXMak0o0kaNGYrK1semfpNU+j+bQhK1EkRdS5Eb2obcAK
         NX2qQmxSoachQvgJIVLaA06gWUOp66ypqvAVeR7xQpdGHoZ8sJ6YrfLTiU21587vN82H
         d0paW7JUCeKBO1fpE1+6jpo90xTmI7vUvnBC0uW4kHcnKZJ6/gwB1HKqhXe1PUztkLFs
         Fb2g==
X-Forwarded-Encrypted: i=1; AJvYcCV/20zoZjAGHj0q7Q1ZYtf2GkfsiAvD872xHqZSINNk8PTGUuVCfn5E+lHl8+PKwmAw4DWqCIwxUs98@vger.kernel.org, AJvYcCVWAJ/xz6r7MU/ZY2whumSUx4sSlF7LTPUQX0MpAsIu/RYAO07n/E6aX/HFLoTu67DUGV42ZBwOR0sh3mH7@vger.kernel.org, AJvYcCXKMuOmBLbVusqL0hD/LVi5lvE1+VNES59L154h52zlC3zgpQOB/zKuE6JbCelpid1lEPYl/Jr+2kXx@vger.kernel.org
X-Gm-Message-State: AOJu0YxVqVEQxgP4sdTDHJkP4XmagJ7nNtTYwQqeHwYeEfWIiFD+IQqB
	gBZgZwmIFNLtUBbyzSWnarcCrTfYyMy71NLiCofq5h53Jrcy9aWmsqb5
X-Gm-Gg: ASbGncv1f5mX97RsKAaldh+IcKmpQS/nc9AEziJYV5c6pb3GOU+2DIBmCPs/mY98RW8
	mbE/P1lO9LOCcmZU7h2hxNU9GDrPzcPJ2vX4Rt3QH6Nx32oHHvG7u7YwOwTa7tk9qPjxTFpVEpi
	FVdxlCDngKSULShOe0mlmNyleS+3AsUbzCI5p9tbD0lvP/O9QCEpJatIUyTdUtx8ZlBhoIQlWq6
	fXGzRvNzi43z6OPIOT1U39DQP/4OFUVQqgkjNbpGLt7oITrXXGOzNGphFnqJtqwar84gB5CahYm
	XGhf2TequHXdWINaow+RicKZCes+MG1Ff5vZb+4aRwWzwKMt4DcQsgzeg6GuBbDqegvjNMbGFE6
	EFUSocQWOkYq3wlSKVTXELZE+vV279T76S/XV/4CA
X-Google-Smtp-Source: AGHT+IEB8LkkByxeP/0D4VTkMH4oK9VBbuXh8LA9IpI7gs0m3mH8S9zuIgZKyx+m/BIIs1mN7idqkQ==
X-Received: by 2002:ac8:5fc2:0:b0:4b2:8ac4:ef5e with SMTP id d75a77b69052e-4b2aab06886mr107045661cf.65.1756090547250;
        Sun, 24 Aug 2025 19:55:47 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.57])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8c61adcsm43970491cf.5.2025.08.24.19.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 19:55:47 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Mon, 25 Aug 2025 02:55:45 +0000
Subject: [PATCH v3 3/4] clk: samsung: exynos990: update CLK_NR_TOP for new
 IDs clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-cmu-top-v3-3-8838641432dc@gmail.com>
References: <20250825-cmu-top-v3-0-8838641432dc@gmail.com>
In-Reply-To: <20250825-cmu-top-v3-0-8838641432dc@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756090544; l=795;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=2df2g9IN7oOC0sfykEjTkphnVetjockwFMLZy2LuxV4=;
 b=A/yVUUiKRVePKRaqXd47r5mm5InUjJcPlyuKZkCSUCkmKBB+9bujb4/eGiMGtpAzfM0nWZ6Ts
 ga2ux8v2jrpBIdllASi2JEYnDzBb7vl1f/5qwbKFRQmYdec4bdzpisJ
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qZrip2idhSTNQABELWG6WKCrg9xOKep//pV9JGKmW5k=

The new clock IDs have been added and put last,
it is necessary to change.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 105ba0363..59b05ea55 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -17,7 +17,7 @@
 #include "clk-pll.h"
 
 /* NOTE: Must be equal to the last clock ID increased by one */
-#define CLKS_NR_TOP (CLK_GOUT_CMU_VRA_BUS + 1)
+#define CLKS_NR_TOP (CLK_DOUT_CMU_CMUREF + 1)
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_XIU_D_HSI0_ACLK + 1)
 #define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
 

-- 
2.50.1

