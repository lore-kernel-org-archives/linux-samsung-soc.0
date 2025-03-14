Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C67202F95
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Mar 2025 16:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970407; cv=none; b=T+MD9mUD8ymVRVsg70J35ZN9ef8zZ7fkFG9OWxhFhzlk0I5Gxb/+hgRTtFpkn4BAJ21qhKzIk1A3GngyZwGG5NgIBHckwb1hYbwUplbqhY9mS0ACmsBIJM9rIhhl5VGSWZNPd5IuKfjQ4e4CmoKlgu8+n6jGRplmgWe90/PEYqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970407; c=relaxed/simple;
	bh=kaiSqcv9xXbQ+flypO0ZL/5TK5gbHyomS/uDIQTFCwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NmWkM13rNKSukva0xq8VlaPFstvV3OsV0wLL6DdZJfPLwlv96Ue04Yu19mf44Hyz70mUc9+Aaa3i3DKwszkwMANf+0aujgsi0Ti9jLsKL4bjhBJF8aQ1LSFmfu8z82uAkdyfur0lxLcYQ6hOcNpXaOxEVuB1/r/TS7d/e8BRb2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ynWrFGxX; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ynWrFGxX"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso6092833a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Mar 2025 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741970403; x=1742575203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhIDu7E2Q2Kcazbx0KU6LBkMGAXZzziiTNuKzlBCpUg=;
        b=ynWrFGxXD0plDUw5jzpcAROIMnP+5r2RLc6ogTYbLVUCLziczreW/JG/2Y3Uxalhqq
         9vB/KmXDFprj+cjBsj2SFMS5tH8GV+4vfG54q0lNCLp/0P2TjVsH3MkSguuWIVHCeiOM
         HE+VaVyCDSYmjoMuk6yXItGUML83ul6l/mgHut3a7kthJwYFjz/SChJngCoTChWX15Lf
         iRHp756TWFlg+5BwSBNDrfJMBW5OoXpPS/tsGcVtH3tQ+iKQkBse2vEgREPpS3I9qxSv
         AuDdnQhEDqFaJg2W0L6D2f4toLl0YQVUDetiAh6Dh9jxx/dI64rR/xJfQTYGPlz8t7PC
         NGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741970403; x=1742575203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhIDu7E2Q2Kcazbx0KU6LBkMGAXZzziiTNuKzlBCpUg=;
        b=AIDLg/hZ7LS/Gn+XF1CrLNXAfn8Dv3TKZyUjBQ4l6zGMuuDfyDzGOmotXPVZG/a7mv
         DyPbtcjQ0J/xH15LmRWViOQAjVKX+wgipo0+uvZ7ryrFCAMrafD9LXjAMjHOk6ROM88Q
         mzlMoiWj1BcNVNWocxyp2GH8uJiIWCH6zKHJexJnYFJhzn8lVXGEyR4qawZ8MoCdUsdM
         dBN1qJm6pe2EpwVN4SMeXxM2FrAdU/VFUkn+Gi3rENEaA87oFUZ0RgTjuVxq48xmmP3+
         d1WHABXFgipb5rq7dffFMEMdV/DaZkyawjBmdP3RsNiBbilxziOJCKFEALmp3YcUVqpp
         zQPw==
X-Forwarded-Encrypted: i=1; AJvYcCWrs+kzD47g2jROqErZrDEU6BvoSBMEEirMuBj/4L7a83JLwxHHWNcQ1INVjMCuuFUxyWi4TRg1Nzt5xaq9W9VPkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUNz/77K3r8uPtimnkryjUxun9vS8cAttTC483jtrnOZyFhqA7
	5Wo6/Us/Bfq09xMQKf7iU0f/H39l171t9tfxZVbq13H/OS3IdNFJfYOUdMVtVho=
X-Gm-Gg: ASbGncvjQS9WI2jqOgEWpx4jVQm0VsZP5YmG2YhOLYZGE6YQnXyodo9YMFys4dsIRfC
	TRk2DejdxGJRNBkAp0NXDslk3AXiW6KhjstBwtBXS2jJhs/I898HtTwYQqhMr+aMeNRmY3SEQ6B
	c++TcdCMjozoXw6bJMwP5dtVBLRyzzswmsYUL91h0vgRNHrUHbbPTNu6klJSZLKvO7+31v1oLC9
	9F2V2HZjwjzZzssRVlaZK30VYlK2cD5AvvWSBCQ7tyWm6De1/zavHhIhTgwQa/FHQElBIRgE8Jq
	6lNg/AF2TtAuZmJ7j8ddHaErdQAiaB0fdzWdxIHis1BIia/sewrNHoO1MBKOMf2stkx+AmHWzrG
	lXqGtA9aotELUNDYvDrMpnP5bU5Ko
X-Google-Smtp-Source: AGHT+IHsoW+BdLyhYz/cgXiDBGGL8Zn1OXVl8nizdj55crxxXTbUykUjSJOPZPoQVfuKYqW9bGrg3A==
X-Received: by 2002:a05:6402:3546:b0:5e4:95fc:d748 with SMTP id 4fb4d7f45d1cf-5e814d7f805mr8253334a12.5.1741970403405;
        Fri, 14 Mar 2025 09:40:03 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816968cd8sm2115727a12.18.2025.03.14.09.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 09:40:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 14 Mar 2025 16:40:01 +0000
Subject: [PATCH 1/3] firmware: exynos-acpm: fix reading longer results
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250314-acpm-fixes-v1-1-ab03ca8e723f@linaro.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
In-Reply-To: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

ACPM commands that return more than 8 bytes currently don't work
correctly, as this driver ignores any such returned bytes.

This is evident in at least acpm_pmic_bulk_read(), where up to 8
registers can be read back and those 8 register values are placed
starting at &xfer->rxd[8].

The reason is that xfter->rxlen is initialized with the size of a
pointer (8 bytes), rather than the size of the byte array that pointer
points to (16 bytes)

Update the code such that we set the number of bytes expected to be the
size of the rx buffer.

Note1: While different commands have different lengths rx buffers, we
have to specify the same length for all rx buffers since acpm_get_rx()
assumes they're all the same length.

Note2: The different commands also have different lengths tx buffers,
but before switching the code to use the minimum possible length, some
more testing would have to be done to ensure this works correctly in
all situations. It seems wiser to just apply this fix here without
additional logic changes for now.

Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
issue is in linux-next only afaics at this stage, as driver is not
merged into Linus' tree yet
---
 drivers/firmware/samsung/exynos-acpm-pmic.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 85e90d236da21ed76f7adba59caec165138ad313..39b33a356ebd240506b6390163229a70a2d1fe68 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -43,13 +43,13 @@ static inline u32 acpm_pmic_get_bulk(u32 data, unsigned int i)
 	return (data >> (ACPM_PMIC_BULK_SHIFT * i)) & ACPM_PMIC_BULK_MASK;
 }
 
-static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd,
+static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
 			       unsigned int acpm_chan_id)
 {
 	xfer->txd = cmd;
 	xfer->rxd = cmd;
-	xfer->txlen = sizeof(cmd);
-	xfer->rxlen = sizeof(cmd);
+	xfer->txlen = cmdlen;
+	xfer->rxlen = cmdlen;
 	xfer->acpm_chan_id = acpm_chan_id;
 }
 
@@ -71,7 +71,7 @@ int acpm_pmic_read_reg(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_read_cmd(cmd, type, reg, chan);
-	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -104,7 +104,7 @@ int acpm_pmic_bulk_read(const struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
-	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -144,7 +144,7 @@ int acpm_pmic_write_reg(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
-	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -184,7 +184,7 @@ int acpm_pmic_bulk_write(const struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
-	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -214,7 +214,7 @@ int acpm_pmic_update_reg(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
-	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)

-- 
2.49.0.rc1.451.g8f38331e32-goog

