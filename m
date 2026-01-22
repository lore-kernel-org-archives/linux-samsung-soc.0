Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A0E451075
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096645; cv=none; b=hmfxgAdvVUWSKx33tPWYy0GmTiq7m73eiWgLHLq07QdHKHnYLxwPT0NzxwufrUBoRaSebe5Mr4Sdkgm+SRe99JbS0+SCKofN0vY+p7wDqblE9beNBdqI/tjyeiOgslaSXdG8LoW/DnzMRESFemtqiye4L2rSTFwDiahvlk5oF5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096645; c=relaxed/simple;
	bh=fvS/dFCro9ZHFc5w+Z6ZcYVzHaBeI4A1V0hAZLvZGMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VD5aB9AAMhrpUvVhup4H2gRu7L/VQUxRcPKUpEWGIZxpV1RMu8jw+qLdfDVPFWnHt7aBxk1TZeGw79FSVCK9fwy4oj4z21yk6xzBuMWudgXjD96WhLykQXA0O2rX8DR5wdwGFAzHJ0gNrZnbWF5jPjNTBgUsRXUce7mrFckIeFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q6eXGSeC; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q6eXGSeC"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8845cb580bso108757066b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096629; x=1769701429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHOuCyW6EXubWNPSSTKgH38OWUudqlrjbcjJqHW6R9g=;
        b=q6eXGSeC6xQtTszI24s4UCfblfJr1UGkDEM5OfhYx2iKEskE6fHH5JaSKdz1Q+je47
         1UuyErgGIpPxrpvXA1SaklTDNGGtlpUBR2+kVyOxA7KHEcZznyELDQ7apQP04cSqM14n
         IJORFrwl+bqg0OPkX8IpCDBPCYK17DmZjxCyPIrORiL5IsMv/chmydL9xWmxCLQ4Tetm
         //DIVXiJNVz6BoxiHM4yYUovkTUddK1jB9EhfwJNtAfAjYC+4060egsScebCh6y3qmwO
         F6YiNOIoYCVngPxLz/zCqPbNSokUC7DCa2nKJ4Ke3eYM7mFePbrMK1L1cTpPZz9KP3Yu
         YYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096629; x=1769701429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YHOuCyW6EXubWNPSSTKgH38OWUudqlrjbcjJqHW6R9g=;
        b=CH4wrnkYL0y36AdUH97gLCdXXxbzGHT0kMRDAbjABXnZR9tzZ3izYDNmvF2sUUcTId
         fklva27EZx3SGUA2NPobI8xxsueEg4BFimrcitZvbWKxala1eJIzJ7ArExBYHJiQf0Mg
         vp9iWx3hl5l4sJRwgvzhtUnmXfGNVfiVAk2C2zAEROR3KQZDskyE0FWN5vyr3Mv3JemF
         Vxf1K0QHqZoS+O4cTdM8KuQyUGO0R0xd/HXeSkkUpqFrefl8x0T40IAfGywecM18hoc4
         iPMUW+2/JDX6/IVfYcIrREtNkOjJxiEe+aEIRWFlCes1A3UXq557srr6LQKEGAg1j6cY
         VgAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj6U5TveQ6vayUquzyMt+CxfQGinLjWTDnxdONJ1foIHIzyiV4/Te4KkeLNEyVoJVLn0uZGgEtCBvTkoiS6KOtbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiZljeolM5QArMEuaQoFcsDZhRLXPjULMbRd+RLQJW0ddq1Au6
	ukA5grXU8CjVsMJk+Tz+TB35HRcFWrVCZ1ha0unYHb93JwnOPf4JKJ46K/uiPIdiQks=
X-Gm-Gg: AZuq6aIDvcK5XG4GSxdOxBi0TNPUuWsqc6PHAg8XvznqGVwsmAyQh0ALP+Y7zEijP7n
	MAsjFGliCSLj4o+ZsYvlR3axAZgUc4LKqpRY4N6tJbg1tPIGgPl4Kcsxt57eHSQ5tSvuiHKTy/j
	q6ewjyvJVrzXAIDI6RsDsSXS6CfKWOj7zYJcBxWs/PVZKkU4pACZZhyNwRYH5hjpZYe+ZR2r+u4
	xrvbAIs+l2/MnjSj2YEh5OjYGEKJ0bO6pZ+1Jy0MBSW0mgzKaoAX/+MIDOFrx1Wtcro41qGG677
	MyKqZMS8wiT9joKwauVCya8gpZffRUCju5afjp+nPusA/FOoc38SMj0FBDv167MOXw/VnDI7JmN
	UKBxVjHJUS0MTdy9AGPW7y6GnmJazOzVM1/245prhS6wF214sJRcbSUT7N7uLcHeBjTR01lWnk4
	PDy6tYDC9E/rvzpVMuTKOTt/xNh3OydTtQWakUWLnuJ6vmR5Kg+Tnvp9L+V6fPfmldarmsSmipK
	srsTA==
X-Received: by 2002:a17:907:7ba8:b0:b87:6ce:1267 with SMTP id a640c23a62f3a-b8796bf624amr1670208066b.64.1769096628967;
        Thu, 22 Jan 2026 07:43:48 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:48 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:47 +0000
Subject: [PATCH v7 20/20] regulator: s2mps11: more descriptive gpio
 consumer name
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-20-3b1f9831fffd@linaro.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Currently, GPIOs claimed by this driver for external rail control
all show up with "s2mps11-regulator" as consumer, which is not
very informative.

Switch to using the regulator name via desc->name instead, using the
device name as fallback.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 4a9d70947f17cb7520e0e820d3d1b9eb370ff600..2d5510acd0780ab6f9296c48ddcde5efe15ff488 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -362,7 +362,8 @@ static int s2mps11_of_parse_gpiod(struct device_node *np,
 	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), con_id, 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
-					   "s2mps11-regulator");
+					   desc->name
+					   ? : dev_name(config->dev));
 	if (IS_ERR(ena_gpiod)) {
 		ret = PTR_ERR(ena_gpiod);
 

-- 
2.52.0.457.g6b5491de43-goog

