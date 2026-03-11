Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9733D9035
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Mar 2026 11:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229861; cv=none; b=EBNX2z+bbHYJPGznbcROaoFYcYTH4GOB7wiCq4jaRXl6NUG7lF4RllcYbxovqBnV2Hdqigqx5QZ9xveJIwLYZ9S0bi6fDRUbSA3K05W3d8sD5m1c/zIeKq5G/yBzir5opOC0nQZX5XQM3ommVXcv7knkJDM3gHNsRJllVBsc0iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229861; c=relaxed/simple;
	bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S28wA98c8sFazZFV5966HrC4vrl7MZ+joCOz1k2USt0z0iwzNoQOwZaH8GrPJisrJ4HWe7FZoUEEXaJe5QuZvDacqy7/jGXZ4OS+JDc5oxuWQ/5psBZxPLA3WQMWrvuBOcuvPs7XrK6k7YApyJR2lU/qko3y9t5dzp5NXdmpFLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xytk/hOv; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xytk/hOv"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439aa2f8ebaso6981808f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Mar 2026 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773229859; x=1773834659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
        b=Xytk/hOvDF00hrRb0Yq/EusNd26162BrDBGz2sWnSbsSk/+p5rD5lLSiv2b7PY5urb
         OPxEL64A57Qp3tqmHx6KHpff3lWanqPqOt6l6tPBkP5HHBIgcF2r5XtAqpBxUd/dzQ9s
         j8O0AxVKizDNhSup3trigc0CmMRyu6gMGCNJG485cvPol3UbXCAo0qF7FNjwdwlXG9Jd
         FOJ0RNuKWnPNUOKDCH/SjsV9ui4Ashli+wXyhZGNS13kvud1uCiF6oc+va0QIjDnBv80
         2ufQgvlo4GMbOcKvzWmgaoot/MIUuD4DKlHSPgK0nLM5dT0nAerncHzQYGITENEwUbqH
         /CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229859; x=1773834659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
        b=fVOhziRYWLUZHmvFFL+nmeG5tgVyARaJZp+m6+uY/sSsik4lF/aR9gdjXu9VVteqnD
         k66Kc6Domu48qou6M1kzsljZT31mRywZVVRNU8b7xbsfFZ6GmO6+viCn9/xGd2dD/cEt
         3qmNMqMvJ7ppRUUB535EDMzjS5tqzT/pXe9loj8QcPrneG+4Z5yubY7tR0Yd1Qifplt6
         FvvXLl4N9Pp0nGltuCVxTXlQIE5HBSryyalPC/HnIvgRhuc44/ul+ZdUFQp7m1sT/g4Y
         K5BFuUxFZdyXQu88OVV0I8hjzb5jnRW/Vj/RHEj765mw90R8Fg4+4JIRiydxMa6+tcpQ
         kpWw==
X-Forwarded-Encrypted: i=1; AJvYcCVoM9UpFp5c7kOcJfzBixnm7S9jc/13g/lY/gTC+qob5tRKXDK5iprkssK5/OZC/AtDvdMZCcKdiB5FSvhTzNCw6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqB68igAKGBfpYqE3yhVt+TjrOa/4MIs+SZbyzqP0qkraI/0BT
	W9aqYVmSwcTc7PUnM4+J/i6I8fXQZemntue1FqLqEPPIvFvK6+/f8YZwNY4Jc7rYlDA=
X-Gm-Gg: ATEYQzyEdfe9jPt94TrFaBZWD7ES1WTaO9DCrRkHr3+JILOD6JZvg/W70KZ3n4lSrVw
	awt1bsszDq89eqQ6cIxz2MdXFmu8njUKLoLKqsFNp5hFQPsQRXkYu0x3rRmIbHsVE4wtqtyV4cN
	Pjm8/Ure2WeZF/WQdisItEkrCAmC7SOl8J+Dt4V2Ba/eamgbR1rKHaqoNlL62OR91yg9t2RLB/q
	f7Gu3FA9hcPkRN2GFEIFgzDpa+JjBvea3lZ3Z1hWWPw9kWLeYHDfRrX2cM/JpICsHyXRyewJHQ7
	QH8PGPQKpiFCiUO8fzjFKI3Ov9jWgH+DuEr+P+95BwF+xN2vNGc0isPab4TW1cj3q+PqOZl5SoT
	rb2/2crgEFSUCagEV/s61h5nv56oSo0Q/JUJck09itzwRTTRjg7MeskgYIdiKnba0nQPunYlai1
	wtPYsefjJB0P/8O2NgzB8SpfHl2u4beOw=
X-Received: by 2002:adf:e94c:0:b0:439:cb77:aa6 with SMTP id ffacd0b85a97d-439f8222fa6mr3599215f8f.42.1773229858683;
        Wed, 11 Mar 2026 04:50:58 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d209sm5881724f8f.5.2026.03.11.04.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:50:58 -0700 (PDT)
Message-ID: <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
Date: Wed, 11 Mar 2026 13:50:55 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sudeep Holla <sudeep.holla@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi
 <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi!

On 3/9/26 4:38 PM, Brian Masney wrote:
> Note this series depends on 3 previously-posted patches in this git pull
> to Stephen for v7.1.
> https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/

There's no tags/clk-remove-deprecated-apis-v7.1 on
https://github.com/masneyb/linux

Cheers,
ta
