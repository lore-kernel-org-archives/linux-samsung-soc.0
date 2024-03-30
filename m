Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3681A1DFC6
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 20:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711830803; cv=none; b=d1gTY6jFETff6qD/VZs/O7HNew1eIs5QD0bveRiEgR7nkowdq75fZBWk90BGamKeHt7s+NOt+NwuQodb4/IKWcgUrxCSx/X2NK8gVRie5y0bnT0GxcgLqJ/NX45wjAUHxUM67g0lGjuO22U9l5cVtnpffQb+/fGQhsDXaWjAKH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711830803; c=relaxed/simple;
	bh=ikAn+U2VxbkfcXOAocqiqsMAFIUnrQGNULyY7tvmZjM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JTAd78KbTYm8n/Lf7mmhd20KTy8X08ttzsyFaoClsP58+oL3zRmj2UcyyVHuFov9uHt9HGPg/q+m5KF5vaPO3UZuTYK1bmUag21FSx8dT9wmSfEKd8/fPc7QnUC/wBOgxyY3z5vxlmU2jM5PbMLchGscA1Up8GRL5BZO6IhK8K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J0vCs3bZ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J0vCs3bZ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3433e518c78so579285f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711830800; x=1712435600; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFAjJDDVv2Mq/JzFmcsO7YxhKCuR+cnUm88ySh3fdCY=;
        b=J0vCs3bZj868wkv2dxCA16usdLTxHmx+JepOHhgNLGhrtirvnyRwGOK7QU8kuAGxkI
         XAwimqKE0ToQZRhZD2eGjLCsReLZgXnm5vuNxSlCPMlf3dalnHePEaHvZ54DxRzsb0a+
         9elkNdrVfMD0433x0LhQBzFqNu6bJZ3dIT0RnvVXjeQUwXR/Dle4HKh24gEmEZcU+I6E
         i587xtWsu6wcJR6o9dEISLZ0x3fnP8wT6e04edOK5Re/KbOOH3X3Df52EX5M5vmOSP/8
         PTbzSeZj7uKmttBPdBXpUUQwHCDYJm9dVvCMyXuRzNXG+Cs+9w04YkBJmL0+ozCgjDz7
         +7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711830800; x=1712435600;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFAjJDDVv2Mq/JzFmcsO7YxhKCuR+cnUm88ySh3fdCY=;
        b=VBi6HaCk+xhYWgLQ6c/6RMUat1EY/MsjNV1hhN7CvOhTxNEyx10RRWB8dYpE+wFeXc
         KV1d7MYbynFV/RW3YBoQ2celUyyMlo6zZQYtK2qjjIfVUpfPPkFPH9ERjVdt/pEzXWgd
         0+v2/K0Wj/EMZZE1SJ8mXx7SxERLoFFxn53Bl+lmpQKq2ajloFBY4tFp6GFLMkWLH0nP
         duepQ9tDt+125nuKUne2VfTlq4u8T1JFuMDNue8aqG6MHSEWsmvZ9/VuDnnmJidUAYsN
         4my/0cNpu3rptD7ajAVSCaS1jkcOYZbdEkA/lnNq2vmcFbFQqH83RU79EHmyeuAEuunk
         p2wA==
X-Forwarded-Encrypted: i=1; AJvYcCXEcn53b043MGW7WGp0gIaKnDFpSuA+OA8TR90PFxn4M7slMX8Sz7jobDfVP9Qq6eSRvkZtIczB/9JdTwD7IUrzyly76OEmxvflhc5ngR2yInw=
X-Gm-Message-State: AOJu0YxICClOvnwIMQQXFfn1xxPPZiq3ja8qWqbGMt05q0Fl+LSVC9/h
	q4xUyhta0sQEZcmg9e1oU3sCtQOUi/nvDS4TO8Wloqn46sWfem6X+PI5WGlBQ1g=
X-Google-Smtp-Source: AGHT+IGOX9rzHnZKqEi/0u/JwllhPjDL5WI+9xrT75BifyUqTbwy5wixNEYn4orV6XKjH7yINyhNTQ==
X-Received: by 2002:a05:6000:402a:b0:341:c9bc:6340 with SMTP id cp42-20020a056000402a00b00341c9bc6340mr5662696wrb.12.1711830799729;
        Sat, 30 Mar 2024 13:33:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:33:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/11] drm/exynos: drop driver owner initialization
Date: Sat, 30 Mar 2024 21:33:04 +0100
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAB3CGYC/x3MQQqEMAwAwK9IzgZq24P4FdmDblINaCsp6yri3
 y0e5zIXZFbhDF11gfIuWVIsaOoKvvMQJ0ahYrDGeuOcwdHjmui3MKZ/ZEXSFfk4Y8pINjSjJd8
 OwUEJNuUgx5v3n/t+AL01KntsAAAA
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ikAn+U2VxbkfcXOAocqiqsMAFIUnrQGNULyY7tvmZjM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcD5nGngLbev9+ND1Nt7ZqZYQsRksp1eacLP
 WkIvzjxXZuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3AwAKCRDBN2bmhouD
 1xbxEACSQfAZBiA6d/aLNg7qF26Uj0wPR1fgjNyfRIfnunql1d/6F6f4IStx4vjq0toKC17p3bR
 PdE6D2sQxPj6wsScga2SpIYE53Q0dXFIBtvqB0F5GqY2+MLAExBETmkgeKTrnv+dikQaqO5Kw3P
 pkPLep6s4eUpf4QSCaKQggBRFNs0MgUCW7mvQu35OOsw7t+rBrmvxUkBWQgwzH+elQw0sA5VgcK
 ljBU/gecnRyddZ/EbhGIuU5qJbFN+UZejzLHwrewFRmWetZQNsG+NDDlSOQuZ4qle8fRP+sIBZC
 Pw7FKA2PIQdtOuNCXipkThniRxQqJSBUflAzKaUZdNHtxHIOmvcokX3S1k4Sx87HIG+ERLN4QwO
 /62OnW4TW2LIewfHg+3H0fsYNghHw/uW7ifEEVqOfgeibGGsgQoOcp6eKUNDG9MIeO5lTt9IQRx
 EeN1Mpis0Fh6cM4l8xTC1D1NcqQS0IoNsudpnX4hbPGgH3R212SOHT8wk1BwatrZdJ6R2Q8x5g0
 EyI24A4UewQQMbyWJL+o7SJnVTaQzlaJzZclJoJV76UpgyHVF8IzgpqWxTWNiHfu3Y2Lh3vdPAW
 u9FjNjO3ZxUf63LnC0ATHBPdyDAHBTgB/xspsVfe8bwnMUNJBTIMSY8Sq2rjLPjEd8nNb6hXDtX
 Cb+Pm6aXb5PFKFA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify the code by dropping unnecessary .owner initialization in the
driver.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      drm/exynos: fimc: drop driver owner initialization
      drm/exynos: fimd: drop driver owner initialization
      drm/exynos: dsi: drop driver owner initialization
      drm/exynos: g2d: drop driver owner initialization
      drm/exynos: gsc: drop driver owner initialization
      drm/exynos: mic: drop driver owner initialization
      drm/exynos: rotator: drop driver owner initialization
      drm/exynos: scaler: drop driver owner initialization
      drm/exynos: vidi: drop driver owner initialization
      drm/exynos: hdmi: drop driver owner initialization
      drm/exynos: mixer: drop driver owner initialization

 drivers/gpu/drm/exynos/exynos_drm_dsi.c     | 1 -
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    | 1 -
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    | 1 -
 drivers/gpu/drm/exynos/exynos_drm_g2d.c     | 1 -
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     | 1 -
 drivers/gpu/drm/exynos/exynos_drm_mic.c     | 1 -
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 1 -
 drivers/gpu/drm/exynos/exynos_drm_scaler.c  | 1 -
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    | 1 -
 drivers/gpu/drm/exynos/exynos_hdmi.c        | 1 -
 drivers/gpu/drm/exynos/exynos_mixer.c       | 1 -
 11 files changed, 11 deletions(-)
---
base-commit: 7fdcff3312e16ba8d1419f8a18f465c5cc235ecf
change-id: 20240330-b4-module-owner-drm-exynos-d2f1b2d48af3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

