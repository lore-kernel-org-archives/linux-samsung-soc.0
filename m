Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060C734A79A
	for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Jan 2026 15:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057794; cv=none; b=mRn4YiD1ABkfh8wh2tREZL0pJjAjGIPK+6J+E947rygTqa4nLxrwM3U4yExIJ/6XWN/pG7fKv54G7MavLmiqjf7h6Dj+lsTTFYsReJrU6POq+Nl0nK1U91GzGjOZsmoNCVDUMizv4RED08H64lj+fGHh4PFz7KDASNU2EYmL9u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057794; c=relaxed/simple;
	bh=veOrw/m8cCXNOzS0YhBEMZHiqb+wrCM+D/j1ZadzRgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VoTI78sAMN4K3etknpJeM9rEwekXCobXW+M6wVPzwi90TqR+0RzcJW74tRepvNotNlK5wglVs0vscnlJIw86uCTzlrfkjRkEDESoGsoHXPmVXIsCPB/nDZmcTSy0afVcGN78nTn11vCtOWJ2RzHehaVzfYz4kQKqkekcMzMuNcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UR3LYot3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UR3LYot3"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-432755545fcso2961663f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Jan 2026 07:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768057784; x=1768662584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYFiIfX0/KjQWE2M1MYc+2i7VSmAxQXe92tai7T06wg=;
        b=UR3LYot3X99B0iocnSlHLBo6xcEdvqWff5fJcdU9Exm6L/VyIsE1xVQ3sVYgXj7q3/
         AJgsd1EMgirOEF5wAn7H3E2taaHVG0xxbScSmK/eNkl7JVSrD9tlrn9K3U+JEY1JherW
         Qz8doesvUqWD5kfvD+tIrJouA/o6VYr3xVkPxj51Z9B+MKoAfeYgqiPVYyYZKZrNhk/F
         P9bB6TJNL306n/2z4mmOJ83Oy5KeskaYSjMWq2a8PkNrM/SO+irij/BR+IX+izMpqtjd
         cF/nBHWOZQPzwd+sng08PL/DHPEqiDOLBhZ8Qyrf6Ffy1AiCqVfxLza0Qx4ukc3S/Gwv
         Y6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057784; x=1768662584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYFiIfX0/KjQWE2M1MYc+2i7VSmAxQXe92tai7T06wg=;
        b=aVRq2P+6Ulsp4+e4baIqmiCwNb/r6eHZ4yiHMc1BNvHhcwAEiYP27ftc+X0P6nGTik
         9BVlnl6CuM0YtsRHImhEe4b+QMI9eSo/z4gkg3r7CQACgGMjSf5f0qoyJ2OdO5r53asp
         lXRr7pBtoSCzARRPiQXoCBT4RkSxePtrldzUec3g6hSFdEQODK0ltoyEQtU2sVDgXpOh
         Bt5eigg7SVKQFMwthZ9/+Aa/FhkT9+6M7MgFj6w0gHh/v6sCV0E8fztEOZgGsCMtf29j
         IJnrmqRvWjxkR6DoOFv5mVbRMXaR/ySY5WlOMusn4xSWnCrTDYOUW1ZsemBQ6WsiEuMv
         LLrg==
X-Forwarded-Encrypted: i=1; AJvYcCVatusgI5VU2eohwiOMBkap23DlJTYZ/6hGZh9+M4joNH+2kw7NItP6HlIu7kp/89lWg5G7FIdEjvqI5vtHrOHVfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRgMWMLxY2HL0UU6O9Le1Qk+Ez3h51WevnNfo7RPLe2nTZCYjq
	mNBoYp2LuTotOGFeW3Geq0OS9SIht5Gt4U2N9JDrskbTsS/vCy8syP1fQNOu7UnoVNs=
X-Gm-Gg: AY/fxX4JMXwid177yZjA7Qv8jA/HVb9fBLRve6c3bWOfSQxaUhnXZjJSVqIFjDfT6id
	dVjtlzoUbO9sEOyULPi6hHvbeaHTBkKaQxbkhSmbPFEqVyNTpCF0fWWErBYFftYqYF+ds2mc6gr
	XnUAu8u5iPp8D63XAtJJ3EzR5poWjk7ZlKME8MjCktEkLnlWp3Kx7VY5EtQSAyDhBVOlnO1MPDN
	WI3+m10gNpnJkuQwmff3nJq7aqWMP3D70dGbkDuyzRerHTay/xKPD7I/VQHZH1RuJ6XsazXosPF
	CjWzQbI+eKSAsMMJIUM8RBQXpCjlmS2+qHPm4phfnDEzYVUsEJqkTLZ2U8WdveEI6Dy0OHxCFjO
	IjLl4D81eWNsCC1AGoiHH+CSlVmS1Y8DA+6+MJW+JNj59DhmVmJDtfiSrV9nUpNZ7Z0di8b1P5r
	btLFHu6trXOTr1VesxKsJ49UUzpXM4
X-Google-Smtp-Source: AGHT+IHwvRNK+qwBLjP9mJj148RzU5png6+Rsy9u3J7EYhE07UUYa3vVSxYXarlT5BZGC6AC5xVP2w==
X-Received: by 2002:a05:6000:40da:b0:430:f23f:4bc5 with SMTP id ffacd0b85a97d-432c3760d02mr14529601f8f.45.1768057784134;
        Sat, 10 Jan 2026 07:09:44 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e199bsm28208208f8f.16.2026.01.10.07.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 07:09:43 -0800 (PST)
Message-ID: <6c2612f9-97de-49e4-a7c2-eacea2d33f51@tuxon.dev>
Date: Sat, 10 Jan 2026 17:09:40 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] ARM: at91: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
 <20260109-of-for-each-compatible-scoped-v3-2-c22fa2c0749a@oss.qualcomm.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-2-c22fa2c0749a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/9/26 18:57, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
