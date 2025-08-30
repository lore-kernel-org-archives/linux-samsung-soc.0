Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149E92D372C
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756573285; cv=none; b=nmU0Xw8H1ZtJ7bViFYNVJUfSW4ropwa6Nz03Hw422u7uwkjGNSdbnlX35Qy53xiXWDdNlmZj2uSCT3meAF3SAuBLwyFFd7BqiuUdjyxw91A7r1A9VOjfICh6kTukgkzuRvJGiiJDRbRjvGs5FgTG7ciq0O/8CpJRguOpNSEhIig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756573285; c=relaxed/simple;
	bh=euoiA9H0IBKKhfmhLLup7i4X9ldC4By6je6Eq7Dk2mU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OJvXR9dmqfZ2ZLO6OQHa0qK52QfPVTFfOAghq5wcrAGbztqWvMA9PHPqvlb/Ohcrzq96OqPTUdNBKv/GogS3BDYrwRqVRa1sw0LpQ4asoc4EPyDcLIHxNocAOzGUEvoylN2L5GorIbFLKzODQZogWsP5Kgp7txZu5wyCwSWuxZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c/mCK9yw; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c/mCK9yw"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61a54560c1fso718236a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756573282; x=1757178082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZX6cnQtxQxZvee9YX/ODpRQkmgtz5DN0rLc02L7Qaak=;
        b=c/mCK9ywKWBBB8siwqKTDysI3jupy+VxiybqoV6DYKTOMeM7CxGnGwl4p9pt3XuDKo
         fN8YYEpMKhO8YlOnZXDpHQ8+aKaBurpQ/38AUh8Wz+TWzf4l+g1Zk8fPfCWrPiHFJIrh
         oSoX/Evbpwitu4Q9gpjcgADRiufZpKcFgWt4xHpHeoyk3aGj2jskz6hsMHlmBP0AngU1
         flMlh1zCktNn7qfA5YfpDZ+RaM+LX7nupvsKjJScj5HpKECgVpEgJVSRmwZKeaq2HDpi
         w0eoOP1wF+Amb03yphz7UAAsHLxpNMbxUOZYMSCV5g3jWTlaGfn2RT9WfMHg21jPPk+R
         JMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756573282; x=1757178082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZX6cnQtxQxZvee9YX/ODpRQkmgtz5DN0rLc02L7Qaak=;
        b=O14h2B84sq/eJPpeGUU2MM6yGqcZNnjBwSKM+5ogSLhPvtZdkEAEo7GtU9sPk/IH8u
         OEM7KLpwvMgpZ1igfNWFtg7/qB712wAfoZae7drYr8Yb5FjGF057rDlZYHrpiS1ERf63
         LhN69hhxXvweM1hGhtI9KkFNlWTSTwQxuehDVHFWejXl1wb8qbRjsKG+fyXZdi5ypZpc
         AmVXTiZJwDyEKCE8PeeJZCJR0bxw4hFPIYLiGjr3Cl4e1mNYgz+ah9X05DbOyBg40qQG
         EiGIXc+nVdqlw0Kso777QS+R0wk5/mNB/vt8RY5DknYGtElwl7ZDdF77kyYKKBsvZDb4
         RUqA==
X-Forwarded-Encrypted: i=1; AJvYcCXhNUyYnNpGpZzhdgHVBE+AlKNML26HXm6Z56JZ1ppX6vYA1jhKeyX4KcnMhGjLZHneLiNVL+/K4YCTWDWPRkKC/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEhFUF7HB2njxVBmSEJs6FRizT+uecURDjtOcxBYeo50TFC3Xx
	CShVtqTAO9fp78AxBI7c++FIx7G4qFj9i9t9eiNu/jh1zbhcrIqTK8HcWfv13MD1UBQ=
X-Gm-Gg: ASbGnctBjHJ0Y1BGDS5VigQF3AMQ8titZ6izIWVaFVXUgHjCnTmYO258kc/+wdDQwxe
	PrVb+BiP1ObN4GS1xiEn+/g113I69mKmVlw8cpb3rclJwLhoJCXqmXhyQAeBmIzgs/XzNGYAzPi
	ywlWkV/2AdtLpV8elxOxbzL2W53VSycfhQ49FgiNBSkymInGtFNWvjmU7SDzzqpoH3h8McFonlW
	FQgX6zDU+kHKRi75PDkG5RjcsHYOU1IKeKiqLqOyZfp2sWk47Z4LY60QaWnzYNl0Wq2lLgMU10r
	BrQZJrcP6qR7mntf21I7JYXJRuuEvQsQ+PnT+sJH1Sxbk/Mr0jbhaYWDDuKT+2vJuRfT0lToHF3
	5Z5646bkABFcx+5fccCuEWgwfiOz6uHfXEXPLHwc=
X-Google-Smtp-Source: AGHT+IG6v7udHvpdgU+cS2oIvFGVg1zj3T8UwQ+2al+IoXWKlYP8p1wC/7NRk4XZOd4DR47tWUgP7w==
X-Received: by 2002:a17:907:1c9f:b0:afe:d028:ebf5 with SMTP id a640c23a62f3a-aff0f0207fbmr225223566b.5.1756573282447;
        Sat, 30 Aug 2025 10:01:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm309038766b.88.2025.08.30.10.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:01:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 19:01:12 +0200
Subject: [PATCH 4/4] ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-nand-v1-4-05b99ef990fe@linaro.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=euoiA9H0IBKKhfmhLLup7i4X9ldC4By6je6Eq7Dk2mU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosy5Z0MFsP7uvApyA5lBYdFGTBsKp1EP93sAPl
 S4mTXnlm7mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMuWQAKCRDBN2bmhouD
 1yaGD/9ps5kKEsFoE7cwJV5YbXWQRh6c12gbpekdIil86expD66B4EqE9aJiprN1sJkisVMeRa9
 KzRKfWDrkotxbxmxcF1S8RlACyBAHc9O1eBaYD4p9ZJSmDXGManBHmMuAXnrCvajSUcQxDoZXkz
 lA8BX31lmw7dl/WBYqnDaUjox3pRJJLOIH9Bpsi+O2Zh/LKbL3LjCbmDNvQ825c2jSHfcKeZcZO
 lVu+NnN7j87OY3gdsky0Fy7iY5gGnvyem8yBOYVBjlk4aUQV4el8npkzE95mcUbLGWdxuOZUOO6
 OQ8y9ng5eMnxd4wxWE7xehibqDn1RODbA2ku2wCuQkcFQgubF5QgH8rk8KTVWrTM67xfwQ+9lNp
 NPlWwUL8feF6EgFXQF/PlfSc+L3Ajmi+5SuyQAu0pN25MoLTAvguRBaz0HSWBZ/ccH+FaTCpnqT
 2qgqIMd49hgAiNnCbVQq6Q7JU1r0CpKbw8XHdOZYGGMJj+FGR7JLoOeJAbhUlSymvkzcoPNI/Rn
 5eGcJbkCph5qNXCMqMCKMc+twgH0f0KDwQ3z/C9fGSrusirQ23ULNb2MHGgts4ZE5aeycJm7nGh
 rZJ4sSZwAnbR/aw5brRpow4Jk3rucpmHcBrFYvBaAMgnClM9qhC/lRVoyrDipkQCbidFAmRh3P2
 AuhCtHO2e/1GaLQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

MTD_NAND_S3C2410 driver was removed from the kernel, so cleanup
defconfig as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I will take it via Samsung SoC.
---
 arch/arm/configs/s3c6400_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/s3c6400_defconfig b/arch/arm/configs/s3c6400_defconfig
index a37e6ac408251903212a7e6cdd5972c10bc10b79..967b1cb22136cb60ff8eccf15997c669ac2ec743 100644
--- a/arch/arm/configs/s3c6400_defconfig
+++ b/arch/arm/configs/s3c6400_defconfig
@@ -11,7 +11,6 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_MTD=y
 CONFIG_MTD_RAW_NAND=y
-CONFIG_MTD_NAND_S3C2410=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_EEPROM_AT24=y

-- 
2.48.1

