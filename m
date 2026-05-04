Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A3838D69D
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 May 2026 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889751; cv=none; b=HPA0ITdhLvnP63h46OIWdMtl6VOmE3WfOAkof7lyRt0Mt64xSy7feE6rf67uzkbLWgdqSYlb94bgTog22SNLdu8Wu7KChKK4Z735rWrVCoVy9RlTS/EAy609Vh3fCLUxwJT8Eoks2Su6J8BLTdudUZ6hamRwZ6hqg8mvM8rw8cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889751; c=relaxed/simple;
	bh=d7vm0U9qdAXbH4NbIyamvNnVpjWmz6WguBCwDQ3CBjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MYq3FSZlMD6auRslwfZTPbrM8EvcUOx07NblNm82J9EeN+IKA9IXQV7X+3sO5aNthRpUohsgux4sJfiy8c2Q3sj7P3ZlZluwhbOu0cGOAvgUgjx0mUmiGuhdBj9tg13rBqis1cokYYk/wZ6J78dFNRtjD5wvu2EhjWQD6uiMI7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uDs8mYqo; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uDs8mYqo"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44a044cb827so2524608f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2026 03:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889749; x=1778494549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zXNbcb1r2bmykw+LmN/b7BGBlvkjjNT8szr48jA7Sk=;
        b=uDs8mYqoVfAfiUt5oTZH1g887cUggCLw5tQiBMKpDBcP8aM7kWPVuMv0bqv5k6VagF
         ItbPiMgZjKK3DZ4KKjGEtciqpIVcVVEnkHT/u96SMnn0wwRiBKLvGXn5UXh3iKGhCQB4
         uSqSrpTV7jRCKaxCcdV+7iSVuDbSowtPXdYIoxnnSlNFcGnPqdH5UGOaty5ZIW5QBpkd
         F4m+PVQYO1K3f4PrY3xLyGgCtX3in+zxySdlC04vwDwLIWw6RhIUxJ4naK3tzdeqnFz4
         gXah22So9897tHjSrrwxUGq1RG8BaS3XUWGXzvq1jJKEnvEcE76GQzZx4N0oKkOrspot
         b8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889749; x=1778494549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7zXNbcb1r2bmykw+LmN/b7BGBlvkjjNT8szr48jA7Sk=;
        b=hxgagBD6DWm7V7OJFX8ekq24wbOdq9l9J1WSmOfh6V3JoBiqur8sfAz2o/W751zjOl
         v6KPhsOO/aEeHqTzk+bzdS+8c/H1lYm5c8z44vf0ZgkWltL44/nrXwU/12KFvF4rOS2j
         1MsvlkQ/NIauoNhB0NvUUuj+dCltIubzsipsJ/tBfB3dbPy3fU6yvZt8B6GSC/OaDWVx
         EssT4ciGmLZwRZ6CyEo/kkLufo00IOYNOLjArBWLXGw83nYXhVaDhRbczKvr5X31lZhP
         uwO7IUvWxIUOnejmjHENuQafPJEMXS3clMSVT67z8nUkLJIvvyAMwXEd1m6PvDIifq7k
         pBYA==
X-Forwarded-Encrypted: i=1; AFNElJ8pIxbfoYrN8fDLIOi2s93z4tnHSzMBIls+LVIX2j3UQPHqvDSKlX4vURX9vCDGMjXnpkgxKh6M/b17xBVKDq5FnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkIeDsg5vJ1SqesnfWwvoOn1S0ny6aZB2ro1Jd1+pgrY6byqo+
	TeIfahfC7Ce6uQTKNkTBduvXuAMlkLwJ79tvmRfuwLnYsZVmZyFyH7XnL7okw0ee8dY=
X-Gm-Gg: AeBDies+hlsiDFk6d+H1myLco4S/XwVgE+5SmK1UEhEkeeC7WpVRu6iIonIESLw10be
	BOLHMyR+pFgCEgNu8O9AG+giGCpGpkQmU4bv8hu0kBP6YkF7gPnjnY6g0rwkipkOTLgmz23xmVA
	Ocij/pNgBxkqi1BLdI39KzWH0LLznS3xbs/nQvDhPHouvj2lVOHPZNn1VR9AK/kWzv1VO4WeH5y
	fP3Ys8NsOnzVxP6mQwmzJ4rXTvrsOiLlFHMJuvznV3OiX4X+x6V8z9S7uqikzwfvZwgTXSHi2Oq
	VuozDVrqTythrZT8XOU4Nc30HcahtqaLAERavV/C4JM0BVT0uBFN+jBrhGbdeOOo9ObVFk0JOtI
	T30KPQm3q0xv8IomeblLXsDT4U6hfqKjxa8cYLy/8kHvsc7ZceCDXA9/h1Oy/hxQsBKFaPw3Pty
	fJSgUOA729pbvIllJVxAqAvI4+BHxM8gPNxxD76/8LWDPadLfjN3iiJcBgm/5FxqWkIIkBjZSDk
	KIMpuqKncyHimODtA==
X-Received: by 2002:a05:6000:1a8a:b0:439:beb9:5a96 with SMTP id ffacd0b85a97d-44bb6ab21e9mr15653154f8f.31.1777889748670;
        Mon, 04 May 2026 03:15:48 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:48 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 04 May 2026 10:15:45 +0000
Subject: [PATCH v4 2/7] firmware: samsung: acpm: Fix mailbox channel leak
 on probe error
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-2-529246be6b2b@linaro.org>
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=2402;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=d7vm0U9qdAXbH4NbIyamvNnVpjWmz6WguBCwDQ3CBjQ=;
 b=0rNQ8Y4iQCyOFXljmUsK4qxlKqz8T5lsKjJdTaI1xueZa/M4bjprLdfeJPxcebI5j9oy37Z3F
 lHwd2yowtI2AHXEbLPaxKxhmQ4iqTdhtr+bGVHVA1ymMWJdqABBvTvX
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified the leak at [1].

The ACPM driver allocates hardware mailbox channels using
`mbox_request_channel()` during `acpm_channels_init()`. However, the
driver lacked a `.remove` callback and did not free these channels on
subsequent error paths inside `acpm_probe()`.

Additionally, if `acpm_achan_alloc_cmds()` failed during the channel
initialization loop, the function returned immediately, bypassing the
manual cleanup and permanently leaking any channels successfully
requested in previous loop iterations.

Fix this by modifying `acpm_free_mbox_chans()` to match the `devres`
action signature and registering it via `devm_add_action_or_reset()`.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index e95edc350efa..9766425a44ab 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -527,10 +527,11 @@ static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
 
 /**
  * acpm_free_mbox_chans() - free mailbox channels.
- * @acpm:	pointer to driver data.
+ * @data:	pointer to driver data.
  */
-static void acpm_free_mbox_chans(struct acpm_info *acpm)
+static void acpm_free_mbox_chans(void *data)
 {
+	struct acpm_info *acpm = data;
 	int i;
 
 	for (i = 0; i < acpm->num_chans; i++)
@@ -558,6 +559,10 @@ static int acpm_channels_init(struct acpm_info *acpm)
 	if (!acpm->chans)
 		return -ENOMEM;
 
+	ret = devm_add_action_or_reset(dev, acpm_free_mbox_chans, acpm);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add mbox free action.\n");
+
 	chans_shmem = acpm->sram_base + readl(&shmem->chans);
 
 	for (i = 0; i < acpm->num_chans; i++) {
@@ -579,10 +584,8 @@ static int acpm_channels_init(struct acpm_info *acpm)
 		cl->dev = dev;
 
 		achan->chan = mbox_request_channel(cl, 0);
-		if (IS_ERR(achan->chan)) {
-			acpm_free_mbox_chans(acpm);
+		if (IS_ERR(achan->chan))
 			return PTR_ERR(achan->chan);
-		}
 	}
 
 	return 0;

-- 
2.54.0.545.g6539524ca2-goog

