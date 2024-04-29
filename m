Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2DB8664B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 17:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714411806; cv=none; b=hbdV5y5AtAgguaByVzjc7VkEcA/sSRGBwNs0keuUwHn4C545aqReeBb/j5NNn572gLeAHcuWQYR+tHP9y8mT/dAEWK6bJzDgJ1W+M23d9e3Lvd7QFIrzi2Exz+uI+bWGajbJTChGnXydfc0s0vjRNG2Ph+/0xw4/Ov/bn2UjweY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714411806; c=relaxed/simple;
	bh=aXOjr92iPcAE/T08trtbpigVRtQQ9y07lh5/3yHzJec=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lg0LNRFQoeJQsbPk05ONNkhtwVk1rPdvvQHu90sYyzfns2NcJg+l1X9rJNULnAxB1tpe5ULKO1cIYWUxDvJaQWwPVvS1dH5Yz6qCvUZZluvsFJKFjQWHTXyUQ1MSMmmYr9Ftsd1F116YH2O/riRPfmZsKGrp/TNIzP/aBtdPtbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vMeTEtsi; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vMeTEtsi"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a587831809eso567222566b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 10:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714411802; x=1715016602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yatZlodOrSiFDVv4IxSIxRtNs8ZKl+msO2iNMO0sDg=;
        b=vMeTEtsi1Guj3f7qXU7Ue0IS7Z8CRXsF275T848Sxo51Cc/U4Jkeu8RkXZ0C/UL3M+
         2/YLprRx7CcY15EP9kUGpAGAy4IriHqC/nUgfKt1Ao+bbV6qu2eaC01GxBcaLy4WSy0C
         kYbPBkNO2z96zL+iooMkSmc18xcU2AdFbt/uH0euGCFq0ghkuPNsXTYD2N4+d+iHafgo
         ZBjOp6XvhA3zhoVum47Xb3FYQFpnNhuNJA/Pp4kx4y6Z6BA5kg0mNrv0zuzlJhDIz/ve
         3SsRYqAtolodJ24lDeNCpf/LanzpbVyrPX3/hIJEzTp2hT+gulXzrHUY93wnalI0E2cE
         gX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714411802; x=1715016602;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yatZlodOrSiFDVv4IxSIxRtNs8ZKl+msO2iNMO0sDg=;
        b=srG9gm3tCuY7YUDavnmcPWJ1nDdqRZ+qoWxzhFiXYITZIUMBHdYfpPe94CTfw9YAMS
         6T3EoIvxzhYYQ+54rmTW9QiWN1YG0ioG6JFjTh4kKBzTVQUm6vokUPUx2ZoSr1RvUZ1Q
         39LOx8Z32T1Lt2Yx8Pn3A0aFdq5Q92t7QEiqVRZTUgMDa0DTBw8l6b2LJMDXmr22Pv6P
         wVSUyUCVpmw/1NOawwVQbeA1bjWMWLK92RjWWhyy6C5Ybd3pAizulJ8xGMv2T1fquLr/
         m1NGEEkejVMEQJXivja6zDHj3y5gmNlZpIlocdSLcc+SRJVvVsHad4yHH7CxscLGaujy
         uXvg==
X-Gm-Message-State: AOJu0Yzp95/75wAJbo7FADbvS+zlW7afsCjZY+ClAstJ8B7o3WWHP/pG
	u2/YR02N4gTlSc4rBDPQawTPhdlGa79CWYT2CWwVaLrchbJJaJzpzlMTOd7z/SGYBmEoAspfbKz
	8XFs=
X-Google-Smtp-Source: AGHT+IHMrR+ILjSwl39ta04eWzQlqQ+cF90f+vMpyNRu4VToNyD3hzzY1YMQf6m1Xb5sFfmh+Y00Hg==
X-Received: by 2002:a17:906:a24e:b0:a55:766f:ce59 with SMTP id bi14-20020a170906a24e00b00a55766fce59mr7347268ejb.75.1714411802235;
        Mon, 29 Apr 2024 10:30:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906298a00b00a58ed644d6dsm2770173eje.127.2024.04.29.10.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 10:30:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 David Lechner <david@lechnology.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240425075628.838497-1-m.szyprowski@samsung.com>
References: <CGME20240425075634eucas1p17bef12cf8ccafb6971f352d955e14fae@eucas1p1.samsung.com>
 <20240425075628.838497-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] clk: samsung: Revert "clk: Use
 device_get_match_data()"
Message-Id: <171441180027.306855.3829533557086428823.b4-ty@linaro.org>
Date: Mon, 29 Apr 2024 19:30:00 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 25 Apr 2024 09:56:28 +0200, Marek Szyprowski wrote:
> device_get_match_data() function should not be used on the device other
> than the one matched to the given driver, because it always returns the
> match_data of the matched driver. In case of exynos-clkout driver, the
> original code matches the OF IDs on the PARENT device, so replacing it
> with of_device_get_match_data() broke the driver.
> 
> This has been already pointed once in commit 2bc5febd05ab ("clk: samsung:
> Revert "clk: samsung: exynos-clkout: Use of_device_get_match_data()"").
> To avoid further confusion, add a comment about this special case, which
> requires direct of_match_device() call to pass custom IDs array.
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: Revert "clk: Use device_get_match_data()"
      https://git.kernel.org/krzk/linux/c/da244c16ac58a3b1b7d8c54ec7780fd8326da2ff

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

