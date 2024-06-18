Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D897158D60
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718719624; cv=none; b=L4eDfv0fZ7aiooi1Dx/2QZyA+2s5pzYymKlyOLmEMykgQPt4b4y8bl0imfbT2JpkreCxReloolaI0Fu5noIjmH2nKjHJTztiCyihkkZuwPN1CGC1y8JNx6hwzPG8aDvc2vtKAnyS7KQz7KgiSUFUBlHzVgw76pQofIrEEkodSM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718719624; c=relaxed/simple;
	bh=Hbmv3XFMpSTJICmgDgzCN1gkqr2Z8G4rUOXR0h+8tB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E+dOHY4jEC/Pd6MFBvKyn4cdL5UG/EWW8sHAdHRFvXujDLXcIkMM5IckdqWj4Fw2krcXl2n+98IDJfOGwwHxpPLpDuUIM9tUWQM9US3HAzf6CcmuSDurbFGUdHWEBYrez8mBF4rQsbYykHdI544+w8k1MkctLosEUVsHNpr3RC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mTDie1rZ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mTDie1rZ"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52c82101407so9115100e87.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718719620; x=1719324420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3si6hS7kdezOYwXxr/YuIhrD0I+xKbIgHBoEok6r9As=;
        b=mTDie1rZDbPcRXKv2x+uaYRkLxIb1KXZXxguJF89CGrEoo5kduNje4eMTEqOrODAEF
         zgdR5eJaWRtBWo4yKF2cLvZbO6xHDY+HagLXPYtLSM1874pKcYRXdodqsInp2Q5zzScg
         xvlq0kBwM98kIDlTDbnSFlQDVkYXdrnIQr2L/MtuZRT8qMXc+d4tNsfxOXPNtC/DzInS
         WrxoCmaKPhJfZ6R8LDyhlCXP/GUuM/tU/huFgDUzUJSXB/082T9CBQN9Ns/4cL6O8zka
         ZOTvqnfR9+mFE9b5MmPksS/VqZEIiKhjDiWFO6nz3blInChKtGv/oj+2Dem24qYwA5dl
         jQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718719620; x=1719324420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3si6hS7kdezOYwXxr/YuIhrD0I+xKbIgHBoEok6r9As=;
        b=LvUi6WicRMDYUuUrOirBEZ1ITZm5BGSxvhAF9vb5t4vil5tRUlMjgdVosXVYsEkIRH
         5/kYXh7A0Ur8qBlk6kGHTgIaAH1wd3jGqqUxNOsECMykss7xPPo4dgURZ2+Nh0dpXu34
         15tOiMOpAz6nQ6S16+xlERhKTiRPMV3WgWY7++MX2Gz2FXvcYwGV4zOraTN0Y8Kv8ILQ
         Rx7VAEgRPtL8NNg1o6SnxRFa5iJoh2h2zNybWjuQlxGbojRcXTi0LRA9PfKIx/wA10x2
         JCx8Ic5sXTZ9qzw+iBP3fedI89k5MyyyWStN0Qe/TgMyTGTFiS0Rm3MVdIqSt0Co9Ldf
         D+NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDfbUJvOzM5FN9Qn/iG4U/j/F3ML/ZHAJ78tUmLvPYXxvoYs4NXkC6iSx/pYKJwl506/aBjfVzD0WPybrkJnC584l8B6H8unFGcWEhYQZg2xw=
X-Gm-Message-State: AOJu0Yylaq+5pI6O/VZlnWEZloVlU4YGYerBleHC7PSGP31c+7wrgvQH
	AqDnY7vqstd2DL/uuAfFVXZ6nr/Uxx1sK254MQMdE9xiDbHjQh+fHXTgwBUd10g=
X-Google-Smtp-Source: AGHT+IFJLofjUC4t74eowxJ2/hsKLGcRlwVabKgkrjURD4QDMFbmjNw63Vi/v4qqaIE7wwB4ATA/8w==
X-Received: by 2002:ac2:5de8:0:b0:52c:8289:e891 with SMTP id 2adb3069b0e04-52ca6e56efamr9347270e87.6.1718719620233;
        Tue, 18 Jun 2024 07:07:00 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca28723dcsm1517734e87.151.2024.06.18.07.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 07:06:59 -0700 (PDT)
Message-ID: <51ee3d59-cca9-45d0-8a0b-31bc707b22cd@linaro.org>
Date: Tue, 18 Jun 2024 16:06:54 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/23] arm64: dts: qcom: starqltechn: remove
 framebuffer
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-21-e3f6662017ac@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-21-e3f6662017ac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 15:59, Dzmitry Sankouski wrote:
> Remove framebuffer because a panel driver introduced.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Not sure if you want it gone, this still provides framebuffer output
for the first 1 second or so

Konrad
