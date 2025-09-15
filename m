Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4B82652A4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 07:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757922388; cv=none; b=uCRKtbZuqSSqonEDXUnOIcTKTFC3+N6usCpwb+gaDvjk5XJ4uT/TjtrQdq2PR6B8j/L/Fu56H7O6x3pThBm7r08yjRL5UecHwY0udur+90HUd8CaDAWLf+zHYLdz/Ijs9/WabKVWKfZocbDiiHDb8xX2hF/XM/AUMzkn2EgK87c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757922388; c=relaxed/simple;
	bh=rxgBGv2zMZRxz4TM397vl50YX+5rV/wH6l1JB5uVKT4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cdX7WAx31XlINhdO5F9wW6p7EJR96SfnnS1Hgmpz/5cPNnv5ePlAjMJanqVqgmFYWHPuzno5d3t422x7nM7+mqiUt4OMzTAmdULUt60ZXi9qnUsS0sE6mQ3BHOfgPqmqn0R/ay/UVbneONE3OFJIrDP5uy6Hj3cySC0+bJAUkng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V8n6zf7B; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V8n6zf7B"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ea115556b2so620311f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757922385; x=1758527185; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rxgBGv2zMZRxz4TM397vl50YX+5rV/wH6l1JB5uVKT4=;
        b=V8n6zf7B2GCu6e2opOUBFBhGIpz5wG0nHLqtXHW2OD3gyMT+lEotEp5gupeb4Z5Wfr
         gNojRbFUEzisxILvPenML4ZLC6QiuoSS1wjKzUd2ob85vpmuTmNmqlKhbOjrhnLZRl7I
         9zSYiqXxh0X/r1kKhByZR4eLWGFP5XvWPbHn36MXcrftKeOTeSutuLTRk3Hw8FMOA840
         gfiImqfIzJNeZJe4dGP7dZc6NpnCjRl5KiFoWq6hQSjqU8+n8xCoXPd1iMk9Fo0MCYHh
         U6FqY6h7jPfRFV5sPasorwF6FL8mdB9hLYBeisVBWo6zA+0GJw12GohQKBTipHZSj9JJ
         kBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757922385; x=1758527185;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rxgBGv2zMZRxz4TM397vl50YX+5rV/wH6l1JB5uVKT4=;
        b=vDXNP6Mi+B5Pkns9nIQMhJrwb9tAW3ewuRCrgvs++3FsjnmfSott9VpqNqemD8uEos
         wAxC5SnR9bdicMwOEKSVITRT2CCTnL7ocJGrGY3SN1ueNifQG0BUl7c/UvavztjIgGIQ
         HnK1ZGgVJrsU1k3Xzd+BMqIKvgb7qUmlysTZrk7k2ND55mJAoP1D/NDWQIA0t3giQ6rl
         0M4zO1vigv39Na4QN7vkLKQDOirP07gh/GWBnjawm1Kalfh0JSE3tyjTrPMoHZtnuUqN
         3C+NmE1Oynbw9xKJK4OJ70gpnzkYpkl8m1p/qTcQKRXfpmWrI6gtO3pe7jIQw615viGf
         RVJQ==
X-Gm-Message-State: AOJu0YyIJOKeOqjsnIJCLudFTunc1wRO+yoJONeGh1RFtbQLmtoM1Mlw
	lL3I6NOg5foohoeeK4GZxXOypS/OC2gbWGh/+e0A28D1jfTWKwGAYM3HmO1vs+eNLp4=
X-Gm-Gg: ASbGncuGjbviO+dW7cGEuPX7YETRDzCiFZDZlqe9y2hs4sW04SXP8Par129XsTfiTSo
	HYgQ8TYQgH6Shq4LCEPEeYRwmayYl2DH5kWe3HpkyI3GPA56h2m/0vwsJu5XsX0k7ePpbGrT3KC
	pJru3dtuZisRuxEoOWaADmAJ8vOECOJ0+JYkfQ+MSwkHvJjXUnJDjgRxG/wfQiwgsc0XGqYCTTc
	0cLGn4Yx3tIeYXAY/x9QN6Mo/ntKog1Z0tZgGQ2U8iPXm7+nZo2/Pm2vqRwtEX1oNLdO6GDuOu0
	P6oN/aKjtIcHzzNRaMBx8WS1OIsCSOPH3Lby7mEY6X7NpVDAbeZyFjcjJYtl1IOVKha+13F8JYH
	9QshmSqflr9eWmjM9dNIYRPwbFg==
X-Google-Smtp-Source: AGHT+IHyyuLf6J5x2h8+77IB2PsvJAJV4Tes0P0hl/pG4jVOFAqE/MRdKs5G4GFgkNVlw9YzjUjKhg==
X-Received: by 2002:a05:6000:26cc:b0:3e7:458e:f69 with SMTP id ffacd0b85a97d-3e765a08312mr11049943f8f.56.1757922385224;
        Mon, 15 Sep 2025 00:46:25 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9c2954b10sm5452113f8f.50.2025.09.15.00.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 00:46:24 -0700 (PDT)
Message-ID: <62d7c5221b9598f390102f4db8db483af9f34289.camel@linaro.org>
Subject: Re: [PATCH v1 5/7] clk: s2mps11: add the support for S2MPS16 PMIC
 clock
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo
 Choi	 <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 15 Sep 2025 08:46:22 +0100
In-Reply-To: <20250914124227.2619925-6-ivo.ivanov.ivanov1@gmail.com>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
	 <20250914124227.2619925-6-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-09-14 at 15:42 +0300, Ivaylo Ivanov wrote:
> Add the support for S2MPS16 PMIC clock, which is functionally the same
> as the currently supported ones, with the exception of a different
> register.
>=20
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
