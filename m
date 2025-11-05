Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EEC2C0F97
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Nov 2025 07:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762327525; cv=none; b=BbYk/taS1Rgxw5DZUoYc7hhMgY75Uj14KG6ijvEq71cn+P2iuFkO1SOCN1CfDe3S4KmxafQexminy6hKA7Mb7lcsZb3t1AO3xfsFDB0uiccoBLl77uUDn+yzdQLcA5/ab1L1SBKjI0v5q7BO03DzcN1w1VdLFVYNlg7aeSjvb98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762327525; c=relaxed/simple;
	bh=tvmPBYZnlM8mLqw3SaLismRnZ+xLMx/VxpTUkKe69Jc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XoNjDiTjwZLcPvbTA4SPdcUqBFfjfbkJ9GUhp/s46Lh4WA0OhgAsOZw6oPH+sMLoX48ZhMfyeLxnrluBmeBxbNJwCcidLpWWgfBUmABccxgKh1UXtXcYWraYHKXQUUzBzBiE+VEBYEY0i7dlvOROzIrVm5z6S9xmUBL/Pm7Itww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gmPiwXGU; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gmPiwXGU"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64093f3f7ddso835113a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Nov 2025 23:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762327522; x=1762932322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIb/KYzXNYt0u1RpA2PEFtOULDEYN0eGfooGuJh8/ic=;
        b=gmPiwXGUxFDhxWgB8oDGH33DrDsUQktXzPpHGpSY5WXjj0Cul0afuRBhGPQP5RADYT
         Sed2cNOZXDYbs6zIgcHQOq5e/qq2BwwTXEr6r0CHaO6C1DdAEbovYHARzjCpm7vgCnyj
         Z5A/3Klo8A39lagFqrso8S8Ywi9qzzVlpLVhEiSxUDdueVH09QJBP2SdwLqAr6FYc9JO
         CXaM7D1W/0gBPoT4OOV1KBykwM/vp6lX/dMb7k0OjjeEEPeOJZmc98MRwrev2blseXjf
         W9ccaDr6DHlsl+cPLHG1iSiVm0P9TdHSrLi2sAPX02C7jHNeSGV271776g2KZrKfKpGC
         2iAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762327522; x=1762932322;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIb/KYzXNYt0u1RpA2PEFtOULDEYN0eGfooGuJh8/ic=;
        b=sl6u7VYAWi/1uwio2cLauuaMxtraYPsRa42w6jGblb+y6zpvkwZZdHtfKXhd+xoiiK
         mE1dJEhRTi9bkSDu62lg17dpq7DWFKZQBTC8fhfTgDdUx9LeRZhX1XzhqPn4InnSdaGP
         NrYXCBdAPFNSvNd1S/0TzRAAEt8tzSArSnYTRL2xGOxKOjPRKdHith1W7WyxO27EW13A
         lBXnWTLll/tFBqGI7iWq2Pm4e5BXnXXYmtZamgu9S9HP+lQ/l1plkGzcpHX91aNJ0kkZ
         Cr+nlc1zuqQy4TfmEBUNQW/YBDF299YnMNRQ0JuKg/E+CImNjWchEW2Jo1lI2UywaOYE
         3jxg==
X-Forwarded-Encrypted: i=1; AJvYcCWwh63Dst0TPhc5lIKpeQFRyZSA7/sfMBKv3F88iAJLX/m0SdtZFr7At8Qc6vRO6cuC/jeFaAl9GE+QmEb6G5fzqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3L52/oTf67QQf1Vi4vbTJ1f47XbuyNbYU1/bgTRj0PfjBCnA1
	BJZBBmcnVJIc0dn4/WVAOzcz4zCilzWFE/o4TSHMaFZ5B/NPBra02d9+NPaCzk8+/FE=
X-Gm-Gg: ASbGnct9z6rKby2oSIzXozqMNBs6++69HJCrZsIIb06FuQZgcRjh9ojAE67+oB8j4dk
	O0dGuJyZ/oyPhh8PVc+jx+NByA1MscGCAaqBeIHe172GGc76oQ32nw36dafbisDOPCX6+W7esMh
	a5ch9MrQJML8cFknw6R5Zfj+okCX3YSfflcw0Av/9TkGcnPbnBtBHaebRCrbuEx/9U47G8UISun
	xtGjz0GTJhCQaURUp9dOY+lNPx4eBdBLihHgjT2hbUDNFjx347QHuGZSeVG/8I3OnvF1RQKrXCZ
	P6izbu73lOBODsGDn95e2wD/ZfYpuZKxGJoq2LomLt6PiJfZJc8T+R9jFCngPzrul7qKsysBzJy
	HEWwWqgw8eM1HxUKgEvgvcsdoUehMja7C1TVB8+/9La8OcvrX7Rp2WvztJrs74ESvelW03dCEF5
	SEUWzCEYl2lk+Lx4sl
X-Google-Smtp-Source: AGHT+IGzPFXwhqPyvOn8ewQmtIhpOZEz27+6Xn30YUvZx2NGtmHf7a2VZK75fukyF0zZjg0re8/YsA==
X-Received: by 2002:a17:907:2d0e:b0:b70:b45d:d9c2 with SMTP id a640c23a62f3a-b7265687d2amr98936366b.9.1762327522067;
        Tue, 04 Nov 2025 23:25:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d6f8c5bsm411534866b.20.2025.11.04.23.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:25:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251031-exynos7870-drm-dts-v4-1-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
 <20251031-exynos7870-drm-dts-v4-1-c1f77fb16b87@disroot.org>
Subject: Re: (subset) [PATCH v4 1/5] dt-bindings: soc: samsung: exynos-pmu:
 allow mipi-phy subnode for Exynos7870 PMU
Message-Id: <176232752047.13426.3419883403605615740.b4-ty@linaro.org>
Date: Wed, 05 Nov 2025 08:25:20 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 31 Oct 2025 00:50:15 +0530, Kaustabh Chakraborty wrote:
> Exynos7870 PMU is already documented in schema. Add Exynos7870's PMU
> compatible to the list of nodes which allow a MIPI PHY driver.
> 
> 

Applied, thanks!

[1/5] dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode for Exynos7870 PMU
      https://git.kernel.org/krzk/linux/c/81280d39a2f9e7dc12056db889da52cce067b1b6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

