Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF3238A714
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 17:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744235; cv=none; b=Q5+mNO9De3zwcL6aVmnp3X8l5lEzCNpujsf4PPk4bzlLle5LPKoiA1CTcok4MjASxa947ShGnRroTXqm823TpaKnNfT7S8+z2K7LmlM8dT2zfJxN2JbKS9UbQqtVI6LvS2wj0mFcFmiX9OyRLK81qcbbY+LUJ6duciSRDWDjasE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744235; c=relaxed/simple;
	bh=V8OfhvBu1qNdN0KD4nFF3ROMtpeDRLHG6GJmQmeUi2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rvwHRylVRrXl12Bg+r91kKXMXlRqKFvErC+Xr6epQOV1dCPEgWC9WGJmmVSqo2alvuc9GKSxF5cyiUUivKtgyt1De/OS7TiU825f0jJhOPi8cQwShtGRwRpPdiBgbZ4hbFaS8zQNwGBRtgcLyq+VHX9nQmYgZMu95QsoYI9QAQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ElN3SjIc; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ElN3SjIc"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-658078d6655so7837349a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 09:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770744233; x=1771349033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQDNu+LBE5AULrwMKg6yBqocyEp3U+FKLIXmvE5hWBs=;
        b=ElN3SjIcYnKvykj0s2ap5fU++kJbA+OynAbOndMA7afksu7Q32aBvK94jtztl5W2oD
         o9PobOUHK/OBtmTy6QinZSgigX+l3c76lzGSEJvvkydm/+lOiGgeLQKXLJFMe4i+KLwT
         S+vaKek142k9XpWiAzpMqNbc1v3ph3RREWyeqXb+mvJfLxg8JwA+YYWKSglxjRWcioow
         e9k6BjjStWRR6fqu5LXufLRHC8VUMhy+7gQjKLIKttmJDEKWwPiIQx3OuznP4Erzst6L
         wqpGpKgloxLXcyO52KKInwuaR7tk2fJqdlrgCzMn1knRQa0yan5VUhu8kDddDosemDNJ
         Aonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770744233; x=1771349033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iQDNu+LBE5AULrwMKg6yBqocyEp3U+FKLIXmvE5hWBs=;
        b=NSQDer0Sj0mpJDvl0jXAT6Gs22T2jJvoNcg+0xB1rkGgt/wo+WUwsu9EWadtOBWK1b
         DvmUEim7269irY8XFLRpjd+NFrm/+9vUQHNd+z6VbXDAdo+qJZ/94X/UeGpuEY73c/iH
         A3pzvyAJClVMhJAKW6fV2k4DB0WJEEeqd6uuyEf7Ry85duT+f1L6kaSLcsdL6bac9jJ8
         /gOkJP25t3OsM9J1R7ziSQSukEAJTRRZpYxdI8Z0jr696pDzjTU0i3Ou8OVegagyruwD
         qGu7VzlvwhDSFyTlEx1Xy+ASr1/nA5fHZaxHlHLkHOKDT7BiWfMWwp5wWNVL11P31EUn
         +z6w==
X-Forwarded-Encrypted: i=1; AJvYcCVbBl8A70vzYd6IynMRLkqwshzvd2LGqo9NPQqMXTuBpeogUzdPFMS6DwnnaRsgY3czX7JM4sJRz+wOiucvVXpRlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPpYRfftuQkS5xKjEJK1UgSXmiB53sr5kE41kp4TLE9ztOQGqD
	VSE49SJicTJBcXqjIoHOli1V8LiUn8ClZwG8mPIshDcBKWz6yx0aqC1j1pgi6IfczDHcyTefvAN
	QSo+RvsU=
X-Gm-Gg: AZuq6aIcZoBG+ecwK2xWeRHbnIhe3CmPSMcLFsJkx+gIXK/4nuv3hZeFg32kvPzKpvB
	qZ+MnhnVyrXXYdXsklincdtO59TGahVhaoVim71/U8+P2UZApDNBpMNwEi4kDu4FyMJyjK43pHy
	UQWo5KktDc5BOdhxz2fa/Sv7dszjb6c8hqLllCCuDBV/ys03yiCdiQvOsvYwzUxEWavlJKYNJgy
	NPpqbjfYWZrR/97ng3hMAqt4oFfJ5ppFLMqocVTJINZUyUaeV3dI5fbt8NUqZKUJgNHl2mAvWVL
	+6AJY20s+HQW5hks6XI3ogUX96fkjKPMJJAkbxEuBDBmUpNgpXqBkEeEzOkPp71CwOirKKdXaCP
	zr7g4VqZ4maQmILVYi3VhSgeRW7s6Be2uhHTpGTU5kK0hOH/fBmylSKTJiiLn7y3XOZ8GyhQjfg
	jEmL5k15QtpTsg/bCXfFcA8Q3sXELizXzZAVWoeiZWGr6gAX8jK3M6jKMk2LWwmk1o9ZHKmJa2l
	dXUdLmwcvNXOVtqyTOlAgRKZ6cH
X-Received: by 2002:a17:907:6d0f:b0:b88:713e:78a5 with SMTP id a640c23a62f3a-b8edf25ccebmr891244466b.28.1770744232655;
        Tue, 10 Feb 2026 09:23:52 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae3ae99sm565533666b.60.2026.02.10.09.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 09:23:52 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 10 Feb 2026 17:23:51 +0000
Subject: [PATCH v2 2/2] regulator: s2mps11: fix pctrlsel macro usage in
 s2mpg10_of_parse_cb()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260210-s2mpg1x-regulators-fixes-v2-2-ab3d3457f1ae@linaro.org>
References: <20260210-s2mpg1x-regulators-fixes-v2-0-ab3d3457f1ae@linaro.org>
In-Reply-To: <20260210-s2mpg1x-regulators-fixes-v2-0-ab3d3457f1ae@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Commit 979dd8da76eb ("regulator: s2mps11: add S2MPG11 regulator")
incorrectly ended up using macros for S2MPG10 in the S2MPG11 case. They
happen to end up giving the same result, but for clarity, the correct
macros should be used.

No functional change.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 2d67c5c16f487506a2e9e4b119f33faa846269f7..81cfd60460f8bb35a460f44753abfbb745121322 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -440,15 +440,15 @@ static int s2mpg10_of_parse_cb(struct device_node *np,
 		[S2MPG10_EXTCTRL_LDO20M_EN] = S2MPG10_PCTRLSEL_LDO20M_EN,
 	};
 	static const u32 ext_control_s2mpg11[] = {
-		[S2MPG11_EXTCTRL_PWREN] = S2MPG10_PCTRLSEL_PWREN,
-		[S2MPG11_EXTCTRL_PWREN_MIF] = S2MPG10_PCTRLSEL_PWREN_MIF,
-		[S2MPG11_EXTCTRL_AP_ACTIVE_N] = S2MPG10_PCTRLSEL_AP_ACTIVE_N,
-		[S2MPG11_EXTCTRL_G3D_EN] = S2MPG10_PCTRLSEL_CPUCL1_EN,
-		[S2MPG11_EXTCTRL_G3D_EN2] = S2MPG10_PCTRLSEL_CPUCL1_EN2,
-		[S2MPG11_EXTCTRL_AOC_VDD] = S2MPG10_PCTRLSEL_CPUCL2_EN,
-		[S2MPG11_EXTCTRL_AOC_RET] = S2MPG10_PCTRLSEL_CPUCL2_EN2,
-		[S2MPG11_EXTCTRL_UFS_EN] = S2MPG10_PCTRLSEL_TPU_EN,
-		[S2MPG11_EXTCTRL_LDO13S_EN] = S2MPG10_PCTRLSEL_TPU_EN2,
+		[S2MPG11_EXTCTRL_PWREN] = S2MPG11_PCTRLSEL_PWREN,
+		[S2MPG11_EXTCTRL_PWREN_MIF] = S2MPG11_PCTRLSEL_PWREN_MIF,
+		[S2MPG11_EXTCTRL_AP_ACTIVE_N] = S2MPG11_PCTRLSEL_AP_ACTIVE_N,
+		[S2MPG11_EXTCTRL_G3D_EN] = S2MPG11_PCTRLSEL_G3D_EN,
+		[S2MPG11_EXTCTRL_G3D_EN2] = S2MPG11_PCTRLSEL_G3D_EN2,
+		[S2MPG11_EXTCTRL_AOC_VDD] = S2MPG11_PCTRLSEL_AOC_VDD,
+		[S2MPG11_EXTCTRL_AOC_RET] = S2MPG11_PCTRLSEL_AOC_RET,
+		[S2MPG11_EXTCTRL_UFS_EN] = S2MPG11_PCTRLSEL_UFS_EN,
+		[S2MPG11_EXTCTRL_LDO13S_EN] = S2MPG11_PCTRLSEL_LDO13S_EN,
 	};
 	u32 ext_control;
 

-- 
2.53.0.rc2.204.g2597b5adb4-goog

