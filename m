Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4EC1CAA4
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2025 07:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748156552; cv=none; b=uJg2h9aUPdKpbr9xNMplLXlEw4Y6xriLEgOSnpLB7r1i4vhedIvxsXW64pLlYIeESYEG7okjFuIw8XK4miVMU9p4I+bWtO1ijtrLtbI58uKsJh5IahxJACGQT7wVRXxSmr1JWF+Sozqz3XUw28xp7Ksq+CpIdOK6wPQvREEOu+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748156552; c=relaxed/simple;
	bh=xmVuJpzpAO9LBTZ0wqrziL7kSCWF8SNFJEq1vwbSKj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpdZHGzZirAaWcpeRxKUTK+2EaL+Ne9cnSLsK15BXPoJ7Fyfw0+VL6rvxFvZ8uFB+dDdF3NZuQOLSfX9x1Th13aYpaufd4Kc83xx2j5VJGd2QFSYUmcSQk+hYS5/IIOhYv4J/OorVGnUElx8eTHOItCNaiP4+z7KwPEC0kcTtAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PTTLued5; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PTTLued5"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-401f6513cb2so1198449b6e.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2025 00:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748156549; x=1748761349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++2YpVIWSfdyU9wkP36ZaRD+uvghyqrOoMuB3yBAyQQ=;
        b=PTTLued5VxluoQv5Wr4F7Q/TzluT9Kw1Yk4tFoI0uUpWnyapBoXktd4mHlTXwGdgkj
         NrCSMmgw3ugN+42+j2oXr7PMZDlCxubplJ1mGW95tlJsJvhfRRPOJGngmj1C85O5T9Vy
         KC8O75OfcYqGecdXNe8b9CKHPmi7tO5dcQVy8BUQoLHRmiQRuzKQC2DmxrOq/13luw9l
         dlO1zBNWPGLbWnUw/VPthH7H5FVN7j1p5+5ntTCe8NGmT074kCTP+Je4RksblAAikVHr
         G7vscD0y8W8P77NTXGtwMDuZLynuQtZwlHZJ04EULM5ujS0ahNh7SVFM4n3SAz/l7BA9
         ATNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748156549; x=1748761349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++2YpVIWSfdyU9wkP36ZaRD+uvghyqrOoMuB3yBAyQQ=;
        b=ZtwU3ONrc4O3FdhAc/D+C3u9lrAbmr3DgUC4pNqc2GKFRKi3ntVCkhYVq1H5eHmfD/
         /rQ3MvXIXrfLJvNd1cpy+9BbDr6OPWuBKLK31pBtIzf2rLLl3YKWCruPdLiSNIBHV/v8
         pGoV3LXUJE5pUB3D+WbyhdzgRc2/foE7DB9/KSqrPKTxqCxzKw3Vl2jYy5ZqWOgOSUvg
         GOqnnRS0o9gD4ngi+/c4s43zih9Z+3LIhGTpEN07sTkQecPjhjjdVcsj31d4iPqFP98b
         an0imOvie6oUGiNnzFkodhU7v5NFmzD0YPXfGrhUu/uFy42h7W1eNHaPhUNL8edw3zcz
         xbqg==
X-Forwarded-Encrypted: i=1; AJvYcCVFa6HJyWWiacPE4gtTHbeHcn4XKY3mEB+0Cn2bCCPqR9YOGxU+SoaOmN+BFhrIApkTaT0NikHOzBAtGKCeblpzzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynk2BEN6v5bH9tVZOUdM8EW/yGdB/UBGd5KSzDZu72TN35wwWn
	r8/ZD7NLKNxat8DcxgEL0TFzt0EYmjeK4hOTs3XMitA1CM8Adf0tLJo4HGezLO0JmSZK8lAVIxL
	bRFNIVDkBnStNxvFAkKCnu1m9daqn/mOrMZfKB9Tycg==
X-Gm-Gg: ASbGncvY0QEHaAK7qTZi8BrGlOFUz4jC5MCWb/5ka1+tAOC6YjMZbozg7PucIlC1Qf0
	2b/ToerNt7pIQCvy1SkDgVpqDu+sBHuwr6Y/v67fUhtdI+CaH1NmqvSh7YlA/0O820H4UbGEDpl
	WY1Vqq+JLJ+QRrDJD43Z9Dkfm+5fqbCBz48V5CvCbLvtGh+fzYodk0RZn+1f2vWDFXwA==
X-Google-Smtp-Source: AGHT+IGr/xoVtnGmyX8qGFJo5xUSZHa6jevK9WgX6XTSiHo/5DgFtJ9gSQBs5D6r1l1zV6o1b9oFwpI2DMroSyKfCf4=
X-Received: by 2002:a05:6808:1b85:b0:400:d71c:ca26 with SMTP id
 5614622812f47-4063cf85609mr5281162b6e.7.1748156549522; Sun, 25 May 2025
 00:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org> <20250524-b4-max77759-mfd-dts-v2-2-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-2-b479542eb97d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 25 May 2025 08:02:18 +0100
X-Gm-Features: AX0GCFvvZm3ZpbAlMbK7Jst1a1IiZ6IBCab2RcTFflgx7AbbvRBIsrph-OCoOqE
Message-ID: <CADrjBPqVJDBS1pYMhSy8L5sOEkA+UVKNc6N7oY9oiv_twUKt1A@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: exynos: gs101-pixel-common: add Maxim
 MAX77759 PMIC
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 24 May 2025 at 06:21, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On Pixel 6 (and Pro), a MAX77759 companion PMIC for USB Type-C
> applications is used, which contains four functional blocks (at
> distinct I2C addresses):
>   * top (including GPIO & NVMEM)
>   * charger
>   * fuel gauge
>   * TCPCi
>
> This change adds the PMIC and the subnodes for the GPIO expander and
> NVMEM, and defines the NVMEM layout.
>
> The NVMEM layout is declared such that it matches downstream's
> open-coded configuration [1].
>
> Note:
> The pinctrl nodes are kept sorted by the 'samsung,pins' property rather
> than node name, as I think that makes it easier to look at and to add
> new nodes unambiguously in the future. Its label is prefixed with 'if'
> (for interface), because there are three PMICs in total in use on
> Pixel 6 (Pro).
>
> Link: https://android.googlesource.com/kernel/google-modules/bms/+/96e729=
a83817/max77759_maxq.c#67 [1]
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
