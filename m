Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD33215F68
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Feb 2025 10:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788608; cv=none; b=o1oADAhx3KXJczjbw0EFbPjl9aPUi1dE/xouGtmlZ0saKjjKzZHQwH7McDuBiqxGduE5CQiPAkv5P4u7c+41apm32MWPFu4WZeyRwYIq8pSqLj0rCsYakSC0nSg2fulmJPIC+GaSYdN7SgYneOyaoHrZnVTJMh83d5LPY8BPJGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788608; c=relaxed/simple;
	bh=IW4H/RuddXNAIg/Kohxj7t5Rh3v9x4e3eNtlLWHAcwY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NifQbDKHv9VKdrefLusSw3NFOt9OAkWdReh/DmUufYX2kpp3+ob3dUOXB78Jm6RcwCSYeyExv/3cZqsuCEAh5g5+VlO6oLwUKUOh+qF0HZRndI1x8qyO0Mz1qlQ6p/ZsEHkaaliMCR9+tW0+iJ1timUcq7JuQOzLUAAnjOBRp/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TbBm2FV9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TbBm2FV9"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dbe706f94fso604925a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Feb 2025 02:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739788605; x=1740393405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odA1UbFuInXahoaueYcnkzROOat5/muuif/VvbnJ9j0=;
        b=TbBm2FV984Gr4efE37lEdExnawWKrn8Ob5J/PbjgoDoTpuh+uQW+Q9dewFSnqz/K6a
         uVUPT5IaqBoktWQyVKbQDEPXo8IlKDlpzdc9fY2Fo4iK3HKUHfh7J0kThEjhgUwYCix5
         VR1DVe3/TRUdxUl1sH5X6DhPwzJjZuHpD3rcdOuubuSyJCX4tcyKWGphdTanQURfjyGk
         7m26TYxDf0N26nRvITzn8opNYjai9p6Ln87L6TqNFMsRNqqeEMHrlk7aWsZ45VXJv3zE
         5hLEngYOLfA+xDftmOLFB0ek2t4MTJLtraWOeGGs0l36P9H1S3UyAVWvsxzN2wm3lvs1
         HSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788605; x=1740393405;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odA1UbFuInXahoaueYcnkzROOat5/muuif/VvbnJ9j0=;
        b=r39e/r6W6PSHya9WmZcfnh5+ZhfhFVP85TvHoqr3qM7FWHRinf39xPp0L9uNGjb9lY
         Gpd803O9zM79U/+JeWu7GYgnmLW1xjPBqpjVhFLhFPibDMrS+FtqBTdW34SCSNVz31ID
         Qhz4A8VHoLH4fwzrjvChmyEX90ThydheurMQe35QFBjD71i84A9NFfiIMB5RPzv2Z8hR
         SwfSSFpC0ypRCiz3yCdgb7DTyu0/2M9HA+XCY1lV3d6j7CrXUNQGAflwLd+o0PLU6sfH
         Oq1+2m8P5AfMgWmYoKzj0S9e5p8F4MbNRLcM9+2dZZxo/CB0TMJO+eK9NEfUcaO0u8Z6
         f7Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXN+5cGsP3DDk4FG+jNE3KNKTw52uXWeL3E1y2HFHbFncdnUHzvrAPZABfFCVrI1KNk5Umwc2J0aX9OdlybL6xepA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPG8YQM4fNMfd57gMT89nBZTO4B1isvWE0CTlTh148xBBKfzjw
	DzCp/A7f2nCX1Qdku+SyzfOe7NWNJi0reVGNvBfUU6V4ZH9pJypQD6WelwaHhS8=
X-Gm-Gg: ASbGncsgvTua8Wvj0UoIOH/Ku1gziq3eg28MtqfSGN/u5iqxY70GeE7JkuSUdiwaHE4
	p52vPO2vYtDWjgqVFglee/JvqWuST/kwznCsme9vcHCFkWryOhlhQ1mNQaxMdavQfhkPie3m04N
	R4mh1+qJKh8bPFwPd96a7s/tHuuAVJw3quUj4j6V+NuqGO2zaYahnrHpsRsL/U3B1O6WILEzV9f
	UwWlAxPnYKaPVEBDsjSa4TQB09zAD7s+dVgIs9XLhg6fAaMfwVhNn+DKxSsv+QgGdLr87wqLWZh
	pZ17+Pu9XI65WYmmWpsFGLd/hU/+480=
X-Google-Smtp-Source: AGHT+IGLK9kay2HyRqmw0YxEsi1Oq3aDAG9+iUL0UrTRPcqhtxeRK3H6GewyV/X09yl8wLNmhln4kw==
X-Received: by 2002:a05:6402:5254:b0:5de:b604:355e with SMTP id 4fb4d7f45d1cf-5e0361b8ac9mr2830518a12.8.1739788605299;
        Mon, 17 Feb 2025 02:36:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb961594absm230383566b.111.2025.02.17.02.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:36:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250217091341.297401-1-colin.i.king@gmail.com>
References: <20250217091341.297401-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] firmware: Exynos ACPM: Fix spelling mistake
 "Faile" -> "Failed"
Message-Id: <173978860321.144850.18127886620209008962.b4-ty@linaro.org>
Date: Mon, 17 Feb 2025 11:36:43 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 17 Feb 2025 09:13:41 +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err_probe message. Fix it.
> 
> 

Applied, thanks!

[1/1] firmware: Exynos ACPM: Fix spelling mistake "Faile" -> "Failed"
      https://git.kernel.org/krzk/linux/c/8c47b744b49f61604a2c0b64453bd410ee0f3f08

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

