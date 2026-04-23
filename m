Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDF1319617
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 14:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953953; cv=none; b=q041bkPUiLfYsMt+8PibTFEKoP2VHoHaJR0JOS2ZAZ50qH+N9jHB1No/YB5EW0TzRR2uUcfVnGCjJaGe86fdZtxHVXwoAsn0MmeFELxAeDfdPvayxsJNDINuaJgO3sxtQFSzo8F1fMQABtsmPTAmYRh8ixhMVRrYnTsl9oJMhhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953953; c=relaxed/simple;
	bh=kOgs95O6JRaZlEPi/372ZddtgKAq7o8MYF3mwzBuWXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AofU3gyIYFK+2avH+ObdA3UqX72hsRzuT+0rWJnJPMs7BdQCE+3eq4FXtR/O+KvoDwWkwL2fpDhKq3Yvxshq0oJxxho/ar5Y/jiY4gwuQKH3TTeJTxDhkA86BOW4iy83mymr6HtXeCViejYd+95dcHTlD2/gyWGbuE/F698ZhbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b+wahVun; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b+wahVun"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfd832155so4922819f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776953950; x=1777558750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1raj2hLcvt/ctJ88E4Z4hbSzBiYLTxybyHDMre6WH2o=;
        b=b+wahVun3/NbLUQRMC8TDjwlN92mMe3AHCS/m89Lo6YbtSOgcd3CL/531WGd8IniF/
         lO9Y+xk+brKJRlbmxYWpKwHuZdzryhzg1Q2/omBiCqLm4oqwg6MQ89dqAJeymn56yb92
         YInsflWhqTvE27YqLPqjra/23LCJ1ksOE4hc/fuFAObVqQfEAoktTMvP+WNhQJWP7Uc9
         8zV18Dql7UqumZT4FevwL747zeYoymQZq/jQl5URBXpULeilfQvP6mCqWMhJlBmyYZgF
         VGHRtXP85/bjjgHsGTWto+Z9Rhs31EdzcJ5d7DrqEFfCKpEp8a6fMf9NL2rEoroGcqVg
         KHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953950; x=1777558750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1raj2hLcvt/ctJ88E4Z4hbSzBiYLTxybyHDMre6WH2o=;
        b=im4eR8DHAVsD1imKoyQy/J89925XZmIgjuhsjDiVIHoKqgKW+KpXnnQFRrNmR+qoEc
         Ui884xX4FKnEUv6JxrUvh+YaWIyRK9CEja33DdBS9jxTocZHq0EFhIPyjXimOC6SiLms
         MQcGgkb1wkex7dAtTWesVEjLG4KT5Vw2M0Dnq/9KVgBPZswtIEBAWq++zLEuehySEfh4
         Qjbg3MDu2BCk2pkSqGOuX1waG/n161VUkkkNzQTBYDlLYj9z/o6UxgS9VL8saMwvrzQx
         VwM9qC/d8Sp4bFDywrtieViEO3m/Q9ciZb+Iuo5nwe8yVCEieWECk21CeeXLV1S5JPr7
         7fPw==
X-Forwarded-Encrypted: i=1; AFNElJ9WQD+7rkr2g2R7WsyIgA5OOzK30ltZPKTgq1cgcRBqYOmjHdFlje2V+GFZ6Mz+o144/CrC1MRY0WYefeLwX3RSmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgD64/XFCpiRzIoHuTJn25WGr5lbBoWhUsucR0J/CdhwhyA67p
	qmcYlZ05U+oxb3T+AbF0TBLNIgoWTDv3+SUoIGRXBtzhMCNRelyANd7tV6L9bmsOmdI=
X-Gm-Gg: AeBDiev93TBt/3Y8xye+2UYjXFqBAUHwEieZDFakCbVX8azMISQRS6+5U7bD5WUe6I1
	g7oIV1OGnt5sjT74i7YiLvv1xC6auNaGFV3iVYvcp0J8fE36zaW1sVUS/xuelDuU6QysraoxyIk
	fRf/A/K/ljNMZWBPKV/XADcu2DcPhQMQKoaU/0nWap/OPbMcse9u05HvFq05zLcYtPvUu1uTDmJ
	vcWevwC+CU5Xx0OsVULJJFUbcSD3eiXcXEssyZ3y4i55oFaV/LKn7+KU7GYM1lHft7gdWJc32Qz
	m8Q/Kf5hVJnFQDRiL0qLXFrYBFHvSqHc8zgiIDQ2IEbEaf1yBU2cAQcUBeDpSJiVPiwsQkEmwVC
	GzUi8GkJQ5VDfVsz8q+/0trBGB1Eit0E01ui8Ld8ilSOoYsT8EqAPFSDEZcDz2pt3Cor1HsVoTd
	jAVKDQYZDcitaHMxrj4Brkpk32zLhIX7jYY6DNITU5lFYKzlZH8oBeN1REEGtZs8c4nODB7F86z
	GRgeGQG63HNC9gytLKR2oRL0pgg
X-Received: by 2002:a5d:5f96:0:b0:43e:a73e:cc8a with SMTP id ffacd0b85a97d-43fe3e0aa94mr41477511f8f.36.1776953949571;
        Thu, 23 Apr 2026 07:19:09 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm51107483f8f.31.2026.04.23.07.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:19:09 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 14:19:07 +0000
Subject: [PATCH 3/4] firmware: samsung: acpm: Fix mailbox channel leak on
 probe error
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-fixes-sashiko-reports-v1-3-2217b790925e@linaro.org>
References: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
In-Reply-To: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776953946; l=2175;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=kOgs95O6JRaZlEPi/372ZddtgKAq7o8MYF3mwzBuWXQ=;
 b=18HbsNzGpOO8k/tK09MU8TicbRqu3E9ILnKYrDV1cDHGI48yY+5TskCUogS0Dt6MibK/x9cgh
 gCD6yJNK1UnAM7ibtJDYED7qeoBJ+rZZTFISCeBmJY3R1GFry0GLLhk
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified the leak at [1].

The ACPM driver allocates hardware mailbox channels using
`mbox_request_channel()` during `acpm_channels_init()`. However, the
driver lacked a `.remove` callback and did not free these channels on
subsequent error paths inside `acpm_probe()`.

Consequently, if a later step in the probe function failed (e.g.,
`platform_device_register_data()` returning an error), the mailbox
channels were permanently leaked. This prevented the driver from ever
successfully re-probing on a transient `-EPROBE_DEFER`.

Fix this by modifying `acpm_free_mbox_chans()` to match the `devres`
action signature and wrapping it with `devm_add_action_or_reset()`.
This hooks the channel cleanup directly into the device's managed
resource lifecycle, ensuring the channels are properly freed on probe
failures or driver unbind.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a9baed5762d5..896fbdc2700e 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -535,8 +535,9 @@ static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
  * acpm_free_mbox_chans() - free mailbox channels.
  * @acpm:	pointer to driver data.
  */
-static void acpm_free_mbox_chans(struct acpm_info *acpm)
+static void acpm_free_mbox_chans(void *data)
 {
+	struct acpm_info *acpm = data;
 	int i;
 
 	for (i = 0; i < acpm->num_chans; i++)
@@ -658,6 +659,10 @@ static int acpm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, acpm_free_mbox_chans, acpm);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add mbox free action.\n");
+
 	acpm_setup_ops(acpm);
 
 	platform_set_drvdata(pdev, acpm);

-- 
2.54.0.545.g6539524ca2-goog

