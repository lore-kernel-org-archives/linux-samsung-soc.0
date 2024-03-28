Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47B57EF14
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Mar 2024 12:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711629859; cv=none; b=SBJoFzuwDFxEj7oUh1EmIdJGrhyX71KIF/v5XkFA3Aa72wIFuM6Ew7SenLCED0XFybY3sOOZihSAAQ2AktR2NBBQGCVhMge11tYditfspI2o0tphy9lj8LriW/KIym0sc8BYXeu+qguknTGe60z7ukthXnvsXbMQl0EAcEOk8DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711629859; c=relaxed/simple;
	bh=ycgLz/YdtZpr9sFj/Nde0qo6Qn0gBay7Aklp/DytJ8Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VS3OzBWv9grIC88WJDdx7Hc7c+pl3Wgj7ha3z7dDrPc1W/mIO2l7FkyYMLiNMSkzAZ7mxqkCLfKPxa1W3+Gv+QxkAvV23K9ES4875Uw+/VzbPkajht9C8rj/pZwY/vIcI8Xwi+BJLRJ08+Rs11Ztp2LZ5vUmexwsw5VkzguQ5Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r53d+Dai; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r53d+Dai"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-414866f92beso6441125e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Mar 2024 05:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711629856; x=1712234656; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ycgLz/YdtZpr9sFj/Nde0qo6Qn0gBay7Aklp/DytJ8Q=;
        b=r53d+DaiQBMLUojPhnMceneCXCd4ksEZ39YVnZsD4YUVTl2aKJiYCFXyf0iuQnIm4g
         3wE7YN8AtIsiIbb1qqPlSYdrY2nUpZPq9z0Eo5mhnFQV5lcn114I2Az91/7BFoXGgbfh
         RC2+ypZnQEDrT5ReTYkKUKsdF92DQAe0UzVnGdh3ieJkSjyilIGAOckpI0258xKAhOag
         Mi2LRKRD9BUiY4L86trO65lnRHtVfv+ihhxpR1lhyGMk06T6e+K/pJ3AmWndWSYJCx0a
         4tQCfhJhVsDsJxINzX06W96AJ3HVX/TVCjKmYQOw/WE8/ZiaS/NJm2XXcnG28+5DGqFW
         fIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711629856; x=1712234656;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ycgLz/YdtZpr9sFj/Nde0qo6Qn0gBay7Aklp/DytJ8Q=;
        b=ZG7YBrUGUL5rXh40D5QD8f7USxu0hOKRL/+CR6n/Wx3ObZZ9ML4f51kqywpL6Bcd2R
         7ttKRRWVx81+Dtll8A2ieGdCXF1K0S2SAdC81cuxm19UIes30GQxZoRIDKrcZZB19So1
         /Srv/HTCpI2v3kunEWMlvBR7e2vjE/fMIhfjUm8hFg8+UXz0QcNS6/eY4Ed8wXLfdLTE
         cSBxux+Jdwd3PaIt5tNSNoFcT3mX+Oq0y/6vVubWF0aKq96fvZfIDF1ZozzXaCXMQC4r
         9iCF6bejDvXpLfXuZJ+NzhSgRClbUBwdL41mSKrkPrrmO8EKPpVyzyygJUYoVCbEcaso
         JSWg==
X-Forwarded-Encrypted: i=1; AJvYcCUYeZ69QpUIRrxVkEUiZhzC+cC4kQuSTcu1KIqIYrYfz+LxSlDrfjtsPEAl3hcnYpu3EW6Vse7P7OO5wt0NxpJeLMCRHrcFruQU5bfrZDqAPuE=
X-Gm-Message-State: AOJu0YwttnP5VwxEHpXnSniRDAaEXGjNjx3vmQgYcK1wOJ7Kt7fyOhXa
	LJVqfi6ZYxxxRJUtopgARNk48IvyTwB01HMpGJ4y0vCmueQKpE2Lvo0OQKa+0+A=
X-Google-Smtp-Source: AGHT+IHi7Wy4Zr8z26J8O+tGD7IbPNJPd6xA7LXKo9Cp0xgyHhMz0p8MNXQ/AtST8ruBPRMycXkMxw==
X-Received: by 2002:a05:600c:5250:b0:414:d8f:4399 with SMTP id fc16-20020a05600c525000b004140d8f4399mr2353378wmb.18.1711629856206;
        Thu, 28 Mar 2024 05:44:16 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ay34-20020a05600c1e2200b004149315600fsm5392316wmb.7.2024.03.28.05.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 05:44:15 -0700 (PDT)
Message-ID: <2125e654f89ee8c709a48c8e46956ef7645b9d2d.camel@linaro.org>
Subject: Re: [PATCH v3 1/3] clk: samsung: introduce nMUX for MUX clks that
 can reparented
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, peter.griffin@linaro.org, 
	krzysztof.kozlowski@linaro.org
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, s.nawrocki@samsung.com, 
 cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 semen.protsenko@linaro.org, linux-clk@vger.kernel.org,
 jaewon02.kim@samsung.com
Date: Thu, 28 Mar 2024 12:44:14 +0000
In-Reply-To: <20240328123440.1387823-2-tudor.ambarus@linaro.org>
References: <20240328123440.1387823-1-tudor.ambarus@linaro.org>
	 <20240328123440.1387823-2-tudor.ambarus@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-03-28 at 12:34 +0000, Tudor Ambarus wrote:
> All samsung MUX clocks that are defined with MUX() set the
> CLK_SET_RATE_NO_REPARENT flag in __MUX(), which prevents MUXes to be
> reparented during clk_set_rate().
>=20
> Introduce nMUX() for MUX clocks that can be reparented on clock rate
> change. "nMUX" comes from "n-to-1 selector", hopefully emphasising that
> the selector can change on clock rate changes. Ideally MUX/MUX_F()
> should change to not have the CLK_SET_RATE_NO_REPARENT flag set by
> default, and all their users to be updated to add the flag back
> (like in the case of DIV and GATE). But this is a very intrusive change
> and because for now only GS101 allows MUX reparenting on clock rate
> change, stick with nMUX().
>=20
> One user of nMUX() will be GS101. GS101 defines MUX clocks that
> are dedicated for each instance of an IP (see MUX USI). The reparenting
> of these MUX clocks will not affect other instances of the same IP or
> different IPs altogether.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

