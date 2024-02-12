Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B8439846
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Feb 2024 11:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707737455; cv=none; b=Un/YFiKraJEQ/DAF37SFzpqAdNvqCC9/gy5QZF16mge0zBbR9fkXrowAhJ6tW2oMNG6IV/Ze3XH7s5gV8Jn1TyXgaJbajtsughw/XegiYpH91zkEZ0yCT5wAIPl5xw2e6185RWH+XTf2fQa5Tt8hXvvG1MdnrrMVrnDFGBTyy4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707737455; c=relaxed/simple;
	bh=LPMIqh1VHEOTDl5Eo/vKu/zemXhlISnHcMKmfvKZ7Ak=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hyomm1L5i7FQPrNyZ/DTiv8c39gZcksrG0SpsQJp0RMO4iv21Y6dHY8i1v3U2eSXNuDhBEi7nqgdrobrFy9liHzps47NNQ2Xnzd5wWOb4D7oZ06GyVB8f+gYUMnqaXDS28JGt98zUGr/SEgHnsczGvRoyr9UteVDxKi+SeZtINE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hsi2vccb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hsi2vccb"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-410fbf07602so2004215e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Feb 2024 03:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707737452; x=1708342252; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L1JBAqPmAtCPzMf4N3r+gYLkv/oFoGEnBHp1/HY8rf8=;
        b=hsi2vccbBpT3YsrDbEJsZ382QG3fe9RuQouM+v+xDz0YEBYgbTD3bCZhdRIXncNCrf
         P5pTkBKcyPc2aedqhhOpi+f4wF953tG4QiSJJvEWKrr/T3H74UQgTxDh8ZpP7xVf3oBG
         NQGPIKZryb2soqOElarlKXGSyjrauUJE2wle6yElaSvOpVw03mtFqAckGTNRVH+MPXAB
         u+yjX3CkRcAafhotjzPprowTPPqfQcPw1/vy0xIazUjI5lkUCO2UlCY55+maqFpbjBPG
         JsMRAk/cxjtJxJ508PXCibkQcq8eO3Xvccsegxsm1qndRywJpHhOkPr8ky6dXM5JY1Fd
         NTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707737452; x=1708342252;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L1JBAqPmAtCPzMf4N3r+gYLkv/oFoGEnBHp1/HY8rf8=;
        b=LwE5vkK2fNA3JoWQ5udIGSUvW4ksuh7qi2S4TigkbOLKX07KPH47SJ40DjW1QXhVA2
         JUJBsTik9LyQ5x/ih/UESIkL/klPZDezxwmARUwdESi5lHmsKqLY2GXbYhdHvRKGzxTv
         BV0J4TOe5DsipB20ZXFgkeUCvabe2N4Xk+QfrI+6g9cs+5jMv9/sRGCRt6EKDncKviXb
         XIEPX+GhcmFTCPbbrPR6zA2f3zCmK4gkAElQ7rq6cB4kV61tCUTlWa22pV9HLLAzBG+7
         nRCzTIWcl5Yx2qgkunJ9DnoBT6d9YbyeraZ+kU3mqrn4yz8wufEqXaT2WIhcpJKbLijb
         dKLA==
X-Gm-Message-State: AOJu0YzT+RPiZqx49Jld3x4ABtTg36ImbtbywwfUSydi7X6AAElZlM5U
	MBbDb94ZH2jJa6tTXMjPC+8ECwhENkuCLshZYK178hiQivYKH3N9QkOdRGZTBjI=
X-Google-Smtp-Source: AGHT+IHdx0JzzCZmSy7yxwzinADCptkAdd4W9Bm4mX6JgJse7TtWyzAf3q4skGt4Rm8w5yc4PdIwng==
X-Received: by 2002:a05:600c:6008:b0:410:d877:2478 with SMTP id az8-20020a05600c600800b00410d8772478mr1811401wmb.11.1707737451826;
        Mon, 12 Feb 2024 03:30:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXA6PneBzm4rfxP4667/oJD89tL4v62bD730YafDLqMtw2WyLNrqUbasxNDR/23Ix4Fw5QVP2UqR/H92NKxdP0m1kysdiYAMhs1FoPZlDGGrKwVaxtLlrrT9aFaK0o03vk3/6TZqOHOkwFgdK04pxdwKiXnFpS7kXFXsWBVKJsWUm4C26mJe0NfxgXbGmbmzC3ieuUtUn6lWUDGv9P98Ld8pZSACwY5yoTvqqVp1S1vAPlMLEfjumkQ29mf8dcfc8eh0gOV1Jm7SeI9xe0vyxm/reNQsdcL5a46kDQ5xj7k+XYRV++cVbw37Aa17s/mnhN06sY/0Dlm/H4Ea7Z4Q6b5C4bbFwb8nvZQQsiW4U53LCqMW06BaNWcrwHcmkpBp50U/XXlwYVmn2SOngGKtznlwfNxFU9oRWAqW9Y7YiRDBkIYoBmDGm1FQEuznvGmq9G6KE7cDSsY
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id bd27-20020a05600c1f1b00b00410d3b8c4c1sm2786066wmb.31.2024.02.12.03.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 03:30:51 -0800 (PST)
Message-ID: <c16c1f18a8c6f33a608618d4ccf7d8c8dbb6f88b.camel@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: gs101: add stable i2c aliases for
 gs101-oriole
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,  conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org,  alim.akhtar@samsung.com,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Mon, 12 Feb 2024 11:30:50 +0000
In-Reply-To: <dce39e15-32a8-482c-8751-af4a133f82d2@linaro.org>
References: <20240130233700.2287442-1-andre.draszik@linaro.org>
	 <170737972037.52344.9107022607101399076.b4-ty@linaro.org>
	 <5972b6a4ae8669e2a9e872278b740b182217906b.camel@linaro.org>
	 <dce39e15-32a8-482c-8751-af4a133f82d2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-02-12 at 12:18 +0100, Krzysztof Kozlowski wrote:
> I can drop it, but the actual problem is that what if downstream keeps
> changing aliases? They can do it...

We won't care at that stage, downstream should have no reason to divert fro=
m
upstream for numbering at some point in the future.

>  The aliases are not there to match
> with downstream, but to have stable interface matching SCHEMATICS.

Except the schematics don't refer to the i2c busses by number.

Cheers,
Andre'

