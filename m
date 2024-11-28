Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40158192B79
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Nov 2024 10:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732791380; cv=none; b=D1UZpZ6sksHc6P7UbjfEnDY8hXaolu/f5L72By6lA37pjEEU1ihzRavvmge0iiHIXajDWps1eYz9W0GQycY+WuBIIYrlk6nP7uLGGh4WxB1D/Fz1dy93Ww5ijP11a3aoJzzUK1UkaarNshEsgrnmhoOJLdeH8PvY5WSotLZd/PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732791380; c=relaxed/simple;
	bh=UHpZFedHEBtUcb+szMjru33LYi0CiBGsIbwkSU8NyIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GiiJ3Z5ebKwAzliKssJ7b8OtWJvC/ZkC/PgdpZgxdiWPr/D7ewvY1J0UkzAJJOJ+DXKAPdUXTXBdotHu97eMir6b/jUwFIiWFd3Tkz426P70j0MPAnVPSTnK39j9Lh3yMxcVfK7sw3jhsdF2KPh7099InNDQZVLZ/SmLh0QPHVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j8YcD90M; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j8YcD90M"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5f1d1068451so274857eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Nov 2024 02:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732791378; x=1733396178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHpZFedHEBtUcb+szMjru33LYi0CiBGsIbwkSU8NyIs=;
        b=j8YcD90MGucrKbRYkycUXRZYgEiCjq32yAiTbYrVcss7Lz0bRdSd9fpvQxG2PdTU8i
         mShDU+o00t41KOPY32JWUCG4+hBb69q8RcPb2ijQ7Qs+u/JhnEEnMGLVYR7cB5sLByNw
         3Oyyo4+OevlqcJgTZaojPj6owIbVJoL3nIEBdNtOncbSXohtHVfk6zemrJ30RBdEkYXb
         6twHE3DqZD8KneWUvUVQCR6NAQb+RdSKRMB1/FoAaonKh4rXfkhKYvkaQRZccyCloeS/
         PLRdb5CYgg0UQnNptr8qWopC6e3eMjCOX0bdlpHhW283p3oAVl8iouLcKZvn5+KlhwUs
         6BzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732791378; x=1733396178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHpZFedHEBtUcb+szMjru33LYi0CiBGsIbwkSU8NyIs=;
        b=GkmJdQkSXIbOfHlFNIgBg+//wNCvYbvPQhLG8UUK8+hxv9N/TvPJtWAJMvp3Iy5skj
         83PKZnV3RDFhmuuiNEVFVtgUYPltDDl79ft5+H9AUfIhEkL11btZzIoazXOMIoL3lT5P
         UbkFEj3XJOKyUwpj2NfllPiRAtzqJlyusyPa+3V10w9BVdomZ6BUb8amNTicFSnmhNlW
         cZq6Cbxv5XmBe8j1PXrVfvE3ye7VesARcEJbwXHWW2Mqvfrb4rP4Jl1g5+96NMqos3Lt
         gXdgc0+feybCMRIU+eSaFHSUEsvypQn7Zi6+HFHY/un8rB2WgDR/fJhoC7dRcKhhkB+/
         NERg==
X-Forwarded-Encrypted: i=1; AJvYcCWE5Rg2CbEvhOnE0YgrSE6b6D48ngexdCmNAMtUDPgwrSR2Xa1B31ftOKg+Oo6ZzAKg4yW3CejTcHLTFPWaK5fc1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdFsWxXMDNaM8Bx2fpRUkXbxIF/kr0pHrFU3WR2cJxsT0xX77Y
	+n+jFqPXwweF6jO/lqFVoez+46hOxM/3X9I2io2PR7ZsUI/u0Dnm7umZHH54Dyt42sDfDFQszC2
	PxijLT2Hw3iRuuxRn6+kndyPNnhBEnVRkdYQgqQ==
X-Gm-Gg: ASbGncuXdTTJgxkdBkb918vC6GYeQrSDZqSMdwjxXI952WylBLQxgDFwwK0RdfUTClm
	TZuS9L9kBO4gO7uddJQrAcdRr+R2Y00T0
X-Google-Smtp-Source: AGHT+IExQGgfObepg/1Hx1vn3/3ajGhOjBe+ADkPuF/jgeiOTQLuy+sihE6vDknoDDEFX2CMag6bWzzgs3MwxWCbYFk=
X-Received: by 2002:a05:6820:2704:b0:5f1:fd30:f45b with SMTP id
 006d021491bc7-5f20a275359mr5606418eaf.8.1732791378483; Thu, 28 Nov 2024
 02:56:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-4-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-4-1b7fce24960b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 Nov 2024 10:56:07 +0000
Message-ID: <CADrjBPrVgnS3NFVvouRYQ32xBfyYBHKAgFyhEerMzenarE3G7A@mail.gmail.com>
Subject: Re: [PATCH 4/9] phy: exynos5-usbdrd: convert to dev_err_probe
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Wed, 27 Nov 2024 at 10:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> dev_err_probe() exists to simplify code.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards.,

Peter
