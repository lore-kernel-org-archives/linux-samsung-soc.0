Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9291B132112
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Jun 2024 22:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719614118; cv=none; b=iRhs8SkHkmklS+UUKp4fWupvgsSzReQgbk1PAnJY5Zh44L79D6ig0IE1ckZPw/3cMCcQv5GYsi66tjePa0abT4hUs5q8LFSZXV7QOK/uNyR8/7Hfj8VXHBNRv9L1i70m06k550TATRfcfuiy7BoeFiePiDuFWH483Mty1iegRNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719614118; c=relaxed/simple;
	bh=PApABQ8Ns3+kJP3W0ZfRrX0JhAAa8kO4F6PTGhhK+4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oU4CH6HI/2AJ2dx5pv78qbFMD6F+wuSu8Z5rgKFvk6Q3uU3NQXHTj6YMnyExTc1ZNVC3Xt0iwidNZcyv+J+5o+y+h6ROEWHh8fyFMShwzVlcednJhDaN8X7ayCWV/zXE971pBz/ysQp2M87OEJ09dGL9B2Mpg8gnG+uwyn9qA2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uWlWMie0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uWlWMie0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4256eec963eso7592005e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Jun 2024 15:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719614115; x=1720218915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bK4GVLftRcx1G43I5RNC1VZ+kMnAGIqU8rAyC3MW8BY=;
        b=uWlWMie0Yso5DTYVxZMXd7OoxDvA3F0ybBEFiZxJcIX8WI21yAImKn8MasHkGIeE/s
         GNY9I3BXv1efa+JNp8LP0OMBxqpnQDcRGrc3sy3xAMNFV4KhvMGctdiS+nCiPLzQR6d+
         enc/EXBTgahMZ6kECjihgc2i/uEMRGskRvsZLDkbi5qXQcSr1tJ1tIvG+gB+X0rhMQWm
         kJ0NQgUM8QNMt4wyvFOE3WJq6uEX0ksSBHV94HXMceiMMoFnnwzHOcbaAf5kvI8A1t/w
         tevENQpqp6EOR0STEc+88dyTf6D5YX6tmcRzqdPdGklrfxmVtpVEXd/aRNwC537KK2c3
         nIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719614115; x=1720218915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bK4GVLftRcx1G43I5RNC1VZ+kMnAGIqU8rAyC3MW8BY=;
        b=Xcj4hEfN6+Ao81CTX0qFGljeWD6xJ0aHbEyAQt8SYYeY3hfB6aXhsbKgC7Ruf3OTZu
         6yMo0zL3n+gQH5ahNYOj7DQxWO4m8J6UpTPOuIo3dOnx9JHnEcctRzqXkt1fjt8NqXjJ
         wo/WygCz6vbsu00GqrbkwJEoqvqo7FnyUDzv5K7fl+uvtRcdMEJfzPvqmOe11DUjaOF3
         I57okN0o+wFOAA73De8mws5y7J3uW2J5sLGFZ55SQdXmeCkU7DaTkSVWVrKUikOrm0Pt
         tm3lxifNiDQvjEHMDQlkuD+P3fhtM62pvr0BqnXLlXnl15lCW/JkjlGRN0sZrxzwb54h
         GXqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaNhYnr5iBQREZ6EHPy+f4PLdKWmAb/RFnYUftsO7dZjYUR86b5hvH9IMXZDOk64HFZ8VmuxW/vsN/3KKh9aBPI5XXyckPW6PrsmTWLFFpUSA=
X-Gm-Message-State: AOJu0Yz9ApiVnWgiAv5U23HMMeX99i34lPu7xP/PtXGFIt9ryGSE8kyB
	mr5RkQcT0wfBUAziQhXAttPkZv5jlQM1bHmwooO7OLj1BZU9DxTrhYXArVssoqU=
X-Google-Smtp-Source: AGHT+IGAx/+hg7U8vXysG5fFaJ+7znqTB7jHT7deRrgK6fDUyfus/N4BjGymdOMvzYq/K9V9/QTmyA==
X-Received: by 2002:a05:600c:6b16:b0:424:a3d7:2a89 with SMTP id 5b1f17b1804b1-424a3d72b27mr80778525e9.4.1719614115166;
        Fri, 28 Jun 2024 15:35:15 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510::3aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a043a16sm3496711f8f.0.2024.06.28.15.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 15:35:14 -0700 (PDT)
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
Subject: [PATCH v2 3/3] clk: samsung: gs101: mark gout_hsi2_ufs_embd_i_clk_unipro as critical
Date: Fri, 28 Jun 2024 23:35:06 +0100
Message-ID: <20240628223506.1237523-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240628223506.1237523-1-peter.griffin@linaro.org>
References: <20240628223506.1237523-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The system hangs on poweroff when this UFS clock is turned off, meaning
the system never powers down. For the moment mark the clock as critical.

Reviewed-by: Will McVicker <willmcvicker@google.com>
Tested-by: Will McVicker <willmcvicker@google.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index ba9570f7a5fa..85098c61c15e 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -2846,7 +2846,7 @@ static const struct samsung_gate_clock hsi2_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_HSI2_UFS_EMBD_I_CLK_UNIPRO,
 	     "gout_hsi2_ufs_embd_i_clk_unipro", "mout_hsi2_ufs_embd_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO,
-	     21, 0, 0),
+	     21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_HSI2_UFS_EMBD_I_FMP_CLK,
 	     "gout_hsi2_ufs_embd_i_fmp_clk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UFS_EMBD_IPCLKPORT_I_FMP_CLK,
-- 
2.45.2.803.g4e1b14247a-goog

