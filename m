Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089FC28C872
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Jul 2025 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752655370; cv=none; b=rAdu+GgVYUpcPbkHjcQx7IsTqNdtMdkheo3cnJszkj3M9T6fVGj9mFXxJum5oVEgxsAG8tiZPS+eKMkKai5lDgWqIK+jjajM/5vLWpvg/S9Wxa88nhwtlFJ2BcMX6D3w9oxEhmDek4V60iAPlvYDYG4MV0eQTsVvy/1wYtMXnCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752655370; c=relaxed/simple;
	bh=B7SsdO+MenMYckXWR84ZUdMgGeszbtfwtQYKlL+IKug=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=biuyKxlgz8eCQf7YNAjgqQvk8uTkJYN6nw1hWJwXPeEO9uVWwWXMY+hGIUbiFTo11TC8gpVEaNSEz6KEJKywJr1kabmg+18CygiopxnkTspQC14lp77tuQoS7OxGuEd9wGMwBDn+mW3v9l5GTG4Tgd09ET9fWMTWL78jPNo6BZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YCYr+BL7; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YCYr+BL7"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6070a8f99ffso977076a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Jul 2025 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752655366; x=1753260166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEwTO6jDq9O1mX9IG6Eme66k2aXlrb5FWoDpo6lnm8I=;
        b=YCYr+BL79jTPQR9L1CxHCYOtcpEswJv268F2OgdQcRxjzaEmNFdYmAZu2zHQAk63of
         ONFw7M5fHR46bIsXgDAny65czF1Rvozo7nqGMSYshOLgrArYDIsoXSRf/vFFYj8tdXvn
         w39FGMlQ0pi3PUhp1uEb6c3tyET1t/ZkhSQgQXWK+QMZc+4p0X9XK6pVDaT0/FuUqRqJ
         XrK3S5305s4595oqFfmTYxw2hqR+zKYV1AwAqPT80WMO1/3YOok1bw657wwzB2sWnn7A
         eO7LiQx25JDmbR7hgIiJuQdNJV3j52yQDGjFFhsb3ulqukl5fkj5UtUPjyBO44pFcZU6
         xXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752655366; x=1753260166;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEwTO6jDq9O1mX9IG6Eme66k2aXlrb5FWoDpo6lnm8I=;
        b=li7clHAhmHzBSC0TEWwp5OORCMpiiy6E9FftIiGA+iHQmnw/JRd6Z+HnV0RrpOOMV9
         MG5K6WMFYHf4sJtp75++hxWbveFieSSApxWUgQvr1napjivoEE0xkKg36DAnAgdaxZ6Z
         iZdTi+n6Jv2l16+evytV1Y1ZvjPmm9Tx5jfP67mjoL5HYoDG719nUEvRNHqOfw03O/5y
         19K7EN41CfpZbEjGqjIqsbILA3D7t17iEkOWB0XoPetadN8gXE1DANsBTaT2weG8VtbG
         6aXtXNYIDJ/BMbfX2jKfaPMk76o3nrFpNsmVsRe9SMUwxg4J+b0Hx2xZYVStJv2mM2zu
         59cw==
X-Forwarded-Encrypted: i=1; AJvYcCVEzg2mOniwddSHtVWyw2IOeZB2GOcMIi2l8+KhIy0o6/S61gqCFWNLK4+kWxuP7W2nTAnPU70+Sj4oRlvIMI8XOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyacTkAp8/dN0yKCOeTqCTjCbpKnSgBXsNOHQjUqe+gxl9SyZMM
	AD3eKmQzkyqOpLsEQzFWMDlaUngn/oPMfjI6AuAY7dAOgDoBxJCGq3tZst0FjxMAw+U=
X-Gm-Gg: ASbGncsGNYqB5CE8oKz9emuVEoMKrmljYq+JWDeWvVZ9+p131PwZu2vQXl9wWizmhMV
	HwbQsWzZ0ejtfJfsfGkEVTx64d2kaEhKtmpSUD7kuNPPystlUl8/q1ky9DDjRAakTiW4eOdCI4l
	e0BnmOUHDpA4EHQXl6G2xUDW6A9JMA+T4bnKi0SD7tHeqgMGE7WMhJYo/MfBd68Si6045opffLP
	r5E6IIjgEFL5YRn/qcoqfofSFlZFrcINS0AwEx873yqU0oKACDWM9+aEIo9CzYWZjOeF5z+/m/j
	D5F5uIbm8R8hl6QhPdYz0NqrCvHgsezsuLCVE2c20KpqmfC2vXaahwAs4vzgG6C+SU3Gf1APPT5
	camXgjiqUk9v12BpxuTZYv764hqOVnxwmJcCk
X-Google-Smtp-Source: AGHT+IG5VzneoFYbewswXVJiJQA7X4tnJGGDHvgb8EgFHw+/z6nhgITDJiBHyRBEDaIMb0avqqonAA==
X-Received: by 2002:a17:907:86a5:b0:ae0:8621:2233 with SMTP id a640c23a62f3a-ae9c99cf09bmr84890266b.6.1752655366273;
        Wed, 16 Jul 2025 01:42:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294bfdsm1132749566b.120.2025.07.16.01.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 01:42:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
 alim.akhtar@samsung.com, kishon@kernel.org, Sowon Na <sowon.na@samsung.com>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250702013316.2837427-4-sowon.na@samsung.com>
References: <20250702013316.2837427-1-sowon.na@samsung.com>
 <CGME20250702013332epcas2p4ea41cc442d42fd7b2c742e1d08b26182@epcas2p4.samsung.com>
 <20250702013316.2837427-4-sowon.na@samsung.com>
Subject: Re: (subset) [PATCH 3/5] dt-bindings: soc: samsung: exynos-sysreg:
 add hsi2 for ExynosAutov920
Message-Id: <175265536480.111577.14907577908476237198.b4-ty@linaro.org>
Date: Wed, 16 Jul 2025 10:42:44 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 02 Jul 2025 10:33:09 +0900, Sowon Na wrote:
> Add hsi2 compatible for ExynosAutov920 ufs shareability register to
> set io coherency of the ExynosAutov920 ufs.
> 
> 

Applied, thanks!

[3/5] dt-bindings: soc: samsung: exynos-sysreg: add hsi2 for ExynosAutov920
      https://git.kernel.org/krzk/linux/c/687d974a218a719f7e729bef9c498ec36f18115e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

