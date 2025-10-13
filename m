Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40599224225
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 01:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317334; cv=none; b=mRwJ2l9Bd2+UU6NIJnvBuJrCcwd2jFwLT+s+zIr3Xot3HieGrwtLUTi8BtyGdnokh6SMKPT9yT+hUHB1L7/Z7CgqOqpJ+alT5K5ZnrNdJtRSLCoCdbc9usKS3MS5UcAaZKqG5td4SiGzd/ZVlZIWcNszyts8AXiaUDO1AlMt5xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317334; c=relaxed/simple;
	bh=hPO3fb9A5GUMjlwesrVBFk2doqpjzcMDbOWwmKe2wnI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eBnM8Mj5BnMLfnVdeO7x6IMlr/rw1sQJwfYAfY7f+PDMQ2nftDXJVjubpwDgO5S6dVteG6qMrYvs/k+jc20StvLo/wsknhwXp0kWHD6iNgo9q4pR3Ed/hWGoek1wsyqO7Is7vsQZveGh63lAhqswNin+rlhg0A2+uTaJZA2S8Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v0k1PdCc; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v0k1PdCc"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b67cd5d88ddso3195a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Oct 2025 18:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317332; x=1760922132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10a4vKq6IEmQUW56jJWKaFLXuKf0sl8IrALpzNZuGbU=;
        b=v0k1PdCcMHpIJAj+EkMYnEy7cH0xMYWMKeWr5Gu30AL0CUYnG6OzFlIgGi1v/C4so9
         kGNta/zreolQcmUr6TdorZWBctyCclXRKnzW5y5RrGfgVxWsjuJFnj00jRbKTlABScTA
         DxZchP+CiwdCzYdijY5NJL7t7De8anxvxJSiYsPBLOZeCfrtwzqa2hc9dHep663OBJXU
         EO+7TCTBOj9FUcMHPnm1uN2QZV/X2InUp1+vbL8NsDy7DK8Y8C/jfXYVmCtXost56Neu
         GodZ4oRlNPkKmXa5CtA4uIdeJILbfnTHihnaYdFdRdNLfxjVvk3SZRATSbsA+iH6Bycc
         Gplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317332; x=1760922132;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10a4vKq6IEmQUW56jJWKaFLXuKf0sl8IrALpzNZuGbU=;
        b=EhrqBKT09TWVNbmM2wgbx0uBbBx+NJW389LetdVgLcklBNkJNuwF7Rd2w4kod7gjnW
         WdtXmaYq7Syzrbe+gm4+KwhgH4RkkyqlVx8lmyo3C+ttDHsETBdf554A/rifCWzDttq3
         XLNlY1I4SJxSI1M1/3Qs8ZlmWnmh2PcKSk1HO/TyLmIUapxUzdWVdceLiWf9qCFCDpUn
         KB4/VTZzMObvwvy9czhNFsVvJeeoqxU/0kkSZmGGNadMU5wTcRZCGaKIL+lvEd/aN9Zp
         xGFtHY3f6Wa02YtvgAO7tKb0rAi8EWBJchX5OFfYio93sXvCCpu2UFCoCiJbhs6GPzR9
         LxAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh5YnbNsQV5Hb5ggsib3FOdwOEVQjKmHGRFSDu86GIjFp9XJi1PVho27qgBdyHIAZXmSpp+fT4fP6YPYEFIFwMBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyKhlRrDspWuMriyzCWVacFfj5h3JEtEgo95+x9ZummXP6oUbF
	IbcpIkuISeyc/myjjgC2uTCyr9fcQvTYV2zxSexHPMsNrJFma2oHUMf7gtCcjxtgkGw=
X-Gm-Gg: ASbGncsRIyfwsCY7Bfw+CnKPP5FWuJGupcZvEcipYRHpmGPf7IkSwRdbDdDySbdF4Ry
	/oahDiT5yGW6dgU9Y0bneFDWF5W4B7X09UlH9as6wnMJ2sFjrsDtJDBGAJox5o2LLrJ/Qt2DfOP
	+zXpRodrzxmqx3+eZyN8A0a/6yvQQPlim8VqJ/hOnKKJP1SIyFssNivYixhEc43sSPfG3Tc4WJ7
	W/F2HswB97hHaK1YJWAY58tZNcZ4ZKmUD9URrPSfpD7W/xzo66uNjNUNnOnpq8qUbvegJVEw5yd
	TyfaU9FGVUDH4D10/nn8K1u7CGFNd+4QjSrT4mZNoL+QELKBhlCBWOtRLrgVqBTzU3elxCV5Muf
	YznmFyw5fbvIiUnGQGtaR5qjh2cQP8UnRtmc0pFRu1h/2rZgdxPfKl72+U1yp
X-Google-Smtp-Source: AGHT+IEt21JJ0GbW52Ae6IIeXGAxkDnv8PoqVX129SAInTnAX3MkkPG+Hi8yBSex+9tD040Mp73hFw==
X-Received: by 2002:a05:6a20:d526:b0:2f9:74d6:440e with SMTP id adf61e73a8af0-32da8508ec1mr13363457637.8.1760317332410;
        Sun, 12 Oct 2025 18:02:12 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:02:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org
In-Reply-To: <20250917-perics-add-usinodes-v3-2-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
 <20250917-perics-add-usinodes-v3-2-a3629e4666ef@gmail.com>
Subject: Re: (subset) [PATCH v3 2/7] arm64: dts: exynos990: Add sysreg
 nodes for PERIC0 and PERIC1
Message-Id: <176031732773.32330.8134222095806318376.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:02:07 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 17 Sep 2025 21:04:22 +0000, Denzeel Oliva wrote:
> Add syscon nodes for PERIC0 and PERIC1 blocks.
> These are required for configuring the USI, SPI and I2C controllers.
> 
> 

Applied, thanks!

[2/7] arm64: dts: exynos990: Add sysreg nodes for PERIC0 and PERIC1
      https://git.kernel.org/krzk/linux/c/1e6daba7a3c05af0f8b02cb59e71ce18fb913aa6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

