Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10E918BB8F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Aug 2024 16:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724428806; cv=none; b=pJtDTVh8DJcwNrsPvjDOhp2rMvY6v1KukZaK7gvzZHpm1FyzhWEDnvYN1DFryQWt0a0zgGxezFiWVTK4wVC4FuNu6RnuRi+G2i3E0H1i4AE7R89IFn+rgO8tKJ5OaM1CxzKW5fhaqQ8Qd3Tq6OrhFKhUVlD/srPBmDyhJODoGbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724428806; c=relaxed/simple;
	bh=N9Q+HfstvZrc3Uyj8dpSq40+6yhOtXrkXeQ5BkBE9Xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVwXpHShqYAMf9nnurg+MDQ+dTnb+Tyh+rGfJJGgPybI4sotZYlltHqq9vAmv/is7ZcupXIVOtbv4We+t5NJKNeLlYqsi+mmVi73fNWrdu/8HhTZDiDEkLZai0gLWy0qC+nLEZ5f9ZsTrTzjMTX5eSdRUi1Xz49rwSR5No/0dTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iiwad0iV; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iiwad0iV"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-533461323cdso2490482e87.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Aug 2024 09:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724428803; x=1725033603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9Q+HfstvZrc3Uyj8dpSq40+6yhOtXrkXeQ5BkBE9Xc=;
        b=Iiwad0iVu258zc/Oqitvsvpcp77cYcfVRtrErPCrrzbY1n7eWb0M4IWsouWyn/FVMD
         QC0evnXVtfiTNNkndOJniMSABAjTrilzlrxkM2yF8w+/mlQDkmSJWvQZC6nW4UosyNpK
         y22ZhrScMOXJVw4rRjW3a5QFd7qcJtkfPXO1dx6ofEZl7FoQebvE6RTCNbRSz27IrtSx
         DSFsx2K/WWCfyYZ9pSPzNrbU7B2U8gXsUvhvNl8JqAyFT+kLqX/6cKjzf2xREr4w8/Um
         iQGSM/a1QFsJNIwkRD2DnJVMsXAgSCwMZcMP2Fu9jeT31owhD1hQExuSxljO42SJyKrj
         /jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724428803; x=1725033603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9Q+HfstvZrc3Uyj8dpSq40+6yhOtXrkXeQ5BkBE9Xc=;
        b=r7qf6ep5x3WZ/fAelqFEJ7B3XXZrX3ZUYsmqm4j/hCDUf5K6q3LAFF/yr1Q3LOvIxr
         RDgs9ZQI3rRdVF3KPUxfz9upxmPGx/dmypCvPU35jPuK570aCGjzOKMuEMuZdR0sxQtK
         bH0u+BwROU7Lsu6pTPGRe38wgptzl7ts2hUWIgFXfHAA/x1CQs6j/0JF5CPxyruCP4w3
         g8ZgVmPFoaCwE6xMcelbal5fXgfoyija0smtaDXL3PyR/mhJEwhF/QjsCzLiqN32HV8u
         L2X5UbsrjhPQeHZc96UTHkYEZLFLiljXpL/fEwCLDLg/cbl5zXFa0dZlO7VaOQGhsDi+
         xgFA==
X-Forwarded-Encrypted: i=1; AJvYcCU6VvqPnss8nMyznqTU/+yVzQORm3NDaE0kWvLqzCEiXRq0PjzOkRI+2/bShvljw1D7q/qm1MvEpFiijgaWHftGZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHeVDgZxmQ5XFLUO6Oieg+GgVualRK76KAz9xliNZ1MSD4bpEZ
	LYSSVGjtRd9HcbAUPF1a22m/cogVCcz39NcOoVBPntaUITAJqcb0fi/xET2dP2H9akGN1ZulIej
	6gxkqkxHeWy619SexDxeF2MtKLplXX/tk6aoFlqlNgHtGBe5F
X-Google-Smtp-Source: AGHT+IH08LPEDFU5VHx7AqFMaGHbX23x27JBvOmuBNgaED1KnPIFyOCr2R1LWU/ISWTOYE+H7pGSrEdTHvtQQQj5kqg=
X-Received: by 2002:a05:6512:3088:b0:52c:9e82:a971 with SMTP id
 2adb3069b0e04-5343882d1ccmr1899018e87.7.1724428802573; Fri, 23 Aug 2024
 09:00:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com> <20240807082843.352937-7-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20240807082843.352937-7-ivo.ivanov.ivanov1@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 17:59:51 +0200
Message-ID: <CACRpkdYdJn3jSmur6q3+NrURFTQJO5tcxV=aTGXk7JfPyN1=ng@mail.gmail.com>
Subject: Re: [PATCH v1 06/10] dt-bindings: pinctrl: samsung: add
 exynos8895-wakeup-eint compatible
To: ivo.ivanov.ivanov1@gmail.com
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 10:28=E2=80=AFAM <ivo.ivanov.ivanov1@gmail.com> wrot=
e:

> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>
> Add a dedicated compatible for exynos8895.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I expect that Krzysztof pick these up unless he has already.

Yours,
Linus Walleij
