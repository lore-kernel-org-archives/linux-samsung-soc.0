Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849DB1DFD9A
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Apr 2025 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743863352; cv=none; b=uSduzv0Ut131361lNcF9AQtpjsv8l80C+VWVyVGaj1ymP33XLgtbZpYoiooAhejXbMYlZ+E2r8v0Z8/R1ZjO2NCjrH0YF0Bm3fGAU3WjD7HhvSt2Fb/TGbEX5524bAI4OcliSPpkFHhx/VzVqXyJysIiLjNxs73O7w012fgKMu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743863352; c=relaxed/simple;
	bh=GiHxnNFMXpNIIyTnynX7IxDP/p9NCTJMguIsJZ7Y6h0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fNujs0BCz99COMaOQF4nf0UCQPfjd/DEEUZ15CO14TXtsN7+qhf2Qa+h3/B7Z9lHJT64d2agAu8Tsnqd2yLTnxUjagWCdypej52rEgmOTWrQv1uZj/XfVyXf7asqkjyOmnqy8S0NlX5c7FtFYslgK9V3QFOknct3wBq91b+JK5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dl0xft0C; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dl0xft0C"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1661088f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Apr 2025 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743863349; x=1744468149; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GiHxnNFMXpNIIyTnynX7IxDP/p9NCTJMguIsJZ7Y6h0=;
        b=Dl0xft0C1X6gds1VaxF4D5yQc5Q88d18FDmfNNaoHDAeEbBFisYX9phxnpr1nP/Gxj
         8QEoy+ztXWcQ9J2mbRIfa4u8GkQf0qP+xsm7bfceb5+HGS6QG8SuJ18Bc8VXUvaQJiKY
         s6yC/lmUCLL8sndZj7Ts/n3mOClo8tclwSL6dUQubk2xc5Qpt61Xs0C9mzzhIm9VNmhA
         0o4FMCDxMN8x094tEbzL4bQP6/fLF65CYZ76CUVLCF/HtfURT0eWs5fNCKBTKPFRzUbM
         KFCF0tWTOKc01yLQVVmzaGoK5NLzZfLS/Jzfs5iUk9VHJf8a7SF0h19/6yx1d8tLwrHO
         Lcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743863349; x=1744468149;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GiHxnNFMXpNIIyTnynX7IxDP/p9NCTJMguIsJZ7Y6h0=;
        b=Gdl2tZtUfacQAnn5F48Y26jxiNzilep1FeTuoUIO6WnIj2mpkftGta6fw6feqvgAn8
         8y+mcTr5/tq/Lak3UOf8MOJ5d9P3BnIdKEsrUfDE/34Q9NtDLlQyUJq35AM08CfVAMz+
         8+Hm41vMf34GfdEAixl/n1OFRWwaDhxowWGZrrr5kgNDxSXL2J2tup9/8jKzEb4TR1Ph
         dRo9sjsW9ZEf3WuwVqlDUgOeujHXjzAGTbPP/dHC7zrjY9+QUIjWtFmiSomCFX73Q9uF
         uXs99IspJ6wx2PA+h1bG+fDzYpMRiE/qItXCXUP5zt38kekIja0laKbkYxtfrNei1+8g
         c7pw==
X-Forwarded-Encrypted: i=1; AJvYcCVCZDktmR24jy8iet/oArY4e9RZripteD5h+EC4GkCskKQDLmAtZ3FOe9mPzurIgFXmsZXE9WWIUm93mO5/XKM6Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEs2cttO7gp0pwtEH0dKE3/IsKOyqlGhzOaFNq7UeU8cRZBcDn
	G7fZb3N1rQBZy8oVU5r5DqgHgZyIgCgddbHJ6IH/xtvj7+uPaVn4K2UN45knxCw=
X-Gm-Gg: ASbGnctS3od9GP2K0HI92GlrNnboYk2k+K7pHmusvGxyFUfINAeofgzmZfqWGHp7J5n
	z0q9HvaNe1u8NUlZmn9eITT2VrOStkasFEeU64k8Bxsxrd6ANRy37TaBAXGrCnZNmF8jStCMZdS
	vJTd3s6Kmpfr3FK/gkpoeBFwYUj1oPmlv8MMYfRhMS13q37uXEqMb5WdF488v6w2moQULp2RLst
	6CMT1xy3ASDRS4t5gOP1cvjx5ei6wcZMLrnzYVmSBdaBUcldRSRiKKz4mHiaDqlEuvS45g3aSv9
	bAmQ1ssO9MTl0ffGMzeYSJuIY0C0v9/awtydNFs05WD5kik2
X-Google-Smtp-Source: AGHT+IG+Z0ir3xm5RCrAq1SN4ZDlwjVRgFNS1Hr6WM6JjZY4zAku9AfXOB4reUpFaHMAVqmVf3D7Rw==
X-Received: by 2002:a5d:6d8a:0:b0:39a:cc34:2f9b with SMTP id ffacd0b85a97d-39d6fc291b3mr2358345f8f.16.1743863348783;
        Sat, 05 Apr 2025 07:29:08 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d63csm7230344f8f.69.2025.04.05.07.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:29:08 -0700 (PDT)
Message-ID: <73d99b656c405a19f75633796b696cc1aae71b90.camel@linaro.org>
Subject: Re: [PATCH v3 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 05 Apr 2025 15:29:06 +0100
In-Reply-To: <20250404093035.GD43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250404093035.GD43241@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-04-04 at 10:30 +0100, Lee Jones wrote:
> On Thu, 03 Apr 2025, Andr=C3=A9 Draszik wrote:
>=20
> > This series adds initial support for the Samsung S2MPG10 PMIC using the
> > MFD framework. This is a PMIC for mobile applications and is used on
> > the Google Pixel 6 and 6 Pro (oriole / raven).
>=20
> When you resubmit these, please note that MFD subjects take the form:
>=20
> =C2=A0 mfd: <file>: Succinct change description starting with an uppercas=
e char

I've followed your suggestion regarding the prefix when patches touch just =
one
file, but for patches that touch multiple files, I've kept the 'mfd: sec:'
prefix, e.g. in patch 18.

Hope that's OK.


Cheers,
Andre'

