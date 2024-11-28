Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F10C14B945
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Nov 2024 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732783208; cv=none; b=T7mr9QRtXD5iYEEEQTVFLNIzDxioVqAz9suq/Aj/Hqwup/1W1FRlS4RGLK7VtOb8+6vOSKbEMcdpR2xyaGfli0N08e5SMmpV+Ot3jS9GyA+x0JgNnDTXdI9ZoiKCuNxiZoGNNMAKLNMD2NOHecXWVVagneoQMUBiVp5Iii5HH3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732783208; c=relaxed/simple;
	bh=l8r4E+fAxvn95ykDQ3t+Nmyf8EYUz2dFT+lg2PPw2HI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oZB/+v9pbWTDInrw9puJ9IRozIKXKA8IbmmCniPRP2izBacsJU5W8x0sXSRYunG+rCmhFyT/TkWIXacW9gM8sdZgnvNPVQLFijM+yJmkhGkOVm+lfS2V8y3/L7aY8GPjBYvVSUzOhsR+XTacKP656rhY2l2Mz0UkW14z2zoJMMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a/S6bdZg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a/S6bdZg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3823e45339bso437044f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Nov 2024 00:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732783204; x=1733388004; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l8r4E+fAxvn95ykDQ3t+Nmyf8EYUz2dFT+lg2PPw2HI=;
        b=a/S6bdZgISDO9ZAz2kcR92XlvcoculYKlo91vd/zFSU/Sw2kFgYepEZSJAfhGb0apL
         UX5CgaJblqb9vJPKkyMxX3mqTari/FvD9vZoA9q8qYfICycwNN3QAzUioKRw4xgMlvKC
         xWSZMA0ZcdymKsrVsJ5KcrIZxP6dZBfXxQM/3EXvNFlVM2cjbTChgBV6TMeFP+zVDOdj
         NAi9nHvlE8mbue0940anXfAK4DBdYn5byMbJUEFqhAVeZciSQHpE6u8n3TpGJK9l0+GO
         /UtjV6wkKU9nR9h5kZZPNSJn5eRKz9OhrhnqVY6NwM/e38j79n6QSq33k4yftpGgrFXx
         GbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732783204; x=1733388004;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l8r4E+fAxvn95ykDQ3t+Nmyf8EYUz2dFT+lg2PPw2HI=;
        b=ZgiygMEnLS9KIKmu2GLJ6msfyf9/AqlDH7QpGROw6MJhhYI281zdQJe1bq6L+6Hkk5
         PmpCOFrNBOqcdsdmBIk5vTOxNmRP925bcrYtGsqZG6Ez6uXRaYhVCjrrjwCuClfcIKGf
         eNH3SeT1KB1awuZISVly4GNlSbLoP0Bt3QojX2OykM+2VTtFYprkH2unHGHVDdgw13Fx
         K5TJqNOk93EYv1srxHS757ROBeuRSjhue4QerVuFtCDm3kUU8nyKjykTPfenk0BwK2I/
         14+CuQdya7CP8qsWOP52pZxuaRSuO1x7jumJsSfnFHL3OTnBou0RKqc5nDYOS7Y5MkGV
         r+EQ==
X-Forwarded-Encrypted: i=1; AJvYcCViqp3xyOe1Zex2eJAHNkeOkdmI6YnnjGWd7If/HdOxomQaDFvTyeyCTlnoEjyQ2E3meAWbP8fCerrHFw3OVmf1fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHUQjh09ePJ1s30lDnQIGSWcDamamM4XW+MtxB5Yj5PLLGP4gz
	Ihi41smo/wfhKKk22ULG+wpeZGP7GnTvvbSIoVbTLd5kpwJjubV069ylyJF1Q1Q=
X-Gm-Gg: ASbGncsudQQ55C6ZUMQfBhcqyH5tCBp4jNZZel/cFmVkboGUfKrrIAN/DRHrjBnFaBN
	7U5EenpWO3qViyl0DL2KtXtg+VAl5kep4A2seoLT1Yxp/2qruhTKzm07Jqfiao9+fZXkpIbueMs
	ldrNMwBRCpOTz7wKt+1Xn5+ZK6BducZRUSehB5v5ZWGoA+rI0Sz0N60BYLWpQNwNmxIzyfriR/5
	2T3/c+VCReeYd5vCOLEkPRB7zizRe3ebC7Z5j9oj6+iBziOG9/NpK8=
X-Google-Smtp-Source: AGHT+IHLCVGEBiGpNB3pr06gJDHBvejAWzRugYtAncqUTz6NJIMOpbiyuWDq3lH6CC8FDjfooG1oIw==
X-Received: by 2002:a05:6000:2d8a:b0:382:2f62:bd45 with SMTP id ffacd0b85a97d-385c6ec0980mr3638454f8f.29.1732783204673;
        Thu, 28 Nov 2024 00:40:04 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccce7859sm1096280f8f.0.2024.11.28.00.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:40:04 -0800 (PST)
Message-ID: <5d2a32a9bcc38f31beef56c04d07f6d53aa49e06.camel@linaro.org>
Subject: Re: [PATCH 2/6] dt-bindings: usb: max33359: add max77759 flavor
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>,  Alim Akhtar
 <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-samsung-soc@vger.kernel.org
Date: Thu, 28 Nov 2024 08:40:03 +0000
In-Reply-To: <8325415b-4af9-4bef-8310-39410b10aa84@kernel.org>
References: 
	<20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
	 <20241127-gs101-phy-lanes-orientation-dts-v1-2-5222d8508b71@linaro.org>
	 <8325415b-4af9-4bef-8310-39410b10aa84@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-11-28 at 09:17 +0100, Krzysztof Kozlowski wrote:
> On 27/11/2024 12:01, Andr=C3=A9 Draszik wrote:
> > On the surface, Maxim's max77759 appears identical to max33359. It
> > should still have a dedicated compatible, though, as it is a different
> > IC. This will allow for handling differences in case they are
> > discovered in the future.
> >=20
> > max77759 is used on Google Pixel 6 and Pixel 6 Pro.
> >=20
> > Add a dedicated compatible to allow for potential differences in the
> > future.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> This should be sent separately to USB.

Sorry, it slipped through into this series somehow. Will do.

Thanks
Andre

