Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D907C20D4E9;
	Sun, 31 Aug 2025 12:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756642398; cv=none; b=kCvH31m0jLQ78AjQ08VKTEwrrEjlVkk/h7dvOZDbZSsd2AV7kHyCgmti/Wba0/18sbHV/OdHBvaPLzub2xh/30+SByQg3zuxdYBBxAyl8glHiFuXVGYialJLHcRTp8QgOZVtUzQbEny7PGRc13Yf3T5wBtSzEdaDIDxF183d2+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756642398; c=relaxed/simple;
	bh=fuxHW4rePv9EsV3Tpzc5KQNt5HrwUJa1W4L1YzEvEwM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hATgW0DW0zSg0DZ0Ofww5aU7S8rmsxfWHXO4SFU37zums/WRs3SkdLPspruXn55lHApLkbS5JGxuAwahIfPx1hL57mihh3SaQuY1QGmqOyPuEfB2vV6pUg+r/LNRDDAno7qjL9PZ38EwtxMqWrwTE089i8G76zIdC89Xk/NhMLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnrQ3CbS; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnrQ3CbS"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-70dd5de762cso27826206d6.1;
        Sun, 31 Aug 2025 05:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756642396; x=1757247196; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s3qXwIOFHOBVJZsU4pjXdZDp9jSucFH0f3d5lu2OlG4=;
        b=KnrQ3CbSC6lv9mdUpA5c7zg9a01/M79CP/K5dUiU79Y1L7sdV6kqDFNMlRtPCKs+vE
         9PE1+MxTqYMiFSY9BSnMFtdvzy2LKe6dMMwc0kK2bSSdpSac9FOk5jyIodMOYGJbfDjg
         MKu1jeTPr8Qv5kPD8QCHjZain42My+t4uEFyW+btMNrjkjABNEXvTitnhAeiiaTk2/NM
         tiYkCK+2SOviFAGXWhENcIvZAqO/1TwQPAdbT8P1d5M+xqOUFRdBh/tPlbAcRqik0ZpB
         VQ8sP+nD82SWW17xeKga31CBRCylmH3T/36FEPOXnSin435uSmBqw29yijr1fgy/hV5P
         d0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756642396; x=1757247196;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3qXwIOFHOBVJZsU4pjXdZDp9jSucFH0f3d5lu2OlG4=;
        b=wL+WIm4YuAMIAg1MCz+ixZ2z7lo0oexPUcVnTmYLVDc3WxSd4fBqxKSJU94YlZaXl+
         bjr3XAdBadoZ9u8g+93lpV8iciRYxO9ciL/W4wRPNZ86/ef1dSi430L0hJuEkMLOvYbQ
         +9OFMU1PDL+GP+7Xr00tad1CkcalpJl/Tewr6/8/YWyKptH1iqEcXbe3FDa6TpfWDx9e
         ufqMhsoyBNQham59uOTFU0qXuVHYxWAMExRZbe/BMASTGz3wJxqh3PtPakJ98LwUqcPD
         AJ8jX8KaTCyq01o3xBSENOYxsg2vC/tSFnNQIAMI2u+kKkoPRnahCYFT9x757p2N2agB
         ubJg==
X-Forwarded-Encrypted: i=1; AJvYcCUmpsAUg6ZDyp/9G2VbvH2DJSLpXwFK6Lix8czfHxwZIeyoF+AZskqxMi9jGQf+cp3ehp4TQZj9neXtSVHJ@vger.kernel.org, AJvYcCVaZD0FQXC9hGaRWIzKZoNU58OEWkK0u1lD2ZL3+7YmFIyYeeRL6WxEG58bslxyaMWrpuS9F2Cr5UPm@vger.kernel.org, AJvYcCXtgzXbWT1+6nFITsez7TfDbhbilZ1aemmKg//TscwQLUDDiBbAX4EA5YsDzzv0efpeRJZMz7vgr3us@vger.kernel.org
X-Gm-Message-State: AOJu0YwND9AfhSzQYK1Rsr7nlXw5WxKRssj2U2CJwF/IPiEj5vLkR//g
	y9m1ZZqFwpPxZ+HdNVz8ByntnGAle7fx8JxYhkeXJ/RiwWz/ttGpx5lJ
X-Gm-Gg: ASbGncuwSZMYay7scTzycrneZII7DHGpANqqFXS3G3MhIdyHtyyKRDsjE0L3MC+6+CI
	5+5QvFfiOB2Vx2y9xieGB8n9lsMpCMqRx5nF+iJXiGhd5ZgxInNTKZngWf8QWdJpK2wVPGEPXDd
	/GIBKML2WOIApPXBpYlYr1BRKvSRxCrUbMPDUTgpNZt0bAuOmq4hvBcG/b1emMmKkrST+IqafZ6
	gf8qfpiEHmol1VuFvkET78qTOhMwnYGXfX5L5VpJSMfZHzBTXnWwk1W11vAUHC2vsHMDkCjYP4C
	Kvlw7wXHCnPVE8O/uzsKvTso0feWqXS8zaG+RDl/5lAWm1Q3fqjNwsZD/uzcz5dC8iPveZ3FNKc
	21g779m04Nrv64qphC8jaPiIgk7+YH1aAcaWieMy7Tw==
X-Google-Smtp-Source: AGHT+IEcejfsOll0uj/k+IQ92YJQY6CEW950O4QMdMtE2aAH5qbhTjPSF7OjZma48BPPr9XkxVIrWQ==
X-Received: by 2002:a05:6214:622:b0:711:9196:adc5 with SMTP id 6a1803df08f44-7119196ae49mr32548776d6.47.1756642395693;
        Sun, 31 Aug 2025 05:13:15 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb289f518sm21163776d6.56.2025.08.31.05.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 05:13:15 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 0/3] clk: samsung: exynos990: Fix USB clock support
Date: Sun, 31 Aug 2025 12:13:13 +0000
Message-Id: <20250831-usb-v2-0-00b9c0559733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFk8tGgC/zWMQQ7CIBBFr9LMWsxAg1ZX3sN0gTC0k9hiQImm4
 e4iicv389/bIFFkSnDuNoiUOXFYK6hdB3Y260SCXWVQqDQOPYpXugk7uF4rrx2dPNTnI5Lnd6t
 cx8ozp2eInxbN8rf+fdn8LAUKVGQ1GY0HdbxMi+H73oYFxlLKFyLvon+WAAAA
X-Change-ID: 20250830-usb-c8d352f5de9f
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756642395; l=1070;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=fuxHW4rePv9EsV3Tpzc5KQNt5HrwUJa1W4L1YzEvEwM=;
 b=2qNTorBIv+2AfSMWxkIugjFdXaCRccVnUwZK9qE3D7n969WZLJ42l1NR/OE0nOTECUgx4J2wT
 HfMs92BHwp8B2k+AARMqQpuiaEV+2CMSQvl5PfIgP+CwXgfGKMQX9aE
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Hi,

Small fixes for Exynos990 HSI0 USB clocks:

Add missing LHS_ACEL clock ID and implementation, plus two missing
USB clock registers. Without these, USB connections fail with errors
like device descriptor read timeouts and address response issues.

These changes ensure proper USB operation by adding critical missing
clock definitions.

Denzeel Oliva

Changes in v2:
- Removed fixes tags and stable Cc

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (3):
      dt-bindings: clock: exynos990: Add LHS_ACEL clock ID for HSI0 block
      clk: samsung: exynos990: Add LHS_ACEL gate clock for HSI0 and update CLK_NR_TOP
      clk: samsung: exynos990: Add missing USB clock registers to HSI0

 drivers/clk/samsung/clk-exynos990.c           | 8 +++++++-
 include/dt-bindings/clock/samsung,exynos990.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)
---
base-commit: e0edfc39b62e35dfb6d669b1189fa268147345ef
change-id: 20250830-usb-c8d352f5de9f

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>

