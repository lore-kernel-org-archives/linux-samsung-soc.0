Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133A521B180
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168669; cv=none; b=bu6Jo93i86t0tqOWxMksfve3QfYZkEquvGIgDuaM2L/LJpRJC4kH60OI0a+68yOMbzMb89WisAbsk9VDHYCzB49kqonN80o4pZFJI+BiNGmYWlFAl5QnzBg9QTg5WbZkBqkiuS+6J6YuI//43N4YWvTPv3zAYzjX7u+zX5+S68E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168669; c=relaxed/simple;
	bh=l1zcOTqbAXM+6Af1i6qiSSUmTQ2DiJduP75aVq1nYPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qiZLrbzz7gK0IUV7HLUc0p3Pd4PBIwvukjZxwFkR1juUW1yJbDvpPZwrQTG9yew6ovrQmCzEbq8rOfTCjjM7ysbiMjKp3Vn0Kh+DSwZmqtu4WvZj/+nP20/w0o2nVU6aH0feS5JvTOY4ZCtF3OoulJdwDgHLt5TR7YnI6eyCkak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JhmUU5BP; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JhmUU5BP"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so3359379a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168659; x=1743773459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=JhmUU5BPBvJeOyfDkeklAzkrzwVlKhvacXEhqq6HkJN6iZFC/69NkvY2fla2w4bGy0
         J5E1ItAYhwzZVEoX1BuKC2llkVduktlsJe2dWg0YGaSCZKjvDyq+DznybGtGcSafcPCm
         TLvCloNJ632tZq62eKfrOcozRt4tyavWo3rm3aMYupK0X66cRw5kwAzaqff/HUG/vvjn
         1vA+D6ywTG407kziUKNVcj4/tYYy6TANU234J2OJ+iFd5OzOPo559fOFi5CZNknLT0xk
         a8p5WoGdrOI+S9j+txpXDffYQZf2BkyvmA+D5JKoTfi9SB+msAoIRnL9VdkUr6lwy+aI
         koOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168659; x=1743773459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=sVRP8wxRJT7Q5D+BE9pynUurUhDi/LWYzvkoeJ2fwnm0h3aTz2VmgPiGj61Xgsm7X0
         d773ZqbMmbqkFgOXmlAkvXIE4D0KwNZxlBln5wjwNi7d2K7VlXt0CIOkEctvntmlA7Bg
         174icj7MWh2Anx5bLrYEAgirIX+Ke5cP24UhMnV6jPjd6dPkFzwGv1mKngwM4B4pCYOc
         6RnnlhIo1rXghv3/Q2ABeSCySKoPz7bcxsLPQg4PxuDauv2DIe0Z4HE98XGwyB5zDqc3
         ikhP9UUOxfHxe4dw6Mz+5fIx+SwTIRVc1vARoIGt2eNAjCDetMKrA4YduN/D0zJzWfBW
         38TQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/kSK1eB0q6K/kR8ydMcSH9JFX5qIKfJYUDtXErW36xSu48ZYijhQMYT2TN8wHTX3XxSVJgm2gOGHVxg72pTPXbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH5BOQFH2cqnWWphwKnL2sToMP2QTd1zQdb3GYFo6LuP8O0DnF
	PH1t9I24vxIBBe+5C4TWDC+W/r6AZyfEe0mIFTJg9bs7J8um2p6ErHyb8F4rhdusE0DFa4t3HQg
	QQU4=
X-Gm-Gg: ASbGncvp+KR1ZdSwFMPuGwsxNONRs09ciev2y5+0L+cu35SvBHjh0MKyHzhw+hMiKyG
	gTT9ixE8tih9CeItNcv6TwOchwwn+R2aDeW8cnm7tIGG9OH6qF2ROeTgGUY6c/D0qB171/KvtXM
	mgx1HH2V30X1mgamg1B+xn2MzIG9IVPCYMNd2GpZiw4hkHhNExcKCsa7zdqMeYgM6P0HzR5nS04
	ET0+3nCeMSE233cnRpYwNo4hMWzigwV09dgxq4mRildqK1r7y/A/QIi+K494OfFXZlwDctFWjB5
	nkjQdl2+QI4iX62CSut/ylAcIXA+/5CEKgnN/GyAs1XlHaJkll9boag5vesL8ZxEKog5G4qbuNE
	p24S8tYGlX6+hY/tkp47LOrTA4Jku
X-Google-Smtp-Source: AGHT+IHY77zJB2+ZvJcaGKZHiHxoVE2X4zdszR83ffWy9ORQ0cPQA29Aq9xL4S7dGRJozxmx6Qfd9w==
X-Received: by 2002:a05:6402:3554:b0:5ec:96a6:e1cd with SMTP id 4fb4d7f45d1cf-5ed8e061508mr6757044a12.2.1743168659356;
        Fri, 28 Mar 2025 06:30:59 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:57 +0000
Subject: [PATCH v2 11/32] mfd: sec: fix open parenthesis alignment
 (multiple)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-11-b54dee33fb6b@linaro.org>
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

checkpatch complains about unexpected alignment issues in this file -
update the code accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* make new alignment more readable (Krzysztof)
---
 drivers/mfd/sec-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 782dec1956a5fd7bf0dbb2159f9d222ad3fea942..1a6f14dda825adeaeee1a677459c7399c144d553 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -149,9 +149,9 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	pd->manual_poweroff = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-acokb-ground");
+						    "samsung,s2mps11-acokb-ground");
 	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-wrstbi-ground");
+						   "samsung,s2mps11-wrstbi-ground");
 	return pd;
 }
 
@@ -264,8 +264,8 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			"Unsupported device %lu for manual power off\n",
-			sec_pmic->device_type);
+			 "Unsupported device %lu for manual power off\n",
+			 sec_pmic->device_type);
 		return;
 	}
 

-- 
2.49.0.472.ge94155a9ec-goog

