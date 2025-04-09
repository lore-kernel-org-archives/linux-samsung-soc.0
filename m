Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB00215179
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231072; cv=none; b=m/gVkCjBruLifjYxh6Pxl3GybKqw1kPKaTzvXWphZ/iVhNMaPlQe5Voi99expltdiy0wXDYnQC6s3vuu816NkJb/DoMKZFKeUf2yDXg+J1UUkPwVOeToRCYdSbgvMdL+bf27fHHqa8BkYZamuGjpQRQSXo4ZC9UC/7Rsd87zc2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231072; c=relaxed/simple;
	bh=3Me2u0NhSmvUHUm87c5Lew65uoJBRoaotojNz31DdRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ghYxSFEPSGaplecJkK+yOr0B6pZ52fe5DgfZ0QlnSw8Rc9sXP1MEK+iLYOei/ol+NTeHOWIKhQ6aktfsrrfsCqxxKHheH+9hyQ1MkO+9x1kzBCLyN9RH8O7vHw1oL2nfj28gK8YzSQ+WgA27fVA3qG3/JhM9ClNkjn//DW34lNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HfrGGi1L; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HfrGGi1L"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac289147833so19083466b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231060; x=1744835860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BAVD406cmjg3dX/fyGSMAhg9gbpo2Je5SUNU/Iu6Ls=;
        b=HfrGGi1Lp8vA1fc1S9V6LqqFdvvCXMBnAOE3R5cPH6fYJFe9V+5Q8AUA5kpr2kyAri
         2h6zgKTC+Ka50zQWTkQkU2SrAXjgwLHCzzviTX6AH+AZ4TmlCV4P7IWZiJXUILep/D42
         XqVvrtkEm3M7CDJm0bt+s2ETpetoz53BauLqhveCGTeLCx7dRaiGtR9eSQH8+OLqxv1J
         CL3xZb/mHz1K60wXG1sZ4eUgRYJTcfoslP5cIaE1+srpnhYMXsuNtFumIZBhZPhimjlm
         nfNCX+NkQ2qeJVrgW3yVaikbWdoA4cbniArOFzS/hOepywdoMrszHzLIhR31EC1cZRW/
         TWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231060; x=1744835860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BAVD406cmjg3dX/fyGSMAhg9gbpo2Je5SUNU/Iu6Ls=;
        b=TdhKJHIelWh1tPSxdXNHUVY/g4vGD3pF3PwHKjFFP1zMMqtS4Z2eVmR188QoLhxh5A
         DxijwHl6PC+e1GfFyYI+O11cj8ubq+FhuY3ADS+EmvY315SNaO5PxSYUraw5iVl4g/CU
         vwx/7Ick2B8JVCC5C1uvO+CIA0QNYwEQ6DEhh+dnFaHxT8EHXoXU2kXEfqNlvyWTmJV3
         zTiyNyn3VINWLRToEU1PM75emqh3MwkziQhtHImO+XEnrt+Wgp+J63oq2KI5pFAfNMvj
         kcALrJ6RpXAvq68wUB7YTrK1pojbc7/0iKJJanQDd+EPKXCO2vGBoSTBRO/RnZaez5N6
         /v+w==
X-Forwarded-Encrypted: i=1; AJvYcCXoPOG8JmaMyouoeG+Iv/B8HwInWf4AjcyC+MXgiP/Qz2NuFynqfMqUS3DL9ePDUTH24+n9vxdv0HtndzLoMh6oZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDEJrcwtQDVeZhykhjTcp1nyutV283TYNrYnlv99FynZTyHj90
	IhZHR/LtRwcbP/LoEp1RY9KF/C12Lpn7eozdWg0OyYLSQrtwjFg1z+u9d4A4/9E=
X-Gm-Gg: ASbGncuwPGqVbkOK19vlooZYWIAtTbCYmsANKu2mrpdilyx/VB7ZqpUT8Bx407WVOmb
	PbNZwZKKq1k2IXxgGEgyIPLDba/NDst6IL4I9SeHNgnAciqncAPPvYKgiDFylWlYONnGLYGvdEk
	Vn1+OccmPjoeFLCtTyojQXGHB1tTm6RhneUj3T1xAjfi/lZA6VyxTZa/79zVe7bezYMtpKIln5x
	2EG/ECDRLhvUZgxAiG4bTM4prRe7r3C82NJ9R/j9AlRO8503l83dd1FiYHz0r1Ro4kbwaVnon22
	d8981eIMAXrXbdseiUutwcygsAk85pTO7ZCeFyl8VaSM4m2pTLWVgF7FiK1JIUBEA2QbALYiZSZ
	G1yaTiM39uNdFmwdiFlS80sTEXJ3wV5mFmBb5tQ==
X-Google-Smtp-Source: AGHT+IFGuRopXUZBocg06rjmD3ZHp+XWR7FsT1M8CRyC7YTvs4QmmNCB4EgixbVEA8gphf+u1JLXHA==
X-Received: by 2002:a17:907:3f89:b0:aca:a539:be04 with SMTP id a640c23a62f3a-acabd1231fdmr10950466b.4.1744231059836;
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:41 +0100
Subject: [PATCH v4 20/32] mfd: sec-common: Use sizeof(*var), not
 sizeof(struct type_of_var)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-20-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
index 55edeb0f73ff4643f23b9759b115658d3bf03e9a..e8e35f7d5f06b522a953e8f21603e6904401c983 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -163,7 +163,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	struct sec_pmic_dev *sec_pmic;
 	int ret, num_sec_devs;
 
-	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
+	sec_pmic = devm_kzalloc(dev, sizeof(*sec_pmic), GFP_KERNEL);
 	if (!sec_pmic)
 		return -ENOMEM;
 

-- 
2.49.0.604.gff1f9ca942-goog

