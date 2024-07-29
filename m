Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C908513CFA5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722255933; cv=none; b=ilGF3t358IlN/bEA7HbbUWdDOPr9zsWJX98f74Z9uvuAbPmo39OREWxpiYv8sQEkEm0pgy/dkKgKnsvK9jQ61ABA85vfj28cN8LxTKa75Y9vu7vIyvIi24YIDi/S9T+gsyaHbEGyzT9f3/ApA6bw7JW2nwhmfTwCS88oUzSAOr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722255933; c=relaxed/simple;
	bh=zoJNAWTqU5I4En/2CudM5+XKxxwTYQiPO48asS9+YYQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Bv+BDTqJYUNVN8hxUG+SbpfmeEvWwPmgAQQxMusxTs9QMHAG4LAPmO7883Z2uDFuVRt+CFBLF1b7V7vKdgt9Z9tC99e/Gy22A5h5270ycfR+JnKNBW27gCREfPiJVuvC/kp3ITbksEk0ve7ZXwdRIaIR50ktzm+RZm26inia/Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yE/gIvEa; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yE/gIvEa"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso16482115e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 05:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722255930; x=1722860730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Vg2xuu/qj9ECyM8Dr9YGng2AyXJU9jC/IuVj2yW73I=;
        b=yE/gIvEa9wfw7tguWYc1BjwoPkRLIOTSS2hk16QeBc4AaWzog5Hk9/INO4qFCLi03u
         w8YLUZ8Uwy7joddF6wB2AkMY1UjqdBtAOfsk/LGxnMFPsR+eqnLMLHd/xVZp9JEwRaIU
         7vJ/F/uMMHLUUCosyvmCszOvLu5kpWhzcE2l0W/umv/9oLV+k0CAxPtL1LLkPzB1eiSv
         ZBu47h4TGvv8NsMPpKJNv4vQNZG30Yc6NGTE2ksR9QNBHHaWH2FwgIEBgMuIueCy0lJX
         l6C9MQjBFkjUySPHlJPLEjVukZ28aJJHxON2DsUQp4sYmANoWsxUqed5dzjFrGDvTzii
         Rsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722255930; x=1722860730;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Vg2xuu/qj9ECyM8Dr9YGng2AyXJU9jC/IuVj2yW73I=;
        b=Su5KcmBN3LpdolJGi4jvEvVLxNT8iPZ6fI6WPcd1Ynt7PkqQo8TlSqGnHM1QT6FfJk
         BHY60lz8Zxw4ObsWnreuqLz8xLq54iaAvc4gBV4vhkvYRotMOZoxB9YCCjNKQSqwxJ7y
         hvTsDeh50Pjtjovg76SMJ7WOGw+mVzwK1hTagYegkFBcdGAZuVUaoJJGrPMXf8QQRsnh
         k2+aSWzJyGWVZ50KZGORWCQlRZPLfUuPNgTga276N6UE3zVcCUkNePRUUpUQW4LbgZyJ
         1CMrxIzG8fIWzwGlS37TFpQEXZX0Te17ywAg7fMdeUkf0AKg6R7Dzexx22LyLoVYR3/R
         rd5w==
X-Forwarded-Encrypted: i=1; AJvYcCXTBKKJxsin+VptUWlVFphODcB43/pwhYm6XFn+z0muSb/nvmTXN5FS0XoYxcs0udtwzLHLLliOwkaLpjyk0JFG015vsi56/GnT9oQ7grgi/pk=
X-Gm-Message-State: AOJu0Yzob6af4UzeUFl5owqkGngWdlhlQgamTjUwZJ5h0HG+iQOsxkp7
	zz8D92WpP/PUA9ELWqD1UexX/RUENbcq0XXrK+ZN4n8WWRu7iMfAWrxQub/C0EdCVvAdsisewZ6
	E
X-Google-Smtp-Source: AGHT+IGfQ0DfbRYah7VUQ+O319MFuvGe4DU48MT7LDMj/XnO9W5q8Gd1ah6ZEaKqZXrpjptMvpXK/A==
X-Received: by 2002:a5d:670f:0:b0:367:f104:d9e8 with SMTP id ffacd0b85a97d-36b5d08b9c4mr4285810f8f.47.1722255929593;
        Mon, 29 Jul 2024 05:25:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b3686227csm12113664f8f.99.2024.07.29.05.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 05:25:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20240708152530.19306-2-u.kleine-koenig@baylibre.com>
References: <20240708152530.19306-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] ARM: s3c: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-Id: <172225592831.279717.8096070043448420240.b4-ty@linaro.org>
Date: Mon, 29 Jul 2024 14:25:28 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.1


On Mon, 08 Jul 2024 17:25:30 +0200, Uwe Kleine-König wrote:
> The wlf-gf-module driver doesn't use the driver_data member of struct
> i2c_device_id, so don't explicitly initialize this member.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
> 
> [...]

Applied, thanks!

[1/1] ARM: s3c: Drop explicit initialization of struct i2c_device_id::driver_data to 0
      https://git.kernel.org/krzk/linux/c/c652cfd1d31ebcb54fba1fc19dcd8691c5ba9474

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

