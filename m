Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C6D21147A
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Mar 2025 13:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007488; cv=none; b=QXa4KHUOVIrK+EOv2cid3rr4cuDlb1T7hsPTFJdr5HQnm/2rPGiuu00/e2mCGPME9SkVFiFE6hz3Z8EpX0Gbrn+/iFYQfV5jSEAl6Vbb3q/j5szhOcx01DLxGYEhzYaX/JLh7jmr7ea+wGwAcXJ6Rux1VEeJiCk2hJhwYuFBx6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007488; c=relaxed/simple;
	bh=r0ACFUP8gmClzRtzoxXd/Ng22ZxFYgefb4nyAq8SEaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z641CvWww4bhJW8lZfaZHAWqmtkSseSFfFRulOFwHHOZpbHAeZgvCYy1PnLoMoBKtK194gyBmsnOi0qFvV2Jmh3ldWQWZerzPkxR4urCzcVMteUPHsU1NklI3Ax5AZfsN4eu7QDEaA3vSCT6yHr2X6KL2QckKLtb9x4tiXqrvmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pN4BIftL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pN4BIftL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43690d4605dso27990365e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Mar 2025 05:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741007485; x=1741612285; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kBkIEoZc6BXsEi/Xl/zpbl5kQzqAT2D5l+fVFL9X634=;
        b=pN4BIftLkHFRfR5AiJpuj19pHI5ut4jL33Ps2somyZnfde4kwsmxWa5EWjNccUAGsx
         Aa/vUiFbOV8VpatiTYUh6iIvB36u+gDT8D7B4CalZ9xcEcr4iBDut5N1lqsCfNCDB8Xi
         elv1Lg3eEJ9NUeVlmxFAwC7Tb1Tu9nk4GJmQb7t56JLL3/Y8EWqDzABdZ0OCDqMZn67i
         +BnauNVri/z/ZjPDFShIjaZv+2JNzM2XfKWG3u34waH04tR/tYKETBogDDYqOrLUr3e6
         xhp8k+jDkInJZbIgSm8PruesGfGGWBLDEwVJZE8ZKtaZJZxWOe459VwyTFlNbH/LdBEv
         UVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007485; x=1741612285;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBkIEoZc6BXsEi/Xl/zpbl5kQzqAT2D5l+fVFL9X634=;
        b=dxaVlwORVHS+52RFkMjsKrG9mBcSmL+zOidZ/mSbMK6IN+LnzaFX9NHnFNhCnkfdBf
         OqjsQJxDai7jeJewwT84I4Dfa+XytqOTaSBntT832OYgXT8y7X6a34XxlW14f+ZOWyi2
         KinhfJYbhLKHXHgTxlHQPz8guT75wDMs2xqylIx4bciSK7TSDNUt1ifXohqCGLA2YtCk
         Vov+BPRlZ9dmxPVNmd07klTDOMFqa0C2GeJeZjkvhpZTWhOSWxl+KK9vgJxfcE2UYa6O
         PtIMEO9Gb3gMEQu+6UPJAxYCEwJ2MzSdHq907rj76xi7PIQc/wDsiF/XldAJN9nX50/h
         0QDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCK3wgjqlO9UicY2OqH7ulVW/kUFAA1BQHNHJOQ7/dpQM9VbPJa2C9602uxuIHVbHsEuMsH5cM9cJymnHsA5zmFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGebHHj+CPIc5lku6EmDpwQPCO8Kt5PrrKKPTB7BlaXAzPigbJ
	NQ9zdxrE5jMDLHTNZjGoRL+GV+SZpAQDFUbb0HYnUZNaqXOyRmI/27REs0ByvoCvH9rkdNYHpfc
	T
X-Gm-Gg: ASbGncuYuX2JKhXWZXQQbt5dKV4K5Ys98oP1z4eFc2xT8Lo1iK5n9U0t1gvIOkU1q7U
	Zi9PkkPQFLyixUEk01CLtiXahMSu/pAFJdjvnNK4gXN7teY1nHf6TiaZ7eiYjGQy7dXTh06+8pv
	RdkycIkZw2GgjVf9K+wjnVLatO0ofZPnwHc60U8BTcFhprkp+gvdchXS+BJqRpo4GxCS1UOINqv
	fIAwGAuk5VO8CUM0CMs29f7sAW0W9AnM6uQHlaw0ra3ZfW5AGmG5hpMUM7W8EMHuv/MeIbgsihm
	z8XcIv4GxiOhLoXRZbqSsrlThTV9gt5aHi1vwWCaKp2gUsdicXOY7C36HVSGSqYZlM1HfNLPeek
	=
X-Google-Smtp-Source: AGHT+IFogfy4vTLX2D880m2Emlv1b0QxLptjPdeT4ir4OaH0lDrtdJ8Ijk5zG3y61SkNW3iZImJ9Gw==
X-Received: by 2002:a5d:5f96:0:b0:38d:e3e2:27e5 with SMTP id ffacd0b85a97d-390ec7ca98fmr10768345f8f.5.1741007484699;
        Mon, 03 Mar 2025 05:11:24 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b73703caesm158307785e9.12.2025.03.03.05.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:11:24 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 03 Mar 2025 13:11:21 +0000
Subject: [PATCH] clk: samsung: gs101: fix synchronous external abort in
 samsung_clk_save()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-clk-suspend-fix-v1-1-c2edaf66260f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHiqxWcC/x2MSQqAMAwAvyI5G+iCWvyKeJA2alCqNCiC9O8Wj
 zMw84JQYhLoqxcS3Sx8xAK6rsCvU1wIORQGo0yjrLLo9w3lkpNiwJkfdNo3obXOdGShVGeiov/
 jMOb8AUPfVtthAAAA
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1935;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=r0ACFUP8gmClzRtzoxXd/Ng22ZxFYgefb4nyAq8SEaU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnxap7U2WN1YaRHw7W9uRbiu+2fenuf1A5eZ5Xs
 bFL73mvclGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8WqewAKCRDO6LjWAjRy
 urfgD/9/FuIh/ujTyKiv8Fzda0+kpo71fe+GrwZib/NQ3obhlvSc2WG2XGPhRQqKlMOt+DkEN5R
 pkLY3fshHXDFGhS39zEkhSA7qIaltThWozUvf38use4WQqs4eriaJxl2vWe4+s2/uztjluGDzsO
 3h4ya7IYa8MwskiloUzzctUj72lrg1OatkYUBxed0T8dky1XnyAMxKJhvDO0b7pleAuVzbEaY6J
 HOpd+dJS0SoZXlir3FNdpL1Tj9AO40Bi+GtLOYFu2qoBsIpAvgfZgsWkKgudL4fatx1TyChxbIU
 WciyJusPm8nN9ZhblpHBPvx1TZBYKTqgSJH4l49LreqaSvPkll4IiVBtYdiTii3WKT/VYKpEQLm
 eS1C0DH11KnPbQGXvk9hqQk/Hvnrwy/8H0By6KghKQZ1/KmpHEIEK3SzD9iYzK6ipbaMi53ihFx
 MQ5YkGLXWljT8CAnz8WiWR+kP5Rc0ePEgX1/AH9j28xALgYmvS1oLEefx2divEis2r1ubctopys
 xXiMu4ffHKQX/TM6zqkIFpeoXMvS+S/DjCpYVPeixRCu43QIBUO2/cSWIH8ArxA8OLg3vIZyTEe
 n5W+B9NFHjIOfmXhKKZnbNo61bf2pAIkXP7TZPPB6X2Moqeo50SGuhjSusHrW7SMp9zX4j8mjvL
 eagVef8tl5/9+hg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

EARLY_WAKEUP_SW_TRIG_*_SET and EARLY_WAKEUP_SW_TRIG_*_CLEAR
registers are only writeable. Attempting to read these registers
during samsung_clk_save() causes a synchronous external abort.

Remove these 8 registers from cmu_top_clk_regs[] array so that
system suspend gets further.

Note: the code path can be exercised using the following command:
echo mem > /sys/power/state

Fixes: 2c597bb7d66a ("clk: samsung: clk-gs101: Add cmu_top, cmu_misc and cmu_apm support")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Cc: stable@vger.kernel.org
---
Note: to hit this clock driver issue you also need the CPU hotplug
series otherwise system fails earlier offlining CPUs
Link: https://lore.kernel.org/linux-arm-kernel/20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org/T/
---
 drivers/clk/samsung/clk-gs101.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 86b39edba122..08b867ae3ed9 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -382,17 +382,9 @@ static const unsigned long cmu_top_clk_regs[] __initconst = {
 	EARLY_WAKEUP_DPU_DEST,
 	EARLY_WAKEUP_CSIS_DEST,
 	EARLY_WAKEUP_SW_TRIG_APM,
-	EARLY_WAKEUP_SW_TRIG_APM_SET,
-	EARLY_WAKEUP_SW_TRIG_APM_CLEAR,
 	EARLY_WAKEUP_SW_TRIG_CLUSTER0,
-	EARLY_WAKEUP_SW_TRIG_CLUSTER0_SET,
-	EARLY_WAKEUP_SW_TRIG_CLUSTER0_CLEAR,
 	EARLY_WAKEUP_SW_TRIG_DPU,
-	EARLY_WAKEUP_SW_TRIG_DPU_SET,
-	EARLY_WAKEUP_SW_TRIG_DPU_CLEAR,
 	EARLY_WAKEUP_SW_TRIG_CSIS,
-	EARLY_WAKEUP_SW_TRIG_CSIS_SET,
-	EARLY_WAKEUP_SW_TRIG_CSIS_CLEAR,
 	CLK_CON_MUX_MUX_CLKCMU_BO_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_BUS1_BUS,

---
base-commit: 480112512bd6e770fa1902d01173731d02377705
change-id: 20250303-clk-suspend-fix-81c5d63827e3

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

