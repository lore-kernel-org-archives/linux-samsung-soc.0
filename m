Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6217B282EE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Feb 2025 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740384094; cv=none; b=stgC1fI3y1SyrYdqVTjllA/1hCprGFTl4Axzgy/X2UzMr5yCMxmEH/ULbzFcjDtfATRDL4zGR3zeqmjY+koInOsTgcKAVZiL8JMXaS1zRwAmorMc/E21LJSvr1jdogWDlSTHPzNGcBeoOKu0n27QoKxaElL4hE0Sv6biZbbX5C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740384094; c=relaxed/simple;
	bh=oRQzRk5xTUcaDM5dqPMGTeTs7TwHysSopVPkeUpXl7I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nRmxJPm6C6AnAHRropa3RABUASQeoohhhnMLxWpNb8GoVxfJFDvC78mbiUhFYUdivjUiguOYsn/g0jSJ8V9oSN3MN5RAM7gcYFdk0qhklXnM33b2cOSHdt/I4B9MJ4vA3XP05ExDyLbIIl09j3L5JltBzmqLuC1TZ1ewlAzwzpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KapILkno; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KapILkno"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4399deda4bfso27055405e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Feb 2025 00:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740384090; x=1740988890; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zcxQ5Im6UgvOQisVqwrBvBr+aTDn+0rM0hX5qHkX9dI=;
        b=KapILknoX6Bgz+vWT064hKVNmv345vC7x95p7+mQ12xaqCGP4KoMjYsyCrPkciObnl
         4bmdIyrXqZ2uk0NWF7Ptgc5fOzSLlL2BWQGqCjEq/ZngVOBg3S97xxtzcjZ/FThX5b82
         uQcfNRQTU7uHI/DFuoakCDTEf8FpLOFN6pJacNaOriI54k85ldGd9hmnIFHFPUrmGZoh
         wg08oiFKzGPftWu2FJhSEOSVZxWsIRlBd+eJKsPD2H3qUbyODvjngDMNK1yxhhW2LFnM
         bchH1YTyhjFuPb/3eDtp4sMnxBJzARTBGW6ROTFYRDzjZbaiDmi028+E6epML8znmcRs
         096Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740384090; x=1740988890;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcxQ5Im6UgvOQisVqwrBvBr+aTDn+0rM0hX5qHkX9dI=;
        b=N5v/gJLANj15vC1oamBe5o+fN5DxWBHWZDb8ue1ETMiJZ22BmILp0PLKNX9nDYevui
         1JDSZ3OyHH/nrMIm9i/CRUWgxZtcdpDEWIbodj0v/eZnr2TnvV8dx5EZ4Jcu0L3Kld9C
         XJQ9zWZ9pa6lT75N/qpq0hRBajck5A1X+hwyfadxRamfWodcscDc0qMhdXkwGRh0QhPC
         gnho3k7rVa/ymESFrEw1vZXsdY6N57perYFjZN/zMEp6kKlMXcWjLRCkDD9S/kzUjs9N
         ZYpqxoH6enU+5Fk9dIoPgPOt4oyPN51zD+qojEE4zirAa5n6Cd9SssRPWV2OYeLwlg8s
         2jYg==
X-Forwarded-Encrypted: i=1; AJvYcCXlrx31xoXxRQTwcOoSXr1c6jwy/UlPLCPh3NoI0sPofxJnUNkRIljEHE5N4dBZqeImUiiF3J/v/lCwMVqljV3OgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD94xk6LynHELogmikMPB6UlCnI+1BsKpkh7nNJw9nPr3A8OMi
	eHICpjNh/HcO55e4VnWGuPdFejzLyR32tmuaYhHec5t90EPywiezMgFNlbg6OeeN/oeMir7Pnsa
	N
X-Gm-Gg: ASbGncuy6Jr+xZweMfjuQsw8aXPRBUSFg0fqzGTFQYVXbSOva35LtQICj5Bw1xI27LN
	D8ik8LebRhpQl3qT6SQDGSAi4D14TvZYnPir6TBrCP4MWuTfIKYpZsH20sS31XUcGGvHQYFlLLU
	4QbSA0A4o4eKyHyFwkziWCsoi4fXAw67JHMCx/wt5I0EUP8nG0Ry9XId3dDU+5rJL84xQXVg2IL
	PZd5in0JwxddGDvRJSPVSUOHOTnO6vyeO/m9ivZ/sd9+UDgHwOYng54RH72frPEq06UegCS+wOF
	Cuqd3mF77UTxuxpOL0UJ3g5ukHdNDtLPEp57fA5fYJOJhF80ssSPPZXjyi657P/CQfHe5cK8Oyu
	Nb2inRQ==
X-Google-Smtp-Source: AGHT+IEQEeyrw3EzcFeKThOAVt50oI16dNJaA/e4rE8vh2rZw03bfg7CZZRU42r2tScBKfk4Ik5kSg==
X-Received: by 2002:a05:600c:1d29:b0:439:9377:fa17 with SMTP id 5b1f17b1804b1-439ae1f4d07mr102577595e9.18.1740384090295;
        Mon, 24 Feb 2025 00:01:30 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b0367533sm97690395e9.27.2025.02.24.00.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:01:29 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/3] firmware: samsung: add ACPM debugfs support
Date: Mon, 24 Feb 2025 08:01:21 +0000
Message-Id: <20250224-acpm-debugfs-v1-0-2418a3ea1b17@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFEnvGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyND3cTkglzdlNSk0vS0Yt0UQ0uzFAOLVDMTMyMloJaCotS0zAqwcdG
 xtbUA9QyMw14AAAA=
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: andre.draszik@linaro.org, peter.griffin@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740384089; l=1478;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=oRQzRk5xTUcaDM5dqPMGTeTs7TwHysSopVPkeUpXl7I=;
 b=1GPC+AlVrtrDlXyCWt4XXvvUJ+mIw/T4ANo17j4HAMMd79u31gNY//b6q4lBP2v9rVAu+EB+W
 OQODBr0ljjYAzDnslBcQAMWVTXD5G4t+vNS28bvHbt8GTSFQI3av81S
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The ACPM firmware saves debug information to SRAM. Add debugfs entries
in order to expose the ACPM logs.

acpm_framework/logb_gprio_level controls the ACPM print verbosity to
the SRAM log buffer. It encodes a 64 bit value, 4 bits for each of the
16 Plugin IDs, with verbosity levels from 0xf (log error) to
0x0 (log debug).

acpm_framework/log_level has a maximum value of 2 and controls which
SRAM log buffers are printed.

Finally, acpm_framework/acpm_debug_cmd provides a way to issue
ACPM DEBUG commands to the firmware.

Add ACPM debugfs support with the above capabilities.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (3):
      firmware: exynos-acpm: rename exynos-acpm.h to exynos-acpm-xfer.h
      firmware: exynos-acpm: move common structures to exynos-acpm.h
      firmware: samsung: add ACPM debugfs support

 drivers/firmware/samsung/Makefile              |   1 +
 drivers/firmware/samsung/exynos-acpm-debugfs.c | 359 +++++++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-pmic.c    |   2 +-
 drivers/firmware/samsung/exynos-acpm-xfer.h    |  23 ++
 drivers/firmware/samsung/exynos-acpm.c         |  61 ++---
 drivers/firmware/samsung/exynos-acpm.h         |  95 ++++++-
 6 files changed, 485 insertions(+), 56 deletions(-)
---
base-commit: f4d315a1f9d8fcaf608f283f01ce4d66160f44a1
change-id: 20250221-acpm-debugfs-d196d08e6462

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

