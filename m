Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF5A3B6340
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067566; cv=none; b=HHm+uaRQCZ/WpFJb8eMfYYanWkTFa3vmcl/fRjyrC0/NrLKe3BZgsdG+9F/YomiKngJJDljNwYjrxHLCLDephckags3bppRIy63bu9u1idkL112rKfs/3I/UcPQbEwPaBKxIjpKRdsgquKQzqbvvPJrrgsi40rG56ShyhcBEhmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067566; c=relaxed/simple;
	bh=InPW5aIoFLfi7L5QYj+FWyGxWg+TtOroOI35/SgGMrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V/dH9L6dWaZWWaOD3oRek4vNJWv5+medghjB2EY9LOubOsQykagy5funZp/FbOw/J99ku+PjK+LdNhqgqgOm7WVP5nlNNDpVtSsCTfdPmEC02zoeolZaSYcvC/scF89XV1dU9rNNwc8RrLN20X4rZ89wSJzrL27zHi7EWxCxACY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c6zrL21F; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c6zrL21F"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44a044cb827so4560573f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 04:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778067563; x=1778672363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvGC3o+HXUBsO1osZIafgMiKf+lkJO3vUojNNgCQ4PQ=;
        b=c6zrL21FYNzEy3XDPYIAPJ+OMWEEd/E8i3oP3CjsPFRvIfDN4YuvBeDip+LUt4jds5
         UfYPpWGtd4g1nRgOB71YAvBOUAu0wgFpiNTwxyeRb92sr58EVDkb/hFAXC9hFu0Y/5l9
         8p9MO9OwUnF1STu75Kj0BCyG9ciVnxrguHN7PK1A2Pue7sVLvGEY6UIqUrzOPChlriTI
         jVeHxTYbdhL16AgxE8uAqI7WKfypImy4rlIHKTBuoFFbl8sNbT7hiTXv28jnKpq6Vfjf
         1/LQFFB3HDIkgaIIQsZF+t8ERpjkmomQwko7nuoh/zaqcR41aDCmAIdk6WkhmvZowTID
         TUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067563; x=1778672363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvGC3o+HXUBsO1osZIafgMiKf+lkJO3vUojNNgCQ4PQ=;
        b=DIHuCQGctKl8iVUG1qy2bVfeF64hhGrFihyi1LvzllOuQnFKnv0LfECy8CzNO5k2I9
         kZW+ebXlvjFQHn/FPmpE6vhmNzH7N0vcbaWkQ6SrER1VBgFXEo5kKZk2bfNS7tLzpIk+
         DGe/OU0RxbeTnx5XFlzFHHqRi7z06Vy2/U08ZJT0sDIMmKftBVjGhzRAgjCHSO/EfA1b
         VKJe5NgcpaUyVCUQB6bUgrr7cbf4K7/OCCkOVChE25BdgKpuhQxmBXZIkL3CpuF2zkdm
         One7DtBkjIiaCJk0u0AJtpO9X4yvPxrfGG6nDw3zBlOxO1+IYem/QMei2zZ9ZKre98qV
         wRpA==
X-Forwarded-Encrypted: i=1; AFNElJ84XUdQgYrKRkRk8R9Pad69YbrDMovVk9WjDxO3iUv3ncw5k84r0lpNMlmGqbSv628GOpBNIVo/lyRr5A4FdMyeWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBL6dHvdfPbjQ3y+jTZfa2tLqi+qEAzyhddOq8FB4F5oV45JHf
	wPRFPJLcZlU7Qll4Cp7Dq14l9bAf+wrBTulW/4R2T3caVQ2aU9/+4L+R6qjF6DBpib0=
X-Gm-Gg: AeBDieu+IGr0hSACYm3wCCPG0+u4gjF8n4tsX3R1g9dom8VnkYqhvqhF2xv+BO7Se+l
	DaBnibvthZ5HQLukmlh1VYUsyLstIoUewTAYVMWm3n0FR2UxXNPqf/CwVHsGpoFgGPFDB3tx3Nd
	c2aZS9wH0601K7SIUencAsMxrST+/jHPvdACJw3VettAlAADikJjq8vcFS5uaBcaVGZSTY/jxO/
	RQ8tG11MhzOqtJNqjuGxvWwnDmkVS6HOwgP6k12nU6Hq02tI+wrq8PTsgHLZW/+HVQugQWIfeS1
	tLhjvybS6WNP5qM5hHl32WDDJBnHxMXlNhdzdvF+ZTh4Et2WUiCaVaSM8cM5r+YvaJRNdHinoaQ
	2Prn4Lpuluv1b5KdlJXDJx1qMh0Bjz0P/zwxWNS3bt2HZaOgerogTN8fQtRFWoMNilt6rgiXWNS
	ga0FnhlM9PtkNmnGJg3moxooGCYxlyWpOXxsLC1lQWJRKU/yCXs9VVT7PvB0W6lEXa+akppAZvi
	NpVbh+UfDaYqioQKg==
X-Received: by 2002:a5d:5d87:0:b0:43d:762e:76ba with SMTP id ffacd0b85a97d-4515b525abemr5169570f8f.17.1778067563093;
        Wed, 06 May 2026 04:39:23 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm11852350f8f.6.2026.05.06.04.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:39:22 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 06 May 2026 11:39:04 +0000
Subject: [PATCH 2/6] firmware: samsung: acpm: Annotate rx_data->cmd with
 __counted_by_ptr
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-acpm-tmu-helpers-v1-2-a9cd5daf8355@linaro.org>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778067561; l=2479;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=InPW5aIoFLfi7L5QYj+FWyGxWg+TtOroOI35/SgGMrQ=;
 b=pubO52w85UBt/AD2Icw0FjZhzPE1/uxNCqZC7wE3gbz3G3T+DYAk/KG32A46kRsJt6nvTwNLa
 uopL717hhx2AY4JcFM/7kgruUPkFO+YPujpA0lG1qTAm3QoXYbGW4Zg
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Rename the `n_cmd` member of `struct acpm_rx_data` to `cmdcnt` to
maintain consistent nomenclature across the driver (aligning with
`txcnt`, `rxcnt`, and transfer helpers).

With the member renamed, annotate the dynamically allocated `cmd`
pointer with the `__counted_by_ptr(cmdcnt)` macro to improve runtime
bounds checking.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 88a06842753d..fac88c427d2a 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -105,14 +105,14 @@ struct acpm_queue {
  * struct acpm_rx_data - RX queue data.
  *
  * @cmd:	pointer to where the data shall be saved.
- * @n_cmd:	number of 32-bit commands.
+ * @cmdcnt:	allocated capacity of the @cmd buffer in 32-bit words.
  * @rxcnt:	expected length of the response in 32-bit words.
  * @completed:	flag indicating if the firmware response has been fully
  *		processed.
  */
 struct acpm_rx_data {
-	u32 *cmd;
-	size_t n_cmd;
+	u32 *cmd __counted_by_ptr(cmdcnt);
+	size_t cmdcnt;
 	size_t rxcnt;
 	bool completed;
 };
@@ -432,7 +432,7 @@ static int acpm_prepare_xfer(struct acpm_chan *achan,
 	/* Clear data for upcoming responses */
 	rx_data = &achan->rx_data[bit];
 	rx_data->completed = false;
-	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
+	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->cmdcnt);
 	/* zero means no response expected */
 	rx_data->rxcnt = xfer->rxcnt;
 
@@ -584,19 +584,19 @@ static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
 {
 	struct device *dev = achan->acpm->dev;
 	struct acpm_rx_data *rx_data;
-	size_t cmd_size, n_cmd;
+	size_t cmd_size, cmdcnt;
 	int i;
 
 	if (achan->mlen == 0)
 		return 0;
 
 	cmd_size = sizeof(*(achan->rx_data[0].cmd));
-	n_cmd = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
+	cmdcnt = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
 
 	for (i = 0; i < ACPM_SEQNUM_MAX; i++) {
 		rx_data = &achan->rx_data[i];
-		rx_data->n_cmd = n_cmd;
-		rx_data->cmd = devm_kcalloc(dev, n_cmd, cmd_size, GFP_KERNEL);
+		rx_data->cmdcnt = cmdcnt;
+		rx_data->cmd = devm_kcalloc(dev, cmdcnt, cmd_size, GFP_KERNEL);
 		if (!rx_data->cmd)
 			return -ENOMEM;
 	}

-- 
2.54.0.545.g6539524ca2-goog

