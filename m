Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C702F39A818
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 May 2026 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889753; cv=none; b=O+vdBbBFpV4g/ITiBF8Jcaqv/JGp1AJXDr8od0HdE5C6L5UmkhyTaALgGY9Pw+xI++Rgk4C9U0hnVxF+lkRNDLw0NOw4UnFkhJ26F4OI4JYKYLXec0eGpXP0e9cR+Gv6ddCvNlVkE8ckZdN9n5m+LVXOdlt1TV+A+ZAKVn4ppmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889753; c=relaxed/simple;
	bh=tcFrmEcYu2tzuwg42FiZIub27Jmrw6YPYJg6B/kafic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eI6zL8ODsCcZm5C8KqcaLGy1NMQ6W5/ytzCN7/sdYr0TydtvF+mP/HQZ4+G28pHdXQz2n0dIMNtXW/LjsIuHzSSym2bPtmtCnQ0djmQcIirYXV6nWIf5xC7Zqg2twxVqJUW66Db72Pg5Y0+tMRhwlHAO21kFmEcEnhmFUcwqyvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L4nCdkCH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L4nCdkCH"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44e1860558fso529299f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2026 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889750; x=1778494550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeMW31xh2IrRZGJdOFJPgh5TF/3iY7D9q0BMKHUqLFA=;
        b=L4nCdkCHEkKnnSoaNFynUCHf8bKZgoyV5BGM50zZV1uRdyJNP1kCsQqaoXoXISyzaO
         GKcmdpGcydYeiIWJcceoSCJjv6tvs/0Uel8QK/ZJk2PoaFhFwW1o3H2pP2mEI8GogqkG
         pPdus302M1aqCLfN2aJ2hkkPAg4j4KV30oXi1uCjACiSZQNgx9TqfTniMHcIf+9+KpEg
         TfMw7zUoBya6PgX762QH56ta43VPXVjBOFzun1YjB8xFLLJVlOpYOzlgdmLT9iKaXojl
         dRBu1DwusTe7/D/LWPr8xD19R5l09mtiaigespV1KnGNgykwCHg9BNv2zlcQB9htHTXt
         GYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889750; x=1778494550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yeMW31xh2IrRZGJdOFJPgh5TF/3iY7D9q0BMKHUqLFA=;
        b=YHgy1pRbbyPZIjNgJkx8CLMBZV0PMNEj0NnSXTr7mu35QP8ckr3ufUyC4vDEw/EEV/
         ofC4pqIYKnqI7kcPnRtZJ9/52+fAdf39UuwaazOFzg5KKhhfYO542xO4K2oz8uphb1Zw
         Jq+4otxGtcxsSE338lhm5zOi15y05ffVTsoxYhT7nnzbFyjHvGQc7aJ+j0KTddEQbY5Y
         RpVwZtmubONWatP+PFa0wexUdMhZZ95lzU9UdACaiVfAfnxfzZbZnkF6TlD8QbrHJpkZ
         stSgbLogSUOUK9wH6pHaJ4JJivolenMG3xmEAX0k90Da+TXrzKTPJvoVCWTmCm/2yiBw
         Lv5w==
X-Forwarded-Encrypted: i=1; AFNElJ+xQtg8NYo4aBTo0EJG616FpJLsNID0mqk/q2ZVxXawzVF4tJqYQ56zVvr31SAkSPmJu7MUvnJ0YFQmOfFbT6AH1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZLIIeh33QP/FP7q45iNxeoY9jqx3u+tLbrRfsocpF7TicwsFx
	UWJtXNIBXNQ/MJPCjLWDDGG1XF7cn9/QzcEOwD19DqKMt2So5HYizsPWZGv3N636DLY=
X-Gm-Gg: AeBDievPs26kpmxIwFwJFqOu+yRsY12eu+avNK/wdUCbgcgRKZdGf3kQHleLjRPTnHu
	BSunvBTj4Hqn7Op6/RVOQH9c9FE1t6ypFb5dacBp0dpxTfgXq3ts1cSufJ4HkJc83Uuq937eS9f
	wAH7cbQbZSqBS9e6rf6RdPSgxF/Ef/k+cDayiMSlJjJDx0tcyBzubD+dTlBFN3Z8bAt+ol1Xugr
	dh/6FuWyyg5dt76MtErGEFt4NGe2LkEGabdc9VEb9R6Mdyc94cOx8/PGSHkO7I8EkBUDX+6WBbh
	C55EYwI1k4YcHMNWfshXu4O6Q2ye1BRZl8VXxKID6H0p1CukNa1nEqnJ5vbv1XCbMhE49SDkTaO
	wl80kHHqEdIv0eIfEjqHPRIFFmWdSQ9/mOCbw7DIlnc9SW1IhsHQNB9FmhuFKvakyYs/+kShyq3
	dD2Sr31oIyf3eF1haim3APerraZzwMc3s4XNSOkP5cgCYTIqa3aekonGQHvjckegnHzNdx56jZN
	Mb0U5+DVPCLn9e17A==
X-Received: by 2002:a05:600c:4450:b0:489:fec9:a17e with SMTP id 5b1f17b1804b1-48a98874d1emr142393595e9.12.1777889750219;
        Mon, 04 May 2026 03:15:50 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:49 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 04 May 2026 10:15:48 +0000
Subject: [PATCH v4 5/7] firmware: samsung: acpm: Fix false timeouts in
 polling path
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-5-529246be6b2b@linaro.org>
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=3926;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=tcFrmEcYu2tzuwg42FiZIub27Jmrw6YPYJg6B/kafic=;
 b=byoTnQZ9OiajgkE1qADTMGG6v0P5Fdr56zuMUYOg3Q5Dhm6jmJ3RlDch4Q8PEZoRRi3hYRceW
 mdaoebfXMCoDO432C7dm4UjTiQdSX8QI2aM9laroHWs4R/gnxYG+MEt
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified the bug in [1].

In the ACPM driver's polling mode, the polling thread waits for a
response by monitoring the globally shared 'bitmap_seqnum' using
test_bit().

This creates a severe bit-reuse race condition. If the RX thread
successfully processes the response and frees the sequence number,
a concurrent TX thread can immediately reallocate that same sequence
number and set the bit back to 1. The original polling thread will
wake up from its udelay, observe the bit is 1, falsely assume its
transaction is still pending, and eventually timeout (-ETIME).

Fix this by decoupling the polling completion signal from the global
sequence allocator. Introduce a dedicated 'bool completed' flag per
sequence number slot. The RX thread sets this flag using
smp_store_release() once the data is safely copied, and the polling
thread waits on it using smp_load_acquire().

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a9449bc33bd0..ad677962d10b 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -106,11 +106,14 @@ struct acpm_queue {
  * @cmd:	pointer to where the data shall be saved.
  * @n_cmd:	number of 32-bit commands.
  * @rxcnt:	expected length of the response in 32-bit words.
+ * @completed:	flag indicating if the firmware response has been fully
+ *		processed.
  */
 struct acpm_rx_data {
 	u32 *cmd;
 	size_t n_cmd;
 	size_t rxcnt;
+	bool completed;
 };
 
 #define ACPM_SEQNUM_MAX    64
@@ -261,6 +264,12 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 			if (rx_seqnum == tx_seqnum) {
 				__ioread32_copy(xfer->rxd, addr, xfer->rxcnt);
 				rx_set = true;
+				/*
+				 * Signal completion to the polling thread.
+				 * Pairs with smp_load_acquire() in polling
+				 * loop.
+				 */
+				smp_store_release(&rx_data->completed, true);
 				clear_bit(seqnum, achan->bitmap_seqnum);
 			} else {
 				/*
@@ -271,8 +280,19 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 				 */
 				__ioread32_copy(rx_data->cmd, addr,
 						rx_data->rxcnt);
+				/*
+				 * Signal completion to the polling thread.
+				 * Pairs with smp_load_acquire() in polling
+				 * loop.
+				 */
+				smp_store_release(&rx_data->completed, true);
 			}
 		} else {
+			/*
+			 * Signal completion to the polling thread.
+			 * Pairs with smp_load_acquire() in polling loop.
+			 */
+			smp_store_release(&rx_data->completed, true);
 			clear_bit(seqnum, achan->bitmap_seqnum);
 		}
 
@@ -318,7 +338,13 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 		if (ret)
 			return ret;
 
-		if (!test_bit(seqnum - 1, achan->bitmap_seqnum))
+		/*
+		 * Safely check if our specific transaction has been processed.
+		 * smp_load_acquire prevents the CPU from speculatively
+		 * executing subsequent instructions before the transaction is
+		 * synchronized.
+		 */
+		if (smp_load_acquire(&achan->rx_data[seqnum - 1].completed))
 			return 0;
 
 		/* Determined experimentally. */
@@ -384,6 +410,7 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
 
 	/* Clear data for upcoming responses */
 	rx_data = &achan->rx_data[achan->seqnum - 1];
+	rx_data->completed = false;
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
 	/* zero means no response expected */
 	rx_data->rxcnt = xfer->rxcnt;

-- 
2.54.0.545.g6539524ca2-goog

