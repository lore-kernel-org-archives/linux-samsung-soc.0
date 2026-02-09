Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A253237E31A
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Feb 2026 15:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649672; cv=none; b=S+w7vxU1214i0Gz2tTmobguPh7Hj3MgzsQO1clyNi/9Duf/30t1xbzdU75tEUDNAp2Kj2J3GIKLQiKzzqBv5Az20PdQY39+04iGwchcKheUz8xkGwXImfKhReOuhZZerxzrr750ar5JlGRwi0raSE8E/OQhwEEFU5NJztmhTFso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649672; c=relaxed/simple;
	bh=V8OfhvBu1qNdN0KD4nFF3ROMtpeDRLHG6GJmQmeUi2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JcMcusIx3tZm46Sse+7frZxkitJeedsJlpzN9TyG8LVWrNhXBFWNLnAGuyrJruVUXd7qxhfXVXKV7BsShjkj/Bmy5m+8ubF/0tct3LxjS3vwHMCyXTAOLpU+i6Wr/QNsXA4QGywbjtgQl1ZDw/7jmixJMqg0xP3vSdsu+I8sjW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T3RSrrWw; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T3RSrrWw"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b883787268fso480928166b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Feb 2026 07:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770649670; x=1771254470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQDNu+LBE5AULrwMKg6yBqocyEp3U+FKLIXmvE5hWBs=;
        b=T3RSrrWwX9hL7Ed2MhOoyl+8HMC1lDGudWnFmpHZUdYyT1idnLAAHqEwtdhOfi/6Rs
         ruqkHDKE7wqdzOSpoNCebTRhOo11eU4DbAxA3B5/Iz4dbM9/OFj1l/Q94xwCs4FfNaZq
         85KdbaloqHlgf0h0Uf7jJC1bVPGNKub/fQJEW0yhkMqnZ824mesNog81z1jI8mkWfIx2
         C/g9CBCE9VTT3W9g74EfRc468//jpq9QXEO+oZnYunP8EIzOkAj34QfSN6jmOhTZyYz4
         Vtv80Kbogtg4gWpKgXUTGtz8nSJkqA5rjxhw6EREpltgNPqOPIWuAT+s13KhcVHPAPgg
         nbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770649670; x=1771254470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iQDNu+LBE5AULrwMKg6yBqocyEp3U+FKLIXmvE5hWBs=;
        b=Y+95oGXhgSL+gMAOVFfl6WGhlUlz8HiXP3KY6R702HCy76Z+eJIN3NyAqRcjqQ/TCF
         QlVrvAd88ky7g+qu8QLFsblQMxe204iFmNQu8t0il3VOHUIuKO4GndT5FZmWdEOjiDXO
         PdPYYkPTt+t45D99saTwgnrkMvLZfuKaJNUyHORwNoOHAo7CY8zPYJVZvz/TeuURYewU
         fGqzKzeBIF+DkfyVlCiUCBHZWiY3W17uPbDbeTXPqi7C15oqKhbOjN5zEfOyl64ZSKYK
         aBReOMrRfwgQxCX6qCRKgGcotOTi8wSnx0P0aeGLnReXNdSHK5Lg2s+yEomIk8lBA1ZK
         by4A==
X-Forwarded-Encrypted: i=1; AJvYcCVaf2tvnH2PGaoFpHtjzYe10opo4/1yXaAkEPawlo4d1QNxQtI+hOGTCDXYA1y52erNMFHcLRHMFcfLSI1lTAo9tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZKvOQpGZyB2010zR4BlA+DN1cL0M7aWeLDrGFLJs4YND4BK93
	iLnBOsmikQhivw8KT7jKQLVn+11WcM/6vzYfvM7Hy74YHcf1Iway98n3cbp/au0OosNFqxiUn1X
	70OqC8KM=
X-Gm-Gg: AZuq6aI/wh4DAPbnBuWYoiQx+WZMsl6PyCo0q/py9r7dkIW4XrK9SkOBLPrccNNQs+X
	CcDHO7iqRD1YUSae7fQ3ALafT7tvv9HBWA5K/AU8HHxosFM4yq4g1/5n+mMY+0sxagxKChlFTzm
	vBvB99GIl2NokEVctNPMQtOkCgTDU1k1H0M7FF/G0fmYb8xu0blkC/qW6ASDuJ+mFM+b+GfH5mo
	zuMMUdNqsp5fncIr55w2O4eZ6edl0iROAIB2AYqrQrThMKTf5mERsMjpV3FN24/5l1hxrRY++44
	7ziC5Mpi877P3pFS/GX7w/9aFXf9SWHGi92YR5btffB+YpfreCYxwN5/w1rB2VVY1zUOqN0W4uw
	9nEn7b2ZwE0YREV3ckzgwM6ByQ3qooiPwW/z/fK2M5mw47LDxF3XCOHAVEkO91XnJBUWUfaw+ns
	JtGls7miVFkYkXglbmpIndTGZvrntdpSJ7eRVuKHQeX0+qzN3jxiw8tq5DS5w3ha5cyxW5wTvpO
	c6oVw==
X-Received: by 2002:a17:906:d550:b0:b84:2075:b902 with SMTP id a640c23a62f3a-b8edf2f9c23mr597148866b.36.1770649669979;
        Mon, 09 Feb 2026 07:07:49 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae6fa84sm393516366b.67.2026.02.09.07.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:07:49 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 09 Feb 2026 15:07:48 +0000
Subject: [PATCH 2/2] regulator: s2mps11: fix pctrlsel macro usage in
 s2mpg10_of_parse_cb()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260209-s2mpg1x-regulators-fixes-v1-2-ead348e64e14@linaro.org>
References: <20260209-s2mpg1x-regulators-fixes-v1-0-ead348e64e14@linaro.org>
In-Reply-To: <20260209-s2mpg1x-regulators-fixes-v1-0-ead348e64e14@linaro.org>
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

