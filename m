Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2421FBEB0;
	Thu, 17 Jul 2025 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752739952; cv=none; b=nI0aEIsDB34sK/yxr2vr0dwVfJA+G/mfNPhs+2CaBua3xUC2ITtbfhsDqbxeDFC2Z/h9wfIX4qq5/LXOmcwNGhEUf6wIpJIegDdUt1P9lnk5EKFqoM2pzaNsP89FTzEJU8kkGoPDBy+kyVDiBCNmSXWBolm5gz3zZgnD19/XmA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752739952; c=relaxed/simple;
	bh=6dzmgsXZ4ihctdNNGrst7LKfmkrzDE3GFRksTdLmYNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XuasBPbshXUNZPHVsJQtqASytGtq50V7eJrzdzFNh5QB6WhbrOpNuV22ytcu6noT3RW9b+Ee8+L5Nqos3Y9uq9L9Z0xSYqP2ptmyOujg1gYdSFth14W3uQDhZ1a4wNY9fbySSuzGDgFCbdw+ihJt5yUc8N23eREKlGfMcN++t9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsoR6qYx; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsoR6qYx"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-528ce9731dbso268308e0c.0;
        Thu, 17 Jul 2025 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752739950; x=1753344750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dzmgsXZ4ihctdNNGrst7LKfmkrzDE3GFRksTdLmYNM=;
        b=YsoR6qYx1K/tfz+HZKVbBZZ2WY3nFLo38ZJqBYdX8owPNd3iIx+2zeeFyHN/79NvTt
         3uUfwm+FC0kQlYUb2W0nFMNupIG/eJdIdk+5mIm3oHHHeA6DH3Wf3g24UfW/FqoBbcsF
         AgpFK9onCaRrvcARefXhHVtUT34u+ysiBVHg0xm2BIHKdj3Ntv+77iDCF6y8pCYQUm/E
         Q3nDBPPEOtfNBLrgRfDpUW/NZXowk0r7pYuQ5jvyQsZphxyH+Qime76rhxcWlZ+jZVJc
         uWZkONMPhIO74IfzjwMm/IynoAJr19Wfgd/wt9G5rjLwF53ijPjewEwQe/DYT3QZTu8w
         lF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752739950; x=1753344750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dzmgsXZ4ihctdNNGrst7LKfmkrzDE3GFRksTdLmYNM=;
        b=hAgWHz1HoQEJwmjnoDuk7nYC1d5rDsnHdpGDDgPunT8wXT3ybCrcuPWvdO3RYLHr+G
         f8OdhnQ+HX6i9zjKLwxsowX72UgeVRMbaPM6nkrK6dt1T3D7QADyeohlreWczfnTsxYC
         dAUnHVwX7VBkmW2hCKg7lH7Gwr5LflGTndu2OekiEfEBLg/0CXEl4/ErLNMNzy3HLTc6
         mHlJb04idyLjwU/P7KllWia2r9qQP06o49GgZek3AwYwWrzvf2plyA2xsJOqvVlbg4LG
         qWBoW+z7e6AduuHBvvtLGppV4q6ZFZRbZOSpF0GTvI07JryqvnA0Lco0FNowMyyrw9Me
         mOPw==
X-Forwarded-Encrypted: i=1; AJvYcCURwIAlYjMThOQmHm5nTGjHQcW3pmKO0N5cmjC19/5XGSynjfd9VJu0aMXGymExtByge2MpwJGyyA7JU8avr2Y6AAM=@vger.kernel.org, AJvYcCW0qUsQL/mlg1icDx7Rvh5hTvju366hDNO71a9VoorkNOjn+yDgSVbd7HPduU3gG27GOVyf9gzBnBqafQlY@vger.kernel.org, AJvYcCXx5pgjLRsSgHuN0mrWtgWoEcoEx2ERG1+y4uRQbVF2YcD3k/RG7QNNbLe4psWnncmRTdDlYGRZDmaD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/WxUmoMbP7Kgzc/FFSmSd3aoTiJmaiTEKuWm1cj9YYsBKeTN6
	bxLWTHf2cUcYl5G5Iq5zQckRvWoYjYAS2R/pklaAi7oi2Wa/9DGfr0jo7bc8JfMXrPlpvjW3Wjk
	dqyCTxTWnS6FVufyUHsvqV75OvfwXCL8=
X-Gm-Gg: ASbGncsYLEnPUgHE0worfWa6a1clEKiTvSGxJ4dDAJz7D0UBqXr6jsYSnnR1uC4iitR
	Kh7zMn0gKtTNbn8//nOQV1YukxK5z/wj6HwzYeCv+JF8GMTMOEmk+x0bgAVGzrbfhmBsNF/vCwp
	QKEgkqlkoAa6LqpeWu+TmjXAkpPZlDHp25Cx0KgOZFRDlUuPBBXnrAAG7dHM6M6LRFR11rJvmQi
	yWN1EI=
X-Google-Smtp-Source: AGHT+IE4+/jyzpcJbm9kLqh319e9w2ifyYgMXgvBj1eovRPq3sGlFkHS6iaGjCao2H1GdMVdydNDXEbwn9tkBnQeCAk=
X-Received: by 2002:a05:6122:3703:b0:537:ee0:7ccd with SMTP id
 71dfb90a1353d-5373fc17f24mr3472385e0c.5.1752739950040; Thu, 17 Jul 2025
 01:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
 <20240617-starqltechn_integration_upstream-v5-3-ea1109029ba5@gmail.com> <7bec6fc2-6643-4ddf-9475-8ead4b312912@gmail.com>
In-Reply-To: <7bec6fc2-6643-4ddf-9475-8ead4b312912@gmail.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 17 Jul 2025 11:12:19 +0300
X-Gm-Features: Ac12FXyILLppn4fNJXMt6JbXlTuHpIozeuClAX6gTrcucQbkwaV2GmN42jvBHx8
Message-ID: <CABTCjFBTY4NV2yKyRO31MacGFAnJ4T-viDLrXkPs9z66VU6nyQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] regulator: add s2dos05 regulator support
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 17 =D0=B8=D1=8E=D0=BB. 2025=E2=80=AF=D0=B3. =D0=B2 10:28, Iva=
ylo Ivanov <ivo.ivanov.ivanov1@gmail.com>:
>
> On 9/26/24 12:47, Dzmitry Sankouski wrote:
> > S2DOS05 has 1 buck and 4 LDO regulators, used for powering
> > panel/touchscreen.
> >
> > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
>
> When is this going to get merged? This patch brings the regulators
> functionality of the pmic, so not having it merged is odd. This PMIC is
> used on other devices too, like the Galaxy S22.
>
> It seems like this has been hanging for almost an year at this point.
> If the author won't, will somebody resend it?


It's already merged, see
https://lore.kernel.org/all/20240617-starqltechn_integration_upstream-v5-2-=
ea1109029ba5@gmail.com/

--=20

Best regards,
Dzmitry
