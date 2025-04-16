Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7585422DFB8
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Apr 2025 07:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789087; cv=none; b=suXRIRujFoUROQhzQF+sIpE2v3IiwZ6VdsSbEMA5/XXM3QDypHIIBEtd41WZ9fUeNfQxsWR1p5cx5gFjqiuR0yATObqIVY/GWA4cWrsaGvXYU5A1G+S0MUsEFl8ftN9oUWuow5ncgwxuk1AbSxVjR1ajFqznIgSz9yhrlQvcnjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789087; c=relaxed/simple;
	bh=bT+cQpwTABxthE21Og42/Nfhu15qsdTLYAV48srb3+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HuV5yh2AsldYyq18W/sWtBT/FzRCfvtiCuyDbBj5gyIp/kJLrMUV+z1XWxBrHSZB5RMjihqNTqCO0E51uxP2cPtj4XlEhhZrSBJjoJj7724LCnoaz6Vdnn18GT60SEGS6peip62E+ZMEFR49bGtZm7KwHBt0NMeP+N2FM0ks12c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VKqSGHPf; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKqSGHPf"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac315695c8fso104344266b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Apr 2025 00:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744789083; x=1745393883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MESsicyyhatyINufDMJoZ4SnaUsTOFcTcz3ZiENjCc4=;
        b=VKqSGHPfXxjt4B+uZnv4OO54qAeihZZpBYJ0vqfrVFpszdI/L67L1H9AUejBLOF/K8
         WVYsZuw2jZiGzSu/xFvHVF79O3wOz9KpoImiobyelyBoVmw0nZfYUihHlAdn5sCJ1K5Y
         bfGc30S2MYYPVIwwmiolZHNFwaoMg0/EclofvKQWjxQxzbbyMx+8d6Ko79QJVLoLYGNE
         QdP7yDgRio25keJX6QIqUAr/i0yhThS8v9/njS3Uv+pofHDZUvStlIt26/eG6V6BxxZj
         wxE6Qu7agSjdcFJWMS3QL8qDBfdd7Xc9BGSbOsxS2LBClQYdq4VA0w9q98k52C9HCfLJ
         vDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789083; x=1745393883;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MESsicyyhatyINufDMJoZ4SnaUsTOFcTcz3ZiENjCc4=;
        b=fKZ6NTeOR7OGHGPEiIrRP8MIsw+D00Lym8bpE3JbHCCu3zEdW/iYtjDmu41WjHZk/1
         C+f3F8L3vd/RaoJzVI6ljUtC8zAMmEKgq6yqFA843rtXuUO9RLdx8+/7AfpjGDogQ9Bt
         LgSo2XQwYM/McqXlZz6U2SSWVd8UsPSrvL0u4ipzHwyO92zJgrW8Tj2u75/0GeEhXZ9f
         kuQPvEvUvJf1+NmateZdl+wDfZgKqZyHLQ0fCb2/vatr/kV644Bx2aSE3bm736cKVlVx
         I9C8HQ/sVrcE5nFcoBOP6FWyQ1YWW+RW/ivfWY657wnyN5HEBhoAvrC9BuGjVlJlCNlj
         wlxA==
X-Gm-Message-State: AOJu0YxSX+aUDhD55ab6oDguTHcJZHfzC1jCsTbRU+qiBzk8cZxpx2/E
	DEhEtJM7IPPbpPNM2mjT5Ak+ptDC2tgFeciLIkIsVfZHpnZGKLLFcY+0GOqu0hM=
X-Gm-Gg: ASbGncvhX21FF8gvAU9tY+EUFaKmIvSAhfY2M42nD94LLeMiNejZE5zuKiJjz5clht8
	OeYbshTjOdta5TR8P9RaEKhK5DjOgQl6oUPVeb7qpv4ut1dhjUNUJ470Wq6CxVWGr7Qrpxx/vwR
	MNSUdDRMC7T2cprx/mYoPA06utSvicvahc6Gxa0bimrQmzUpgwLCey9Q18cEivaO0YS3uM/NYXQ
	MoEhKizw2JpmA/pgRBty5B83l43Z5uadHX6ucc6RcIaCIEqYB8Z/AjXcOaVvJnnLLOZQs2fvEp8
	wYhPwyn1vjMAd49QTG6B7C3bLqvOfTADBBOPxkGpgBkeF+YhUw6L0rVlNPfJad3mqDRXozOAcC/
	lxBgYEn+EuliuW8k=
X-Google-Smtp-Source: AGHT+IGfmvUt/FSzOcqD2du/hnhTnAGiq086+HJ2TFi6ewXNvWJS6ClhkVHTH7jbIEYkihEMx3raLg==
X-Received: by 2002:a17:907:1c18:b0:ac1:e2eb:8877 with SMTP id a640c23a62f3a-acb42b52478mr17700466b.11.1744789083533;
        Wed, 16 Apr 2025 00:38:03 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd63f12sm75397066b.32.2025.04.16.00.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:38:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1] arm64: dts: exynos: update all samsung,mode
 constants
Message-Id: <174478908177.19245.11349422916489425295.b4-ty@linaro.org>
Date: Wed, 16 Apr 2025 09:38:01 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 09 Feb 2025 15:20:43 +0200, Ivaylo Ivanov wrote:
> Update all samsung,mode property values to account for renaming USI_V2
> constants to USI_MODE in the bindings.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos: update all samsung,mode constants
      https://git.kernel.org/krzk/linux/c/4855244996578ac25495a708b426c3f27632a068

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

