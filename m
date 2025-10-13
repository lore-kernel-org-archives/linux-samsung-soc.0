Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967A51E51EF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 01:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317300; cv=none; b=bmIpEoDyrXYAB23Ozi7rD3T+rKrO3RvY3zi7xU7FUNCIaZqrJijqyCLfB6IJmpx3xrqJFjPaw71vjAoY8tV+0q5NE/j8wj/J4HIZCi3pxcyJJFhCtGRWCoeFlo/F+cLsopVFWXbNee48CUyvMJG7Fj6obiZ5EJqJ16GGag8oMYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317300; c=relaxed/simple;
	bh=vblrrA1PTLfQIEhi9r3mgnNvhMqCX1+5f453+YraP/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kuCCCOQbNMkuxf+WMyGRwsSBF9Bsq+fg8FcVQCpdUJsy6/b+u/56VnMDOb9fgvP/QxE0b4WD5j3zfH1v3gxDE2J5I2fmU3yF9mxk2rSNfcy0UZzSWEl5GL+ccOL/JGGu08MZoTv2hvC9c/4oU3AwBMK0yYtstTcFUz6cleMqHMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yj5gAkhf; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yj5gAkhf"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e2ea21430so204060b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Oct 2025 18:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317298; x=1760922098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUCP4LKA1bDFYppqppgto8MgAIuMCRJ1Lo8b0QTm/8I=;
        b=yj5gAkhf6BBL0MNXA02+hw36MWK4tBitSyoh4BfsDTi+al+MuFeBXCdJEeAkTzMm1s
         MignmTDKUFtgYQA4KjKucC8ryLXj5MsNwh6q94RyF87l0xrWtCogYC1G0Ax4wMczW2YD
         4se0k6ekipB2gJoK+COiIUwM/JnMGwoD6aRd0XVzhUYWe4Fs2bPzEILQyQ8CW3KUIAf8
         zNAkScD0BZOn1HUV+Wu57bKOD+NMx+wIy8lAWtokhey9J+O4PuUjFngMv4tmbA2trDJv
         9fP5ZEqjeq3neRZBvXnHwXBRWiRXqVd7IhsOfsqdlAK53e8JRllgck/vXAcGR5/yOKtK
         t6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317298; x=1760922098;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUCP4LKA1bDFYppqppgto8MgAIuMCRJ1Lo8b0QTm/8I=;
        b=eoiIF1+O70pCMGGbJKVTv9b1/a5gsZ9LbcGEwXcTHcmlc68rfZAQr6rZXEki273S3E
         bT2ujEiE9lAg/3ZmtetXb/P+kUGiSANPc8mEjWKUBkFXJ8S3vTpM15VhQGZ1a76zaHQw
         lrZOy56eA8axLCsN6XE7BF5AloNUyvywibvN/owFAXRW/twI7FqcSoewHFUG7+xURDvo
         ya7ijcbgyyHFWr2ff2mLMypk8yeGxYorBLonleI326ITGDnf75Ye5UJ+mKAIBsxVdBbW
         dgE1OI8P0LOuU98/7VPeMkomsdJcNb8ztTNmzAlUe2InDEgVytqcHx4pSXzapttTvIxF
         4H8A==
X-Gm-Message-State: AOJu0YyU1cZWmgSgNtp7BVs11hJ7gBQnslzbb7wzboj4tI0NGKcqfkiJ
	M1NZzTEp9XEX20qovHtwlTxfRjC8G2u1t/Z9HAVj3ZVf4Ce/os/mctiEKmUfhP46OqU=
X-Gm-Gg: ASbGnctsco+FAU+Ffd4FB6AYLqv+21eQAEggt9L2UZtKxyFlpqWvvUh1hRZ2tRCd3h1
	W7sRln8glBRdGB7T7Foh9WoZvUVGTT2Kx84FNUbhQQNICnvzkeYYIkDfMzXmpiP+JKLu2W1wxM9
	B4OTzldr35ZVi/stBSZ0dBSkqsYSB8lEu8cW9ct7A5W81IgSOW8XCd8hZO3oE2dMJdDX9WlH13O
	m8RwX59ySLDpKYWoCkQGzRugnmmH9iFA1O41qc9LGxWc2NxUiHOY6K85CYTJRKLaGMBFXUD8fwV
	hafmTnD7fr8M9E7Th86aydzwMa6zc0U8fQidDnyussSdJRKBaZQ+HVVFMJGjx+EhY0dbsiU+JJM
	omnbraX5Lcfr8cgN1AZaPgwGEOTAq0/mWXsEDnPg9LvFkmeBB8GO6b7r74Ru450Te9fSFThE=
X-Google-Smtp-Source: AGHT+IE1B9hR89kcu5D4i0PCjI7kQyz2poCnY9xOFDtLABQiwPAkgeCMqEBV5hkmUp72wJBiyTt0Ng==
X-Received: by 2002:a05:6a00:b50:b0:793:1b79:ee5c with SMTP id d2e1a72fcca58-79387c173d0mr11494869b3a.6.1760317297843;
        Sun, 12 Oct 2025 18:01:37 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250925130457.3476803-2-raghav.s@samsung.com>
References: <20250925130457.3476803-1-raghav.s@samsung.com>
 <CGME20250925125616epcas5p37346312c6a788a5398212f671d8a369d@epcas5p3.samsung.com>
 <20250925130457.3476803-2-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH 1/3] dt-bindings: clock: exynosautov920: add
 mfc clock definitions
Message-Id: <176031729214.32330.12498017940011083883.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:32 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 25 Sep 2025 18:34:55 +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_MFC
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: exynosautov920: add mfc clock definitions
      https://git.kernel.org/krzk/linux/c/0b94201e327471d034d81cf5fd2131a5529eea19

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

