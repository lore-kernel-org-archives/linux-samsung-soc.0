Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6D32D9EF2
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030975; cv=none; b=LpK38LvRWqid3XTOWet/PPjvDhq6WAM3rvM/9IsYMBW/2OAvYCUGpukWZ1VxKE4Vgdov3hdNIsDBElHvNt3JXz+1r/tu3OG7FrsKcm74zQtU8I7PZKDzx6CBB7G77TRyN0E3lwGY6Aw/mfBkgLEsI+ZcyO9RzmUwwwh9iiaxqrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030975; c=relaxed/simple;
	bh=2oV3N21EVG9NEmZuJ5omnfKLZjJInSpP6WwU9F4mZpk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nP6MJchbVvsZUKyEyJFdnQs7po866VnsFYOT4f5BUu0DsLcDtPI9QHo0tf7DmzWaSMWzhPZIY3W31FHMHU9EBHbZwkBtNZoWODE6vfIhm7+n58XwLmIHI4zEyahXxnGY70NuMnPRGSPWoJpUshVR/hr1WBK5fw23f4PVogXRwIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rsBYYXip; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rsBYYXip"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso4137979a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751030971; x=1751635771; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N2cruWPjz3gexVrRlJMt2yY2YOmBkTyGxfEJbYUktqI=;
        b=rsBYYXiphzUOQsbZBDgtPQ0Njfhr6BqWX3mnspQd10zuUNRlPnFDOjhWpqkr8fGmtR
         QMOkEy6ozIp5M1baudXkiY0fNWJkwkmQN2h36w7MalDQXhCvDFtm4eLMM9sUCim9NHPC
         hrAtZzDuzzj6WItwDs7Eufdez08apAxzKaWG4A92w9dlULTCK9fR6TDpmAN4WpAr7amX
         TEx9rWVP4Er/lHxgVEsy97d4ebln0jpjnrKK7J20R4zFUnWu3FE91oxxE/9B+glMTVgQ
         T8YYzQgHwiM97SsGBprUlZuWMd71zNndeKdmZDoJfpYV3o8W5Jb4axEIO1Y2VDK81CgK
         Clkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030971; x=1751635771;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2cruWPjz3gexVrRlJMt2yY2YOmBkTyGxfEJbYUktqI=;
        b=SwPhgzPAYCM4LVX5yBs3KyD6YEHJqSfe7j5Ixr8nYKfeLqeFGE+wvROIMPSkWUSk6j
         CuAUTOy+EbbWh+1ZFQKULUISq1z+mscUFBKKnoMAwtz4ChUpVF4L0DuF3uuzIPd1X7nN
         H/e6cdUNmNlu73gWWBaLQBiWpYP/EIju87pQGpX7kfgb221q6Jl++T/MtFCPsXVRjBcY
         iEAYUjQqTJzR5MavF9W79gqWtPi3uadzVOm+cuRa9EMq2Bh0Df9eZEkxfnBPN8SZlswA
         D+QfVnAV3mr/MZjC/VWbptkhJfnxE4hR3ac8thMAHqF4qtv41eii9c0qo6B/EmVTQdJu
         s9Mw==
X-Forwarded-Encrypted: i=1; AJvYcCV8R7/t8L0G1jIbipe+6GsUDwHzugAqb+HKb9SDfEWJH7IRDTbLcpMgvDShI69JkQNQlYn9JH73hexbdWNXmzPV3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBJ+uRn7iJcWXnCa7rh7Tmd8zZXJwZfrRpJA6KtiHvKRnZHo0D
	cbsXBKT2anoyEaxSgnpTFBlWKV4w5g0rsdKQpeFHk9ZGYEPEmwXxRIaFqq7P4D7HIyg=
X-Gm-Gg: ASbGncuCOxdoIr73ad7lfgC3ojYF+OBDWAwCw9d8rIrzV/3GVunlEcFTt242KPuPFr6
	4VoXpQqCOfEKm+22DAo6B3bpjXP4T1ubkJd69TFv5nZli9uXmyCtsgmxUGciHc0sCrq39GfSps9
	kapaKClA6kgkPqEaTn80U+LhfS0h6I/z5QDwS6Uud5+UneAIpYxuN0MYGjZ18SgF0A6KdydLwMB
	R6MeukobAl1CNd7eRh3eCMR66ABCHbRhnMaUc08jt9Q48Cw+l/CcrF2KcPO56kBNnRHGqmaRECN
	j8+Ro3A7MY2KA1J5Pp6Ority7pQPeMdrfQuXUjNTJcCp4DQc+3lEHo4NDyIJou1shXLKYsJ7Rfl
	QDwGSZRgVqMr3KUgvFXp8C3B7C3r9qtIpDGissSxt5JZ1OIreg/Giz2WN
X-Google-Smtp-Source: AGHT+IFZK5c46HhXnjcsG+iKu4lVg84Jm5gZqBHYsY+oJqop8E97nfkHet25Wa24z6oqjQJtzHQGZQ==
X-Received: by 2002:a05:6402:40d0:b0:607:4625:98f5 with SMTP id 4fb4d7f45d1cf-60c88e58024mr2569375a12.23.1751030971492;
        Fri, 27 Jun 2025 06:29:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c82908297sm1462702a12.26.2025.06.27.06.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:29:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] gs101 s2mpg10 initial enablement & reboot update (DT)
Date: Fri, 27 Jun 2025 14:29:29 +0100
Message-Id: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALmcXmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNz3fRiQwND3aLUpPz8EmNdC+M0i2QjE/NEg6QkJaCegqLUtMwKsHn
 RsbW1AGKIwG1fAAAA
X-Change-ID: 20250627-gs101-reboot3-83f8c247a0bb
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

This series goes on top of krzk/for-next commit 62cd64f5b915 ("Merge
branch 'next/dt64' into for-next") [1] for the reason outlined at the
bottom of this cover letter.

This series enables the s2mpg10 PMIC, updates the DT for Google Pixel 6
and 6 Pro (oriole / raven) boards accordingly, and switches these
boards to cold-reboot (instead of warm).

A cold-reboot is a bit more secure than warm-reboot as e.g. RAM
contents will be wiped, and the bootloader will not assume the HLOS has
crashed (as it does with warm-reboot) and will therefore be ready a bit
faster.

For cold-reboot to fully work, the reboot mode (i.e. what to do after
reboot) needs to have been stored in NVMEM for the bootloader.
Therefore this series runtime-depends on the Maxim MAX77759 nvmem
enablement from [2], which was applied to krzk/linux.git (for-next).

Link: https://git.kernel.org/krzk/c/62cd64f5b915 [1]
Link: https://lore.kernel.org/all/20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org/ [2]

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      arm64: defconfig: enable Samsung PMIC over ACPM
      arm64: dts: exynos: gs101-pixel-common: add main PMIC node
      arm64: dts: exynos: gs101: switch to gs101 specific reboot

 .../boot/dts/exynos/google/gs101-pixel-common.dtsi   | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi         |  5 +----
 arch/arm64/configs/defconfig                         |  1 +
 3 files changed, 22 insertions(+), 4 deletions(-)
---
base-commit: 62cd64f5b915617ea7978205b336ff21f0801c95
change-id: 20250627-gs101-reboot3-83f8c247a0bb

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

