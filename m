Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027AD3176FD
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953952; cv=none; b=bquqfVqLtbDNSKl+Y+sEaLLwJT8NbiRssuvg7wxt52ZcviG8NPdrj+QFWBj/tmbr8RGHyLrhbI9cOvhIMu95HD2RqZ0s64LtaOmSCos1JduK+qxdFNPP4bjz6PeU4cE1rU0s1EpqL93C4SJtJQj66CZ5nmQLHYo2PQolvfnFj4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953952; c=relaxed/simple;
	bh=QTePW60Bb9iT8APl2jkQnh+1qmdtoSopKY5nHEff6yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dorsSOXVhoYKvpGenIhx2FenzGDr68aOIhcRDi+n/94mpwFPoyCfd/vOFlz9agyii2y/cdC9fW9dHsv0ZsQc3B+5xT3Kv55d1IUFHOygTcqUMZJrhXy73YO3a++SaneJ11fWp47C4w96OMbyISMYY0Kfr3OmdCtI/gTxkJiXiD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W7df00nt; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W7df00nt"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cf7683a28so4588963f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776953948; x=1777558748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ougqSxlNHpdb7A3xiXDiO/CHpVSWdAi7241ogZispeo=;
        b=W7df00ntvk+mQRmKXe9AZt8KolwsyEVdYYACjCnbAohFJl6KINw/+RDXB/yh6T+wjB
         dGiYavqPiBeF9T8b5HpfqwbU7MCRO9EZnVzlrobBoUDCYMxrXbSmXkZ/W0Ytp9uVfSU9
         GshUBxXq8cNWYXoQpE9XZSwi1yNwZQ7JzHW1S8m42BMVRoxzup5ThmB+JyMZ9WgUCiSL
         9UiPumTu/R0QobMyb5kwVWI6L1ycyTTyYWvxK3lGkWUKVQvKopfTHUnKy0qZiC5qOjDN
         /ecVKxUuzt964REIIFDWySFp70ByzGXM92C/xWMVDD6tnxZLHyHkOahEIuM6FFiEFf7Y
         M47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953948; x=1777558748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ougqSxlNHpdb7A3xiXDiO/CHpVSWdAi7241ogZispeo=;
        b=KPcmGgERcvZg+NT3Mf/0rugKNR90jaA5jIiFg2rTD6FiWPcULARn0szAeUlDb3fgCF
         mwQeMYCp1wn3LXB5OtONtRAeNS3ie8pzb2NXsozwLULGRlAQuxYka9JT4lXRg+TZvdDn
         JM6XO9VAoFFMD6ngs87kT2/jEdRkTMFA7TuDowkKszcVkNXD72hqYeRpTHpLeCxZL3sA
         bpJWq1/ttm3PBAq4Mge/LC9c46sfAVXRFQOP8XuzcHTalkfPG0TeQxgGisLSBfJK9aUy
         TpZHJjSdeL7JCNlDH330iD52g5bzNfZCY3UH9xf1VJ/OdP4NU9gEX2duyaFQgc4FIk5/
         klxw==
X-Forwarded-Encrypted: i=1; AFNElJ+sQtmtLInoI5isBm4tw6UM+gLe36KWa7ld415UHIO3H78BDKLeYbxlnZP0GZ5zcNQR+Vaa1cW6NghftuEK14b4dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIBFVz0Pam2UYZmev5fmJkWkb0tgalbSB0O2ih0H7dSHb2CI8N
	N7fvrfY7ed9VqVZqpQfpVCkwQUPXzUJLeOt1mSGrwytaMnc0gqzF4G219hQuYtw5DN4=
X-Gm-Gg: AeBDieu1PRiJtzSNBpFXGix5JcJ9WdbOIqoZU/DCIbOQn+mNjjVEGdF5WByj25/0v2Z
	qr+e1hAzZJbDKp/4FS6u+NSEnTYC3HyHp9N0KoZu49alvvmF3x4UUs3sUI2L5LkXtPA6V4lOmvc
	0azIlpYla2nC6zYV7O3REnK46UmL8mekkgShc3lBDQ1K3fThqtDhohSOE+cvbZwXTjrZgfe1rBN
	d1JpvBJJl9Kf4FOGR1TarWN6gjNijCUYfPNeWrsducXxV8D4XutyFKz7BWTvvRW5Yd1BAOLROXc
	3QEF+yAnOzJFhxbwHMsj/dHMZZQlcCYcSipcsivyo2kFVIFXhwEtGQH1etkN8lKviuW4zmDgw3C
	bN9y8t8m3jfGt8f/JTDh5Ahhq5irkcJ9fsFtV1aW+xObjUkZ3X7UnOLjGiEh7uJrdFu74Xs0BS7
	BBCmh7FLg4fnfnjNFRsd5vKokK5kqeygNuawKNChF7M99d0I6TXmuAAxhZpCN8aA5HZAnwGwOOP
	/a5CBXnMamGfiLROA==
X-Received: by 2002:a05:6000:184d:b0:43d:e31:68d1 with SMTP id ffacd0b85a97d-43fe3dd958amr43167628f8f.21.1776953948240;
        Thu, 23 Apr 2026 07:19:08 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm51107483f8f.31.2026.04.23.07.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:19:07 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 14:19:05 +0000
Subject: [PATCH 1/4] firmware: samsung: acpm: Fix cross-thread RX length
 corruption
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-fixes-sashiko-reports-v1-1-2217b790925e@linaro.org>
References: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
In-Reply-To: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776953946; l=4319;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=QTePW60Bb9iT8APl2jkQnh+1qmdtoSopKY5nHEff6yQ=;
 b=BkMC2rW8uMPkEzO9Se35YVwqJqHQ3jFFR6ZEBBGYlKTgiIxInLGocoIewycok7IS5US62pYih
 YYunIANvn+aDy7rZ3h/vhoZOl0Kgpa1G/oS+3eA4F8tRxk2AnBpX2IW
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified a cross-thread RX length corruption bug when
reviewing the thermal addition to ACPM [1].

When multiple threads concurrently send IPC requests, the ACPM polling
mechanism can encounter responses belonging to other threads. To drain
the queue, the driver saves these concurrent responses into an internal
cache (`rx_data->cmd`) to be retrieved later by the owning thread.

Previously, the driver incorrectly used `xfer->rxcnt` (the expected
receive length of the *current* polling thread) when copying data for
*other* threads into this cache. If the threads expected responses of
different lengths, this resulted in buffer underflows (leading to reads
of uninitialized memory) or potential buffer overflows.

Fix this by replacing the boolean `response` flag in
`struct acpm_rx_data` with `rxcnt`, caching the exact expected receive
length for each specific transaction during transfer preparation. Use
this cached length when saving concurrent responses.

Consequently, ensure that `xfer->rxcnt` is explicitly zeroed in driver
helpers (e.g., `acpm_dvfs_set_xfer`) for fire-and-forget messages to
prevent uninitialized stack garbage from being interpreted as a massive
expected receive length.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c |  3 +++
 drivers/firmware/samsung/exynos-acpm.c      | 15 ++++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index 06bdf62dea1f..fdea7aa24ca0 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -31,6 +31,9 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
 	if (response) {
 		xfer->rxcnt = cmdlen;
 		xfer->rxd = cmd;
+	} else {
+		xfer->rxcnt = 0;
+		xfer->rxd = NULL;
 	}
 }
 
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 16c46ed60837..e95edc350efa 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -104,12 +104,12 @@ struct acpm_queue {
  *
  * @cmd:	pointer to where the data shall be saved.
  * @n_cmd:	number of 32-bit commands.
- * @response:	true if the client expects the RX data.
+ * @rxcnt:	expected length of the response in 32-bit words.
  */
 struct acpm_rx_data {
 	u32 *cmd;
 	size_t n_cmd;
-	bool response;
+	size_t rxcnt;
 };
 
 #define ACPM_SEQNUM_MAX    64
@@ -199,7 +199,7 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
 	const struct acpm_rx_data *rx_data = &achan->rx_data[tx_seqnum - 1];
 	u32 rx_seqnum;
 
-	if (!rx_data->response)
+	if (!rx_data->rxcnt)
 		return;
 
 	rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, rx_data->cmd[0]);
@@ -256,7 +256,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 		seqnum = rx_seqnum - 1;
 		rx_data = &achan->rx_data[seqnum];
 
-		if (rx_data->response) {
+		if (rx_data->rxcnt) {
 			if (rx_seqnum == tx_seqnum) {
 				__ioread32_copy(xfer->rxd, addr, xfer->rxcnt);
 				rx_set = true;
@@ -268,7 +268,8 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 				 * clear yet the bitmap. It will be cleared
 				 * after the response is copied to the request.
 				 */
-				__ioread32_copy(rx_data->cmd, addr, xfer->rxcnt);
+				__ioread32_copy(rx_data->cmd, addr,
+						rx_data->rxcnt);
 			}
 		} else {
 			clear_bit(seqnum, achan->bitmap_seqnum);
@@ -380,8 +381,8 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
 	/* Clear data for upcoming responses */
 	rx_data = &achan->rx_data[achan->seqnum - 1];
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
-	if (xfer->rxd)
-		rx_data->response = true;
+	/* zero means no response expected */
+	rx_data->rxcnt = xfer->rxcnt;
 
 	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
 	set_bit(achan->seqnum - 1, achan->bitmap_seqnum);

-- 
2.54.0.545.g6539524ca2-goog

