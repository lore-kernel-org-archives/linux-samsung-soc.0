Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA4F3C09F8
	for <linux-samsung-soc@vger.kernel.org>; Tue, 12 May 2026 20:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778618464; cv=none; b=B6asUsvqbmSaSggyVDGgdehEJZ7gNyGngm8C0iAeZJEaifzD3DlaP2OdAfHGlfaGPDUtQWJYdi+y5OALMYqmzKgEh9jq4kLk3TRmqDxtBk2skegKZh87Kadn4Ik6U+bgem6/QsWSY0V8cji71Qr4xj6ySihYvPyBh+VgtdTIdQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778618464; c=relaxed/simple;
	bh=KrqDyS0Yy3yf2NMt59+FCaahshEy2irhHS958tZyPSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KVtKIzy8SdFRtWGIQ351yODzQPWIzM8goYf55qn/NPePqxec//F9SczDPiwclfjVhFjwseqOUXjZQDwD1eYLL7tOaAtGnLesHR7am9BYoJmp4mFL7PjiGYICITR5UEVyC6d7wIQTv/SwZ7mor46DGSML35hEr4pAIBmIdXQrSW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fFprHZDC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fFprHZDC"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso36813285e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 May 2026 13:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778618461; x=1779223261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ew8O/tYrRk/rxSyItBEjL6nrUs9soh50rr590jZ80xU=;
        b=fFprHZDClHH9NWIt5gTps4JXaR1NzOx1ZEqgwywIbIopJUvjsu7p/LyfnjPClnMGFL
         uKCQ4bVfgZcl22hoyGeIH7yHqUw2Z0v7vuClN6hCvczdtOaOJYveJ42UvTmtoHHHi9gw
         vnXnr9lrlfnJ3z3JMwuxw9Az4ZyYFzHIkAW60XJnr3m3mt0oBisjya+ce2SVHtyzvUsg
         yal0CxdYQQkVE5rfj27LvtjQ9okygBRUjOlOSyDUaoEWRFYqXeMuMvv7KKzfveHzi0Fu
         hL8S5etBjhiS8rp4diAecEiYQSjYTm4VgTe9rVmm8OaGlcliiYhDSkKQn/+2Gre5RnFr
         iycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778618461; x=1779223261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ew8O/tYrRk/rxSyItBEjL6nrUs9soh50rr590jZ80xU=;
        b=D3C7Z6dkhvKyLGGsZdDzzvIXhv88f+MHpPxkJgZz5+y0VgIcQdLa4HYsunBvpYZ5i1
         PxIRsAPSjc68H5mtxtbD0KJ+C6CobI/WPC09xUMP2ZDJouFGx5fVtTWAFazu4hXtWqAo
         pSGzRj+yJ/xJaOpvFoLZI9WLgbAK/Gd5HACdJig+UreAijVUBElfGErBLi3n4ggcmn0d
         A0pboNEJ6EZLxLsth6MFF7GtaY6aWEQNFWeOkeT5Fi0c1rhRLwiw/Vdg8NcpfrFN9PhB
         JXC2Ni0y95aWqOMO33+eUXTh9+wgKzc5QDY/LOpPjmCgtMboxLdE006gz/GGKf6S5/13
         tIWA==
X-Gm-Message-State: AOJu0YxxHCuHQB5UtookoElX6Wfq1TifXu7hw3icAOzBgzSObXYYjld3
	pzyfDGMcaliw+zp1Mg5mBx804xBo7GZg8HF6JErJSfqyr3EuvKz7Add2DIFznUF0Fj50KHw5toE
	ZZ+PX9Ys=
X-Gm-Gg: Acq92OE/18s18U6Rr0uCRErnnHZ6HansdhqUJJoN3LHEJhugsDDUdKoCjByGBpTMtP5
	BzJmSJiFYV6kuDqa8yo1dPGecmkiH7w+jHAJwtnQDpiuVR1Eelqdl18KJUFN3T4zjC2q0nznzzc
	X1HZiauPBPVQG9aZ3ymh0I3cX9Z7IzpwYkexkmfR5vCmjVzkpmVWiaVGIFmRkhECaxo+18Flm/V
	KNlib9VLIeOQ6A+wQMjjq2MPDa0RII86Hu3rp1vICK7779Ui05zenUnThTGwt+26G9Jio2JrtwS
	zdyuiqEz79YskdZJjMWK5yCq+yOig4LNv/XQetEBXoWbRGZRDznG6jTr2L3l6wIbJj6XMFj1d+a
	lX8G5pIe07fdIST1O5hxx0KqQzB6W3ThWpoeuUuPAwgAWfPx98ZKAzgu7VVenPvOTMjNZitoEnV
	0I/+OmjJpXZ2h3z2ApiMfvnKnC3eZfvIDiM+pHNXBXMBucgtmdiR3mdCWD1zci9TugAV5z9fSNA
	ROSYZIqB3RJIBi/
X-Received: by 2002:a05:600c:3513:b0:48e:635a:18d9 with SMTP id 5b1f17b1804b1-48fc9a34ae6mr5561115e9.15.1778618460190;
        Tue, 12 May 2026 13:41:00 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d21c72sm18788095e9.7.2026.05.12.13.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:40:59 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 12 May 2026 21:40:48 +0100
Subject: [PATCH 1/2] clk: samsung: acpm: introduce driver data for
 SoC-specific clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-exynos850-acpm-clk-v1-1-837532ddbf38@linaro.org>
References: <20260512-exynos850-acpm-clk-v1-0-837532ddbf38@linaro.org>
In-Reply-To: <20260512-exynos850-acpm-clk-v1-0-837532ddbf38@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Currently, the ACPM clock driver hardcodes the GS101 clock variant
arrays and counts directly in probe() routine. To support additional
other SoCs (for instance Exynos850 SoC) that use the same ACPM protocol
but have different clock trees, the driver needs to be more flexible.

Introduce driver data attached to the platform_device_id table.
Update the probe function to dynamically extract the clock lists,
number of clocks, its names and mailbox channel id based on the matching
device ID.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/clk/samsung/clk-acpm.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index d8944160793a..604604b5b814 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -113,6 +113,8 @@ static int acpm_clk_register(struct device *dev, struct acpm_clk *aclk,
 
 static int acpm_clk_probe(struct platform_device *pdev)
 {
+	const struct acpm_clk_driver_data *drv_data;
+	const struct platform_device_id *id;
 	struct acpm_handle *acpm_handle;
 	struct clk_hw_onecell_data *clk_data;
 	struct clk_hw **hws;
@@ -126,8 +128,14 @@ static int acpm_clk_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(acpm_handle),
 				     "Failed to get acpm handle\n");
 
-	count = acpm_clk_gs101.nr_clks;
-	mbox_chan_id = acpm_clk_gs101.mbox_chan_id;
+	id = platform_get_device_id(pdev);
+	if (!id || !id->driver_data)
+		return -ENODEV;
+
+	drv_data  = (const struct acpm_clk_driver_data *)id->driver_data;
+
+	count = drv_data->nr_clks;
+	mbox_chan_id = drv_data->mbox_chan_id;
 
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
 				GFP_KERNEL);
@@ -154,8 +162,7 @@ static int acpm_clk_probe(struct platform_device *pdev)
 
 		hws[i] = &aclk->hw;
 
-		err = acpm_clk_register(dev, aclk,
-					acpm_clk_gs101.clks[i].name);
+		err = acpm_clk_register(dev, aclk, drv_data->clks[i].name);
 		if (err)
 			return dev_err_probe(dev, err,
 					     "Failed to register clock\n");
@@ -166,7 +173,7 @@ static int acpm_clk_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id acpm_clk_id[] = {
-	{ "gs101-acpm-clk" },
+	{ "gs101-acpm-clk", (kernel_ulong_t)&acpm_clk_gs101 },
 	{}
 };
 MODULE_DEVICE_TABLE(platform, acpm_clk_id);

-- 
2.51.0

