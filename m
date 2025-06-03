Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC01423C516
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Jun 2025 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965405; cv=none; b=PfU/3eB59ypiMGLMMBw/I7uLyRxkDJbN+U0C8Rkq6FXQaS5VVZ1JzQetQuDvonDOxMjZB3VAAcLV6BavXPFs8B6UvEqgUigjTFgOGvuG7T9nB9OSbn8ydqE3028eP36bCTGBHjTYkJzqBlfsR2nn4LD4svH9J/Gs4WezcqwPwlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965405; c=relaxed/simple;
	bh=0/e960cM7qU9YBT+WAzc6pA7trJpgvnwKErk9+qJgkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GN831ViEnKwlmvYj8aOuaezM8TV3M4Oac6P8b1tnKdXKKbvkFePwPbIqwxTihRW6NxwXFS3ZRD6qaDRv2yiRnRrhzhJ3z4zKBVh8zSO9SCxtuBW3QSIjrXOfJ7IaSdKJZY7QUhOow+xjoO4E6OsXJYcpLSL1P0kZh5MDb7mrQEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P273XMMX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P273XMMX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad51ba0af48so1196953366b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Jun 2025 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748965402; x=1749570202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyDAynqsG9jh+cOOc7N5aPAGPcSiqWcSOwtimCSGBpI=;
        b=P273XMMXui2BrL1K6VjKCIGVjjh6KLBxKfhhkLbaZp/N1uNeBoV1jOmiHj2gNVDAgA
         hUofkBnL1GFtogzuwpl0tCI2x3RVOIi7Y//DUPfsrWbaeC/Fhs9mnC7RPTM274NKwn/3
         k/s5I0sdIG35osdAbJmw0oSDeKblNv1CtUyshgihH7qs+q83YxyMbLLCKpWI/81IyCNC
         jQiW4diZ3US7nFyrf8rYGZwBKBaMoUrNQ0l3NlcXp9NAV+zL8OHxfvZ0UM5fKfDbi1zL
         raC0E8jusvu5/asvSPPyQJlNyp+JlnBiVpmL3NPxm58oemcTtxttS7K9f74W4viYdLFC
         hiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965402; x=1749570202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyDAynqsG9jh+cOOc7N5aPAGPcSiqWcSOwtimCSGBpI=;
        b=V8bjSN1HiCrN4vHUb0PMdK2Xnd3pXxA/xBuk/Ra4qHCZenkABRr88WRq5nS9zKfkCQ
         oQQG+YYjBP4OZHK0qWPhfbTe4szr1N8y0wsSuUpSSHyxgvXN2KuyyZmoyZQicgE3/lwZ
         sQXPMIUdykU5gaW+D6Y5rpyKuzd6km5Asu+oIJXz9Xhve7MBH9dVfBvSqQRg+9xL6z+7
         YWTaQ7e0EnmfuedyBXRGIGz4R94ztEHQdWlq+IfIZ3DsTlED/oIdLSvSPNYVtBbCR+H3
         cJdSrLvavXnoAEJFmwkp1YjhyS11QnyFWMoeM41sQMHnpK/HQK6hBvBDmjSaBh9NTcOf
         MRNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgqslg+YA2YhTD/4a1ix28dfLJ1gCnFzhpTfcXi455zyFMMGiAu9Seuvd9bdFQMIaZz1UAbCB5M4qOgiQFmlcutg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc2PZc+AV6ausxxtPFOuGzaBsBiDkiOEzgbb+PS3UqNPXRjP7a
	tdDGouBzzEhZwy6YqkDwXYwtu2pX961EIl9UH9VO18kvll6PbPApxkVIU9UhDCt3QM8=
X-Gm-Gg: ASbGncsCOV9y+OM9RwVydngjVe+RZG5VW8ePVeC5/FSK3+XqRWb9koOGdjh16Zy93D8
	TERNX0QUovJEBvRnRvK/knDWtFHckfzADQMDLOH27pOA7CZAX29OaJ2jop9Ijp5gfnIvyA4su8v
	Zbu5Fz2hZIx4lLqGBDwqjYhiZgBROrtbsi2CdaK98mSMVSCh8Aog5EoS12euQbkq12ynLReSQ8T
	8aTsTurTCXuIV8eyz8TwUJ5VpApyhIgOfZgQcLLDKhmLEeKmAc7b8AMvMk70vJk28lFu3nZgC2H
	MVEhUVVaCjm2J/zuxPlEkj/hPAxdftqJVpDevId76c7N24/QBzRjMlsocpl59M3e1nDLgbnB3AX
	PawCAPrAiS2qJGL1A7LtEfpd624lB4CcdyOs=
X-Google-Smtp-Source: AGHT+IHaS+y52wFsPfn/BGos8YaLrH6Wz7Z3gAJ7jHqi4eOsbjUUHHFwYuM6LlBkTlFWjROGBuJiGw==
X-Received: by 2002:a17:906:f5a3:b0:ad8:959c:c567 with SMTP id a640c23a62f3a-adde66652d6mr315927366b.10.1748965402049;
        Tue, 03 Jun 2025 08:43:22 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de9bsm959277166b.47.2025.06.03.08.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:43:21 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Jun 2025 16:43:20 +0100
Subject: [PATCH 2/3] clk: samsung: gs101: fix alternate mout_hsi0_usb20_ref
 parent clock
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250603-samsung-clk-fixes-v1-2-49daf1ff4592@linaro.org>
References: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
In-Reply-To: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

The alternate parent clock for this mux is mout_pll_usb, not the pll
itself.

Fixes: 1891e4d48755 ("clk: samsung: gs101: add support for cmu_hsi0")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 12ee416375ef31deed5f45ea6aaec05fde260dc5..70b26db9b95ad0b376d23f637c7683fbc8c8c600 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -2129,7 +2129,7 @@ PNAME(mout_hsi0_usbdpdbg_user_p)	= { "oscclk",
 					    "dout_cmu_hsi0_usbdpdbg" };
 PNAME(mout_hsi0_bus_p)			= { "mout_hsi0_bus_user",
 					    "mout_hsi0_alt_user" };
-PNAME(mout_hsi0_usb20_ref_p)		= { "fout_usb_pll",
+PNAME(mout_hsi0_usb20_ref_p)		= { "mout_pll_usb",
 					    "mout_hsi0_tcxo_user" };
 PNAME(mout_hsi0_usb31drd_p)		= { "fout_usb_pll",
 					    "mout_hsi0_usb31drd_user",

-- 
2.49.0.1204.g71687c7c1d-goog

