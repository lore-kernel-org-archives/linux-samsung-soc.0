Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83F732E13B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 07:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040004; cv=none; b=itIv4ozBl0rzN8ro+eeIfhTIQlSwkFAHuRYHu0PkttiSoE8LBtLBHBnOPQRasRlsHpM9n+AC7j51TVRH2OZcEOBxj+eHW2g9tLKOKD8JMfaknHAegFFyzS7n/3rmbHgsP4jkDvnqw91omehuDr7JeMM3O7fF5vh6dgQfiuOJdaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040004; c=relaxed/simple;
	bh=C2UmvHg4pq3Kveuh7eyfvS0WF+OsmyQbD1WPj/oCZfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dF0ILDaR00gLxnw+/5GPs/cElMfWuX/OlmwXC2OW3hIXButnE/aT7V4GeIp99DXo8PN/mxKLVkQugjEsP6D8dYPnUcg+9ImHpA/wsgHsjWjz0rk3iyX2FbBeCZfmwSxpLwLNYrBGBUXsaNOmeykDzuOH/hq4Yo3tP0XbA2JJqdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnOc882U; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnOc882U"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a4113ab355so8844330e87.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 00:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780040001; x=1780644801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cLXzJTBxhRzNVcfTdOrnp8DxAIsKoO1FxDcS4XlJuFs=;
        b=VnOc882U2GUpjzR1ghxiJZKdLoi5M1jiMx+VpZnO+OVGUSU0ASGcCU7/hCpHNwKBhQ
         pfNInZglmC+wiy2xToqcI3uhnQBtr1K6Oiid2a840KjKKNHN6jHbgQ7Yj7d8xPJgz7XJ
         trE1H734BruHR2IJIAbPlY2E+SmIPKcOg0AtNRIbUIacU3rZgTn+oopx0IaO4/07wR4r
         ouHwOhHQePhxnUcLDptTjmalVIR7M7P8uC3r+O9ulbRGDaQGSttIDgQlpBYwJR9FdsUE
         Ql1bIi+7M5I3ahqrfqroWxYhIyZA5bLEDtpEpULTROOx66rZDDZtYuc6U/HgfjgBV0Gy
         5L9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040001; x=1780644801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLXzJTBxhRzNVcfTdOrnp8DxAIsKoO1FxDcS4XlJuFs=;
        b=IRqoY1h2qpSqjKjpATSsGYJAdR6j6lPCwyjOc0KV3rWqI8VTGo9WYpFtPvtPuqnTFB
         dy9HVqM7LVn1zHG/gkQYUyXT+NMkwYgPfBnAV1VJk90z8YdMJsHw6Mj+8Fg93YUlZgS3
         fe3wkRy65X/1He9KVDjWic9Ri/x/nvXu/0st0MTWVpRXdBEmKwzaujmycB6thyw5v51g
         f5qN1Tg91KolQP2tYKyNheICV/6t7eNzcKcTrd2wKa1eoimgb/txabq5dBOJuCEJP89j
         GF5zD+CHk65G9yJY/9CknwjceJTbDWnyv468M6cswUh1gnuB213iTQoymeOR4D7ylIb0
         /Mkg==
X-Forwarded-Encrypted: i=1; AFNElJ/pRSMwOeV1cD+KpZR+AljStBEcXeTIBPIzOFHqA1nsYc5lEEzP5UKPOlH9SayiATe1JcgGni13HDf3WrXRh6wflQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/YLm6UCvpp4YwuuXWRCQPML5YYUSqimLK9YYDDlNfWNI3H/kp
	8Lj+VKpzmcCefPp+n/A4ev467a6LJVFW1oy4eLdDkBHe+p+sIVPRHaQQ
X-Gm-Gg: Acq92OHGa5EKu6RaAQJOscYdSskqLWmUHN/INNf9ej8RoM48zv7MnijR1AWS+jE/GcF
	khbKB22wFB5Rh+KYiITLinIsESxvnEQdRLDOfQSwkHyjsHpTeLq9jGz7o1Pzapdawf599GifyGN
	30SUhtbOYuGbCblPXyTNy/VcEvkNGudF2hHmWbQR/2BocUehdmUluSF2T/q6of8HSWm241tpwBr
	FkX04if+zY8R7iPYm36YaaJRFgQwn257hdd/vcQPFLjBoDIfPuhmEw9Q9oD1HyRxsusUnRALrc3
	zcmXREMh7wKXLSEkrs4WcmAQYZJyqV+vwFSOrVEb+IxQX8HmaAdzutm3ZyGXuX3P2MSKohq/NOm
	fGXSE0gjh2G3XGtJuf8xuHBeK8vfWFxoRSL9Dsl8MAPnCVop5xX9pKZ7STy6tfhblx+W94KAYS+
	7Wz85TtIDNat9qf0bgZEZxTd/UG3MAi43H4xtl8Tcn+eXtgSPsLmzyvQ==
X-Received: by 2002:a05:6512:b07:b0:5a8:97d7:8c2e with SMTP id 2adb3069b0e04-5aa594b424cmr494476e87.28.1780040000761;
        Fri, 29 May 2026 00:33:20 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b79f297sm92290e87.82.2026.05.29.00.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 00:33:19 -0700 (PDT)
Message-ID: <fca8dfd9-f377-44ef-bfdb-b7135f4d39c5@gmail.com>
Date: Fri, 29 May 2026 10:33:18 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] rtc: Use named initializers for platform_device_id
 arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Karel Balej <balejk@matfyz.cz>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
 <d14b9076b2c7703708bcc5cc35f339cd97fc10cd.1779950275.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <d14b9076b2c7703708bcc5cc35f339cd97fc10cd.1779950275.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/05/2026 09:48, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
> 
> While touching these arrays unify spacing and usage of commas.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub)<u.kleine-koenig@baylibre.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

-- 
---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
