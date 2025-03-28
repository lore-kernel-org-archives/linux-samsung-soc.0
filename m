Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9552236426
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168682; cv=none; b=IQjiLORwx4+Hi9dUY73h1DBf7bc/Ksq7FkXjyTYCLTUAxgHOerE+H/ArYirh8T6JEsSjiZ+31CLl1z7HQE5sh5ZSTAcohOGCqAx3QHrns835g5x12FMSdHoZqS5RZgg0bUUqBKkk9vFSY8USWJ4bDmBPkHwsAvwqburRqvewad0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168682; c=relaxed/simple;
	bh=OstHPLtut+rInIwPbWUGG5F4uJhc1s8p9YL3Yn+eQfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rF4hUfRKPhYxCGtBYKU9XIgqndYAQrZahdXflFtlG4lYxyJhP11T6tkhD0UgLYEX2WHlcxr1JKNmhAUgHjG8r7pm7urozWjvy6bSqG1Q9juoLzUYOQUXhFNF2acPi8Ek89keazzIQnef9l81iTlEI+NtUXxBZBE/hjABR8DKY6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4SRp9az; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4SRp9az"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so312215a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168669; x=1743773469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=;
        b=i4SRp9azeCw6ildaDM+Jt1ptlEfcVSNAp2jBSKX+I1dZarZ08fJs3bxXIKf0hOgbWh
         ImmY3aB2kP0NihUk7KJdIVezaSIchjQKw9cWDpSuuwu8rCQmd3F3BfWSqKJXalorYhn+
         6WeWWXwAlhG7hYh/I2QQoioykshyYGWsfqO0Q4HxJTUuYow+pAh6xz62s9VR5oCZcFQy
         wJmAipyT4KmD8/rMys7Nx12AfQcOcpkzOtPaWwKPmhIx6ULE8OP0RBCRYMtMD7MgMlLB
         AYw/5IB+1oGEreWhGr4KV+WB6DG2GThA7wBLwI0Khscwqjp3SS0M//P161dMvQs/rlHA
         aj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168669; x=1743773469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=;
        b=B23/Gj7LpjRfekNiBd9LdGesnnesLA45gRO0sZ2raaiQy+RJoPq3nNCvIW7kwQOUm2
         vj5/PAbYV7mLjaywHB45P/2DCy8K8mX8sUOaaP4laSXO5NWGGaZsmvV5+8I4ySwn0Sy9
         TVPsE645+5+/mkSETzi+Mz2Z3xml8EtajUoeUCvVJdi3ZeH8YYBSrtw+xgDjoGzOn5o3
         pOCylZbAJ0o2dxt+wRLnrMbeWF4ipJro6HxmC4Y7CCo1612M90jq1GLy5F+qVLogbWw6
         kg3TfqgBSo7YkjOh6ipQjX5A9lVbxH4Thx7PJhH2t1gUefg0B3S3ewTHOrUi3Q4hJXgD
         20mg==
X-Forwarded-Encrypted: i=1; AJvYcCUAzoRWDGeesbGfx/D7wOgcw53jJg/+e5dHYh5QS6OWUPCN5uH/UANoic1Z1xz4F1MLgZ76FAPzytKhspX+MrY2cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZc9hMExJe9ye3cAIY2sH5eJUJe5PWBf1btXLlEdAL1JN/wTLM
	naLQ3VJiM2B6NqgnmmwM0o6OaeetF7F+m8Fa+ke0tuIxClONCRUNQwxQz1WbVLo=
X-Gm-Gg: ASbGncsC+e8akCXUzEeQOP9jp6D/Vn8aoOwS635BECwsb3SzpJAzWQXegSBhRKYPgtY
	U8OVabJEFusMSRdJ1dToQRoKKi5uWlxH8rIdtUFrvtsR2Iotk2R00sEt+XGRqLY9AumD+iE0Tn4
	IbbM4B7zoenG7xCtZpS8HcfbtV7iTd/BNvExKb07RqgteH9suMP3iQLp5HA4Fbh7v8qD2U3vRAd
	oJ0JB/bUqWD/Ydbc6pO8djIRUeLY5VbhaypBMz4/Xa8stUGEEZL9TEfPw9FJ6hEWwgJTFcZe3Bk
	GEKkPLhbQ9ilRbij8vzRYpUaJ5M0SDvfw6FNgyOdrEJyYgfzlI46jOFsMwmN5G7iO0w81DKiP2M
	qMfJLd2tT/wJjkaBvvLwYZQq74iDT
X-Google-Smtp-Source: AGHT+IGPOuJOhetnhPLDwYjmYCFkw94wWYnGaOGbWSLs66EXrE/s58NfpYkGGvWXaz4pE2WTKd2LXg==
X-Received: by 2002:a05:6402:40cc:b0:5ec:c7e4:b6ee with SMTP id 4fb4d7f45d1cf-5ed8ed2ff84mr7735639a12.27.1743168669063;
        Fri, 28 Mar 2025 06:31:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:14 +0000
Subject: [PATCH v2 28/32] rtc: s5m: fix a typo: peding -> pending
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-28-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Fix this minor typo, and adjust the a related incorrect alignment to
avoid a checkpatch error.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 0d8783577bab4f4ebe61050dbd68387d970773bd..7b00e65bdd9c25b3426f92355f8ea36e66c3939f 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -243,8 +243,8 @@ static int s5m8767_wait_for_udr_update(struct s5m_rtc_info *info)
 	return ret;
 }
 
-static int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
-		struct rtc_wkalrm *alarm)
+static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
+					     struct rtc_wkalrm *alarm)
 {
 	int ret;
 	unsigned int val;
@@ -451,7 +451,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	dev_dbg(dev, "%s: %ptR(%d)\n", __func__, &alrm->time, alrm->time.tm_wday);
 
-	return s5m_check_peding_alarm_interrupt(info, alrm);
+	return s5m_check_pending_alarm_interrupt(info, alrm);
 }
 
 static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)

-- 
2.49.0.472.ge94155a9ec-goog

