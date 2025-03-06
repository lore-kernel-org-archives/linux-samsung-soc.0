Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D484226F478
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Mar 2025 21:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741296313; cv=none; b=atORrjAHfeD3gdZYWPwK8V0pYMVF+0Gin7sRxIlRIIZ5pGZdAvNx4QFTjsvDLb+Wx9raWjXtrtlbJmZttwBgEyp+/oHqxzIfeRU4UJXnOe+ZqfzQU3NF/GiQGpje7TFLomSjZpC2F41cjnr7DTRls/Vy2lk64Ofj987Rz0X0WNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741296313; c=relaxed/simple;
	bh=6nLUeGZBsOZaxX7lD0yAqrwnU/9EkCCEKqX2KbebjDY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aCC5BB0g0ZacenQDL4TpZ0jkMmiqvTdNzIIUQpWL6no88wGuuJW/yB6A2n5yN1feyUIKPRwZk6WWa6MVh0YAcaDNTZlh0Cw1W0vWx4eRAj94UsrsYe2iJoq51TxzS6IKx8PT6saQ8uN5qV805Z0O6KKKBLVaK+PvQOxNfgP1inY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y8yXhYxb; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y8yXhYxb"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abf4802b242so223808366b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Mar 2025 13:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741296310; x=1741901110; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6nLUeGZBsOZaxX7lD0yAqrwnU/9EkCCEKqX2KbebjDY=;
        b=y8yXhYxbNasZPZMGQjweQq91JrwF0qwIqKnhDD00CsLW1+uxQB96aHu+/RgxhmQSyY
         ocaQgUQameDnuXFZnKF53BOYjaCdlipwjqg0e4znaayu/EBBoiS4qIYFN0Kz+bfvuPAz
         rlyEmStL4Fr0rQnC7O+dx3Jzqfcvs3t23rGiqtMrtKpJs5Srhr7RkcgkXI6GsbHZjyTN
         5TV6gNy3GffpoEtc7HPbxSCUxOkgp5Y/PXiqB4pvr81Jwlcl/4ThuqsTv8Cz6c5JmbHA
         xPGVmi+wUAV8Om/qWkYPC4VQJBgMRtrYgSPSddxu1KfJ5IgQbEOlnGGIZPr69EdZPBLi
         ST9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741296310; x=1741901110;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6nLUeGZBsOZaxX7lD0yAqrwnU/9EkCCEKqX2KbebjDY=;
        b=SMaLGKj1I0yDga9QmhKYhkFwYgcVNVcC2Yh6d69Rr0W5TTbFpfpyFi5Ref/7JEzpO8
         zWYeLZfIvShQqiJTrLpylErkEzPL8ove0jHl20l3OYYreRjrdHMZsyX9Xv22ixsXh7k5
         6CQwebNRfImvDkY2tZzY8Pzo7a2pvZy2Kt/pIGBI0Yx0sPWyJe92elQAvcwokq25yM/W
         9Q9Zma40wHFr0NIx+m+R/wrWg3TOw5rhLXAOR2XnltQ0jx5juWzZy6MsZv/ZnGyIyD2b
         +pVP0ybWRX4nSd+895dvcbxL06B80Zkr7c1cG2WUYvbH8EwDEB5txW6Sybs2jl0TQQIv
         46yg==
X-Forwarded-Encrypted: i=1; AJvYcCW8pbhBX7Q8fGsfOGj9jcG0Pzup5M0E3Lt8kXt1qXBrKHiRj1Ku7CS+YOAN0oHPmQ5nAOFk+7j+0a28p88nf02Hzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNQri9kAVazpPdHMuUPeHnj9crFb/7G9j6dkYu3Say5YMgOY/+
	1sMvwO3erEnA9XbBp+EPsfcIIA6z5RS/kvtaQxrES+fyNOkAtz0Qi0TnHyQRkMY=
X-Gm-Gg: ASbGncsx6yKcrFP4PfaMAuq9wkA98KISR6HLGCi1RdVSiy+94jZbpzS8YKOUn/AXlw/
	fqpS2U5hAcxefO2FXxwourw8emXxIIKk8WKqX8sHI7wn7huH7tk8RG96io6y2RXhHrW+0JPxHFA
	VbKl0joEKSQmckKD5DTg5xPBoed7MBSz/Ys6LMzICs2ymry9a3iaTx2OjOUYCIOhAJ0RHb10Lfc
	NRBs8hjGl6HqTZhHdWn3PbUnsck40oWoQg33QG9npjW2THv9WGUhmjaM+j+iAYe6yWw1M8ReEbW
	qGos9l6lvd3d69oFTe5njmkGymQGRwJPkrx6/KaKJf914s4=
X-Google-Smtp-Source: AGHT+IEfkrY7UVJaq0/ND9NEi5g0hc9ml44W1eaBzgh92FLmrsjRrsJKvCEmtLb9GKZY9TgjXouEaw==
X-Received: by 2002:a17:907:3f9b:b0:ac1:ddaa:2c11 with SMTP id a640c23a62f3a-ac25210ff7emr88036066b.0.1741296310064;
        Thu, 06 Mar 2025 13:25:10 -0800 (PST)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2399d7da1sm156779066b.174.2025.03.06.13.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 13:25:09 -0800 (PST)
Message-ID: <2c1cab545cd3b57a2155df2e87ad9830b2b94ab1.camel@linaro.org>
Subject: Re: [PATCH v3 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com, stable@vger.kernel.org
Date: Thu, 06 Mar 2025 21:25:08 +0000
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-3-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
	 <20250306-pinctrl-fltcon-suspend-v3-3-f9ab4ff6a24e@linaro.org>
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
> gs101 differs to other SoCs in that fltcon1 register doesn't
> always exist. Additionally the offset of fltcon0 is not fixed
> and needs to use the newly added eint_fltcon_offset variable.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configurati=
on")
> Cc: stable@vger.kernel.org
> ---
> Changes since v2:
> * make it clear exynos_set_wakeup(bank) is conditional on bank type (Andr=
e)
> * align style where the '+' is placed (Andre)
> * remove unnecessary braces (Andre)
> ---
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 24 ++++-----
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 70 ++++++++++++++++++++++++++
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
> =C2=A03 files changed, 84 insertions(+), 12 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

