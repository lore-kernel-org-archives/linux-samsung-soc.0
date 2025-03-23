Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C1B1EB1B8
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769587; cv=none; b=Gh6jN1VHqJ/sHV+jy6Mb0HIz/FBJSWM66cgRLl3ZgCV7GQzLKqnXsP/bI2S38d8U7+Li5lJ0ODOUbUwCcnIetpUPNeW2Gzums7fkJfOwkQh+zagNplb909ws0tMWJboWwJtQ/OII8VDnNxBTplVkKGA5sDc2+FTgVKeplt+UsT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769587; c=relaxed/simple;
	bh=ANmM5x/He+PE8PRBy0626kbsZRP5OO6JjTlgz9DtHdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BkoAlFJ2KKl+5aKIFMjZWm+LYPp1NZnVa/Eam3XlchqwVPH4OniPp6qRTRsPx9SMtd+pI3+HglIue/hQkYA32r6HLiaX7YQqEdLIK9SxWbkZe1sFQ5w50Cja8/81HyNDGf6BqrPuJSZC7Swl3oMGKkuH/nVaXiF2/eZDTCjd27Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dPpuqkEj; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dPpuqkEj"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac289147833so457752066b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769577; x=1743374377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaAxKK1RdiX9Q5Rykt2k9FAZMFKWbpXqOP1fRVyJN0c=;
        b=dPpuqkEjp6AjZwnV94pKzTW+mqVLGpOch6NK0AK+r1n/E6VLnypm+gFsnPmJ3Qle1P
         rd4CX9OKK8BXaIzsFKYltvDnsT365lCGQkfcRGjv0H6Q13aVB/M2MchKrOOE8D1fUaBI
         PLWDXayWGudf1RZitnKWKNg2mMUqp8Tg+te8ZkfJ75/L6F2VAukjW61vXgdhIBlteLa0
         UrNXkktpa5jWqlf7Rt5Fzr5lmjQj/1WLB6ZXOn973Y1HiDNgmuSxmYQtQkr2xTAHx1eH
         BUObqCLjhMZRkILYVcVY9Pf8cWLcVpy8YuNkUSYbjllxwLG4LaoZzhbWcAcB80MefG7P
         DxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769577; x=1743374377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DaAxKK1RdiX9Q5Rykt2k9FAZMFKWbpXqOP1fRVyJN0c=;
        b=OXptMWdo5+Lcm/SZMd6nFni4bZRKqKi3dFzKQBs9W+Q0zr81ejzzNszQZ4mAI7wjOL
         qYfy3dqW982iQBxsP6ka/hz7KT7A5V6AXnEZ7yanGT+79LIWwZ+ZvQJYHBVRRgPVY9wV
         j1ffIWJnH2yAPfuEbygJXMflUJ/qx0SiUlHwOfRi3kc/XlkZZ4pAmwWxpeKsWotACNf0
         KVCRdpG2yVQQC0e/0Tgy+U079T8S/9I+9jAozU7uLUHPrdcx+2PrNXy226u59WMiiWNC
         7MjsHc22h5ZtOtlwZx9KBPOlcmvpbiTxEF/YMVj/9M5lOZfRNa3iKCy4PcPPh4iSCXWr
         iO+A==
X-Forwarded-Encrypted: i=1; AJvYcCXeESSmCfwFNYZXH0AtWTZYmkMXeAONtqkHX5jVm9JzU5z/SF0VPJsFafOAxjdcRoxNuSWbz14nWcQ0apjB0EBraA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEdMYGgZk4JttG7PmSP8wsVslpV428HIqaNWQ8IBbZMDWEE9me
	eiPd4dS6e4jyrujOCWhAL91NwiZ5PpRHhvsf8JYKPd/a5Pheq48wz3nMVUQeicQ=
X-Gm-Gg: ASbGncuzfChMI7R843alYcvGr+LQV0hKrbZQhUSjbL3UwFedKOk/pSe/xUeZXu9PjUM
	Wfaq/9psOWO+nuT4kAKUVT2JAINADQ0frya519DW7I3gvXRD5fayBfKWarP8U6Cm0+pkBwEqePZ
	7DOdG2HDh87jkZ/Z9KtX+/0zHXSxPvGqoqekftjIZYj5GyZqSLosRYcU0yh+Wy/Ol0KLvhZQ8fC
	c130vr0H3iXNS2LvPzT5vqmRWeeR2fSPC2MV19hyWBuZDrLFWur07G9l5y7vw2dtGPhY/jcTMAV
	jZBTUHGOPME427H6FUMIXY7SCdh2bCJdTu+sSsRMN+gtLLKFw6Rkf2vuVw+So90g2xUeQFzwipV
	j98gDtPnvHW53+6dFyyI34+xSfkny
X-Google-Smtp-Source: AGHT+IEHAfiBfUB/nsPtj6YObLClfT3lIBDTn7g2B2otGsQqhwkiW+Sr35dDHIHATiseMaWDI7emPQ==
X-Received: by 2002:a17:906:d7cb:b0:ac4:5fd:6e29 with SMTP id a640c23a62f3a-ac405fd6eaamr641943466b.26.1742769577350;
        Sun, 23 Mar 2025 15:39:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:36 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:39 +0000
Subject: [PATCH 23/34] mfd: sec: use sizeof(*var), not sizeof(struct
 type_of_var)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-23-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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

Using sizeof(*var) is generally preferred over using the size of its
open-coded type when allocating memory.

This helps avoiding bugs when the variable type changes but the memory
allocation isn't updated, and it simplifies renaming of the struct if
ever necessary.

No functional change.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 90225b683fa083d4df7a20dfaa4f47084051e250..5ebc77d7edacbc1b7a3debb9069bb489109d57d7 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -139,7 +139,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	struct sec_pmic_dev *sec_pmic;
 	int ret, num_sec_devs;
 
-	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
+	sec_pmic = devm_kzalloc(dev, sizeof(*sec_pmic), GFP_KERNEL);
 	if (!sec_pmic)
 		return -ENOMEM;
 

-- 
2.49.0.395.g12beb8f557-goog

