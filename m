Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D554A2E1C
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 May 2026 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001312; cv=none; b=kOg4QBbUMM5KVay0Rm4fYRzuSNs+UpWJJwvDH8h7P5oiBjIB6VtyywliQkGp6NkQirR3WabYR4vADKt8a4EmPicr3OxJ7ED89kqDmYT1iHsipvaLi4zGYaJ6V0gv/qvEBwy78R5ewF9ykBu/d13bMQ7RRdnmDcw5kZXpAMjWFas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001312; c=relaxed/simple;
	bh=lfOOkuIV2FBobVlnnDylaAQ9MU8rXE54JgCvXidilto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XxidU/4OJgL1LoUd7PS0Az5sWqoBg1AD8rQ59HbnyRi5zGLt62nyOc84Hrns/1UvEEsAKhs0L+DtFkIqBIS12n2Pu8UDfP5U7KMqUXUfx+obBCKvOkirW4V/czDDSmkEFc5k/xsfDtVENf00xL5esm4IgNB8nGjLI80WIU92UNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M89DZlva; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M89DZlva"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-364f7c42c62so2766949a91.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 May 2026 10:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778001311; x=1778606111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oU5jBJsvD6k1Jx6JWFG09TBpMXR8dm6+HY33LOBovk4=;
        b=M89DZlvatxaPVTeCDQZu8zgk3IQTfLk62Cje8BNqcKqfWvvtUab/Arqliz/ztILDuE
         AEqO4o7QYC3I0xyED17ZIYoXIQ4QEJSZRjwFuEOOpuJfekLR2Oez5pUUSvKGQMzqbNxu
         4KQI6jgcwbJgS29Rqkl+0ahQI0pLPQ7hnpp4/VEYcVqhn3AEUsQgeRGpcuDFuLZftOd5
         b01aVbvH968/dDRauVWBxdwlb3VXQtW2wPEylqsYLybw0Dmq8jIb1zeJAoWo0tyN8GrQ
         OjMckYdzvJmxpz7eBnnx21ReB4dTq35tpqdZBGi71H9cwLhvX020qWd30dFSHpmrnxGK
         dtzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778001311; x=1778606111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oU5jBJsvD6k1Jx6JWFG09TBpMXR8dm6+HY33LOBovk4=;
        b=Rn70EeQI2OkW2lVMVobBdRsKdv8vZ+Mg9b3idvwNKfxCb7A0nozx6Rq6wcARvjLzPa
         1zYUS5eGQFm64j2i23z9mIHiXSwMkPTDWmCG2b5rC4RVB/gikXKli+biiKgFZwgCKEVQ
         yjOppYi7aA3DDw7TzHuOqIWQRRxPBic+amQ4M8co09HQKJPCV/2DwPJCKreCQ8Vxl4AC
         6Oc4w2nkb/k/j1Q13s036GVOyJ6hZC9MMlrHyUavQhON6QkVLfZ+9tMnMSvJ0RAoDKyB
         mdbCEpS8Dez4pWicvNX0BpBRpIsmxiVyk6DJ7jDZRN1gpvK+KIZKaEhr7ley3Vs5+LKR
         FTVw==
X-Forwarded-Encrypted: i=1; AFNElJ8CspAz+zGP0EpvZV6m3DHaHkvvOXcxjM/yYjmBqwr4xY6ONexnbSA30EBwgvxjqUWaZEYIPCVpPNbnpzjIzj/T5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQkzPPmV8tDW+zK3mn8t0AN3jXWtSseQUY9gI4kweCeBRMu77n
	HpJ0qvkJ3iyqXcm2U2OAYZeoc+n4VS+OX1/0ZuTsq/0M3+fFjviB9ArE
X-Gm-Gg: AeBDiesfMrU6JWfbVFEIFtLO6z4c7fvq0kk/HyaAb3n5eAF1llByXb6dk1IqkNDKBLR
	uQGm2sAuzbeoP+87Ke0xVQfQ6KzV/sMC0xQQw+mQC+yGXjTz9QJDpl4+4YTDbo9LnGD3Htm3ys7
	HbQHvBy+519KjxNZzN61U+wBwot2t9yiWfwuWksh1um5zWYLVLvZn9niz3UqCtRnfQFejXdJbqh
	am1Q0vtiXGzLJMYZ9ww6BenevYbzEWhiHLmkA1HnhKeLvJSqiHEpmry7SGKl8NgbsY2PZeKVHMO
	YDF+yGp1S2ONqJrRKkNq5ljyDnByZn5MxpVwkvA8X8BLgaPsauPUAoe8OqVg0PPOi3VAScF44fj
	cgZWKsmSxtkMRi7QPoGY2Jw+LoYZtF8e9snuj716itnFAdpN8k+IHlJznKJLO1kEsDroO1LFMO7
	fEk5LX90MwdOekKfFEm0ciVwLP0p59xxjJR6zT3BJWhKkj2ioTq3evHlQ92EDlkNU88vA6rKW2G
	nPcQ5ibHqxDRD8G7wkj5q9gMyU+7iwqv3y1EWA22mSl
X-Received: by 2002:a05:6a20:6a0a:b0:39c:643e:f062 with SMTP id adf61e73a8af0-3a7f1a1c8a6mr16302989637.7.1778001310824;
        Tue, 05 May 2026 10:15:10 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbbf298sm13414509a12.13.2026.05.05.10.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:15:10 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: peter.griffin@linaro.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	alim.akhtar@samsung.com,
	semen.protsenko@linaro.org,
	wllee@google.com,
	hsuanting@google.com,
	marscheng@google.com,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	visitorckw@google.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH] clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs
Date: Tue,  5 May 2026 17:14:57 +0000
Message-ID: <20260505171457.1960837-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the peric0_clk_regs array, the divider register offset for USI6 was
accidentally listed twice, while the divider for USI7 was omitted.

Missing this DIV register causes the USI7 clock divider setting to be
lost and reset to its hardware default value during a suspend/resume
cycle.

Replace the duplicated USI6 DIV entry with the correct USI7 DIV
register.

Fixes: 893f133a040b ("clk: samsung: gs101: add support for cmu_peric0")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Build test only. Found via manual review.
Setting up an upstream kernel on hardware would probably take
considerable effort right now. Since this is an obvious typo, I'm
submitting it compile tested only.

 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index d2bcd3a9daf8..b44bb31f38b3 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -3921,7 +3921,7 @@ static const unsigned long peric0_clk_regs[] __initconst = {
 	CLK_CON_DIV_DIV_CLK_PERIC0_USI4_USI,
 	CLK_CON_DIV_DIV_CLK_PERIC0_USI5_USI,
 	CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI,
-	CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI7_USI,
 	CLK_CON_DIV_DIV_CLK_PERIC0_USI8_USI,
 	CLK_CON_BUF_CLKBUF_PERIC0_IP,
 	CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPORT_PCLK,
-- 
2.54.0.545.g6539524ca2-goog

