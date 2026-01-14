Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24272D73A0
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2026 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400108; cv=none; b=nOBw2KsK3dhADwBiQn2x4n4h39+Be5wP88BrDyC4RCTo7RtnbJzx3cxeUBVkcQW5TRWnGdC0ruTrE25Gsna05Zkwje6aepIIKfbPKk3lnus1M4Z+AgLi0vomG0MlXOtes1T/qNmm/kNzR2Fuizb5Kks1nL3pss3jb3pI1YnaQK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400108; c=relaxed/simple;
	bh=NKlOFQD6uXj0VWLLS8qWtWdchxZnwtrtwtRRdnryD+E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dsyzzSH6RepnG0XW1qSaloVEd8oqUBIoZCF7FFiZiLY/BhS9tkj+cWo6s/5jT7Dqk0+rzEfvvADYxj3Bx0nqKeWKbturpEQrnzTf1Zz+JXbiE1+HXQYXOxwc37CyDx+BDxdvfslHIvbFxVAj5uSEVJ/NxkQusHVA0lW0F4HeId4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wv8GtboC; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wv8GtboC"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7f216280242so341843b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2026 06:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400106; x=1769004906; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NKlOFQD6uXj0VWLLS8qWtWdchxZnwtrtwtRRdnryD+E=;
        b=wv8GtboCLQVEKX3PxvU0xn7QrVV8gNToyphPCAMqAL7T7WFhU8eTGxMoH+NDoFP8no
         akGDuzs0wBcK+eJsp7Wk9d9l1M3gTdI2UNqHMQWablpOzka3O9zIV0SAiwsSzEMTkOg+
         oYVE4Q/aaiFymr4zjme/8z8hkfklGGkVzVN6RElslZp7LjL3bqHmiLiedVDuUdS2/qZt
         rTt1IlsBqcFZUHiVXgZkam0cHwnxa+A6itw71WYhgwXEErqkSBjtGLyew4JOzm3AfYn3
         5gKhJwoyVlmZHsj+I4XWEuTU2CJXTr3A/tVO6SBs4cI3RX/RoZNjB+LPf19O+hvN5nO2
         4AoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400106; x=1769004906;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NKlOFQD6uXj0VWLLS8qWtWdchxZnwtrtwtRRdnryD+E=;
        b=ZXHfpnVbbMFpRw+nj+srJ028+idgyJ0OSEMo5DXtuBgy98zIaib9g6cBun7BHZznxt
         jP4Fwe9W6gyVXdtcByGZYf856ThJd7IG1uvOz70egnyBnj0LAB08+XcB4H1mx+NMNqx5
         48VQ2M4lY6IVKSISqddHcPP71RYIUlGp7q3K0/J79L9/v4aYugBihbQRPLcVQX2Vx3pL
         iYfMaKqVXp2DhfHu5yo7jQSmIb9CneNMTm88npfzbxC7v2qIN+r7IMxx0Hrli1PkZ7bt
         Ccm+087eJHZS9aJVqAfFQ2sB56HZqd3qTRSviYffo+8EXkA442o8DQFTEOtDRN86HvPo
         iJ1g==
X-Forwarded-Encrypted: i=1; AJvYcCU44wcMJfjrnV93WyAAMDIrDOoHcvwrRpC/J9KOHM+SLkuM2t0kUAou0gsc1/QxJb3CifPBXGDjx4JMgEsV+48Nmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEzLJr9Nr3jK2ATDbpUGnHCSKsgGdDmx9x7s7ZY310eL3GOXjb
	ofGfAqRPQ0NkCt/LC9A2RrcODQfbmyaCJpsJlPwEtdGdzlJWsjH52k0JT84Vi1M2yFU=
X-Gm-Gg: AY/fxX44f14wFumJCp9mVBrbZYFNbaeVnWT88kn/2IjHDKQC7EW5Rbn6EPKUs0qTn+1
	ipdjp9QYfVERp9yG50n4Iv/QZa2NJffH7v7Ucu2vl59Ya/CZtZOU/6q23Ps4yNs7UB2qftEtbXJ
	IceMFiH76S/MF4JHjElDF1m92kZ6L1EfuQGQTdi8TraG+6mLEmz7BzPbqBCs1o16rnd7Kn9yDDB
	3ZtWLoCIx8ODdBSTelfTs2QcjvHicL5qEudMfme4MEGblhO4ke5F2eHunLtso2Dw0nb9L7+CwHV
	aOKlldgQv7n6uF9gUUErCpNnBd9m0WM8aRQgp19uFC9IPnDmCr2PW5SWtxZd/sz5sARrXH+Q76S
	iHqzL1ZI+8iiUdruJoc+ogMLFu7tC6Cc/exL0k98sSaNw7e2hyOz3uFTYF3BKGDkdMaLMM3k30n
	lL/lZDK0IFqL35qiFJ
X-Received: by 2002:a05:6a20:430e:b0:366:57e1:3919 with SMTP id adf61e73a8af0-38bed3b0a3emr3088839637.26.1768400105900;
        Wed, 14 Jan 2026 06:15:05 -0800 (PST)
Received: from draszik.lan ([212.129.75.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52f88casm23418638b3a.34.2026.01.14.06.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:15:05 -0800 (PST)
Message-ID: <08a972c7a0fd17260a91f09ce0201167cb6ed7fd.camel@linaro.org>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Bartosz Golaszewski	 <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij	
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Will McVicker <willmcvicker@google.com>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-gpio@vger.kernel.org, Bartosz
 Golaszewski	 <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 14:15:34 +0000
In-Reply-To: <4502ece1dc8e949e23f971a93dc06dab2d4f0bf7.camel@linaro.org>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
		 <20260113112244.GE1902656@google.com>
		 <6ace23c4-d858-4bdf-9987-104e706190cd@sirena.org.uk>
	 <4502ece1dc8e949e23f971a93dc06dab2d4f0bf7.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-01-13 at 17:28 +0000, Andr=C3=A9 Draszik wrote:
> Hi Mark, Lee,
>=20
> On Tue, 2026-01-13 at 16:20 +0000, Mark Brown wrote:
> > On Tue, Jan 13, 2026 at 11:22:44AM +0000, Lee Jones wrote:
> >=20
> > > MFD pieces look okay to me.
> >=20
> > > Once Mark provides his AB, I can merge the set.
> >=20
> > Given that the bulk of the series is regulator changes I'd been
> > expecting to take it?
>=20
> Just FYI:
> 1) I just noticed I have to rebase/resend this mainly due to
> patch context of the binding updates.

I take this back, I got mixed up with a different branch. This series
doesn't need rebasing and is good to go.

A.

>=20
> 2) this series depends on another MFD series of mine
> https://lore.kernel.org/all/20260113-s5m-alarm-v3-0-855a19db1277@linaro.o=
rg/
> (again only due to patch context) which is still pending.
>=20
> I was under the (perhaps incorrect) impression that changes that touch
> MFD always go via the MFD tree. I guess that's not the case. I'll update
> the relevant phrasing in the cover letter with whatever you two decide :-=
)
>=20
>=20
> Cheers,
> Andre'
