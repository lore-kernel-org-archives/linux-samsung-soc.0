Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA15A22FE0F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168677; cv=none; b=qoUCp+Kz09IpKeR7oaMcZzAZQva5xWoMdhz21Ch68a5qPh51Z0B2LWB+6IvtX5+67CJpICWQXF7Vj+uVhxWQVBEyQQNFjtw0ooKkYxokL1fdahxEFR+uo4ZQ3VBBKzc/fL2AqDxkvYIyzlJ9hJAoUE8ha8Evlw5JXWBVMGiM6qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168677; c=relaxed/simple;
	bh=kEDFa+8UVBQzgPmv5eunRw1YTfTPcSizj/QHfDecNE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pku8trauXDiPFg1M4JlZcoL2zYKu0yW/CyMZcX7Gcfj7cIWX7MxRI/yGFVtrhyg8UMG/XWEAT8ccMUz28R1qTUe/2VzuhozKTwzCMGox8r+uWBbc/YP8+xs43gIUfwCTXOHb0XTCwKAbWkZ0N77k0h0tVowdoygqsaAL9cMz5D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fp1xXmKZ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fp1xXmKZ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so3149736a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168666; x=1743773466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=fp1xXmKZegKILOcnMMhnBzMmxqOa+3829cjCZ/M9/fvWw+rTE43gHntN9Kut2LiucL
         Jxe5mnb+b/MKhJgB6P424E96nPPVYATrIsUYfD9llnzlMepBi4Od0Bxq0z4A8rkE5T2N
         tViFclVNvinzdX/6XVRdb02bKCse1/7ibkPs7iwqsMJW48l5BLgfBZagFPoh0p62KQ2e
         x80OLHd9+emeKjWhTgynvdqvzims/yJJJFKl694bUze9O64A8vJunTFA4lC2X2lX+KoC
         EpVw8j9n+TOO7FWTh0IX/gqgn0C0Q66IiXnXYwLMLmt0lXg3/moqUqgQmBcxlx4BLbNR
         B51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168666; x=1743773466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=Z5XZsoO7sOYt7NKjA6A8Jw6gIguWgHgRBbSFiI+KlZ1mNR+/PpGUNTqRIsRzMLqXC7
         es8TW5s7rgCWvnkohYQFgL7H+qB4uXTNpPe+DDiyXg/lQOQX08mZAszM0M77Wo1gjfyj
         KEKSVyrgQ5R2Z4B5l+20TQsEbRkHp+tEAjngWXpWbuKXncuwUw+BROGxnNbWZVBe3cJd
         J8pPUMKtFTsSP88/lOVo24xKMoYaVUffCATaZG7Kg3C/pfGA1NdcTpGDdYYYQxU+qvNG
         CXYFgnE3rbRgx8wK1ct7rI3ykkNbI8pSeRBa5Jftv2p+stPtsVLepP9MpgUIqvihqWjh
         CVrw==
X-Forwarded-Encrypted: i=1; AJvYcCUPKUi2M137t0DOtVT+jSQNMYokTu68qBW22nkQIE34P5xGKLeTL4R1XL95Gxuz+jvdE1dYGFYeeCITFF0JUnRI6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YytXw4/iE/p9uIht+03BIabjj0rn+8uH3sZL4ryVqW5TiBZ6imK
	Qcrvl3g3k1m3wsM5HzyLMiSBqZadaAc4+G1hiYLz5w2ef5RYOaWP17KAYWSBCyg=
X-Gm-Gg: ASbGncuclXXQNXjZNxOsyqYmrrMnRVerDyVrIuRfVs99PtHC5ce71XqX/Szrrt07PpZ
	JzT2WLYG7LVKMorMRMfJEmHl0qYLd4jv81bKgXDsQCsWyXYxaY4Y4YSCGD1YT5nkLIB8VlHthdz
	ozwvRUegym2HHwm6WC8S8JP4O+IXkA7S/Uo9WAlBnxGmB/NoUSW+26DgUti0TKrEFuLYaKu0avQ
	6G74cI59Rduq6PXG1xemHDLKXJUhZRb0QYCOiUd6E81PUEbBvy404WC7TVFNa4NZ5vwo4dz5Mc+
	0l3x96WPtFieSL+0blpO3mXMcfXHCwcqsRiX6HSvkpYLhJqbkxdkocqUpHr84nGr77IEcOpKuL3
	SRnf7fv+sLKs9pgRb2RGY9O2z2c07W8vr7vfOvLk=
X-Google-Smtp-Source: AGHT+IGAjkKL4/RcQRVs4lvBXbIgZ8dDCpbSsQ9PMQOGZfxyLbsOG8rXC4O3k3x5fcgkz2IEiIeoJg==
X-Received: by 2002:a05:6402:1d51:b0:5e5:e836:71f3 with SMTP id 4fb4d7f45d1cf-5ed8ef20410mr6346734a12.29.1743168665879;
        Fri, 28 Mar 2025 06:31:05 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:05 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:09 +0000
Subject: [PATCH v2 23/32] mfd: sec: add myself as module author
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-23-b54dee33fb6b@linaro.org>
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

Add myself as module author, so people know whom to complain to about
after the recent updates :-)

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 1 +
 drivers/mfd/sec-i2c.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 448300ab547c10d81f9f2b2798d54c8a03c714d8..05658f05cb857a784c7d01b1cf25de4870e1a95e 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -293,6 +293,7 @@ static int sec_pmic_resume(struct device *dev)
 DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
 MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 2ccb494c8c024361c78e92be71ce9c215757dd89..74fd28a6bc9a42879fc1eb05546777f60e0062e9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -233,6 +233,7 @@ static struct i2c_driver sec_pmic_i2c_driver = {
 };
 module_i2c_driver(sec_pmic_i2c_driver);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
 MODULE_LICENSE("GPL");

-- 
2.49.0.472.ge94155a9ec-goog

