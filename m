Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822A815381A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Mar 2025 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742981723; cv=none; b=H1dd1V/CvsnRgKhc4vviaGFDAyul0MRo8v7LF3/JdiAo2KsHb5b2BT3md0S3dN0jguTSFeeUIWZBFOndgHyE0LdUpUmJspGJ6jsYjuPpdMpDeFFCLRjpJGNcgqhQwO2ViqFnAAznwH+TBBhJ5R7jxi0YM2+6ffC1oRdxead+lp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742981723; c=relaxed/simple;
	bh=mO7U4m0oTja17D3RFzqvynDUKnVhiYqxVxjxnWasqbo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ExONWOb8GIQbfFvXSM4jLQCfk7yMpsMLSfSGOesXWFg/l2PAyTG6OQiTVYzJaRp2OHlZ2/BMrwPb/vsj1qL9A16i0cGukaA60W2UR6vYezqqg32PYV1qQPEQOC3HbElJGVGHyAvvIwa2inFhjUweaQrLfI16zG1hZdptIiO5ewk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Meadw21h; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Meadw21h"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0782d787so45925315e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Mar 2025 02:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742981720; x=1743586520; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mO7U4m0oTja17D3RFzqvynDUKnVhiYqxVxjxnWasqbo=;
        b=Meadw21hAJAbPxHWIvE2IdbDLH8Iu3gP2LwW1a7LUKHThLlqX6CsngMPJQR3Q8jmMi
         Y/eXaeJ2x7qmckOmGM+Jt76QXYznKk6sayGrFiGmC3p4f12N30t7L+d30z9E2Q8aBkXP
         iQ9hoRNkYoHeidu7iB/Di4Nb87PM8VkZiIUZy8lIkD+LLt/igq+9XyvPqk1gxuPfoNxl
         az/n99XmR9iXn/FKMzOJ5s0zKA/MJzY5VQAMMlW+2epY2do+caRJMfrvEs7M1EEfVSIC
         BfJkoIRfkPD63mUG+g0R72X73Y+mHNCvriWSWpX1id9Hr4XFD9b76gm+Vt2PfVNWG7gs
         QRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742981720; x=1743586520;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mO7U4m0oTja17D3RFzqvynDUKnVhiYqxVxjxnWasqbo=;
        b=lTwxbFS5gn1VSH0obtMnCatMRXJOK2kRGIb34r8JuJv+XwbovMPXNtbI00I4Y8JpTs
         r5fT5j0I0gE2gICZ2D/g5NAzm49qlwFsBtXYlzvvDsDUEiF92N08OFoKuq0wSHs4phEI
         iooSDZdOLnujj9CWgfyCssMKL+d3dIQSGtQhsEmLaObdxyPHfuo4nw0JrU9e7cVKUCbS
         q53e0vp7AwWra4UgwHjS0aLNXKYTOp6xi6RSVjoiUb+8wepgFnfIDKWKRSO8q6lTF550
         FyrXrAqSKjC0jORfdoNeX408/1iVi1wTogKV8xP3YYQocqiPsj0fQuXIGtukCNe5B3hM
         i8Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVv62Q6A/I70t2ZW0Jl15HAfnGdj0pMvu1RsO2DO1+SqLaQQHzD5yvekMiSxwEH2CNPTBe2GYeDqdB6oiWlT8AGdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1UouHIbeUNrMuTAW1sxr2bgkfQFQjAipQzRBdpda6DO4AQJ6s
	MLEgcTpdLip59BDrheBRWy8N40jodPv+UwenpMH+EFDy64AwvTtSOMR61UIM+qw=
X-Gm-Gg: ASbGncvXvnSPu29K4MeDnrK7ynBswtGyRplFTtaUueAG83xZbMOLhJ9/0RwKmv+gFKt
	+SfBEuvq/SMuVdiyKBD7J5NeJyd1jcYO72gj9Xx/G4794JDhuXOXz/VJ4AgRIBwXkqrjUR5/fuf
	hReuwlWMQPU+FLn52ancFfj6IFNRPlK/X2fg2GdC0Tel6PJAZU4m5YWjlKXH5KAGaApcpZlT82k
	/OHD5/GMJJupGWKxyFRiYiypYKFePqaP++W4gfzlwTPtikEQnimfzl+MxBBjqlP4OI4ijpppFJl
	DCj00OiUc31m/9u2r7PrlzeaHTu6aeCeMKtPIsUzihrNGge9hQ==
X-Google-Smtp-Source: AGHT+IGcfQ6I4FNrJirurd36EI4HsUJuWVwi1KHS1E2yEYqjMI56gm6awQtr8PEUURenI12KJk6YUQ==
X-Received: by 2002:a05:600c:c0d:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-43d50a33d03mr152636725e9.27.1742981719714;
        Wed, 26 Mar 2025 02:35:19 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f32fcdsm232615235e9.7.2025.03.26.02.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:35:19 -0700 (PDT)
Message-ID: <40a8d82aab764669cf755adbabac80a5c0044a5e.camel@linaro.org>
Subject: Re: [PATCH 12/34] mfd: sec: add support for S2MPG10 PMIC
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Wed, 26 Mar 2025 09:35:18 +0000
In-Reply-To: <25eb9c47-96ba-4037-b320-af16e0226f4c@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-12-d08943702707@linaro.org>
	 <25eb9c47-96ba-4037-b320-af16e0226f4c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-03-26 at 08:22 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > Add support for Samsung's S2MPG10 PMIC, which is a Power Management IC
> > for mobile applications with buck converters, various LDOs, power
> > meters, RTC, clock outputs, and additional GPIOs interfaces.
> >=20
> > Contrary to existing Samsung S2M series PMICs supported, communication
> > is not via I2C, but via the Samsung ACPM firmware.
> >=20
> > This commit adds the core driver.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > ---
> > Checkpatch suggests to update MAINTAINERS, but the new file is covered
> > already due to using a wildcard.
> > ---
>=20
> I did a quick look and seems fine, but I suspect small rework when PMIC
> becames child of ACPM, so full review later.

Thanks Krzysztof! And yes, there'll be a small change to support that appro=
ach
instead.


Cheers,
Andre'

