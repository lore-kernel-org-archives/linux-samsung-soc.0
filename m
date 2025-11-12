Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D3E2F616C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762937322; cv=none; b=gaFZrDggOcKzUHi6wC/SMIzDPaRedqSdXBlr78Q8wkXzBOcq65uAkQ6pM7fpgX4OHEWkKKOvNEds9JB+NSakjPKzl9tYxUroZI8MwJTG97aanaG0wqSIwWcFueW/+b+NBeGvPfYBrdkF6CT7RABdN1dvx4o0ViAFNyY60Awu+4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762937322; c=relaxed/simple;
	bh=RSbVXOg+8C0nJD9ShcJwOT4ddmb41onLxh0rOGHpDn0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EeAEFhI4TeQV1Da4/0fPWJCV+Ty29epwENJnXU14WeKyv7eE7HfovGeS6P8do432SpKRN1jja0fwCznRduEe2iyael3bxa6IO67n83AiaW9BqUn6DCH/7qPASgb3/nTj7BftPK8cy4ygAl3LD3d/C/+0Okbm32DsksE5vwu0bCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yz1jhHD3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yz1jhHD3"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b427cda88so330463f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 00:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762937319; x=1763542119; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=27w63Mz9ccc5XxoJlnWhVXxnQAo1CrV0jhbhR0EbEXg=;
        b=Yz1jhHD3mV1QGbCN05wXC5G8LeobulepD5zPNm41ef6QKRVyUjZSle7ft1S+jvXYHk
         xYf/M+2F280rLx1oLr3dFeMgLxZHwz39DWRyBSo1mjjPWw3YQxG6XBS0xIYonXrmuysZ
         A8F0tTlnC98epGlIWLZ296FgyS9oAjjOBLWGVMn+pn6icooKWwqGa6uBBo1fnpdFRUiy
         UbBW2iFivuisD6hS0UxgfrOKAqjLdlsgsMItzSEos7oJPUFBRexXDNbFPGVxn3500Sgz
         1AuAwJv85K4f+RXImttEuj1jj4jOlUAK4mBIbykRyAmXRXQTZeDLZqiygd3tr41mEkbi
         OFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937319; x=1763542119;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27w63Mz9ccc5XxoJlnWhVXxnQAo1CrV0jhbhR0EbEXg=;
        b=Ou/u/ViBNCJCQKwXd3CVdSAj7AmFjievs1qBpjLQgQZj35dgHG+JvMPLFGQvVRMRag
         ykyWzUhBMOLV4Kizgx2Vfq3HVvN7XCfhWX0x74qa2d4wIEZ8CPNzN9MescaxMND855HQ
         w4PCuSuPpJRbzoENlQxPV6O3DXk0SxA8OzgJ63BeMIGYQZMxfXcDhxIdI0LT+2YNcd+Q
         YrjsYp4OVeIh8mv/PlHkKyprOEOERGf1S04klQ673K5VGJEy8CMUp33hrDNf5Yzzpb+b
         CqJGbGBlMq8wx66STHIZ9rkp33kHb7oMuAIpffTVrAv8Sewaf0stjI5S3Chs8rlt9iDZ
         DNRg==
X-Forwarded-Encrypted: i=1; AJvYcCWvtn9aGofL4kv44ctyQdq9A+20jHGn1e0U0kGgKjLgW6Ac1m/w6ja95B09uEQAtKIVZYuNr5Lo4lMYFTWoOUcx7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0+SJ6GuonLzXnGmVkjqGf+md7CCcwDBolpLvMMLPegb8dYWwI
	15Yx2NPWw+Vu1oT+eQkQiVy5buG23pRqHjgYrY99pBwOufqTDbEiCUb8y8p5+288J5c=
X-Gm-Gg: ASbGncunZMmWPeOsggYG+dgBL0MwOQAvEmnWefouF/RCmp3rJbuT+1t1FWy/AX95h84
	+WPpjYOT7zfWb5FAUrDkw0dPUXIRnu11jov/yzzwX0iKfIIj1qpDBIhgT2iVbGtgHxATkSUobBV
	jjv4DJ9P7MCgFrwcwXAaWeQNanqvF4tKjHWZ2vOQPVp8/r9JAciAZjNYdzpLMAl+9Y7vCcXY3oQ
	OS7B/I4QzPuypA6KcWBr3bSUOmngU4B9J/KMuC8DXPYTj7lp3tU6qTYPLMmybpwD3nJIk4OpPBk
	pbcv2v64pOcxdoi/knz8228WE0pIb7XF2h4gS7QV5o7ZwZoRX5LsLX+5GrqaX38Xuz4P/JK7Jtj
	PWpxpoB8DmxYOr+rgKPiwYG6xBoXQhTdBgGGgACkJnGerOHAh0ChJYSHR5ycSGo4l5QtnzxY7C6
	4wzSL7uficLm5k5fMhRbZq5+jBsbBumiDVfDEl+YAEJaJOFxSwHmhJRfPi
X-Google-Smtp-Source: AGHT+IF6Pkp2SBzU7BHGsBfFVqx2Oez9GDgT/TNsMjLzGrA9exqcgbd1aqea20wtto2EL68roP/Ewg==
X-Received: by 2002:a05:600c:4fc7:b0:477:4345:7c5c with SMTP id 5b1f17b1804b1-477870cdbc2mr15394965e9.38.1762937319130;
        Wed, 12 Nov 2025 00:48:39 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47789ffea1esm3732645e9.13.2025.11.12.00.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:48:38 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/4] soc: samsung: exynos-chipid: trivial updates to
 simplify code
Date: Wed, 12 Nov 2025 08:48:19 +0000
Message-Id: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANRJFGkC/x2MTQqAIBQGrxJvnZCC/V0lWpi+6oMw0ZAgunvS7
 GYx81DiCE40Vg9Fzkg4fRFZV2R34zcWcMVJNUrLgrA7Apy4IjLMIVrTWV4GJ3utqEQh8or7H07
 z+34Cm+j4YAAAAA==
X-Change-ID: 20251111-chipid-trivial-6a7ceb9d1852
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762937318; l=785;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=RSbVXOg+8C0nJD9ShcJwOT4ddmb41onLxh0rOGHpDn0=;
 b=adt7/AjQ1uwdIeYx3p54fiNoG/+DM7YPB2T8e/yk6GrwGO6jZf7hdNUYf3xy+SldOWQUGihTB
 24qLgSwTqVzAU5RuNRBK2D2sefLgH4xnZcygwFbcLgdbdZ3D4w1dytH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Trivial patches to simplify code done while handling the GS101 chipid
support. Compile tested only.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (4):
      soc: samsung: exynos-chipid: prepend exynos_ to a method's name
      soc: samsung: exynos-chipid: downgrade dev_info to dev_dbg for soc info
      soc: samsung: exynos-chipid: simplify with dev_err_probe
      soc: samsung: exynos-chipid: use devm action to unregister soc device

 drivers/soc/samsung/exynos-chipid.c | 43 ++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 24 deletions(-)
---
base-commit: 4b67e4c65c1e0740ac12bd0d790eb5a9d0091aaa
change-id: 20251111-chipid-trivial-6a7ceb9d1852

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

