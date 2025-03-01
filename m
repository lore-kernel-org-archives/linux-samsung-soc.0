Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A3E1DFE34
	for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Mar 2025 14:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740838417; cv=none; b=gdHwnD1A07eM8VA4WQSqszgeazRRwWCgznaQ3kn2/VL28gwfq0RWPzwDs6mRRYbPWQdJBDXSAx6dw/OBCXSwuCVV2KwExAGntBa16OfTclSBiDeAS4tYz02GVPakmVTc9Ni+aL3j9UOu5pKHDuTJwX7Eg3BdDnXHn4GJoso5WJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740838417; c=relaxed/simple;
	bh=d50HSxD/PimQmQ45XW3+Ssx/aRWrlXekJzuR2G9oxOk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s/oUEsIavRGT9ik70ingx++ckks6UqjR+03dmWbrcyzqBniCnxfXRQqmsz0e89SuvNpf0L53X4EKUWa79a3C8o5JAHhaUxcJJIq5oW+wQwtf2j/KJekZtyN7pj7OkVM+pQ6A/InFvyx1giqDg3ZVpn73CKbXqnfXRwF/cnVLpyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qhP+mQhd; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qhP+mQhd"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7c4350826so62913466b.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Mar 2025 06:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740838412; x=1741443212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6+VMXcyt281MB6S0PILXj/mc3+AiyRry5Dl88JFAmU=;
        b=qhP+mQhdLTmkv9Ku7kQdEZOo2vx7eIDcFaxyctd9gwCcSJOz1CsfudQBDnECcPjtZk
         KrS8MxElReSfdG8JA4gWWGEuE1m33Nri1WoPsRqOzPt2Mdtn4Ak+zs6/LkHIoE5T/UF4
         pioTugZMIxyRA7qEuN/pEPSBeX85d7a6iT67zJ2cGhxJJIDQghq7lpJIw5K7Iff4riYc
         GEIMmxJHH11vgX40J0QO2arOp8kYU3rlFfhCxRd1VHs6uVr8hwK171EJXv2tMUtpkv+r
         bWEcjQvv0sI5XDDfw4nxxADTN+Gbux/bFJYQ9+2OVakO4yLFVi2Giqr0/ypsdO0abMOS
         ob0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740838412; x=1741443212;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6+VMXcyt281MB6S0PILXj/mc3+AiyRry5Dl88JFAmU=;
        b=e4v+XjyhYbBTKel34R8IB/j1u21GDN8h5k7W0uxmKMAIzQn9546K6kSickhBFMrSeV
         f1d/kfJDpQnZ6sRTfWpSgeu8S90T7DJprhl5plQcsx3nl3y6M/IBoYCddmaRV47CaYiQ
         xcT0+Yn4XYBjWH3IfGl1C3pSYsoybtoyp9v0p8/q9BdCtHTPZu97iR+70+syhIwkK/YU
         PKL42QAsWYOUpNhfqJFdV8BcMAoJ6LlqvCGk4XbMF9dOwwp6z+LEHNR13JLuxEev1YhW
         PnfIypq2Q52T49DXkGpd+h8GvAm04unkcI/jMXBnKvqPhFPoSnUaZOqIhXjvqSZzSo1O
         7ITA==
X-Forwarded-Encrypted: i=1; AJvYcCXoV/Z+rZSjRmrf93qf+ddtdtCnQU0K4wAiDoRH1EgsN967/WsDtPR9nUn7KOMeTn0YdKpZrIUHRFFbSlxG1R5cBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgYIJmEhKjbmEukeTCDYaEdo8h2EYZMgMG2m/U0iFzrOchJJlx
	12q7Q5u0dwEQQMrBVuj8a1fKbpAzuf79te9aKXXxlvrYVOKsq61yqQTp6Pu83gg=
X-Gm-Gg: ASbGncu1hK4Rpiw2XZQjBVPzYO9AHmuC6ywPx6gg66jOCBqiNJb70bO+A0JXBOs+nfn
	3gzgK3dLQefPSuAEXtjlCH4+V47QXsGY/LE/vgPArGMYepud5YUfXTfyly9N+Soc5711N+7KQ0m
	9YLz6ZwspZFwXqA9g4KJZN0MzWF8xDXJWAXqJOWTxu0Ir9sRAfYQvA5qmKL6i+tZT/ZiFk31dln
	elXWkkcQLdLGyIxX/LhyvReXAJeBU3aQ1O1849tfHfJcYZH2cxxNC1uLwlv+TzlcI4NOv8nv+xS
	Rsk8s9QTQJH57QSQXgVTNofheDGKpJPYMJCNbyfCNg7kc/iAwyEa1HzDM44g
X-Google-Smtp-Source: AGHT+IFpPIcRFdEEfoNRMXs9IiWLSrC8PzKuk8Eq3BxzR7HGMfJRXaPfAjNFS/RvB4XMH80jRhalrg==
X-Received: by 2002:a17:907:7285:b0:ab7:cd83:98bb with SMTP id a640c23a62f3a-abf25fc79abmr339769466b.5.1740838412580;
        Sat, 01 Mar 2025 06:13:32 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9cbfsm485532366b.14.2025.03.01.06.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:13:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250223115601.723886-4-ivo.ivanov.ivanov1@gmail.com>
References: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223115601.723886-4-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: (subset) [PATCH v2 3/3] clk: samsung: introduce Exynos2200
 clock driver
Message-Id: <174083840951.17657.11144069313199701338.b4-ty@linaro.org>
Date: Sat, 01 Mar 2025 15:13:29 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 23 Feb 2025 13:56:00 +0200, Ivaylo Ivanov wrote:
> CMU_TOP is the top level clock management unit which contains PLLs,
> muxes, dividers and gates that feed the other clock management units.
> 
> CMU_ALIVE provides clocks for SPMI, the new MCT and other clock
> management units
> 
> CMU_CMGP provides clocks for USI blocks
> CMU_HSI0 provides clocks for USB
> CMU_PERIC0 provides clocks for USI4 and I3C blocks
> CMU_PERIC1 provides clocks for USI blocks
> CMU_PERIC2 provides clocks for USI and I3C blocks
> CMU_PERIS provides clocks for GIC and the legacy MCT
> CMU_UFS provides clocks for UFS
> CMU_VTS provides clocks for other clock management units
> like CMU_AUD, which will be added in the future.
> 
> [...]

Applied, thanks!

[3/3] clk: samsung: introduce Exynos2200 clock driver
      https://git.kernel.org/krzk/linux/c/11fd259b7a9c386179f4bb9657c7597c8e8de067

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

