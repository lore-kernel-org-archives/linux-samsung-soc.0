Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54103F822A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 11:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151076; cv=none; b=H75qfb9MLYD4waA5hdLlqDzYSd9L5i6RUBfObjMFzXGwEIshS2MYpNSvFBs2Z7kZfIjkwiX5KnWhJSv/UuN0giHdWocs+2e7Nngzd6kBmUjaOHveWkam5+r/kqHIttTkqxcuyAPzmqWbh8T8ZCfgp3g6kdT9vL/2aTMdsDxsJNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151076; c=relaxed/simple;
	bh=fwc929VBWUs8HNtC2JsbnDBcC7Mzm1uBJraV+rwzoKc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DsjiVe78RhICeu+6svvEmFTgsrqQ4a/BZRHoJoHf7tL+kyHSB0/O2udvLcCXP6rmGFtH2udAHNLZ75Ju2YEPZ8tCUbyrpRsA5nIwgBHmyZTijpVon0VUTSmbQATwQdFs0U3ag3F/r5PYaBFQMd8UD3L4xJs52vjqTse12mDiD3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BApUwmAk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BApUwmAk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso17347025e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 04:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785151072; x=1785755872; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fwc929VBWUs8HNtC2JsbnDBcC7Mzm1uBJraV+rwzoKc=;
        b=BApUwmAkC+7LTxmOtx6kfETXd+YMHZ5LqvAJsuAv54cvQZFMhLsdtgArwaLaXkQ5eI
         4UJuYDF7vP3F8lNwcgxW4LSZhl1Ec7KU75xGFjRjWZ6Unto48Nu3I68JoMDVyaa7CleB
         HF2eszjC1yWzHCw5H01xRDDp6inAWvQBGdCwrt1FlQ/YIeKHq3DRB5Dk2qep5DZvvTzD
         yEYLDJSEdZxeShHhno3y+K8QPwbr8jfihfrRrjfRWDPPPjz/tZ/jXvr+qnPv7FmkhjhH
         sgL4eW3IxtXM7Yf/O8AWTo2a4gUA+XERReB24F6wfy22P0BfOQ5Pq3nuBVoQD6owTAt9
         seqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151072; x=1785755872;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwc929VBWUs8HNtC2JsbnDBcC7Mzm1uBJraV+rwzoKc=;
        b=AoKRN3KgTzw3dyc6FcsKmccb7HoWQdqkeDTMaojw1GhfDhgJCyNzfKviwXKZjvy7+T
         LQ864xRt+YN11l9kApqOqfYro4XVFleG7JewvzF4Oe+YnhR98fRfyN8VCG9PHVV0Z1Xw
         WMDiqvuhNJsOA8KaszqK2Fk0TMrI7X3k2KjHK+qlwwz7UjAExgLtleoC+U1uuviBqqtJ
         nIwr3onpowCC5lF358ZvLUCAiQ2CVPZt5TJr2AOAg0pWHTZDIfPWsWW9TCaxZ9by9ZYc
         qTCasXZZIC76iETNa9NWeUwxV2bPdIpuFf7a6vneWhCDUhMTwJZMxXhu8bhys7am2bKL
         3iLw==
X-Forwarded-Encrypted: i=1; AHgh+RqvRnAJuUeCwIfW8wXUMurhKuFMsxwlzlga7IX4LP1785XiqeULzM7L3szjm1UJE6XhwZ2e4W4HBWq5cck2Tis8xA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFGOzKHtUszDft98dJqK3QVp75JEeriKr/D7ezXavVbnfCyrdI
	hOKNCseMLDaY8YR8jmiox1jhi9GWgTeh9N5u0/wjhYGNLMly5xa0ZbZTAdmiTv2LeZ8=
X-Gm-Gg: AR+sD13EwWczzes34Cf4DBw+BPNH1vtI0LtWOd43MiYQNf5ZyQfOXHqAn+5ey3I0mOW
	9glZ4zQpKZdVToPhuDEfXygiO2eef4V0v8mIaj2X9Rfj53JRM2GdSXdKZkQxedQLOoHXE696bEO
	9j5BSNXkVUYsKejahZ2GnB72uta5pusRqmzl/n1MCImiTqgCk3iBnZj6xiF8bzVntB575t98TQs
	U4Kx54NSXbuz4NI+MsbSGfq++EESU8oE11QHCQPHNi/QIG/4mAl81yximJhc+JVVGbDHRnBfqN+
	UiKgF6GoWlZz24XPBS2bfvNBsFm12PtR8ipuDy2LpuDHkHSF4qF5kc3ttM/3Lct5pkgTrwMZpA/
	HJqOElnZtuEkxGT3/CkFQCOFBITO26Vl/yKyydjR7xLKHLZwn+TN+rtr7HT6naq3jD+6Zw++ENS
	5CZAbTUw==
X-Received: by 2002:a05:600c:4ec6:b0:493:e6f7:ad75 with SMTP id 5b1f17b1804b1-496b73c6dc9mr98804395e9.11.1785151072036;
        Mon, 27 Jul 2026 04:17:52 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm50401481f8f.31.2026.07.27.04.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:17:51 -0700 (PDT)
Message-ID: <4fc5f291e62b62f3445e1c72f00a23b01e04dce4.camel@linaro.org>
Subject: Re: [PATCH 4/8] arm64: dts: exynos: Re-order clocks and align
 continued properties
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Ivaylo
 Ivanov	 <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski	 <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 12:18:09 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-4-e9e3e9879d05@oss.qualcomm.com>
References: 
	<20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-4-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> Trivial white-space only changes to adjust to DTS coding style
> (clocks-names should follow clocks) and fix dt-check-style strict
> warnings like:
>=20
> =C2=A0 [property-order] property 'clocks' out of canonical order (should =
sort before 'clock-names')
> =C2=A0 [continuation-alignment] continuation should align to column 39 (u=
nder < or ")
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi | 282 ++++++++++++++----=
-----------
> =C2=A01 file changed, 141 insertions(+), 141 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
