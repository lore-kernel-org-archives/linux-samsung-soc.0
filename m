Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A8B23909F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 10:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132946; cv=none; b=W4eWFNFk8xTDSPCGSbEllzGjMiEYLfnqYd22u9CeSj49YUVGs9z4uiFbnG/MX2FHZyEep2ZNlgc5TIYlhIBKwizNvoEp9s7gsdnQf4WiFmGRBGxugTC/pjAO+JBNIzrBMfs7IJdbCbF1aYW78yD9HkpEvfmj5QMX9wahSu35NWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132946; c=relaxed/simple;
	bh=pSmfcyWrGiF4xpTJTeN86T0ysr03H5rq6eBj1nDatnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ClgIdAktwDtWxt8bIMDp92+3pscUenrXeGY86E8BM9YFQOE0f21X24/BLZODYqS+pHRFkdTe6DQws/CTKRSw+K6B24ksu2Ar/apptm6R+CZNfgi1R25AvYrOTe/2kM04fHakLbTNvGTyQSd7yP7ZlnZwgSYR05mjsVN5VnsYDZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HwiQqqBX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HwiQqqBX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso6275905e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 03:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747132943; x=1747737743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yg1c07mHuEVEndX1mN4EPyk/YfVVe6WLz5FXdYEWUKk=;
        b=HwiQqqBXnSYV986xr9Y/ql/EZbdLFMd9KcUdy31uqIzZFA6jHwt2WH5SqjkWYugbZS
         2MRTKPGLw+pS72syJeKquxHetuuGs711hmi0vHap6+jiGjNoPNhrydAvX9kO1Cb/lh6v
         JUTXmJn9kNKaF5oY+7Ec0fwWgoKFWVoOEX0zfU5ZTBS3OdC7uajm+yMzSuMLc+xS7UYF
         gujRgvjBH4olfF5GOouvGF+5HcfDLLjvvhQhqjTLGC/DRAZgEZnbPzSZaBgkwXbTgYQB
         Y0JskSxisMITL8We5ZTnUoCvKatoFErhuQqJWq3KFRcqwUeSvn2kBiaIshvi534kLO8R
         Mxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747132943; x=1747737743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yg1c07mHuEVEndX1mN4EPyk/YfVVe6WLz5FXdYEWUKk=;
        b=wwWzbMqaq/q88yRagrXiu1gO9qgfJL3UGOfRQeVRy7dTahKLCuojo3rTqAxhkb/PGp
         NO3yxFJiJideOhMtg7xU3U0vVzKMky+tlpSIWEjVI+Sis+GSRHQolucReXzoSWXJZDfT
         xYXNhQIEgGURlnwRB0BN3QJe/ulIeIHSCOIPIGc7VGaI7zzfl92fmxK0wCNJVIaLkaYh
         u9dW1KV0Oc5/WqIQWKaT13lsg/dpLVYcZceqJ4Hfyi1g2HXbV1qSq7o2RFsCiDVb3mbB
         M478U4O5ZR5hpv4Vjg6OBdGnm6lPiKRvPVRTbriYG7kQ8KPWS7u1xkIQ4pvTdJlaCjwq
         YAmw==
X-Forwarded-Encrypted: i=1; AJvYcCXCcSwucjWh5svB29Qq2WMIiaSMVe3SOoLsqWrw4Wiue7iljViZgIDoQefvzcwcoJAWBVfn5BdKpz0X8PQ0iOg7Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuCrUeEMvu6F4eTV9hVeOUWdpT5HQWigDj+xBhRwaPHo3vbFer
	LJVW06KqfPX+b+j84n0v8wqPXHkiwVCUjPGRIhWg/dEELdtv+3gvFs9fO6f53vZI73WPO+V5FW4
	mmS4=
X-Gm-Gg: ASbGncu5D4Ep/PW9bK8SMmNj2RfUimUfOz0ySNvss3BWbqOSXod6BdPHhpCsoOA4K9M
	eQGgXIdNwoUVuYCtLyLOHg9cxwYMxr3ELN2BLbBZzllvngGR69p2R1FdN+euLi2xsYRlT5lNI79
	vJShF0hw8uQEG8ytNBU9OX4hQIKtcjU8K4tyVfJ7CJX+bu8kbnIdcfYTRZP2saXcIpRCqmzeQrV
	wcC+ndAtmySean03d/xumDF+pI3faBSdF7K5QKnFr9ezk4cjdJUylwbbcOmDKJxm95vrxMGvdVB
	KB96cvu69UJT59gm7PL3EsOxK8pxKiLPuR3wfccuq8TNAyLx1rgf2U5JLjTsYtAqY+V+lmyrW3W
	36q2lTaNO88cIeMd4cC1lc2TWA6+Suq/Y1aR57w0=
X-Google-Smtp-Source: AGHT+IFoNiPxCt+CMN4614Hku32Rt1pWZtS1Ab8LgzEA8q/WGFVYaj4V1uUDGQcXU9uLbt/oeGpLVg==
X-Received: by 2002:a5d:648f:0:b0:3a0:ba77:fde with SMTP id ffacd0b85a97d-3a1f64589camr4267133f8f.8.1747132942873;
        Tue, 13 May 2025 03:42:22 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm161002435e9.37.2025.05.13.03.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:42:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] arm64: dts: Cleanup DTS for v6.16
Date: Tue, 13 May 2025 12:42:15 +0200
Message-ID: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=pSmfcyWrGiF4xpTJTeN86T0ysr03H5rq6eBj1nDatnc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIyII5bO9UDNY2UW41YhzGm3W79e2lPorMhsUM
 8laVWkGUX6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMiCAAKCRDBN2bmhouD
 18KQD/9duw6hJzlxO6+orDMVLJW8i9K8mDq48xhYYD9+R3ihDIi4P0VwpwYzTj1V9UGm62DpLQ1
 TbVa4C+bY6Kbs9ZzECfRFcJjHsowemsuuxSTB3juYMXN6gtZmrplovDL+vSRZqtlr1kKQ8dTYB3
 Lk2QQ1SPFsBxsAghduP0jhgtecoLh/BfM0piYXXhL2LtYaOV/ZYQVL3USecXb5gdEbBmcW8Dh4+
 QOhSl2NTx4cKibXliq18QZa74cDUdPVOFyoJp54xu2YdlQAUTSodJs9hzZAAg+0kKOTKZisvzaQ
 xI1Kvn16BVz2c2vAdkEDj4ldOk8MD7o5eHN0/uiZiRACZBducpnUW1fvBWGKvMlXJ6zBOmGaygf
 DNrXGI4m/sDJKfV0YVSDH+lnWexQk6cn+3tL/kS+Nr9+xmVPEKOVry3kqlpfbPDMOW7c4XJPulJ
 bdKm4tMUQIyxja3vOvsZbH5m5D/JLzlC5y9wEm8gqpPkS3GmCIgHf/5fOMe5W1LJbDAEnpIS6lo
 akRuP1GMrDwesERkU7c50LPyO95SMWPIN8PFIaAiBroR326pTIAg9tugvdEoGW+dRj3Cov0JxN5
 8zMa/TlEt+HKeOBQdScbgr+b1yl2z3r1ODgttSs8vbjqMDv2hUqUDPoOfuTAQ8UCI0qyC8Q7PcB JLuiWgou0/eQqdg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.16

for you to fetch changes up to 04e7638dd64af20e4e81b7569abea9673e337098:

  arm64: tegra: tegra210-p2894: Align GPIO hog node name with preferred style (2025-05-05 21:22:25 +0200)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.16

Two cleanups which were missed on mailing lists - align GPIO node names
with DT bindings for Mediatek mt7622 and Nvidia Tegra210-p2894.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings
      arm64: tegra: tegra210-p2894: Align GPIO hog node name with preferred style

 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
