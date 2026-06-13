Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F94E3C583E
	for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2026 12:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781354204; cv=none; b=qGTgYGhjD78OCFTsge4qDUrVmtdULx46DwCof/q5LvEcZx1jUtniqVz9OYxf51zC5NqgvoGCi51cBI9lU2W79E+CUlNMK69Fk7Amw1EzCixj7NPK2ljYWX+opCbDitScjdG2CGV57xgf0feJXvJPHsBAWNAnO2ZPW/KgnI2XePI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781354204; c=relaxed/simple;
	bh=miTCy44j1JAsbaJrI3jZw0x5PRuDRN+dSbWd8toHM6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TiSnMc6H2suEhatlIuM+6WX4ZeBSCFDTYJwR51DemivDopbWimlGmPrHI2EQaaeLejZhsJbNAL9F/ewmiC4JIbXUD7sJW8V/zWqUcRGmVPFPt3Dpzoltub8s0rI4QPBRgOr00+V2VIbXI5xZbasmSdI1Pk3GSeJ19gC8XnxIAN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qEgLlTSD; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qEgLlTSD"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3074adb8fcaso1303882eec.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2026 05:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781354202; x=1781959002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oh7XZBRFNF3Q1qZUCiPu89RvrIopBJKwT1Tf5U0uHtM=;
        b=qEgLlTSDGotFWB9EojU+6rrGw5dsg5znJIDFRE0PQLaAL4AlVY7Jv1dskQ0yM1o6lg
         1CRNW6EnlwHkX/Q0qvpfuTVi650LcbekNt41lbtEnvluW5WIe/UmK9BQj+agXPnQnDEK
         1wjfup4tU35ncPV46EpuSdam1O7x8IOUQ6JTs4/HZMRtpsP/IKBFyMP0vdGeVY10b0Dy
         94HVposUzyh9YoxR+o4pPWgyZNzAGrhOLijjYYyXnAt0WmqwYlYR09IAw4iPZC/g0JVn
         ia/kBDTHQ0b5IvgkwgcugCO5KT2hD5p0XDeiEtOdWWD5496c2Tu1dSA3uszHfSAkJm1J
         N89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781354202; x=1781959002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oh7XZBRFNF3Q1qZUCiPu89RvrIopBJKwT1Tf5U0uHtM=;
        b=IK1en8Suo0j8wV/lbJS3kWPiNNoQgAa9SiFQisvc3u/fWDvHjEDqD0VADsoKBRyTks
         uPy0rfjizH/ctX2Wh+yFsQh3t8PFv7beGSpjRigrW6K6SiqyY4CqCX4vAz7SXQnrsR9s
         LxbmEljE501UlAf9kkkknDg3nIb/6tUqUj5xQk9aVWJ+Sg4WRvS8k3z1YYmduWtSBt8U
         eYA6Vnum2sPBW+ER4QmggtFXEHyjsWpY0BlB7uiDi4GEbQiMbssAux2uFcF8afLtMKcn
         gxXMCd1ZYQ3PNesWW08XKMR2/CNEEeE/Z1dBRkXq7VjBIEaExXhyy8PUSnPkUULB9fwL
         NsUA==
X-Gm-Message-State: AOJu0YxwPkmyD/jI/rgMCHfvU0umkVvuGzH7p61Vsk8Vl2HrcY9o0TJg
	ahicFndFoGHrPZZAYYHpQvucEf8SJBKjjf1TPtq3nJxBeHjsnAaYWShXnOB6kg==
X-Gm-Gg: Acq92OGvfaMwYVgQpwUAE9DjKPe2map5DLS+C89jHL7188xeuO1mFKZLC6DIUiu3x7L
	+2jzSHfsQS8JZPxfVyzxWe5THHxX8PyW3q5rgF7+GwJG9nm+DnnN9LLk9iOadYVqVBS89unw6/b
	4kgfygn/N8/NUNUha6hVlZrfXxSwY8G9BA4CdxAEsY0N6ZenxPaP9vmGaFOj4PhiAu6oExAGU1L
	Of6yQSen136tf40Eio5weO3I4IZEpbKIPm5kT4bpz/LBzOCPJ7VvsLqLjOU+PRMjkt1VrGlGkYE
	GkGN5772/pfFY4n42Q7isgp6fNKmAPJUFu62F5r7I6VVtHJNolI4nLP8TdOL3RmHfIgvoCbE91y
	Sfz6P+zw11lGToxSDBL5m6nQ4l/UFoYxqVY3PDibNc/wrM3ktWd7xWYkYlkxuzmxrpd6O9EJZwe
	ypabYnfhd7lyJEBnH9LzMg71KiM/tVQEXcixz3gkA=
X-Received: by 2002:a05:693c:2b01:b0:304:8366:9fb6 with SMTP id 5a478bee46e88-3081ff64a9amr3890172eec.2.1781354202552;
        Sat, 13 Jun 2026 05:36:42 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm9176630eec.28.2026.06.13.05.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:36:42 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 13 Jun 2026 07:36:16 -0500
Subject: [PATCH v3 1/3] dt-bindings: clock: exynos990: Add
 CLK_GOUT_PERIS_TMU_SUB_PCLK
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-exynos990-peris-fix-v3-v3-1-2b230db78ae4@gmail.com>
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781354194; l=704;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=miTCy44j1JAsbaJrI3jZw0x5PRuDRN+dSbWd8toHM6M=;
 b=cGHudpsuDr4dmEXiqgk4rHAdC5Scnr9s5I+xmQapgQwg9WM2IKjiyONnen2h6xyEJzoB3fPXI
 P//x7ItggwFA7Zu3/Ft7OBNLTnVlO9mc14jJ56iS3njjJLozCLp5HjY
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Add the missing TMU_SUB_PCLK clock ID for the Exynos990 PERIS CMU.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 include/dt-bindings/clock/samsung,exynos990.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 47540307cb52..c06f591d9d90 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -434,5 +434,6 @@
 #define CLK_GOUT_PERIS_TMU_TOP_PCLK		17
 #define CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK	18
 #define CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK	19
+#define CLK_GOUT_PERIS_TMU_SUB_PCLK		20
 
 #endif

-- 
2.54.0

