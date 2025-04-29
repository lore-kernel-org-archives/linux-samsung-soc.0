Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA3419309C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916570; cv=none; b=mcyB35QmdR1WXUYD7USqzSfUKdXoKy3mmGk4cpX/gmZtUYXznLBGwjz1eiQwsEz39X9Z14W/FRQyS+rFRhwqnJb2yTXMVWrn48MvrmDeaLqcNnLb6WvZry9RjqBpPA2Fi+XXmP1ylpV30NwbZfMeZuU8k9cNyxL6RobBY+EFs4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916570; c=relaxed/simple;
	bh=qQIdLk+FJaJTOLKosG3vFjdckw+iVeZ0wt9NMsX3AJU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZjnVfaIlhUkVYoNNOQ6AHWX/skUX6ZYDq6x0nNSzLk72/0tUtvXbMfXDY1ura307ZAmWGLAZC04ou3prk5iUzT4KXNt0jBG9IlKAURLWmdclVoXPDUlvJJS1JCD7QW9+iji3kTh/NcIi+pGKcd7CNWxrJao5l7jCBI+MfCQIYGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s7vK1rL1; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s7vK1rL1"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac339f53df9so1097074466b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916567; x=1746521367; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ3Du2msqS99gBPXd5VzJGX2ImDSOyuqnj7RIZBT6Dg=;
        b=s7vK1rL1C1ykAxg8McqfapjcTr4o3AEs93znL6fNn3EKhUCKw7SQbeWawn3jmKI4NE
         T4TB9CFT9AodMPoo/KoTVb/jecQBhLzB7V1Q4mIHq6vqwzOpM8lQ1VUwEw5M3IX+0WiV
         XGq6f1LQsxkyLVz+CHo9xmd94YQ65BFDvWH4RodJLD0WX11QXXlHc2/QZB2lcRvP8Ev1
         +5dJec9ZVdM3ADW49YQlPzrJClVj3RGS4ugo4SWot4TK1JM36OQEZHKd7z8QMsJ8Jb3N
         DYtyNyf2O7eRhrQ8xC09SeymsUIwpbfzdCpg2QBWdpR7EhMTUw9f5Fz5wufLnGlnE6LP
         h2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916567; x=1746521367;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQ3Du2msqS99gBPXd5VzJGX2ImDSOyuqnj7RIZBT6Dg=;
        b=N78/kNZ8ODUhgPCcJqEiqS3leghkt9BnyAJ+n8QEg7UISehfxWJAdUfdGlNFN4WHTc
         HroTTjHztJ7Q7mgwOUcv6U2D2TujKDoh7gdh7T07tQTpNoCyHmldWv+A2+FVJgDletQt
         SMXMTRk/0juCc2b4Fn0Tidaw3D+BfYAYKIlFN9JwNdrdkjYwI6lUDPizoMtu9jssjM+A
         1R1weMVzgnu+doa8GE3AoU4oOtrmwONtV/xITr366Zr43q9iOGexrymMO9D+9czaL9RC
         3tqfQwhPnDIoX4K/weM1hhdtHeiIWKQHXDU8qg3abmxSB5Uc806AwQMNvzJir3BVgMdN
         KrqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQWqz5RFWs4qmA8vR2+2PDrRZY3Q3bLqIRSxewKVYg1IvqYNdOw2slObW+pSp2DtELtpKeH8CPvUMuu+QTyxhVfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAVMp3rvrlIMCE0pRxJLDZwwdS5NPQEFj4bQCtwNMAFAcfCHlW
	TldjjTVjigqX60dL0WQH/U0UnSddoMemSYqurVFfgGsCYqzR/DGFYTU95gK0NvU=
X-Gm-Gg: ASbGncsHTeL45odvLPJS40gxhAKntjNXUvbL1CAt7S1rhdB4kmJtiaRKsFSpeX+b4eM
	bgBhGMnqDvh4pedWE1X2y3swyAfNEWTeeNgSrVjWa13Z27BBaoP67YTQYqYJfMBp6Haq0aAGcNU
	wldZNhf4IACqjMsLu4WdEmjzk45vdkZCOsnkIfAQl9ROhZ9Gzzri56wFUBeO3VykgupH9RJeHfn
	BO033G0xaGSp4mo9PYlAxnVpxl+lEEoRsjagMFixCLx7V6bSsAtsaQvzPW+hheMMP0e1kFqypJ6
	PkwaoN55ISNfrF99pk0XwEKol++07KdIZxpaHFsnt95rO1TJc3QOaLY0HCiCZfvVmXEiDJDc5AA
	04PWIFJ4bA0pOCYLm27oiLv5i
X-Google-Smtp-Source: AGHT+IGUOSkbNQi0TijAb91lwptPj1wuZauO4Jmzd3aIvKCh68E4hLv9NlgmiXg+nD07/oJegV0vGg==
X-Received: by 2002:a17:906:6a23:b0:ac6:bca0:eb70 with SMTP id a640c23a62f3a-ace84b55d83mr1224307466b.56.1745916567365;
        Tue, 29 Apr 2025 01:49:27 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7ec0e6331sm3546619a12.78.2025.04.29.01.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:49:26 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/2] phy: exynos5-usbdrd: FIELD_PREP fixes
Date: Tue, 29 Apr 2025 09:49:23 +0100
Message-Id: <20250429-exynos5-phy-field-prep-v1-0-39eb279a3e0e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJSSEGgC/x2MWwqAIBAArxL73UL5wOgq0YflmgthohBFdPekz
 xmYeaBQZiowNg9kOrnwESv0bQNrsHEjZFcZRCd0p8SAdN3xKBpTuNEz7Q5TpoT9Iska6ZQxEmp
 cpefrH0/z+37CgqzVaAAAAA==
X-Change-ID: 20250428-exynos5-phy-field-prep-1b3ea73d4773
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

These patches fix some recently introduced usage issues of
FIELD_PREP().

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (2):
      phy: exynos5-usbdrd: fix setting LINKSYSTEM_FLADJ on exynos7870
      phy: exynos5-usbdrd: s/FIELD_PREP_CONST/FIELD_PREP where appropriate

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 63 +++++++++++++++-----------------
 1 file changed, 29 insertions(+), 34 deletions(-)
---
base-commit: 33035b665157558254b3c21c3f049fd728e72368
change-id: 20250428-exynos5-phy-field-prep-1b3ea73d4773

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

