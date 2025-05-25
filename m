Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8EC18DB35
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2025 06:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748156395; cv=none; b=B4oVpcWO+0lyjwJCcltZYWWkA+1wzZzZ4hctcSxh8fYL6kdZ+NJalEWl2DutqD8+r/bLuYam+P/OxSAXkygecnFfztReSQnvAhITiaIW+xTcPV1xIlW/iJ/b19tSpwF7blV36wiUFhoxl3DMfcyKJ+9/q9n886W8BfxuwE3tcgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748156395; c=relaxed/simple;
	bh=n6woNA1KAB7A7cPpCh7C05v8CU7LoOLG7R9vYiUjRdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPHWE+rJhlvzdSy4BTBQHT45WPYEU47rDUsgW4QHnmxFloeE+juzlqMEt9Fxrx7JCdkrdEdpcf+Vj+FnEX7/zTdGRQV8AZTGEi9hiGyCyqQ3X398v7IFbzx+gT+7aT4o6VOM7sDuvf86L7W8kK7vTNasTXCjUF8hAG1T719JHWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UVvhBPTP; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UVvhBPTP"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-601b6146b9cso568920eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 May 2025 23:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748156392; x=1748761192; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6woNA1KAB7A7cPpCh7C05v8CU7LoOLG7R9vYiUjRdA=;
        b=UVvhBPTP7HmOm9yKbRkz20Mr8ZEov1O9XhPd3CBuNcgADp6AM9fSJ6oB+8jCUMzaxc
         I/LfhU0eshomUeP4sQ2NeOEC8L7AWJuCyC1fIBK9SOqPjfKQjzY9m4x/+l5M51dRNpkX
         uhnSQY8M7p/q+JyV1kbyB3p0z2/ACL6h9k8gpn0B3krEN96Nl5rompNeIxPkSkKmwDgn
         t8jAV/DLvnt45tIkUc0i7vfDylRDcXKNf6xEl4ap3Y0SLn2BiZFCn97oIXfcl8qU6CH7
         yivfdGNzRpLh6UPckD1G2TRbBkrd/DtzuiKTdzS2Y4LGj5lIvfoMz5U+JT+ASN8/ZUr1
         /bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748156392; x=1748761192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6woNA1KAB7A7cPpCh7C05v8CU7LoOLG7R9vYiUjRdA=;
        b=ikEHjkL/H+AmFiQx9gP5sdKzwlQUm4WvPFH/3qs6iHR3PUcDWduzUWGLVR9oV8CMHA
         fS3HJn7wDK7RqCyRSXbVBdSm6kAlgbtWoA2HLhvO2JZyDR2FZkW659kRhun47ClXA8NZ
         U/A2D3mk+8fNeEws8XEcZI5jr/cpTrcTbC6lGR+r4AcgjZC21cB4YGeuH/xpTl+m4Pte
         4Sm9zuJnOSiz+DzQVcjIHQgaG04ono4ro3p6aRsahTFLrSf9o/ElaZ6zxmhGvuyMECXb
         KZF6skh9FUlDH4m8z5xFhYAmA292SN2H1/gyni1U6Zlgr4I2FN28SndTEh3KrLEEKUUl
         om2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmuBH/hInOrp+qVq1LOZaolzqLAPx0aNRcpR9l0DWhxA/vdlheZQxF4u4aoQais0JmAdR/fvRm4TEfLV0FgyBsQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8nwks0N133v9DqE45YqyBOy/ypb6wgRbD0jgGutKu7ueJko/V
	FrmAmKVeDX+zqS0Cv3/BqkrTX/oyU+TCmSBDOawzJKCPBS6iHF82xFL4SQ6AqwTD6Q5pDnvf/lN
	HvIQP/PzTCBnJPiXJbE7WmBFK0IOst5TDUg/MWOHN3A==
X-Gm-Gg: ASbGncte6uWmPuwG0Lp3yL357uogSKIV++QIMc5FTpQfPJijY+UP3rvu7JnqHGLxU05
	VRNL69lxNdyJS8A/FFbdIM7VUvz/o5z6XZi4+XlVO6QGu5Ce6RVxBWRGV3Xoti6GE5SDkmPP15E
	And4xtAH1wzxXAKD6CuZ3rTnHlwaVuT1/GbPT82gXDDVu1fxRypBL+iTZFtosBNa/ebw==
X-Google-Smtp-Source: AGHT+IFgDLGOtCqohcdRalUhWXVpC+KpngWsK/Rw8iIAXMgLPGD2nNaWQvQPUiC4kmvZXurqEyjrTqM9NmLsfftktkQ=
X-Received: by 2002:a05:6820:450a:b0:60a:bee:497a with SMTP id
 006d021491bc7-60b9fa62424mr2365200eaf.2.1748156391776; Sat, 24 May 2025
 23:59:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org> <20250524-b4-max77759-mfd-dts-v2-1-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-1-b479542eb97d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 25 May 2025 07:59:40 +0100
X-Gm-Features: AX0GCFtzlZ4NN5rM8kQ4Ddqkxfr236WnLwsk7oYUXbS3dPkq764kPsxxis5Ykos
Message-ID: <CADrjBPr2ie+6vNZK0oUH75whXDqX-oXdOODcrM75gMc0LmxoYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: defconfig: enable Maxim max77759 driver
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
> Enable the Maxim max77759 as this is used by the gs101-oriole and
> gs101-raven (Google Pixel 6 and Pixel 6 Pro) boards,
>
> The child devices' defaults are based on this MFD driver's state, so
> this commit enables those implicitly as well.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
