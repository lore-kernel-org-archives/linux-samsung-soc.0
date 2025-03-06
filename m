Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093D3207DED
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Mar 2025 21:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741296285; cv=none; b=PNyOmehIn29HD6xNyequclEPO+ic00vUNG+ReeZV6nxqVt5S8+aunL5URvuAKlBtlnZ9mrO5e8dpBH1Ps85Kje33q/SFYYTGBpY2Cs4cA+HfJ2Y4nUaDiiFoW4xzPfMMnBtCmAfGLF/vaDWCcMQTVk9HHalcvH2IxbXiWUsHLao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741296285; c=relaxed/simple;
	bh=jTLuvp354LUCFBEjUn6vv/C+4kNgg7zXepR1kdOwbgE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L8Alz2mran1sOQaPzNtVtikGWZMlDkmCw6Yx6n6R+9z2XlYdsGOixEj0XhhHDqcK0WPHg0ARCCbIy3V1Jx45IoI2XEeoXsUJq5BJJSoHCO61R1f6c/+j0Ht+GnGmmm5fwm33yBbOYdeBj22eMet2ifrVGtrDwjBl+DMdoU4WkU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wXFkWud3; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wXFkWud3"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e4d3f92250so1619399a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Mar 2025 13:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741296282; x=1741901082; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jTLuvp354LUCFBEjUn6vv/C+4kNgg7zXepR1kdOwbgE=;
        b=wXFkWud3PhfIWlUy5fkzJEOwlrZDkNnaB6YGUEge+KOvt6ZjwSSQrEy7pjBRDjQred
         R5ETq5KqXPFgxNLDzVdkQAuF3/oZQBfSGRO9MTQmlQ/tCHoeWkxNCALwR1HvQzu2Pkqv
         YAhfI93Fp3FG6B3vquZHZgfDcLk+oNUGmyRbudeArjG4VbGNy3cefzwQ3FQ1OVkE7MMa
         PkJzk6mmU79jTzxGgVV7/X+7a8kMsYLWEGaKUbcWnldtPrjVWQi4FbchKBU9OUjJZlhb
         SPbB83aZQXhviYubX8NMVq9y9HG3x8QXdonxI6H6PN1m4D3EX4Q8+jFPf8JN89cg2vpp
         KfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741296282; x=1741901082;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jTLuvp354LUCFBEjUn6vv/C+4kNgg7zXepR1kdOwbgE=;
        b=kz6BEwc8vzFi2QzWGVu4SFvRq9gwOeU5upQjJPEQJE7BojNUcaoOaFQUZXRjlF3whz
         MjXq8DRDMTTdSJkHH4ANbG21Dg1TMgB7bJGyH1M8ju8Se8NG9eRn3A+Gwo2ZOBwgC1Y7
         k3hPatLRz4fr5xfVYrekWmvIF0pv2ZhQt6nPHi20RJplSusgPEC5GyH0w7UCavuaOJXj
         3qR785sM9ZvZaZyf7ZAB+izuLJ97rlayIrCOOaXaTCwg9eoFOTkYlO7dwdNNuG8LlSsu
         JGbPYD2Ni1vUH8GFG5xzQLgdS+vEt5jR2EjElA8uLL+XZ267CClLGdGn1Pl3ls6wfj6x
         caNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSVyU1aeV7QvRT4nWjLnDVDpaZQQkWbESwUXsgQlinGRI30JUZJRcvW4Y5olTkvrgSpLJCWQ7yL57laXDZjqcofw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqUcsEsM63fvPn2sTuel8aTtJwW27DAx3ySQvhb5C+UG9af0X0
	3N/WcrKxPpyfNbgoReH8UeGpBkoUnLBi1zgVAIU/DmuSCFxjgYo5WoBDpF57hMU=
X-Gm-Gg: ASbGnctfHofJ+H444cEshzjzr5pHxCdrAtQdbwWJ444eCW20fYwj56c8BJ/ZLFGLtQ0
	i1goXsWMl1Q80NIWY7tq82U8WAkk7jrwf42+X4BVVRTV5MpDaTZKJAv3SLtVhzsNDBFwpvsgkY7
	OPsFvpDOpWqmeLUIAM6ct8v3Zx7ioJvDjTSCunsV/f1ZSHq5cPwQSLfqfeaN4lIsNP4c2nlXkra
	2Fr9C9y5osYn6a0meJN15x1ijDt71OMfBhgHrzKIgI1izOUTUFTO6A0i5cyvs3B0Kx77nBYgcrk
	DJkBCJVyFVQ27DK6EML9w85HdhV4i1mJsllAXhU/fFNIvr4=
X-Google-Smtp-Source: AGHT+IFGoQqzB1ks/w233aQfmtwjDd/f0Of8nZuLXXAF+RrDFLWTghW9hL6fr6sdxMq2SuzJeJQr4A==
X-Received: by 2002:a05:6402:42d4:b0:5e5:437c:1daf with SMTP id 4fb4d7f45d1cf-5e5e22e66e3mr857005a12.16.1741296282233;
        Thu, 06 Mar 2025 13:24:42 -0800 (PST)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a9315sm1493110a12.46.2025.03.06.13.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 13:24:41 -0800 (PST)
Message-ID: <67ad046453d722ffd80370d45f4f515a432ec327.camel@linaro.org>
Subject: Re: [PATCH v3 4/4] pinctrl: samsung: Add filter selection support
 for alive bank on gs101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Thu, 06 Mar 2025 21:24:40 +0000
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-4-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
	 <20250306-pinctrl-fltcon-suspend-v3-4-f9ab4ff6a24e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-03-06 at 20:42 +0000, Peter Griffin wrote:
> Newer Exynos based SoCs have a filter selection bitfield in the filter
> configuration registers on alive bank pins. This allows the selection of
> a digital or analog delay filter for each pin. Add support for selecting
> and enabling the filter.
>=20
> On suspend we set the analog filter to all pins in the bank (as the
> digital filter relies on a clock). On resume the digital filter is
> reapplied to all pins in the bank. The digital filter is working via
> a clock and has an adjustable filter delay flt_width bitfield, whereas
> the analog filter uses a fixed delay.
>=20
> The filter determines to what extent signal fluctuations received through
> the pad are considered glitches.
>=20
> The code path can be exercised using
> echo mem > /sys/power/state
> And then wake the device using a eint gpio
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

