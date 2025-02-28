Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E958326FA44
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751654; cv=none; b=rv4KpM2JgNn5MRkK+JVWY9rd8iB7uw1yVGsVfmdUWguYcF2f612uynnmqsMt63d+iCX8ivl/PNK44VOG+hQuiWgs/+/hG8he1VqDNrXj8wWMRyE0w7kWE5DMIss7ms28yS+YaV5ygywADdyWK9EQ4X57KdjF39SdQp09/FgA9oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751654; c=relaxed/simple;
	bh=csOMxrJ8DUKG8jZ2g+nC3altbQsJLgJ3nzkzZybq300=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fhV09nphEfOKt+6HUePPouA0l7rd79RPr2sUmPYNNnu8lhWLPFh2nngP1ieuQViNq43qa1Np1JA7VXk8F6gEhyCpKOKjZWPluLz6iIb67u46LlwaW01FyceNnIeVmboQHrYWKXEDT/gsYu68QNIT3ZUocTxnzHcimYRkCQMjaQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QOM1+0+E; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QOM1+0+E"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso3821088a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751650; x=1741356450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVgVdQhbC2YyNwH7K95+EhEh/kAvax64uDHN7A2amTM=;
        b=QOM1+0+EeNvhAM/TKJ0qctceEbRr0WzYClZbSW63L29B2imhJlMzgqCkKNBIfQtU+V
         QuQMZtwErSgGydIOWkB6SiQMHnZF1pcuu56uenHSO9qrXuHSg3RPOXwXDmvKt+LmsyfB
         MicOfm81eg7/+heDKjLcIdOmVp/bSiuVMQzUNRlWQ+h6puitUmpTkVbs4ZYgfbY9yzsd
         PNKKXw1ak/dEjH6ymbT2ye1HfL/7SA9PbCXOyZ/Aqw8pC/kZpVoWjDGFFbKmuvLcS6Aa
         dhqVIr+YKq4i9susfCX6KNHJxbwr7MsCCWgVg8T04QKNkSOCVdkhLlQpjvyDz4BtjEzc
         8Rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751650; x=1741356450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVgVdQhbC2YyNwH7K95+EhEh/kAvax64uDHN7A2amTM=;
        b=KujqkSRLBa4dnHxJp7rR1r9lx/AyYirEDjDS/ocYcC7fV6dScW3RWL28lNqIb18aEG
         mJfUYB62ND4onKyn+SyySVJrn2OeXmVllLCJHrQJUYwM7Fo3HBoHnmeHt0O4pMfTQn8Q
         aPv/V6ndVlLg2IZWicCqQRJM6teDb3ednQ+vswU6PxvjHCuBrnIDidyUXAsbaU5DyK8L
         1iZuvUnb8bp4MJ9KztOUvZGZP6JCPDAk4Yk0r7gJ0T/qLjmPpbUOjHZyUbKemGl/D94b
         6LKXB0fEcLg4+SsBR7p8SWd8pkYeY+XpOD6loS7Y2Mjp3S+OEdbLX5wmN5MQX3YP2/+X
         rfXw==
X-Forwarded-Encrypted: i=1; AJvYcCVI4PRVnqRFcWA7+/7kjpf39zv29zMgvLfqe1frA0teyQFD2YJBwS8wO0pW6qvw/e83VricNc1yyHyBYnG1rhOxGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnCih04AhniZfstQwecIPyT4kqV6ka2qmNDaiyA7vThAwd5UmB
	vcB328VqtBbrv1khXwyrd71gYiK4wNKd3QEbHl8C1LJEL+Q6LAHzuan6Iq4cRvE=
X-Gm-Gg: ASbGncsaZ3MkB9xEpZ1R48QcycgRyd13MU3e/3Jb5EgslgTE6DF7ebnsp0e6sUdVnKg
	+AVM4+W6BeqQ9QmYkexQkLjku+sIrgoC/FgwehvNLHpUwCE3dWBQ+sjkzCEjI0WoxI3ifCFr7lH
	YnlV0IraWvAN9OWVmHpXMULrh96DBeSYDU4KXXWX0ynD10UuNQj4oUHL1TK9KYAbIQkMG94Zzze
	ZWyqvLjRlCGOSJcbq6OlFfaJn3i7s+Iaayx5AqaZ6WrKL+cchqCxazyu4WVyTDvVBQCEF6sYu1j
	gVB+Ec49RWLPMLMT2vGkqFDjahOdOl0ezG03zikCE9CgOYc90LnPx8Dv5QgRhaM7eW7/h9MCVEC
	wv64lxyN0TQ==
X-Google-Smtp-Source: AGHT+IHCyDQzEJ6kBhW3v4N+pYx5F1W3SqfuZOszPC9Ixk4jqjoqtVWckx72H2jiEWEF9nyPWj82Qw==
X-Received: by 2002:a05:6402:254d:b0:5e4:cfe8:3502 with SMTP id 4fb4d7f45d1cf-5e4d6afa314mr2938285a12.17.1740751649850;
        Fri, 28 Feb 2025 06:07:29 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:29 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:27 +0000
Subject: [PATCH 14/18] rtc: sd3078: drop needless struct sd3078::rtc member
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-14-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-sd3078.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
index fe27b54beaad1c06b70bf7f22e44c3f6da087267..ebb4d45ce2409982880affbc7a85d5e7410c8f42 100644
--- a/drivers/rtc/rtc-sd3078.c
+++ b/drivers/rtc/rtc-sd3078.c
@@ -37,7 +37,6 @@
 #define WRITE_PROTECT_EN	0
 
 struct sd3078 {
-	struct rtc_device	*rtc;
 	struct regmap		*regmap;
 };
 
@@ -167,6 +166,7 @@ static int sd3078_probe(struct i2c_client *client)
 {
 	int ret;
 	struct sd3078 *sd3078;
+	struct rtc_device *rtc;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
@@ -183,15 +183,15 @@ static int sd3078_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, sd3078);
 
-	sd3078->rtc = devm_rtc_allocate_device(&client->dev);
-	if (IS_ERR(sd3078->rtc))
-		return PTR_ERR(sd3078->rtc);
+	rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	sd3078->rtc->ops = &sd3078_rtc_ops;
-	sd3078->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	sd3078->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->ops = &sd3078_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-	ret = devm_rtc_register_device(sd3078->rtc);
+	ret = devm_rtc_register_device(rtc);
 	if (ret)
 		return ret;
 

-- 
2.48.1.711.g2feabab25a-goog

