Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFE1374E9
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jan 2024 11:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qLGg2FIW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e47d74824so17048985e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jan 2024 03:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704800953; x=1705405753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vxZPYMLwuWJ+eepzh5PLOjCCW10GHjaMLnopFe+mnk=;
        b=qLGg2FIWNFJTO5duNtKFA/I8DDtipQG6/nqKK6zscYp09jWjiVC00IFBzxw+9WRm76
         WtWQeV2k4jg8HBysaF56THI+rHgCuvFfiIybs4AliIeVPoKy3rXfC7KT6eZ8yUaa50HK
         QV6qMYPgRni6XXvP1ETIzcLJbcnnI54B8f2mQg9l4dMGUgMn5m2KdeLineA4NJ9QfjdV
         uoGHHQVPW+dAsMyrMlRjGvJVuVIuombswGIMlKa4MoYetRV5RWcNJKvhzZF82zizgTsI
         TaOrVrJv5R90amXiv7iRUZFq1LpE2XqBkBYXnv7ataQ1mSOCp7yjXOhWr9HarZexme9p
         uULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704800953; x=1705405753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vxZPYMLwuWJ+eepzh5PLOjCCW10GHjaMLnopFe+mnk=;
        b=BcHACNt/U5jzfZwXnOM12YlJWGQ/BD8OcoKyYXQ/dASL1tB6TPSH09s78AaX1gBusV
         2fYAVBbpIEOZkd71bNm1gAYPhvcLk238Gsbu1xEBHIezi4yKmKfIDcJEJz7ORzDea2GY
         iP2wyYiryQQRoO5YeULicL83ZkqRafZLozUZrBo2O1XUYSKKfrQft1LaNVF6uPV3pUTv
         aQgTSVppsTL9HCIPFS767vsOd51ADUJSYngQanPBhl2z8UOTlhubddVv14Ea2OA5aTOA
         hyykNRTi2Nz9vgbIdmkK0/0jwBfzL+73c1woMUV35Y/HvDMBtlLJN7XBNqGNm98rYoe7
         jcFg==
X-Gm-Message-State: AOJu0Yw1dIC9mxwF0VMV0gl7dScnl5k6mImENfmjdbnwFwJQXmczS8hl
	m6KYVm22pF8N/55ahq6bHisiFLhLzMBcDQ==
X-Google-Smtp-Source: AGHT+IG1DOBapLm3Ix9ZZOZXmRqJWhnU66aeD96cCxaEOIOxQjR2abCWNOUTUmzYv57H2br2SAfcqA==
X-Received: by 2002:a05:600c:3b89:b0:40e:3a41:5f31 with SMTP id n9-20020a05600c3b8900b0040e3a415f31mr1412996wms.190.1704800953330;
        Tue, 09 Jan 2024 03:49:13 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id bg30-20020a05600c3c9e00b0040d62f89381sm3335699wmb.35.2024.01.09.03.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 03:49:12 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	peter.griffin@linaro.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	semen.protsenko@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 3/3] clk: samsung: clk-gs101: comply with the new dt cmu_misc clock names
Date: Tue,  9 Jan 2024 11:49:08 +0000
Message-ID: <20240109114908.3623645-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240109114908.3623645-1-tudor.ambarus@linaro.org>
References: <20240109114908.3623645-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cmu_misc clock-names were renamed to just "bus" and "sss" because
naming is local to the module, so cmu_misc is implied. As the bindings
and the device tree have not made a release yet, comply with the
renamed clocks.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 0964bb11657f..782993951fff 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -2475,7 +2475,7 @@ static const struct samsung_cmu_info misc_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_MISC,
 	.clk_regs		= misc_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(misc_clk_regs),
-	.clk_name		= "dout_cmu_misc_bus",
+	.clk_name		= "bus",
 };
 
 /* ---- platform_driver ----------------------------------------------------- */
-- 
2.43.0.472.g3155946c3a-goog

