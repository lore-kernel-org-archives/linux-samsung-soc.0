Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B953F7A91
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468316; cv=none; b=p4sO+lBvLLCA+ecne3nS/Fi34NC2mSHWOxlfcReEONXe+NiGvCOj/Kx12FJ2787/QQe7HMy+p6AZTdTmN77kqttbwBiQtt1esDdJEkrTkSsPvgESAvMmqn3CbD/op1ilP0FY+1jHrdUXgkFfNMcaQpezNzpJz8IR0IDfo/iwXqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468316; c=relaxed/simple;
	bh=VKO+y19Pmg/NLq4w9DyMkKEZ4ajWvhIqJpQfNSp1fww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHUqwUumQ3gEKblLPND3mghJ9UL4YNbTazTn+YvCwRxiqVQnFXpspXEfo78DgEF7qt7cE+ZnuEMtHIDwRkL6JupK0TosdE/LasUKJdwo7lS5KIa1yIubxfY13Bi2fdy0iCwxn165QHaF3q1xGawL0E1cVM5iSJ/B2cJRkR2Ectk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RObhQBHZ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RObhQBHZ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d64313c39so9637841f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777468313; x=1778073113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGTs6AF8YA/dsJ5X6YrGeOvqR7qYdbsvIoXjGXSTGR4=;
        b=RObhQBHZKGH/M3SfrnL+5KN1fiDASD2bNJ2dZTqUF2mro5nOrbvB0w1EdPeYui4QTW
         42egfXcTEHnpAxQ+R2JJ+nJD/gGVAoYhz8w3BDgLO+R8RqQwjASzQ7iWvZcwtc/G9yUz
         aVReWfn3cmHokNK+fC6aDUZ6ggF2m/jqd94Gvm0vfLt/wxjKS/XnV2kurxHkF75+kPug
         q172prNG1v/RaRVkiofS44GnyPVj04wZLUElkAO72VVvTHljgMg3/8ErS6TkD2fp+XCw
         wTZFmQ15AkSj+/5KvJonRMNL/CzI5xHtHGV+gZ4DPzhWEIegaayYKn11sh/W8pLTd2j0
         yodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468313; x=1778073113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tGTs6AF8YA/dsJ5X6YrGeOvqR7qYdbsvIoXjGXSTGR4=;
        b=ijertixuq2QPJUPzS80MZj3uX/X6rMCEmNV7fHnkWAyef1lhZga4BMzLfFShwWHDyG
         92iLNYMoe9xMCD293uUtq0kDUVUH0cL6uHZADYdzjexMMgk5XvA1SiPB2ra2JS1OsWGz
         THeZrbVLv3Mnxy/eF4fYvdEbO4J1qWOyPluTH5QwiHGb76nJuH0ImpySq6yIghRyyq3I
         B8+gA+eF3cNTdehGEQP/SaEoyYn1ulwG/Wwf67cvJ9OwowcrSVt89uGnfl0ZOobNIQHW
         1XlOb0w461v1PGVdA3vh/HNN6V+LqythuIiX0256PJezYcsvGNV67cxEp1aC8AEeM457
         rnlw==
X-Forwarded-Encrypted: i=1; AFNElJ8Zr8OWVREm7JdF+gNPebmMUTxaficK2QiisbJ94ZX/rudhHC52lRpb+gvIdoc13o+mOXb1/JFo+LgqurAB8OnHqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ2Q0rFQ8IT2z5FwKCzHd0Q+Rpd7tBHCDcVD4G0kLwpgFXas5d
	5O5uK1crwZe9PctoRdqBG/vhaA2pG4eC4FVygcVeS1L6ygeqCG2Z1XkH5r0i5ubjHBA=
X-Gm-Gg: AeBDieuVCc6SP7tvXi9ABoVcTPKFmc68EaBzEM60BkTTk4WPqTu6McOC+V4hfC8SWqx
	Md5f13YnwKiwagN6hTKIqgILHgJmbUojURztmmYSReo9ij/W+NYA5CfJ0FiGjxuh/lcaNqDDlzl
	9THeguFTrRUkab6VGCRdA/1taT1yjRMJJ9SVYSPQhQPSetVpAePeqmPbcL9w/B49KUrtjDREp0s
	Sopqt10alGUBO5f4t4cFV2viasho3KloJNPCXZW5gWx/BV2Hp69xuDpU5i1QuFrxzg0aUc+FYAW
	f6lv2xvWeJLaeKQgLC+2m6eQe7Ays6rsKLdyiufwHLzekrwkSvt1C4bXpeVFcXuU0l8YiSm4+QI
	XZ2GO4aBLxju/BVIQbHwtCddhFpL7DKzd6V4b/EGYI/GvOlYRcPob7/+5YRbG4yChr9Gl5gGmOm
	CC5S4s6G0t2Cx1o1bLa/cYfjBzCYYhz9B1dPEblIqQCp1o2vUI0G05KzKlz17U7W7Zg+NCLKus5
	cS7nksjkrRjcSpRcA==
X-Received: by 2002:a05:6000:2681:b0:441:1ca1:6404 with SMTP id ffacd0b85a97d-4478ee6236amr6849560f8f.18.1777468312985;
        Wed, 29 Apr 2026 06:11:52 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca67b9sm4752867f8f.34.2026.04.29.06.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:11:52 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 29 Apr 2026 13:11:51 +0000
Subject: [PATCH v3 2/6] firmware: samsung: acpm: Fix mailbox channel leak
 on probe error
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-acpm-fixes-sashiko-reports-v3-2-47cf74ab09ad@linaro.org>
References: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
In-Reply-To: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468311; l=2353;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=VKO+y19Pmg/NLq4w9DyMkKEZ4ajWvhIqJpQfNSp1fww=;
 b=1gWFaMA3Cd6Dw7QDwhBQgAQ8DdYnx8S5TmxRBEoW9KCayFmX+XpOy0oYB12RXbvUT0DJgo2Xk
 TeJmSkes8lZCIccs94W3mYrZcqMBIsK/nC7MMT+GLZDKIUgxFTnzRhv
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
 drivers/firmware/samsung/exynos-acpm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index e95edc350efa..bd0d48e9d157 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -529,8 +529,9 @@ static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
  * acpm_free_mbox_chans() - free mailbox channels.
  * @acpm:	pointer to driver data.
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

