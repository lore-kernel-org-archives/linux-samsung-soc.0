Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC50280017
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 19:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197294; cv=none; b=WijpF7RU6QDO9hhYfttxPMqRUJlQvty+tET34LrJhcX4fZoZiVPmK8sIcPhKohg+aCHCtL+VgmDybiX+S0Rp8VcT3eb6ZIpnJMzyhybVSx48GMy/ywfmCDNzcwOoNGH3EG0HzNEd+0vtAPRQOx8mQHFKhPdyS2bSM9aoBKlL40w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197294; c=relaxed/simple;
	bh=BzOY7xFqFUUnN3PD+Nik686oui3xmNMlf7Dt/c4aSB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lbf1FD6HJiwPe4EV5OPb/cUi2gdZg0n4RwYSNjzVRGKAKj+0pKgE/61KcIBlkyQhQfq3w/QSivYoqtumX3YgTuN71rtgMyNic5c+nBTB550Zy/s4bofW3PRSvp0YEhEURVAJHZxMWXI6Ip3yVw7XHHx7R8atub4UFopCX167qfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ggpNOXEC; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ggpNOXEC"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3e9d633b78so1130401166b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 11:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197288; x=1762802088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+H9s1G6YtgeqluWZseo7SuZhZNZyldAYEc85O7etNJ0=;
        b=ggpNOXECDGMlgIwPSzOb8a8yxZJSFajxHfelynNZzMdhgK7O+DPMqu4gpRd0KYqvEE
         LBJ6yBg/WUXKYJsdj4JRHSmnDkdbjN+OAbQ6MI5qnlQ1eT26KXWyMt8UVWrocqjvLwap
         jnH5wPh+9HeR3w3pLbqtvyYR5xmZfmSuirbD26TGd+Etd6I7HMmlkdI3D/KBTp/ril/U
         MYtF7DRdI8WkEi2VmURQDklA+Jk3zfg6nyZiGNibHJp5udV7YdRA30+5WY7H61YmtZl5
         D+2t+5+BaXxG7gqH1ZGkdtTNjcZGb0/EKR0007qCrRo1Oc3ikzlP5rx/JfBupJaY5/QU
         +e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197288; x=1762802088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+H9s1G6YtgeqluWZseo7SuZhZNZyldAYEc85O7etNJ0=;
        b=EBhh0rElMmaVNKH0ftCjKEYmvp0L35behmCSTPrskYdSaJZdkxSAWdDxwolAqe4O+i
         Uf2YnvF5geNr6ZSvMmOg/440ShnGt49y5Httz9IY+dSDhPbdYIuCNSUIB9Rtu8FRSRty
         zTWwQrucvkkQb+U6Niarz0Wa2EsEDf/0Enode6D8e2fMnX+d/WhEg2emPBghtsHo0OjP
         4SVAvMv9syPkAju1qK1UCr+kMUKF15WtoyH+hjXT27/1ZsTkAbyvAxjPI7ffHewD0i6C
         H3H1RIop7N4dEserUg8lydNKae/Bme64Mq6C6c0ounJgeBF1S91gfyj5oPw5W9mmvSQS
         ENJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVinNXTGrXWWiQUebLB5QKTSfDLR8VIMMUPn7ItvGo7uzzuKD1YeW/PL+Q7CkVTSWmCsD/bmizdkYuux6DKE6s9Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGTpO/7rwowwiWLdvQrMa82aHQlRqhi3wq0dGlHQPWTN+zDmf1
	lD+aDdB3i4KTVSbcbRDr3jhmy8xpuqKI7XGUvnfcSPbCMKIYGF6FHKdPm+lT9nak4h7p28jHHu+
	dxl9uwOAyrw==
X-Gm-Gg: ASbGncvORJAkKUFKPvrk0qol8T/rgImQ+ghyBsiZX33/q+pjgWGcSs7aBfc6U1hWUCa
	gAahFqQJH5kvQ83lHvQ1x6NTFNR8H/wHVCSbOSq5dsTXOI3v4j9yL078y6dauiy7H8pihg3hPHg
	kDnwj5RrP1IEyylPSwhA6JyJr3UdUgTixhJr2+sKVFTyJw8wT8uUzpXtwMujHxEDOQbwQCZaiOc
	OryPwU4Ms5gegBBZTy3HGVuGufll74LRoMIOBRs34tUj3mOX4pEV4Ja2mz1TTVwB6ncveNRd7CX
	dHtp9JibSJKLoUAhrboQJzpIeceBMzUNf5QJCfnU4eN4c9RzjbE5t/Q+/cuZUx7uxUy1lruFQFj
	q/PbS7+OXTEaRRCneO0l7rL8FyHr8Drhyfz5uceLprCVqN0Na5iVehOz3igJ3mRA/zW8VOyx5/u
	5msS2qke8suJp6QooP/6CMWy5RV7VGCxEpr4wZxwmmENT0ekGB4gtq/LnhOB/Dfz2/ABnP2z4=
X-Google-Smtp-Source: AGHT+IHrMiuYLZd0vMCvo+Ek4nTQVztiZC07CKVGfY4NotHksO5aFELwrIdhsXO+9Y0y3M22E4+puQ==
X-Received: by 2002:a17:906:dc92:b0:b3e:c99b:c77f with SMTP id a640c23a62f3a-b7217387225mr57792566b.24.1762197288276;
        Mon, 03 Nov 2025 11:14:48 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:47 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:49 +0000
Subject: [PATCH v3 10/20] regulator: add REGULATOR_LINEAR_VRANGE macro
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-10-b8b96b79e058@linaro.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
In-Reply-To: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

REGULATOR_LINEAR_VRANGE is similar to REGULATOR_LINEAR_RANGE, but
allows a more natural declaration of a voltage range for a regulator,
in that it expects the minimum and maximum values as voltages rather
than as selectors.

Using voltages arguably makes this macro easier to use by drivers and
code using it can become easier to read compared to
REGULATOR_LINEAR_RANGE.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
While this commit doesn't introduce any users, the upcoming s2mpg10 and
s2mpg11 drivers are using it.

v3:
- new patch
---
 include/linux/regulator/driver.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 978cf593b6624228fe1fd9c2a3e186b53ef172f8..977755db64c6dfaea7246067eab0d9a2971caa01 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -53,6 +53,11 @@ enum regulator_detection_severity {
 #define REGULATOR_LINEAR_RANGE(_min_uV, _min_sel, _max_sel, _step_uV)	\
 	LINEAR_RANGE(_min_uV, _min_sel, _max_sel, _step_uV)
 
+/* Initialize struct linear_range using voltages, not selectors */
+#define REGULATOR_LINEAR_VRANGE(_offs_uV, _min_uV, _max_uV, _step_uV)	\
+	LINEAR_RANGE(_min_uV, ((_min_uV) - (_offs_uV)) / (_step_uV),	\
+		     ((_max_uV) - (_offs_uV)) / (_step_uV), _step_uV)
+
 /**
  * struct regulator_ops - regulator operations.
  *

-- 
2.51.2.997.g839fc31de9-goog

