Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71AD17B4FF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2024 07:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735543874; cv=none; b=XOU4//C9uXKnYXKv8Q9NnCnsybtr2TaxrB17gAvfxjI2aYKlqagQKCgEuasXuPvedj4tFDyqsaxqDPfEVhAfKr97SSo0yEbDupDcEx4H2PVbo7KA+Bb8xgUW848yMFu5wHlWkmVng7kFs6OE2otIhulEfOqpqJ5GFxIZZvkQsGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735543874; c=relaxed/simple;
	bh=op1v6RqtKHEMd3jNo6wk+1t2w4Xy0XLVP+LzvrcYx0E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mGFurkovgFEfjmr05GSyOXzBf8yjRFSrbF4Z6MePJdfqbnddD92vB5M1DIJqMOnqVs/4aIM4T790icEVyORkOe7WwAl7jB30aYOL/RIDIcB52UsMD9cgBBebhEWIHVDPpYH8Ht8IbozmLBKtxGB7ttVh+kMMjsnM3SyqUDFmy8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M2h87LU8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M2h87LU8"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3862c78536bso543615f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Dec 2024 23:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735543871; x=1736148671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cxUukmW/HtO3A5IzMy4WhojBdo49UTX8VOBptMlYK0=;
        b=M2h87LU8KsWWuOlIEIFsvR/xgLdPL3LRt/SsJkCuoIPpc2SaLLo+aUFltSDg81M+/w
         RjqI+anVE0yhmp3zqYXRZjI3OEdYvRP4THzV+f5i+Y6IFuy5Z/r1wwAE3Ds3i3M5hA84
         NR2hxnIA1hO2YAK7bdyBXoqIUm1z5rtuaEOJ124guTMlimE2CHEgGSePTq20bXwIZNP6
         EGaxbAKUqjR61GyOgVT3OkIXfefI5FYSUwykSsodvR1qDgl6NiVpm4KsO2sxaJpghNHK
         IciVQrugQ1p1R021ptUPKNmmyITJI6FYtFYb3LzMT6RzWgNaZqHF1gjSdQ1RFbL3PWz+
         3ZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735543871; x=1736148671;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cxUukmW/HtO3A5IzMy4WhojBdo49UTX8VOBptMlYK0=;
        b=vdnE45glFbGro1qA3mzutJJwda+qHf8Jqwklm+e69sPzNBFjAbPppmsrNHe7djJXdd
         B1FcePS3gUtePyvFWOvtp7/eUAp8neivDfn5WcdIiRV5t9rusWhCYTiaTXXxBqa8a8wA
         t5SX/3z0+0/zwYZ0OtPuCr5HVHuuZ8JJ22/tY7BtXmpsPVSWRJ+yqWv/zy3Gs5RPzV56
         cx4xHSn77AVKafb5wUNj2ogXGEWT1M7qHRmqSSJ6nx9YRxVfKjh7FOjt8XcXWxmUkSLI
         azVJfsumdFQREwJrIPMhj/t0ZpRTMphvp54bS6x2yFUb3/BCuVn9dLa4aIeGI7hcqfUm
         9msw==
X-Gm-Message-State: AOJu0YzeHM+KKnkn+1K6VWvWFS+jak4bz6jKxMUjX1EEEns2FUvTQHJb
	T06D6Ef+34YJNzX8Hgi6h2nkrwTo8JRR8zlmLTaCTpOBU8u7KhUK0R0l2X/1VME=
X-Gm-Gg: ASbGncvyzE29JWrwz2trNNvLNBZ1apN3oz8cTuV8AdkqwsLI1/Yqo6RXGzQbCBHt9JU
	0VnoxY+SQQRYJhrVft4nm/2hpG78HNjBY/zB8L9ndcD0b04iCRbkBX7Qa7qA+LcaAc37qrLEqyJ
	fZJG3veCeim5NYV+p/g6q5pA8uTLgY2QYA5N5Uhh9jNkyKskg2u2U8yig+NiN4gKa2eVwv/IBof
	eOLO9rkHPKWVqIpjDXUmfEyJM811437GFkvECT+XKgmwk6NQMhjcBZ206dy7fgx3emB4UqB
X-Google-Smtp-Source: AGHT+IEIbHfQQXjbtACZcOl/EYF1eksRr4G8aqfzGRbLMEkVZhWKVQt3Ase4890cxIGZ0+c7ItcJyw==
X-Received: by 2002:a05:6000:4022:b0:385:e374:bd4 with SMTP id ffacd0b85a97d-38a221e1f74mr10283672f8f.3.1735543871026;
        Sun, 29 Dec 2024 23:31:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm29439462f8f.44.2024.12.29.23.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 23:31:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241221152803.1663820-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241221152803.1663820-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: exynos8895: Add camera hsi2c nodes
Message-Id: <173554386976.7938.13644139958887004032.b4-ty@linaro.org>
Date: Mon, 30 Dec 2024 08:31:09 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 21 Dec 2024 17:28:03 +0200, Ivaylo Ivanov wrote:
> Add nodes for hsi2c1-4 (CAM0-3), which allows using them.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos8895: Add camera hsi2c nodes
      https://git.kernel.org/krzk/linux/c/f424523b1b516b3f0984feeb1d8218e904d17a97

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

