Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BC41DF963
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763649489; cv=none; b=OVQPOiDqS/SolKU1/LcBtuVL/Rs2bKv29h/Ak7bGQYg1aOWZOQXY3K/OIzhs7yxtKkAV+rmcYiCnJtjBERklo5D3ZSw9I/ieJG0grREOxsItPRbl/eLxapDUPvVfZbI1TvM2AjgdKs3INHJWnd8N+zF7ZMaPdAb7SJeVKS+xP/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763649489; c=relaxed/simple;
	bh=D80UQ8DT8x5gDNh37qxMkColQlMlnGetG+D6Y4IENvg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RVXDfTZho8SEFKPE6L7gaoPCsSE7EWhcJ6A+C8zK++O5yse3tia+hmtB079Hxi7eNVv7gsJbYr3Tjo9fYlxIA0QP1wZFIvjG43Zpn3MzglXLffNveYiS89RXoFYiEVWN5hdunD/QjeGZibNrBloLZ4t6KSu/TrMVc6/uYdAy92U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J9OhfqCk; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9OhfqCk"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b75c7cb722aso137299366b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 06:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763649486; x=1764254286; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pmx5Fh1q9VVmgUGBpn1GZZhSMw+zKOQQK4BKRiX9H1c=;
        b=J9OhfqCk/QC/OwKVaNhXe2M8Ehu4ZxlkhmN7qzC8bY+xQPQawI1089lsnLklPXOwrR
         GY5njRi1ITGUZwwpdThpZTMIzxDjGQiARNUk+kqZkqLomXphbGo/ZH5EJvtvp20WJymz
         PN5K5+9YI62aN0E4gTc30bhTd/RQ5skb4ipLBeC2no5gFSXfLi46dKyfo1epLoPYr3pW
         bCLA73iBVja7e23Dimi/u+B6VT1GOihfxmrjtSCWRvsRlAHtqpzzdoCPffVOfxkEgoie
         yxgAyXfEpI6fT7djbn3b3z5bH4W9PpswUtHjGRjL7h/M0ARNuI7SEscXmM+rGXAuyoc7
         sTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763649486; x=1764254286;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pmx5Fh1q9VVmgUGBpn1GZZhSMw+zKOQQK4BKRiX9H1c=;
        b=HhcryK0BJN8nIKzmuM27znZn1pAjDA+GH8n8Tj4Uj9jpgo1b75nUSxTasvae31zlp3
         7+/OMVA0EQqhIrJUO4ywa1OJG/CPwtXt+v30ZutYi5smzkcHKZIjobzch17xiasuQhXq
         9cZjwiC593HtZ+o7yHMsZzmEGCVTdo8GCLn5NFhlQYRDATGS7I4T+nkn2dnmtsFiquxw
         htswqOtc6Yne2ETkBInmwAYBfCzJ8zB2/KpvasOA6p3NU9CfQwZmOA8YOdvTOBC4vBFI
         hT3ZsiKX5A/RvpTZw2bs69chvHDR1T+1km1kcEQGCDvHGLhFsCPgBgCjJqQ4sh6GLxXl
         l5tA==
X-Forwarded-Encrypted: i=1; AJvYcCW2Q98yw197VBVyyvlu1Aogldz1lpDDbn45+zSjsP9juhoT/3vv06P1d4bzI3tFaTcITWIgTj0rquTzehDv4rWa+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwFOs3j6DRUwASR0uzARovgXLQ1IaDQLECqJSZBLtCEV0YNZEg
	i9sAiZpySM5QnZraMV5MdlerHG0H/gq35EzTnHirOBbEOynYRvNt1q75kQ+iH1faVdM=
X-Gm-Gg: ASbGncvJ/3Tmy70bSqW19KssklLIbOTPFRRHOEc7LiZrOw1c7zYMQPaJOR5s7pfXl3S
	v6E/sBqmQjje2QCQq3Jru1teLFrMMPrls+yUXIvZ7ZuYgShk+SXaG1V10pAmwEzJHSSAS8YZIWa
	5SlrIo4xYrn34b/jms2gq/CkihPffbRSML7d/V4kTz/zIJ0O1bEq0wovKz1WdP06wihW1AqJws1
	vrPwYOLwwR/hRZrR9d3nln8dz2UkT6VpYUjbn1XR9GH/+qbPxJs52qSqzi0Huc1kEiTdx8dUlLd
	oWbou9uYPzrCC6+gK8mPVXLxuRFB2gHzt69JFqDBY1nblsgQqU9deP//GaJq55s/hfTBwf2RutM
	gF4xBnu8Jelw/GLIAdkmPxRf5dNUV3/VPjQdxjI1C2Kg+d5TLFE9rUAlfTXj6rhmQ1Iwp5pFi1q
	ucTYNsKSj0/j++jslzrH9uomuUzRC+bECTkE20g/M1NcztgZOx45C99KhLJxl6/JkXtvKEPngIS
	aqYHw==
X-Google-Smtp-Source: AGHT+IE5wgD6HX0xGkFemQxe4ZWTQBoYj3/3DktxKBCpayLDAFuGLY5nOeca0EhTQQNZZprAVE5/oA==
X-Received: by 2002:a17:906:478b:b0:b6c:38d9:6935 with SMTP id a640c23a62f3a-b76552b9f32mr303535766b.24.1763649485153;
        Thu, 20 Nov 2025 06:38:05 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7655050927sm214326566b.71.2025.11.20.06.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 06:38:04 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/3] Samsung mfd/rtc driver alarm IRQ simplification
Date: Thu, 20 Nov 2025 14:38:03 +0000
Message-Id: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMsnH2kC/23MywrCMBCF4VcpszaSi1F05XtIF0k6bQfaRCYSl
 JJ3N3bt8j8cvg0yMmGGW7cBY6FMKbbQhw7C7OKEgobWoKW2SqmTyHYVbnG8CjPgRVp01gSE9n8
 yjvTerUffeqb8SvzZ6aJ+6z+lKCFFuHrj0Ts82/G+UHScjokn6GutXxL0g5OjAAAA
X-Change-ID: 20251114-s5m-alarm-3de705ea53ce
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 Douglas Anderson <dianders@chromium.org>, kernel-team@android.com, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Hi,

With the attached patches the Samsung s5m RTC driver is simplified a
little bit with regards to alarm IRQ acquisition.

The end result is that instead of having a list of IRQ numbers for each
variant (and a BUILD_BUG_ON() to ensure consistency), the RTC driver
queries the 'alarm' platform resource from the parent (mfd cell).

Additionally, we can drop a now-useless field from runtime data,
reducing memory consumption slightly.

The attached patches must be applied in-order as patch 2 without 1 will
fail at runtime, and patch 3 without 2 will fail at build time. I would
expect them all to go via the MFD tree. Alternatively, they could be
applied individually to the respective kernel trees during multiple
kernel release cycles, but that seems a needless complication and
delay.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- rebase on top of https://lore.kernel.org/r/20251114-s2mpg10-chained-irq-v1-1-34ddfa49c4cd@linaro.org
- return struct regmap_irq_chip_data * in sec_irq_init() (Lee)
- collect tags
- Link to v1: https://lore.kernel.org/r/20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org

---
André Draszik (3):
      mfd: sec: add rtc alarm IRQ as platform device resource
      rtc: s5m: query platform device IRQ resource for alarm IRQ
      mfd: sec: drop now unused struct sec_pmic_dev::irq_data

 drivers/mfd/sec-common.c         | 45 ++++++++++++++++++++--------
 drivers/mfd/sec-core.h           |  2 +-
 drivers/mfd/sec-irq.c            | 63 ++++++++++++++++++----------------------
 drivers/rtc/rtc-s5m.c            | 21 +++++---------
 include/linux/mfd/samsung/core.h |  1 -
 5 files changed, 71 insertions(+), 61 deletions(-)
---
base-commit: 9ad5de6d54f306b2bbf7ceb27e67a60c58a71224
change-id: 20251114-s5m-alarm-3de705ea53ce

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

