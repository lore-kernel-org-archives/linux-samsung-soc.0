Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF3FF513
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Mar 2025 15:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742830456; cv=none; b=PF/85gHtqkJWEk4yJ2A0/mWdQ5nlMN5+1V51n3GpjmU50iWb7hq2EKJijpIihB9MQV/uNWpaiYC7yMFRHUCkWphdr7plMLTaeQgeCfMYRrVyVU0ldhnc9JoAK3liN5aPUu7xWf9PwilYqM8ZQ41pSyjPTM/foWFYi6M8mwKdcw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742830456; c=relaxed/simple;
	bh=2i8yYb41E2nPG7x7TGqmfwjAiXJsVTQqwHYAuSlN0ag=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qw/SSrqn6tXUmqkWsy5freCOGJTLttRlv8rvU4VVyeIGNHhNCGxV9CvYMLQMgYw45r4TXNXxl9Ew1FVepQYlRkao2sy4blhbWBMKEqluuTHNpJcQjUPP3X2SWqIeZ0Me5wWnqfAx3VrNwkZ+mZ2wdLbVxZHMGS+kknAuxg8HCF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a3VbqLn+; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a3VbqLn+"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abec8b750ebso840229766b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Mar 2025 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742830453; x=1743435253; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VIXMyJcelbL95lk5i6cF7CMMxgNXH3YnFDanO5WuLy0=;
        b=a3VbqLn+i5vgKyrPOhLgWVhKp66c8dByN8X/3sTB2lJ29UShnKld0yBXMbAJYDh9wm
         yOoY/etwf8dOFZz4at7/UMxQAPbfOoya37luUrJWOpzC4itMMc+dXwW2tXiGP7lJX1Q2
         GN8jz0hUMmQfqb/P+LR4RBpsS8JUl46gtk9jFM27NnFDwbLWIcXR2Q0L3SG/GnmH0Gt+
         wQlw9DD7aE2nBmZQUvZPSfqVTU3M2RPqKBjghYQFjzxRDv/oSx4nqYkijLU2PdJU4aWq
         2ARdvKJv7CCWZjXOa1lufI8gHoW2OTxTGZP7lANZ2wisoNY00S2IHlkxsl5QG8sWp7lg
         7iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742830453; x=1743435253;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIXMyJcelbL95lk5i6cF7CMMxgNXH3YnFDanO5WuLy0=;
        b=ah4X8G+Ln3Ca5rNLM8myxjErfpxoA0+0PseArvqOdND1lCQp/JcSASP1fh1Z59+ioj
         zbyGjBzGzAljOkJ+lS6dsFfLsPWCaDwN+V0insCc3TQxSuAbdFqYN/dw47fiKZtW7Xlf
         tNJhj7GBtUZmazU49hDG1yqbo434Q0N6WEm/ppTf/7vr38Fycbgx0nb/yMO1hVb5Q9v6
         VH98YYOEljtfLyeKwIEE/rJ5oElFNN+EC/3/4tO5LynAlSeno0ECU9mpdATGmjiKTtMX
         h+omYWTZL0dPH0/CeLv+9OybA7IFEY50MyQLvdvGS6QUjlsyK4Tk4c/p3jdXEJQHyLcs
         pUpg==
X-Forwarded-Encrypted: i=1; AJvYcCWlb+aLJ8IA1lJypV0iRsPxZ1hL2WpcOqUfZaCOlHc3L6qMjwu0l1za+3DtpPs8h7Ozor9HCbjf7n54B1ZF/1Yabg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0sh/KZAS8OTCLeRZIj3EvE+PSVlISidOL+LQNYA2Vm2Fs5kwl
	tkw3bUGp5ha48HR8GVUqH3Ux36CW81qQKOIlrOhNffMuOHFjAxwEHQrZaC52s1c=
X-Gm-Gg: ASbGncvcNiLw2xz7qyr18y6HQLykqFM+RSJ4Y/Syz964EToaYW+DpmUaEqGmwZD2iRD
	AobFuxkxLmdePKT8mBtVIsZWWTeCXNIST707OHuZX3XjueZTfiICRXE1sW32TZP7Sri2IAazULu
	fPutWQJuFld7wmsGrXP3z93OfPR6ZJuHxLuRJPzM4Ab0xX660WpYDiBBib9WRC03/tmFCcI+uwW
	gGzR/w3vRh22N9lqNtAJ7IlZABAPrvQRGuSG9Me8xJuDZYdLyjYaDGsBU87GQBYNuHkCXaC2uT4
	Sqn2HkkkJ+3pWHSM16stp90QnVSBEU0Sef3DpkwJk/kwrNIDKq1IGutpJ1JD1rbln/rPHFzuCAL
	EhDCHZcu18JF6l0Yhaukjn/7TTP3k
X-Google-Smtp-Source: AGHT+IEAgyYw/lVqLDZmI/94VMcCiHl4tz0Ye4f3LeTmnsdRF9wIxE3C8ACjWz621GGbasA9tr0kSw==
X-Received: by 2002:a17:907:8694:b0:ac2:cdc7:fa61 with SMTP id a640c23a62f3a-ac3f22a030amr1409182066b.25.1742830452932;
        Mon, 24 Mar 2025 08:34:12 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm690219466b.31.2025.03.24.08.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 08:34:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/2] firmware: exynos-acpm: allow use during system
 shutdown
Date: Mon, 24 Mar 2025 15:34:08 +0000
Message-Id: <20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHB74WcC/23MSwrDIBSF4a2EO67FB9bQUfdRMjDmmlxoNGiQl
 uDeazPu8D9wvgMyJsIM9+6AhIUyxdBCXjpwiw0zMppag+RScyUFs25bmd3jSo5xpYzRI9cCPbT
 HltDT+9SeQ+uF8h7T58SL+K3/nSIYZ37sezNOaPAmHi8KNsVrTDMMtdYvaPIgl6cAAAA=
X-Change-ID: 20250321-acpm-atomic-033775b051ef
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

One user of this ACPM driver is a PMIC driver that needs to communicate
with the PMIC during late system shutdown [1] and at that time we are
not allowed to sleep anymore.

This series address this by switching the code to using udelay() in the
specific case of system shutdown. This approach was inspired by I2C's
i2c_in_atomic_xfer_mode(), which has to deal with a similar corner
case.

Link: https://lore.kernel.org/all/20250323-s2mpg10-v1-29-d08943702707@linaro.org/ [1]

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- add missing ktime.h include
- switch to ktime_before() instead of !ktime_after()
- add link to user requiring this change to cover letter
- collect Tudor's Rb
- Link to v1: https://lore.kernel.org/r/20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org

---
André Draszik (2):
      firmware: exynos-acpm: use ktime APIs for timeout detection
      firmware: exynos-acpm: allow use during system shutdown

 drivers/firmware/samsung/exynos-acpm.c | 35 +++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)
---
base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
change-id: 20250321-acpm-atomic-033775b051ef

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

