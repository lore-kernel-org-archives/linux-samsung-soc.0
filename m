Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5726821C171
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168675; cv=none; b=pPaTZ7sc9UXLocgWJ85LE/e6dlBGanybR/W2nbG3J7vXbvsreggLAJrZM55MehIZZ2pp8LC6biqe2ZxYpTqJXhUJYETG+75eUzfWGhpZGzBMB3FdLPiq4v4dsTuvBJbBL4o+FiE7aUkrkSdpG+jfeZkDxVaSjedmP0790GgxsOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168675; c=relaxed/simple;
	bh=cUTy7Xx1YiX1UnRa4JT4b9qKBeo7MuQLQSe/ooLtKqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HCNpEtWUw/I7CNhL4+3JB9PVIOVVos/gnbkUfGo2LBcs1srWNqXqg0TCfH0bUBRPkgT9Qn2BM9ITVWFP4bD1YuS1FJcWAlpM57R9JeCYe6Ud9+omUTQrJiI/wEu2hav4vGV7J5pjYGBF7fdoJnN3gml3paX5+dG5wryFZtn84+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nV1j4V4/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nV1j4V4/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so4054016a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168662; x=1743773462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=nV1j4V4/dIkxhlaR22kwv7O538NCkJMzYdChmNNNyYBx9gYBjA0u6F+qHKjj3HKTSI
         iAdNouE+c8Eu1nT7xfAv41KAsk+auq2GuC+/akczxKWFQmfmX/jc6PIFBlbdmPmZcP3k
         Bzk4Syk3oZBCDIkrUNHm23GHnyFsEEwW46dc6BrGiR6d1pGnPIF1/GTg/rsHaKE5hFQt
         LC7lrJ5cdCBcemqS+R0jAz+ExDU7hYQ7yQpOdthep0D7IiOhi59ZkxH8/qFxyQ0/kehn
         QgC6IEEHVHeNwl1bmRvk0Im0RwRTGWnTeaEAm9K3Y33ExqlUOJfY4jiUPiKYdAhWPgQK
         TqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168662; x=1743773462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=soHRSIpapfT8tAilFf48+zPTsS4Z/e8xhW4NUpI/vJkyNbc4LVG9VYI4UkDDW10brd
         PoY4goN9971YH1MBENycIWxkUUadYgGJtg0L3d6GKiJXOMAHUxqd8MRrq4WDYYHJEzWT
         DW6SHUk90Eupjw0tzYDN9NYzNvJa+JYumIXB/dyj104eFU4R8wcJUXz0AVTuQcMhJzRE
         PewI6VLZ4F9EvpmdleV92tzNUHFzjDSGppS5kbyinYpjrjeuSsrgThxXcm77OA18mzdX
         dghiZMORNccXdXx9UydDyAueAl6VQNFvQj4L+o+L/GBLzC4SzWkAV6nrktrFRkGjxFOH
         QXwg==
X-Forwarded-Encrypted: i=1; AJvYcCXx7AwMccKkwlQisuqG6ReluAl4CsGaIp5D1Z1KY7RTPADXsoeEfvpJ7L9mtEgXIgcrO8ispCo9PE+2j2ShjtckoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybCZma08t5U9BQGXqWpfF4EBEcza3utcfxy7Nzh1PV34Urq/0u
	jcAsybHTcti16I6YIEU8nkg9Be58iLMSyGkqnGlky+yWMXCNniEyow/aFJSPZo8=
X-Gm-Gg: ASbGncs2kc/OPXE+F9mqyGY69lOoiAkcCzjyaZo1i+lfeP/TdVEHTaHyMifUDki+OcX
	GhwBtbelbgCGoU9Kc2iXzxBlsB4XJYvD2vTIOaECtob/Sf4cKG2jtmfbkUquCL9qY7kDf7Lvgi4
	YB1yUTsOE2JKStD4gTocV1Apb08LPxHkN9jcZWHaU/zqSBzMAk58ntctyjCaYjk8jTrQoaLpGI/
	hIrm3F61J4Is4Bl3Aq3fLUiHiABsb/qmKZkdrZnKO59PNU1oEsK8H9ZUZZYpmTq6pm7jQ+iBygj
	AYPRENXldS+/D4Xcg29T4iw6ry0EKxSjmiW9CFFOW9ftF9yN2/HsXUsGr9Nw9KIF3ksMI+JUcvr
	BFmcX1uIGR+70TIj4FPViqi9tZiAf
X-Google-Smtp-Source: AGHT+IENTriv0ZKQDvxOFGqnTo7xSy+uELps+TAzZydZP4h3NfKqEFYmhwGmgFpAh/R37lkn+8E27g==
X-Received: by 2002:a05:6402:1ecd:b0:5e5:ba77:6f42 with SMTP id 4fb4d7f45d1cf-5edc44c9935mr2924122a12.4.1743168662019;
        Fri, 28 Mar 2025 06:31:02 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:02 +0000
Subject: [PATCH v2 16/32] mfd: sec: don't ignore errors from sec_irq_init()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-16-b54dee33fb6b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_init() can fail, we shouldn't continue and ignore the error in
that case, but actually error out.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index f4c606c5ee5a809a106b13e947464f35a926b199..bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -183,7 +183,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 
 	sec_pmic->pdata = pdata;
 
-	sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_active(sec_pmic->dev);
 

-- 
2.49.0.472.ge94155a9ec-goog

