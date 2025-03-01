Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A681DFD8C
	for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Mar 2025 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740838410; cv=none; b=krb5crdcmfQOOugVtwFd7StKBNDJkPcqbZ5b0SJs0vL/VlxCNfh6G4RTtsRO4Xqu/eo/ptpQE6VJp9G77fBSF/ZFrbSxrCJ+M1S+rvnB/P/KAc0e14MlNlg1IsHtV8rP3bKLdZ3GlQhHyfRfXYlrStGka8EI9JIiEdH/2eqM2CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740838410; c=relaxed/simple;
	bh=l0jI5ewz4E8unNwYqgNQ3772jTNnjhi+wvE+Phrny/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uxV/z1cvQ0SQa9hwSGuAwwzyhhLIpDyqDCYEAVB7aH3BRxT+I+XMGs9S+6B8sb4ElVfGaEm3piZI7BI1h61QzAGWt2IEplRRhPQT7bo54YaiozwZWXSrJnpl73tveK9Qu26zJ8cFXXWaJ3JkpwxWHYfWsuY721KrABTBHibpbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sflCk1nq; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sflCk1nq"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dc5a32c313so508716a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Mar 2025 06:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740838406; x=1741443206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kICij+zGJ4SJUAMRx6vOY4fWK/HFQvlnrffeNoOoYzw=;
        b=sflCk1nqgl8RMSI2XM3irIn/+zWof5zGU3bdYiSqzzIng1o3i7Pmsgtw9HbaYtTuGk
         yltDZi+Sn27JC8dDA2x93vPla+vvoLBYjM8gYofZ5oRAhDMbKxRO1bzVtyC1/JSw/VmS
         Ht/BUdkfiFqPhahZsmisuTedEcLiLFnjpCMWrOBoUheN9yqR+7AYCEBiDvr5drdYFVL1
         rUD6W/CIpPYo7Z9huRNFLGti9MI0iCQNhQOh9O4Hz86kwbSVuBq+uDrPtxMjRR19PfFk
         Eln+WYE8U4mM/ZFqh31CvvBm+8PUBFxa6Wdl8k3ZfwoFeSw3iXkZoLnGFhd17cOl7olx
         juwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740838406; x=1741443206;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kICij+zGJ4SJUAMRx6vOY4fWK/HFQvlnrffeNoOoYzw=;
        b=BRT+2e1BXi0tOHmNP6YTJv8GV82Ln2OiGDyO5N/paGjvQ39A3m1ExJvc3pq6qVj4c8
         dtI86It0KOqiwgNSE0l2ElavqdVDMy27X2FubxNlNGMl0qHl8PSazVwY2DTzYWOUj4rm
         ugB3W6MTdDFuIEnFzc2nN1rNqdn6uo5sAv5DtV29UYfBLFTmadZwvQeDW9WrWz9N42c8
         eqPiWEmkjF5vwGOYXe0VOWPdL0lAp1dn2HHksTQlWUL07MevjrSExobqc6e1+bY6RvTB
         p+Wzc/ftbvwdS/QoEPp5iyMx8ZSDZW1jXHWigSyHbvgPbCO1RjDD7cTjEu5PLWvNnnFy
         tFDw==
X-Gm-Message-State: AOJu0Yx3yPspPNRJSNVpUbykn45CZDwMSjAh9WixbhE4Te/HfRe1kT5X
	hvluIiJqgalJOZD+lVMQxsLSkc/eUhhS00cmSvW+Nnuwjyt7AWkiPqIdLWAvhrc=
X-Gm-Gg: ASbGncsvHQEvzNgI7i4ZfAiO4YKAdgdJuZ1LcYHvInGcOhW/vsOYCEvUgmp8OjO8YGP
	eeJVHxLzjQlo8XHDcCLpogbzsB+UK+LgAwyWlzUTu/xId6ljOjVdembqHHi1BtI6VF58xRkzZle
	HXolzh2N0suMtbb1DbzjbstikUM2wA/r5csR1WUoqCMQTFx1jkdFEZE/00GFc6suSfZBHNbBrjq
	m2xIssG1z2Y7OLnIyGZOG2C01uyCTYt9NBOPQtlFVOBDRtknhzSA2sIcDsqjSo4lJyCTPlE+Dws
	/ggNt3wgV36zYYhN/VV1fbE0bO2LTZL/MDX4pJaTGKBKIp/t537+NEnId4w3
X-Google-Smtp-Source: AGHT+IH4LDzdUoKTGOGgBFHqmwTZj1CstR0ayqx7aTgOFcUj9dhcl28Y1Pq7/cB2aRE6iWaW2lq9kw==
X-Received: by 2002:a17:906:da82:b0:abb:ebfe:d5e9 with SMTP id a640c23a62f3a-abf275cbf12mr350485366b.9.1740838406199;
        Sat, 01 Mar 2025 06:13:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9cbfsm485532366b.14.2025.03.01.06.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:13:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250301-exynos7870-pmu-clocks-v5-1-715b646d5206@disroot.org>
References: <20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org>
 <20250301-exynos7870-pmu-clocks-v5-1-715b646d5206@disroot.org>
Subject: Re: (subset) [PATCH v5 1/2] dt-bindings: clock: add clock
 definitions and documentation for exynos7870 CMU
Message-Id: <174083840306.17657.2523115679702297451.b4-ty@linaro.org>
Date: Sat, 01 Mar 2025 15:13:23 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 01 Mar 2025 09:27:12 +0530, Kaustabh Chakraborty wrote:
> Add unique identifiers for exynos7870 clocks for every bank. It adds all
> clocks of CMU_MIF, CMU_DISPAUD, CMU_G3D, CMU_ISP, CMU_MFCMSCL, and
> CMU_PERI. Document the devicetree bindings as well.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: add clock definitions and documentation for exynos7870 CMU
      https://git.kernel.org/krzk/linux/c/35b2b3328c2e02b544f49d010170fe981f20ff11

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

