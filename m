Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC1E303A3D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760602956; cv=none; b=EZUjYmcD1MZX/utfrZStWy/c0SLBwuTThtT42SQb0hd31IZi/qMqjElCpGqmP0JLOw0cGpRCIh74LhPIBCXztgq6YzevV1gpy3qtmPQS9ir97vGXfdZK/EFTmPsgAbngblBw/GXiONjC4aPwcpmDtatePcjPPThwmxqI2YqGwLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760602956; c=relaxed/simple;
	bh=oBBdec07DnXHPLlkhx/kTRhSSBmJ1d438R+ruAA70Rs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sNhIB3hy3wLQgkD47uDHrFikLtTgzQdtGg6tlWY6lA8j58MUH9EQP4XuNor0dilyThDgNBFEIEuMmOY5TZ8GuIZ6fPH6ryiU/kp4lYZj6zZtkz7owOjdythxo1EAX/EUMj0XNW7eknF0tAPmSGqBV7wbvuwrxZezyxkpRfM5YtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TGvMq1/X; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TGvMq1/X"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63994113841so746982a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 01:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760602953; x=1761207753; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oBBdec07DnXHPLlkhx/kTRhSSBmJ1d438R+ruAA70Rs=;
        b=TGvMq1/XCQChBhpPqzrd6PHtUIoSTpJHbT4pAZkLpBnjTBVo0q4lIQwi1QVTocZ9Tn
         N39vYvf/QM64pftaErwX3GEDyhBmVpJ+1KeMvSF5Colrbsx82W99eWHlqjZlzvUHUa9k
         VN4fqFTFKvop1DUq5Gpe80HPx44cB+KgqRAAGyIpoWdY2w9B/rYOpmLLu3wVvd1ZWzaU
         a3TlUwJOHRh9EQvwl1lbX+1bdq7HDxPIHWNRQ3kHcPw8qHcpwTknAkniNzk6qVcZR0RB
         +RX/9vw9j6D4hjoN2fUtv9M3C95Ep7H7jJuaaZhiOIyVVjAh8A+EVZ8wyjYkI1/WL1ww
         Hw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760602953; x=1761207753;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBBdec07DnXHPLlkhx/kTRhSSBmJ1d438R+ruAA70Rs=;
        b=PpUf3CwKvpxtc+vnt5e0seNp63ivwaSbuH1o4V3/RKAaz3vknmfqLva1nJcshfDWnx
         sTOdKPhZ13O74Vpjlf2odWEtj9r+txC7C5A7tfbJP+DuxzMPuh8+DnWg0j1/x0RZayzs
         zHUE7E/K7NqwSj9ZyHfxSxFhlQNBTVcGlgbFolywePXepyiKTwOdHLwEd2ENY1frbUXi
         c3VF4BoVOWkxY4phOfbnAayjNpspxKK7H6WPQP0szKobuI4Q+uSFJfiiSYIK+QQ5z+F3
         GgyymwrHRedSFt6qMRb3mWI3F4QWlgsv5c5+DLD5mU37L/sFXSsRl8s0HxnqHwuPgq9d
         CbRA==
X-Forwarded-Encrypted: i=1; AJvYcCW9bktmwhBcqDEKlTUfbBWeiKcS7u8/ddzUNXTaod1eM57CM1AvWxTmuW7PYCSpFIZ0HdOAYbJsYIA1JSugXV6lQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcrjJhhpUj6wXOTF5LmC8uLJeC+CkgO7JCSYp01jGn+LlaoYZK
	f9Mf+8GzLfEGCcN+9WVJvPS1YZn4Latt1ya/BHm3gs+av7I5wGf/ZmkafRxfwicqfZo=
X-Gm-Gg: ASbGncs0KAqbw5fEiNXQWqdQi6nHH/DdmaJjTjsAiqYX5v1ApVCe8qN+KsbTC8Njzws
	RhCroHfzW/QvOKmmNxjY7Q4mYuQr5adnEFJ1fOg64aNGwhA8Y94atGXyJpG6EOOen/Z0akeOIxb
	jJd8fIC9I8ArLIqZXm/qyHxs6q50NkU9KWLKT6dmGE223ZLH4XhhXYgTlaN+6XmR1iICJCH188Q
	TjuhGoyGF9MgEgQJ/mSo8e6xEFQhPyEv6qGzDT0JBqAEuf9ttn1bejc5FZzdkwB+swRvHWC8Uxw
	NZk6GBZnqaZ1tYjr/vqj3XVuGNYbVfrIJ+d2p+q0lmZzOird8j4D5Abs/aoUpv/CTYmcmnSCLT5
	3UGFBNGxDpJoLn/CGys68VgFM7+nNWgEv1O8BOs9NvBlk96aW1DEg6U1IZ3BdATylB9VA73GoDn
	0P5s3kROOZfLyuKnKKjQ==
X-Google-Smtp-Source: AGHT+IGSt650n9l8ivg1ZcCBjVV9spK1fxIgYVcQeuSemjU+fLA1qbxGFofJQsP8Vwjza4IFOhR66g==
X-Received: by 2002:a05:6402:84a:b0:62f:50cb:764c with SMTP id 4fb4d7f45d1cf-639d5c699efmr29854311a12.35.1760602952962;
        Thu, 16 Oct 2025 01:22:32 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63bea024febsm3932663a12.4.2025.10.16.01.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 01:22:32 -0700 (PDT)
Message-ID: <0ccec501bd01a4e3a2e5087a52fe7a9b32d97c75.camel@linaro.org>
Subject: Re: [PATCH 4/9] arm64: dts: exynos: gs101: fix clock module unit
 reg sizes
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@linaro.org>, kernel-team@android.com
Date: Thu, 16 Oct 2025 09:22:31 +0100
In-Reply-To: <20251013-automatic-clocks-v1-4-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
	 <20251013-automatic-clocks-v1-4-72851ee00300@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-10-13 at 21:51 +0100, Peter Griffin wrote:
> The memory map lists each clock module unit as having a size of
> 0x10000. Additionally there are some undocumented registers in this regio=
n
> that need to be used for automatic clock gating mode. Some of those
> registers also need to be saved/restored on suspend & resume.
>=20
> Fixes: 86124c76683e ("arm64: dts: exynos: gs101: enable cmu-hsi2 clock co=
ntroller")
> Fixes: 4982a4a2092e ("arm64: dts: exynos: gs101: enable cmu-hsi0 clock co=
ntroller")
> Fixes: 7d66d98b5bf3 ("arm64: dts: exynos: gs101: enable cmu-peric1 clock =
controller")
> Fixes: e62c706f3aa0 ("arm64: dts: exynos: gs101: enable cmu-peric0 clock =
controller")
> Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs10=
1 SoC support")
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 14 +++++++-------
> =C2=A01 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
