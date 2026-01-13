Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B355E346ADB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 11:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303867; cv=none; b=VOmZDeHCUcszqJHC7JvWA5jlIvbjfb+nn69AeVYaOVbH48SjE2e3tBFcQi8tLudXNyrlim4l4MwysKYLZTsk9xcwO1DLPOXPS7LRwbYClXL4AFZGXDN8VHUln4a8jwXPZIqSJnq4jVi0YZbHSGBTzwYtdZDAVlxyM6cSN6LeJ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303867; c=relaxed/simple;
	bh=f4wVU9QaczKT/9p32vT2mvG6pfkyMA13UZGXDs37Bbs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cj9a4/+o+7VknUuLyWrygA5e0nDc1r0XBHeXSRewc9kz8a018gk9glGFvOR0EaksxkwVOgW3TFzap9fqsnw9q9SVPfoWs2ERJwv/ImV+O7UViPqc/301hLlZRHKEMKuKoBKwD/vj/NXsaDpY4yc0pGTrbZ/lvLtdG3grGSs79zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ypiZBYLJ; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypiZBYLJ"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ae57f34e22so7486366eec.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 03:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768303853; x=1768908653; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f4wVU9QaczKT/9p32vT2mvG6pfkyMA13UZGXDs37Bbs=;
        b=ypiZBYLJwq4M61y/wA3xFHM25YVqCiYHbmqaVnS/UQwheMZI2xbR9i3AKLbSwNVj6j
         t7xOHInIbvA4VQ2NB/2OCtrlwqpkXuSTBOG+Hbi6Ctt+SO/u9swUACxHJbqWN+v/BhsL
         Q7ovqaNQyVDLLFTg6e2ly+RaAr/Yq6zeIeSfBq5FywtC2EKoAYoWTxXjuDekTBWHNoCE
         3osTqAeAtdXugZAzSDZzbNeCe8ii6Pw6MWKOlkXdEF+ZMAWV/07XMFXGTa+CX8dY4Pll
         /gII+WoWN3Eq1suql8MfTa7gl3UX+zyNJoB02iaATV4hIblqcb33Ayuk0EiXFDNZVOul
         xaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303853; x=1768908653;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f4wVU9QaczKT/9p32vT2mvG6pfkyMA13UZGXDs37Bbs=;
        b=BDy8sTP1qY2/Znfju0FF4U4hTkP88GBRDsFIsZhQBeOzwlKeheRq8QR6C8GR+LIl7/
         iT03fqLvCAyW2NenBuvgZOkT6gYi/znrTGGD3rNzpsqrw5hon1XY4ALk+j2wslFJcvx4
         bBKZB6cDGzV15HghU6yuCDfxGgU7bFNCnR2VPwv8KCiEgdlZf+D5RyZLq4dRvIAIfFAx
         YXsWx/qRsRobXQhQGyeTU5zqYmLL8aVkmbXsKtkvgCpRxyL1rwqvoMDSxmUe33Tgw3ch
         Usf650a6YXLRpdThFGLilC6vlm/oAL5jNbbM914O0pLPgMd9Lbpe3h5MnBJDcsEl1SUH
         8h7A==
X-Forwarded-Encrypted: i=1; AJvYcCWnH9ZPuklgsVMV7xhCcmw05UT4x2RhtRCl0YaPu8Ph1ieSp9wc5YVqUMeksg8UmVwtSHOCWVn5lfPP8evdpIflbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZNI/KFEdkNdr6EE+jGLjyXfsMv9IJE9mKSl+pYgcgvRw5Jol9
	HQay3Ok1deV8hpGTbUUjUQjyrIpuMc7mC3rQahUO6l1lPAiGDB1HQAcvc9O891OrjPY=
X-Gm-Gg: AY/fxX7RahfX6xeYB/vkJOuriKlcBcSaDx2q33D/cNdoe9QmVJISM+I3726J6U7CTYn
	kM/UNxPSXnF/vh+iF7jVutqkjnFKC2H4YRzhszcQMZMWf/8ZHuJ6yWc/N7mVbmYt3hzzXC1Sgko
	IMuZycuZwe1iQdJXT+htYYNbPJrh0VUWfY0ECZM+9e+7tVWEoVky1UoySZcolxBOxP3Cs7yppXh
	s5DxNR7Kl1umKFTj5aPZl9oXN5RgVndwZ1X7TcbeV5hMbJoAHfCyu8/S0f0ER1Ziz5T5JqxJ2v0
	ZmqoGcrg4fQSFiI55xAmnKOYTTPUORj2qtEsANwRzy9tEaEuaqQwSPQ8Yy8qVeU6/OAG7azUzHM
	JzF1JHhsOIUeK2MEFWzdalJ79sfM8L87t5082Ze7fyUA6vURupNCENfQhmuwdT4Kf2oFdh3MvUe
	kUoUB41eK2t1CDcH6I6bj+ExJSHTM=
X-Google-Smtp-Source: AGHT+IE2PQGkBRDHh0wt/RR1JmU3vgEQYzdNyA0r5cB4mfroq+TTyqSFY3sc0gpnweUJAe3hVTED4Q==
X-Received: by 2002:a05:7300:cb07:b0:2b0:3d03:37d4 with SMTP id 5a478bee46e88-2b17d1e4d38mr24451146eec.3.1768303852511;
        Tue, 13 Jan 2026 03:30:52 -0800 (PST)
Received: from draszik.lan ([212.129.80.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078d9b1sm19000610eec.18.2026.01.13.03.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 03:30:52 -0800 (PST)
Message-ID: <ca6de8e5aa0dbd99c74481a9dba9ea9f1ac61a1f.camel@linaro.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: google,gs101-clock: Add DPU
 clock management unit
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Tue, 13 Jan 2026 11:31:28 +0000
In-Reply-To: <20260113-dpu-clocks-v3-2-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
	 <20260113-dpu-clocks-v3-2-cb85424f2c72@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-01-13 at 10:58 +0000, Peter Griffin wrote:
> Add dt schema documentation and clock IDs for the Display Process Unit
> (DPU) clock management unit (CMU). This CMU feeds IPs such as image scale=
r,
> enhancer and compressor.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v3
> =C2=A0- alphanumeric in gs101.h header (Andre)
> Changes in v2
> =C2=A0- alphanumeric placement (Krzysztof)
> ---
> =C2=A0.../bindings/clock/google,gs101-clock.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 19 ++++++++++++
> =C2=A0include/dt-bindings/clock/google,gs101.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 36 ++++++++++++++++++++++
> =C2=A02 files changed, 55 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
