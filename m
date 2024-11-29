Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F93715C13F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Nov 2024 09:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732872153; cv=none; b=O16ShTEPqMh6ZDgVm8Urb6jgs97z+pcCoeCimKHyWYyRu2jkQATwXpaNQjb28/YpDFlcCBBSE6VZTXthFYpl7ZLt7R56IPsjAkeOFEiBoASLHMcOaZcpLMNcxH6ss2L/3JZPmb1FiCrO017qk8H53QkpWnB/t0P7wmSeuwjLBhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732872153; c=relaxed/simple;
	bh=JiIfkNNTfG2wLwCrL8SHt4I5iayU11reYKOyFG1OMt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcLc9fjeoARwbJj9sW5JvUdaufYAjOxRfpEm/M7husBtfyCqCixYGeNLwCe9lcpNldL+UbA6asbfBpTS/Np2dXoBf64KA5Ck0X36zJC7qdkRWdV1rPjE6LmcLAPgf3CissvqXlMAevKI9YCWxe3HrOJzoFia9zrlf5Ou8m3GrKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ifAlznO0; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ifAlznO0"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-29666708da7so1035684fac.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Nov 2024 01:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732872151; x=1733476951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiIfkNNTfG2wLwCrL8SHt4I5iayU11reYKOyFG1OMt8=;
        b=ifAlznO0BahjWOJe/7uZG4FdNjrvuq4ZUvuQKDhjAceh+MDt1cI3hkMNzlApRTkfot
         I2wtTjzvla0yf0oLpr5exaSFBbBjuL6ZVEc1QthglX1/JqJQ7cZ18CWK7a0swuO9DKDd
         Dd4yOcSA469hD+PPUzZit8NgDwjQnnBKonpYQMTRF/kAc3Gu3ykpSVAStfbUwtcDh3GL
         tnLPrNm4y+I0tK7oHKP/WsID3u9lbqYIHv1R4MoU2UEDl8iAdtNc36iliiMKDqvSXcuA
         Cw7ydtWGR1W886MYoYJQVv2ukIYEcxE6bMYxD9GdEjCaXhyQueE89r9BKp1ui4R4bnXM
         1kKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732872151; x=1733476951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiIfkNNTfG2wLwCrL8SHt4I5iayU11reYKOyFG1OMt8=;
        b=j0wId/sILrWvdOyLsM70gA1Aw51WMwo8E0Q9UuJwdCJdLK00rV1K7QEwCNBLt1wzAb
         +VU42PDFg5e7w9hVn7y2q5vNcXWNDB41ujr57kkVvR2FqycMpEzO9LIH3dGvhlD5E1ox
         03TwWy6VhkmvpByCNYvxnLhQ9t06YggqOQO/yzXIYvJQWpc4ucY1kEXUfZJtzWBho5UB
         HfK4of0FPhplL8iRzAYrB4IRresutaeyJtLZgquY+fPnGRvYbLg9hGluLxYWMMnE1oHR
         yDUZKXnFaUdM46Jyq4+/Epv7exYKt9wVNUe69vvvCB5eSAVpUq/U1mrWx2FJrwwgcEwm
         9ilA==
X-Forwarded-Encrypted: i=1; AJvYcCVNpCUUkp4kUJjIJ5gZGEdPHaPWhDnmG2HWnQr+OhphqbpSdFnaaFFuyXWb4KpdTqmWylS/5+MUyOrg7BGIIhfJJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzoUbyz9YPeF5NvTRKurwO+HgyHD5/0ICxScVD/yeZdAfnWPzL
	RFD5neHNSni/zhe/gnfl/BsDuFHNaInPIMZRnPx/sb8NhRZFXcShdlpIKEfeHA1Ov1GI8X7vK8+
	+Vx2d9LltDYcCbxIkuFyK+xtCbjsbpuOU6ar4Vg==
X-Gm-Gg: ASbGncuYcXbwR7lva/F/9fIGS3b2tZ0VU6jeIDOF8mNP/NbhwaktvY7GFDqpgJKIYif
	UITPkjOPrDRQYz5Y/8r+cp4sMQXidLfi1
X-Google-Smtp-Source: AGHT+IFjSIqaNaKVZ3/NuPe/UxWWplbF+FKubgmNFJXh3rXD7HgOiYLcq/AbS7MVH0EyqYNXM/cmA1yMxrA0FbnycFY=
X-Received: by 2002:a05:6870:7d13:b0:278:2c82:e056 with SMTP id
 586e51a60fabf-29dc4199014mr6752255fac.23.1732872151330; Fri, 29 Nov 2024
 01:22:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-5-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-5-1b7fce24960b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 29 Nov 2024 09:22:20 +0000
Message-ID: <CADrjBPqUUXxjKapaSdWQz2PL8MsYVr74HCP_OqZZSG4w58_U1Q@mail.gmail.com>
Subject: Re: [PATCH 5/9] phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
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
> This code's intention is to configure lane0 and lane2 tunings, but for
> lane2 there is a typo and it ends up tuning something else.
>
> Fix the typo, as it doesn't appear to make sense to apply different
> tunings for lane0 vs lane2.
>
> The same typo appears to exist in the bootloader, hence we restore the
> original value in the typo'd registers as well. This can be removed
> once / if the bootloader is updated.
>
> Note that this is incorrect in the downstream driver as well - the
> values had been copied from there.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Validated that a super-speed USB link is established between Pixel 6
phone and my laptop with this patch applied and that adb works.

regards,

Peter
