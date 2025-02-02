Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC0E2F3B;
	Sun,  2 Feb 2025 22:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738533894; cv=none; b=ICnT31M1A78xzVE5+4jNaoESb4nun7lT1d2lqoY2wnjI0GmCICCOa0jjGad5hxuDfJSzItBCrh5mmwSiiCa4zt1BcyC5DOR/T/ADGLbo2p0yVX/DROLuofhhQisO5ZVZLYgQJr2+x78OYiWaIg7FvsAmnVTeByVZtcon3FXmmIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738533894; c=relaxed/simple;
	bh=xLpOT+pnlMKKjkqg84cHkVtwQSmCriCuURRitq28k6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B3gJPEjotKTgmw+5zfy33THZ9Vi86TbPrXlPdmtoC9yW8ClY5WLwSMVfeYwEJDuJNiaN7xonGlh31H7fbVbAxKpfq3SfUsdVTcMdTwag3vgc6A724xXHqMetPIE6IQtkPYXS52rtXL2XMcyRAnNcLJjzH8BbNF/rIyjc1inQ6aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/bkWAS2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/bkWAS2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385de9f789cso2867281f8f.2;
        Sun, 02 Feb 2025 14:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738533891; x=1739138691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bvLRQSNeMyywAL2VZYkzDGhGJ2EB8RE56tLO1zBW2oo=;
        b=D/bkWAS2c/Qkq0LKK1c4dTd7q0sqJqfdBkJej787eau/PQ4VWgwTmtI2XeTlN7R1iq
         k5PgI3D5jCD9IaeV5RecCmqodidL1Wb5N4iAUsnctUuJ99QdZFl1InIIY/MkDey7X2gG
         qjgFzr0u+XuMkJ6f863heOXnl/lF941TC8Ug1t9QM28pjll/f1/4bosYSusEt/glCinx
         DWjaOGd9BilpjzJnbCBCJdnSwTxVC0jLDVnK+ls1jV8B4txzMjYjasKZkkwne6QN2bsT
         XBDt3sv/Yzq6u+850Xkxv+2ttfyIeNwQW1EMGgb0TwNx/HUxS0jo8+xLZEs/7yebTeSO
         P5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738533891; x=1739138691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvLRQSNeMyywAL2VZYkzDGhGJ2EB8RE56tLO1zBW2oo=;
        b=UnVg+cdKAOmIeVijg70Z9ZT9KTT23ScM0b77TWz7wH6Medp13CzAceaeZtO0WLUJ8j
         cayMnEag8bhBa+O1vjmWt79rWY7Bh1gMOOMBHzSVxqwzmiPXxDe599bGsBJpYsmUZdn5
         UtD5aFdaPCQuqPrkiPGaBDjo7uJvWahjwMvz0SSsr2x4cZePjKLQCeAtxMKF9Rfd8sHm
         wLMj7rIBM9oUpAJlkNqJOtbjOnsMhB4FgHgdv8G5m/PMM88Nd1vJBlFbJBOojTlp2HIA
         YYos58cKpCqAjyNb+WXT7wuYph8d0YlwhZIFaWg5Ddxzxs2OE9pSWptxm6IbSoA6a0Ca
         RxkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkrL3Uqxup6/aAjhJ19mHVPgRu9kROORJobeDlWQF+jzZX9WqC9m/MWqb5/UvWBu1RtiSLT4TRzww=@vger.kernel.org, AJvYcCVsWCoLN8dJbF93ZSVkhf3mQ28erzwd01PkwHbvb4pTfkGBmrd8vgy6UQE5ZEwlWKoP/JSM3LW9GBX8DY/tBE2PmAk=@vger.kernel.org, AJvYcCXxpsOY4IZvCzp3j+Iy2Srb1S3BJ1VTYMSJaZpNPZqv39xHhaIvGsfBgo2p9IhVt0Ae2MsnjuhwGsUrgX8Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxSGIoRz8THuMh8XzCk/G12+phKf5XlWwFLySwHz9fRRR4zVv4d
	+pDGeT25+5t4ApXW/ejPRNHVMCbTmHvIN57K8LojxTqmpHBju+a3
X-Gm-Gg: ASbGncuBjlZWCFwKfzxG9DrBtOr39tRhp1G1czHOcycoAI+pkPyKvQLNNcCT9qGModH
	fhzyIMQyx2bOgXKoN8SoTIS6UWGkPNEuakwpRaSvo/9m5BeOGjRtTWJX6PRfJOfMsVbl/rfkOOh
	sHAr17ybS1X+e/oafHvnnxpOhiJ3o9d71OmlA+5K6F5BIIS5Q6XHx6UzP2Wu6MphTLAxiZOMvTE
	krJIHHbddEOr++eneQQKIPw8xeUDFZ1XHNoMjYIF+vboFM/anI19x1+YO81T5/5mTf0YyU1boDf
	vliWahbAilIKJbBP
X-Google-Smtp-Source: AGHT+IE0+XXDl//rer1jPDvr8EzMd6rwQ+VNhIPvmOGjHUvrqbfJiAxcB7DdPCj5lUCudMn87klHjA==
X-Received: by 2002:a05:6000:188b:b0:385:dedb:a156 with SMTP id ffacd0b85a97d-38c5192f329mr15135346f8f.6.1738533890785;
        Sun, 02 Feb 2025 14:04:50 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438dcc27130sm167892735e9.16.2025.02.02.14.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 14:04:50 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] clk: samsung: Fix spelling mistake "stablization" -> "stabilization"
Date: Sun,  2 Feb 2025 22:04:25 +0000
Message-ID: <20250202220425.199146-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a pr_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/clk/samsung/clk-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index dfa149e648aa..97982662e1a6 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -133,7 +133,7 @@ static void wait_until_divider_stable(void __iomem *div_reg, unsigned long mask)
 	if (!(readl(div_reg) & mask))
 		return;
 
-	pr_err("%s: timeout in divider stablization\n", __func__);
+	pr_err("%s: timeout in divider stabilization\n", __func__);
 }
 
 /*
-- 
2.47.2

