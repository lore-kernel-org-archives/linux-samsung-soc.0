Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE94130A73
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2025 05:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742362708; cv=none; b=pPNgiEatikno6JT7jwRZboyXyGmBTa1uhl1P6+FcC3v/6Uwt45nhi6WxtYbkUi42m9NUkEGagxTD+sS6Id8ylx6V31u9beu1JSwNO22TDIMbwr1vg0QY0PUvUzIRvr5Ya7Gt+AVCcvd4ahGg+/yxgAxnQIn7NLo+jE40Yn+GFX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742362708; c=relaxed/simple;
	bh=ZoBBUHOgYpqaffZjzZkxvbpdWsHG/6I6lGK3ZeVlfSQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S8XvCgkrYnGGSQWV/zqqRpox432lFIvHiRoahwig5at+BeLjvL5yNT3p8detFV78xwTKNKR+gDdf4utfnhMyzsaB8kpke/VHxDoyymoBIyJoOzLMI3jSfPCZcRetyal3WF/CKZQV+q0DsBFzG3MMWxYWnaKX9reyoEelrzuZ5Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yEviOLiU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yEviOLiU"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so9526542a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2025 22:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742362705; x=1742967505; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f0q7E5tM1S5F77jiBwtkLZDXXcMdao0HW+6E1Vs/98A=;
        b=yEviOLiUDj/GvGBBctj2NGkgYglhRYtGIV55J4GWw2r760fbOScYswbSZrTA2gHVNc
         uSLx6fASIFQuxqdH3aPvfmFo2FCibnmdb35jwLX/kznivZkE3/8INyaCHdvCQyy0aLwu
         f+lnOx++9HQphRBSmlabTa6KkV8qXZ1QQD34cjZZZGvH+m+bvH0ukOBIKHaPnYe/UxMM
         GGgKiFOV8tfq3jpaj0MQjjwdrj20rEQnk9dm1zmmNSYR40ELxDxGY2zdUaWrJIlnkl8i
         Mj09Ho04L1k7XFEfrewYtqWx4d5Sr+vbfKCzPf+vXsJUccNo3ZdCncxqinRVhzT2gc6O
         t5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742362705; x=1742967505;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0q7E5tM1S5F77jiBwtkLZDXXcMdao0HW+6E1Vs/98A=;
        b=rAG2sgEVW36NC/rgfU161USqGpzfoWcwLymVKMT9nQgFe7vmE3lsZgr+g0gkLSLJmO
         SPajy9DJ6B4Q+aoPKDwNyHkqteg2BIiGtUC9L04pb7kXGrdUt95QGsg9kdgQfTMW3YKY
         3muZNWqRLgaXMsnristjbs7y2XycX5/tl4rCb4pkGonjiQwLGfuc/kA9D7q/7fDoLDm8
         0xSv6dszPBCQc4Fep4VlBXKXxPvra0XP3mq8oQP+Fj+H7OwuWmrWDvp37AH9aBH5kWVc
         dz6zwfODWmhEZSGf7E08LDgs3vyMKcbkpuFnWB4zTD4NiL+hTvFSK6uVkasmCtUCbY0a
         dY7g==
X-Forwarded-Encrypted: i=1; AJvYcCWdbadfEqr72yr7AxjHJ7Xu2cW/N+fBm2hcn31VBFh0B6qhNpSQOPbbM4bqHY0sJ50awpyKEM+pjz7RJPf9d5IT+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRU3TbAI3NssAiznL4PwCnre6O2rvhb04GvOuJPYL8YvS9AbDJ
	BBBxqCvyi44WamW2jVwMDvttH8khL9xfxkUDs6pGChuBM6Vjss68mj4OCQ8sBWRbbSeVFFb0zkW
	UO6o=
X-Gm-Gg: ASbGncvbKFnfcMoWGXo0D3SZWlMOv/Z/vA5V8cNk9TjDM46CuukAY2+krxn56p0WEqB
	71zptTmapPak2MYqwg3TpCJ4VDt8U9lmysOpQ+9UdpgRUJjBpTkM0mCRBR8uCPfBA3V0vSbrx4p
	6lCuE+yKzut4J0w7sUoxeZnHPKnGi+BIAm0dCzidz9I4bO2XLnlwEeAsOpLwfMoprlCWPFhijSw
	tt/9wu1kQb67pxFMbNlccg3x27qjtVQKoCh//R0H5H8CaL0eZYeWkdDyfMoTDRGrj/1ODKxTziu
	RHB60zPnrxGlP0EORK7SJYW+y/oDqHqctPssIb4mT27MX2KeyDNlTo4V7wIASlRhVKChNk4mq+Z
	Z60dXACC0nKeCngGq3N12jmDN4RdQ
X-Google-Smtp-Source: AGHT+IETxQF0HlkGWOHJrycNWdW/ghv4ToDaVOtd9+KfaAEsUmmTturYaUcuKAjEXphuaG6v07nawQ==
X-Received: by 2002:a05:6402:26d0:b0:5e5:e032:e820 with SMTP id 4fb4d7f45d1cf-5eb80cde046mr1054827a12.12.1742362704825;
        Tue, 18 Mar 2025 22:38:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e6d4sm8511817a12.9.2025.03.18.22.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 22:38:24 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/2] firmware: exynos-acpm: read fix & reduce log
 verbosity
Date: Wed, 19 Mar 2025 05:38:22 +0000
Message-Id: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAE5Y2mcC/22MTQ7CIBBGr9LMWgwFKsSV9zBdIE7bSRSawRBNw
 93Frl2+7+dtkJEJM5y7DRgLZUqxgTp0EBYfZxR0bwxKqkHq3ggf1qeY6I1ZaOOCHJyxJ2+hHVb
 GvWj769h4ofxK/Nndpf+lfzWlF1L4m9TBO7RKT5cHRc/pmHiGsdb6BWOSCgOlAAAA
X-Change-ID: 20250314-acpm-fixes-348c058476a7
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

While trying to use the ACPM driver, I stubmbled across two issues:

    * acpm_pmic_bulk_read() doesn't return the correct register values
    * superfluous log messages during boot

The patches attached are the result and hopefully self-explanatory.

This driver only exists in linux-next at the moment.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- collect Rb tag for 1st patch in series
- also drop message from of_find_device_by_node() and simplify related
  of_node_put() (Tudor)
- drop patch 3 from original series, as not useful at this stage
  (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org

---
André Draszik (2):
      firmware: exynos-acpm: fix reading longer results
      firmware: exynos-acpm: silence EPROBE_DEFER error on boot

 drivers/firmware/samsung/exynos-acpm-pmic.c | 16 ++++++++--------
 drivers/firmware/samsung/exynos-acpm.c      | 11 ++---------
 2 files changed, 10 insertions(+), 17 deletions(-)
---
base-commit: c4d4884b67802c41fd67399747165d65c770621a
change-id: 20250314-acpm-fixes-348c058476a7

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

