Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A8247B41F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845490; cv=none; b=dF0NxOAS6fy6ARoK04SOFwRb+pMtqnonC3nYsJtHfB8UOS/I/+y6a/+fu6fqT8VNZBSupau4rxcWexziVeWFR3w67JjRdlMy2QEC+C5Nkhz7nZFIrnu+EFxNW2SiRZkUjjh/CzkrkwLCn5PuAP8EtxbJmf4MLQo5dqI+OB/e9Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845490; c=relaxed/simple;
	bh=WLJ6KLbUaNlC1TZvkbe2NdC8+gAoHQknRt61X23e5Rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UsxNJoFkJttKKeoPtCOxs7cKuSm4bQwEZr+oSIFGl0l9Y4RcEcBf1u+WnQNDx09c8VM27vjhfx79IMqvtriZr2pcvbwFzbl3pWwDrvM9m7SUFXI6c7cxPYCwqnKFqxvL+nOgCpF1N2egwJpUZY+Bkngk7y2GVz2ElUGxI0B8umk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qi2KzeL9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qi2KzeL9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso80402905e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 04:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778845487; x=1779450287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VKGnF5CC4ETtaEpeIaTcRgQeu3JGhooJgfF4cVfOKm4=;
        b=Qi2KzeL91zQ8hU0F15XfwI0ap2XmtEepSmOUmueWkE6SDVcWsLFHD8ZvZWci++1DmD
         0EgQjGC2Xo8rVKjAnEpgkcspfRW2PKxuHOrDMfGF8y4/WvlgMo9aHxelMCKaovDtRJvL
         dsyKsGh+Fq1sqEIL+Ra15accFrhFAoG/XZgUae45ojpKyPSQAMNi+vmqTb40psG9XJuH
         TUnhl9QfxAkFE2eGEdp0fTyHquVfaTygG120+KUfqXCDSiQBIbiz5cxyUMGxpF0R3DE1
         QFhHs4E6m+AxDf/vFLHu/4wYV/HsJ3w7q99v+H6TXaKGSeJkcjEQPcfWBRMx3z0Xjb8A
         /L1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845487; x=1779450287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKGnF5CC4ETtaEpeIaTcRgQeu3JGhooJgfF4cVfOKm4=;
        b=rvVsbUGmaloVAYVRlY0tGJygZbkgzOYkLuNsYAItFLgtZEMs4paTlZ2iiINPa7Yv+j
         cKVwxTcxbuKBOFEx1d0SDs7ZqlMGrCTnq5Fse9vzmzvYus7RNCikon8cTPOgVthQ5y8P
         P6/5n6ydYuJ68duqKiPRYtxR9ChbLL3r0yRk2E9bK8Xb23Ux/lmwpJda26YkCb/pL9RF
         iLxD0fg4uUy37PtzO3C7j7a6zlOiO7Ce5Gfw2q2GB3jF4XHM2EH4djb3/sUPC2fcIkfh
         RNDfz2wh8Nu+ffT1lKLfZVVLlluUBwxGMxe8JVlh4F1ZqGf3UhL321YzO+BeeditGCMA
         XuGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wOnusxUqTFj0cZNfQqWb1r5MEBV+JhD4XCBhGHxe+QeQHXpIfcaHb17fiCBHxvhGAbVJM+DINbiAN3xBzQhG37w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLsaNyK+LW/LiwRwQ9iabLpTDQomiJ9PmQjBFF1Ssu/CZpY5r1
	EwLKJ/WeKZ15yFAbBG2iPzZy6m/qRuzVPZmXih0IILHDmWyxVkQO8IKZGYfX+C8wQP0=
X-Gm-Gg: Acq92OHmJEoDqrWBAnpXxXKij1dDSxYDA0PVp2vTicTFIbpsQjaRLlo6Jv1STYSP3ol
	uQk99gTAHaiV31+PEoxSZq+V9/tZQ4OYUY24OBxgoCyIuhKw8SwK3kO72bzpKKg3haKpH/6ICzP
	Za8n5HfJz/ThiORCTpf5UwXjuHQ7RKbGbOUwnNJQuTqMsISCMqwTjjgPBoyAjvntA0yNzNgnNoc
	zBi3SiDEk+aP1ROb4jjZ/TsanzAyG1sNomIDbESWA26JPbC9NwOSXSHlj6DzQ/S7i0I5gGFJFdJ
	D1uQM/mar2T5nYpBWEmZco0gvR4/6jQBa+kfQ8CLX+dZJMd0cq+LF37S+gqkRLq/5Qcx82YiXyy
	R5AX3PiFGi4iZAnkdhp0xdGYtrHVLQfTVwt7GPpPngA/dv158qrK0uh7NE/AoJeNf0UozGjWLuu
	UM8NTthMGzaGQcXICTzA8+drc38/ISAzy6
X-Received: by 2002:a05:600c:8184:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-48fe60edcefmr45897445e9.13.1778845487488;
        Fri, 15 May 2026 04:44:47 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe83ba2sm11472195e9.35.2026.05.15.04.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:44:47 -0700 (PDT)
Message-ID: <a4c287df-0300-4fae-8a2b-23e2358fb740@linaro.org>
Date: Fri, 15 May 2026 14:44:43 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] firmware: samsung: acpm: TMU support and cleanups
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Krzysztof,

On 5/15/26 12:32 PM, Tudor Ambarus wrote:
> Changes in v2:
> - collect tags
> - resend as sashiko couldn't apply previous version. We want
>   sashiko's review feedback

That didn't work, sashiko still can't apply:
https://sashiko.dev/#/patchset/20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355%40linaro.org

cut

> ---
> base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
above is v7.1-rc1 (signed tag)

> change-id: 20260505-acpm-tmu-helpers-4c5af0e2f07c
> prerequisite-change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581:v5
> prerequisite-patch-id: 18d89d0e2bc0efe2cb366746ac4db36f4682f061
> prerequisite-patch-id: e877f865862ee94f5750b877b5fad863d8acd7c8
> prerequisite-patch-id: b5da16b5c6d6731ea519ed68302fd52ce57c7ffa
> prerequisite-patch-id: df5b1d9df4c8894afaff645c9eb84aa4e3daeeee
> prerequisite-patch-id: be74a55583acb36dedca3e118f49633172979617
> prerequisite-patch-id: 31ebc7bd806d4d466c256049f32e3270e2caeeb6
> prerequisite-patch-id: 7ea0832fcf76e4f40e18b74083904e7e37e1addf

While I see I forgot to update the dependencies, I don't think they
matter to sashiko. If sashiko used v7.1-rc1 and the prerequisite
patches it would correctly apply the set.

If one goes in the Sashiko link above and expand the `Baseline`
(show details), will see:

5e9b7d093f3f77cb0af4409559e3d139babfb443 (5e9b7d093f3f77cb0af4409559e3d139babfb443)	Failed	View Log
	^ this is v7.1-rc1 (signed tag)

krzk/HEAD (254f49634ee16a731174d2ae34bc50bd5f45e731)	Failed	View Log
	^ this is krzk/HEAD -> krzk/master -> v7.1-rc1

Shall your HEAD point to the krzk/for-next branch? Happy to resubmit
the set.

Thanks,
ta
