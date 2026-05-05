Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A87447885F
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 May 2026 13:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986836; cv=none; b=ZNM4W1AnzhMlDL0TUdOwXoxzpUQJTA/isREv5g9Cyh6SGnKaSQ8wthT8IfEz4l01kkTLc/fiE29u63LNjbOwhus7KEUZ10Tm2nKOxVipnb5mRnDNValOWoCup+j/m5kseEc2C5+JiD0ZHxVuZw6inUCW05Rx89yg4iJwJagmH0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986836; c=relaxed/simple;
	bh=d7vm0U9qdAXbH4NbIyamvNnVpjWmz6WguBCwDQ3CBjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=anTW9BbxIrblZ2eW9BEHHwafgqTHu4FiHPXv9QidL38KlWY3NUgrKgdkWUBtRlsbJKyg5/7EozzzhVSg+nIn15j92jZ7CQrQq0Ykm2eK7ihSFbL3sWISVEJvft5IHByG7n7203SyI8bN4aH7U6LSpQ+JSnN3njP2lS+MCj5B5rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mRiYpGEs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRiYpGEs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so50751225e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 May 2026 06:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777986833; x=1778591633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zXNbcb1r2bmykw+LmN/b7BGBlvkjjNT8szr48jA7Sk=;
        b=mRiYpGEs9OyD0fQXYakYqpq+TWwvf+7E/5U0eqHe3Vk60i1xiOjt09M0Z/WYNCC9nL
         ySuvj6j8IELZ1PPaVYqDN8D9nBdg97P4GXIKput02+/AnxSDFLMkDYelqsP0PSeXP066
         ysPlnSP+SUtOTUYrAncX8tNcMSLzrPI/i/sTn60AkdewqQK6MRAkgIqzc7O7/cWND4Ld
         dXRCttF5u3uUm8C0pEDN2zJuUmhcfPavqR8gZzDS5qH66cz48wlH7/TH59rlQvlerZGt
         YnjtiDJ97tbmlLjKhyutJyB0xAkB7ONVayh/MNIdRFinw/tb12PPBjwp/jUg0T1QtrzF
         gMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986833; x=1778591633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7zXNbcb1r2bmykw+LmN/b7BGBlvkjjNT8szr48jA7Sk=;
        b=b6/qMmOY/My4NIkbbdcYKaK9Sz8nvUYJei+xllJdMVQoyDt0hkBjZk5iS5KWgdTp26
         lxhGihsyNjxzt6pPXGdEivP0nC34s34Eqvgn6VBFPNkfNqCh62if6QN+Zc3x5p9GQQy8
         Y4pb5K1Wj0BIFUDytwpagqZPqAbcD82PMRF/8XLycJhCnq7LptKjokmygekHJVaoG+Lc
         +HNTJOg4eqjwH3R4POfAil9Ae9jkIEVrM1arA/xXEMfXBL9WKWuShB5IJd0DZujRK5cK
         eix9ogm7nsXD2VAD53epILDJahdbbTYGw39fg+vgXAAPT03L+B0tLyOMEkipwKEAVGWJ
         M8gA==
X-Forwarded-Encrypted: i=1; AFNElJ99SubdN+5m8jXVkab0LOyGRTin7ntXFFFsmmL0K5ot2Scs21D16Ys5ObntQROgfgvSDJj5XoST7LkBJqbWzgcn0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtzZ+ZE9lsecFSLWk4aoq6V37jQiNjUUiDvtfUGHTCv+gaAtbm
	usp9zMUu7/lfctgkaXVfRoHqQ4NmqWNTa+aJ9auVw6eoO3+Feto9ED6MxhUG1wYEsoc=
X-Gm-Gg: AeBDieu60hFEa+3GfIJOUcdGJrPWjdETuM6OKYSNg3ZqfR3Z/CoOIsgpdpQ7PQlIh+Z
	YC1UDQWWwDK4R8PXWCqUdcD7mh4AbJjukPbhG7jLkq4awu4pzEzhmD91A0Q4xSHlj2AtVKJUuAU
	4ulczEJD+Sk0ZrWs1V2owVDWyJQPSNavH9nmfrLd5OYbAXq73y/QRSyYISoGtSwxULEb9shtLcU
	JngzEiNXStE0SB36wOB1VVLHNmQQNbVQb8F7yNoobbIihpVXvYAxFmQzcdJH3gq7zs8QvpSZVUH
	DjVwnbT+M1qan44ecJAf2SFSc89ugQHcCpF1XJeGsuW0MTgI324AsmJECMJPQ0VC/ENZ3SNFZk9
	TWABnmQKNiVw+IHGBfJuNG92fgdrwigirFoqIpbxc9U/AHkA/kLD7raPJ63hwkwF3u77VOajUHJ
	0Xgc8BiNqFnczdPMq2+sHt3Jes0PJQ4I3q2Ga5S2GR0shoYvMEkvEsC3bqnOLjMEel1eI2AchbA
	0Sc0FsT7tVEltNbaw==
X-Received: by 2002:a05:600d:8451:b0:488:ffb1:494c with SMTP id 5b1f17b1804b1-48d187d9883mr36909545e9.12.1777986832495;
        Tue, 05 May 2026 06:13:52 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm366599525e9.6.2026.05.05.06.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:13:52 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 05 May 2026 13:12:59 +0000
Subject: [PATCH v5 2/7] firmware: samsung: acpm: Fix mailbox channel leak
 on probe error
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-acpm-fixes-sashiko-reports-v5-2-43b5ee7f1674@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777986831; l=2402;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=d7vm0U9qdAXbH4NbIyamvNnVpjWmz6WguBCwDQ3CBjQ=;
 b=M+kZzEMj6dEoppNgvMWoO2zl4Mo+sei7crymfmwR16IvDgC0ez/YRXM/jUFit87zge5NsxBVd
 uPFQNsQWkvDD4wbmvIOaokkFfSWZApxlZ2CSlu0/KocvS/iEc6DU5Az
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

