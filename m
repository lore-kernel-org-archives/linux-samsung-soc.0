Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE7131E10C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763369211; cv=none; b=i7yuwc6oebxmmUAvvmpC+b9le+DgbdEpUMTwJfUQ1uueQvHOEFoh4B9J4Zz5rqcTVqjWgJpV2/TE47ol2MY6IoAexU20HT8uC937g0BYsMngM/FAZtSvL5VPmk6jWJ/EV/GLL+7yuE6EC5OXrHD8R6YRau81n+/2oGktCdpi0mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763369211; c=relaxed/simple;
	bh=E6K7+S3tjpAT9jtG3l7RnnMbEQwnKRCZim2mlFfHZDk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XqgnnkmDod4NW+EwYYHziVRKrrnVnfGr5aezunUnddYqF44tuU7j67Iy0ThqwTd4vzF2RtZMstdtekqCPsq5lEC8HYfHB3DFg/060ygRiOKRw6xC1nMAx/3zOKu3lSKjB/0kZr72287/i/Ycr56dd3xFTuwJfHHFgHEmjcuD35M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OEL+gACv; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OEL+gACv"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so3238728f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 00:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763369207; x=1763974007; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d27vDqN+JHw1+uJquBYSsbfwHP1Sqq5k0Pnf9NNAEn8=;
        b=OEL+gACvv5jWRGBSSP4S89jHUz4O41aGE8t0X8SSYpe4nwKPmQzzFLefQPgLbxR+E2
         jHZTIyvNiOHRubCh9n5/3RV47ZqPz4MxvPaJBz9e2AbIOhkv/MQPWzq7g5REUAmmA1c0
         mx6IqnAPOMc/EoDupoIruUKNZA/Ap1rRifu9xNxqf59zIYDUbwQxIRmfEw5cEBKuEx2k
         V6y9PaP5Tvi1BTr0VBcxvETRGEsy0wD6zeLsHfFe5KcpJdgyzDXEmIj4M0f8io2iygGj
         ka6bWQY0liE2ZOI/Bn3Aa3lzeBUmnD5QQ2cyiu5iAYOKdr1dSTISSL+gjWL4SBQhXC1G
         XGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763369207; x=1763974007;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d27vDqN+JHw1+uJquBYSsbfwHP1Sqq5k0Pnf9NNAEn8=;
        b=AR34XQg9C+OLJXB7/JgltMp7CBohI/8BCRHw3tmo9AzYiFO/wHtjtnkBFtQ5XU3scU
         Qha1ig+/YhKwmCxUV0+FD1AtquIV2U3d0eSLnMd4sjOArtl9zeVCou46p5gVHJuZMQAI
         Ef5YJ/9ryrLPPljrjqJnvvu6YscwrffEVn4EI2F1XBxjLhDbwYDBXW/TkoQm1NGYYmoP
         ZGExyCroyI50QJp2cxzSCsQ9SYklB3z2fkq3EstCqqj0C0A41I/KSyfHwGV8GSCs4Nzb
         Zq5BWFnn8qDvjZODaEpg52r7nhgexdQ6PSmyYDBDaJordO6vIVtKzyLJCBXB4mW9hZDn
         n1gg==
X-Forwarded-Encrypted: i=1; AJvYcCWBJOuElBNvMcdowVPUhsIjGbNRWtY2dfic+5oCg3xVqOGVFx/b3JRoUD4o15OzlMgt9drTSEuegtzlvGlmXnwcGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk4Vit1yQwFSIu7lM9WEo42kc3oQ9VuPEjp5LBojz+wHdwYmMc
	z19dhzILdtb50Iiu+A4ukbtRn5g4hYmwTeJ5p49WiHBux43wm9GwPp1dLxvwxYfo/aD9Rg1jgi6
	aEm1x
X-Gm-Gg: ASbGncvfa1LbzZBjVNxiNAiTEj+ByGZivBv41gD/hSTkXM7hFtvaIub9TDCVrN3P9nA
	ig69MVhRNMhweTcwHTcNFdXOOjR4IzNj7ON/6ey1TlFAACQ+sqf1IVLq9L6jg36KI1Izhfsg6iP
	Qrbinkz/jBi1YNFM73g0Iuhlk8xwhLvBm1DcEgBffnXJ/gA0siX3y8SJDq4wMbyMkmHOCK6jzT/
	WoTfKL/hR+Q61h+L0GnBC7Dy2yaWkyL7T8YMyASCtEMlG+usGynnssYE93ECRjpiVyZL+dyffgU
	YqfbMHgKrvRvgM/hpOYoVRQeV3Tt20rTImU5xsUROM5i0nOI2Mu5rGQ0tTju5pDFuuIQKtpVlL/
	Nm8qjjqLKgrGWxdw96NitgjwknDkxgLKH4KO2T/ZYv2hxU04rChuOcNNpDVweho9ZQ/vFP/gNXQ
	1pDT0NkwPubosSAQxjPIGkF32507eo
X-Google-Smtp-Source: AGHT+IHwkyRbcMxnSU28LuZ9foW7wfrOf8fSpE3f89YPvs1x9ZEE9MUab9lKz3FiPMeNgj6Sk2rsIQ==
X-Received: by 2002:a05:6000:2306:b0:42b:5521:31ad with SMTP id ffacd0b85a97d-42b59384ffemr9496363f8f.49.1763369206970;
        Mon, 17 Nov 2025 00:46:46 -0800 (PST)
Received: from draszik.lan ([212.129.83.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae2dsm25605597f8f.5.2025.11.17.00.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 00:46:46 -0800 (PST)
Message-ID: <5a8b54fe20dca15e08dbe1f91232bddb95484a94.camel@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: gs101-pixel: add all S2MPG1x
 regulators
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Juan Yescas
 <jyescas@google.com>,  Douglas Anderson <dianders@chromium.org>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 17 Nov 2025 08:46:52 +0000
In-Reply-To: <3ddf1b76-8376-4d56-837f-c9b06d04af94@kernel.org>
References: <20251113-s2mpg1x-regulators-dts-v1-1-80a70ef42be1@linaro.org>
	 <3ddf1b76-8376-4d56-837f-c9b06d04af94@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-11-17 at 09:11 +0100, Krzysztof Kozlowski wrote:
> On 13/11/2025 14:31, Andr=C3=A9 Draszik wrote:
> > +			ldo12m {
> > +				regulator-name =3D "vdd_cpucl0_m";
> > +				regulator-min-microvolt =3D <700000>;
> > +				regulator-max-microvolt =3D <1300000>;
> > +				regulator-ramp-delay =3D <6250>;
> > +				regulator-always-on;
> > +				samsung,ext-control =3D <S2MPG10_EXTCTRL_PWREN>;
> > +			};
> > +
> > +			ldo13m {
> > +				regulator-name =3D "vdd_tpu_m";
> > +				regulator-min-microvolt =3D <450000>;
> > +				regulator-max-microvolt =3D <950000>;
> > +				regulator-ramp-delay =3D <12500>;
> > +				regulator-always-on;
> > +				samsung,ext-control =3D <S2MPG10_EXTCTRL_TPU_EN>;
> > +			};
>=20
> Please add here brief comment that ldo14m is to be defined per-board.
> Same for all other cases which are missing from common DTSI.

Sure, can do. I assumed commit message would be enough.

> > +
> > +			ldo15m {
> > +				regulator-name =3D "vdd_slc_m";
> > +				regulator-min-microvolt =3D <450000>;
> > +				regulator-max-microvolt =3D <950000>;
> > +				regulator-ramp-delay =3D <12500>;
> > +				regulator-always-on;
> > +			};
> > +
> > +			ldo16m {
> > +				regulator-name =3D "vdd085_pcie0";
> > +				regulator-min-microvolt =3D <725000>;
> > +				regulator-max-microvolt =3D <1300000>;
> > +			};
> > +
>=20
> ...
>=20
> > ---
> > base-commit: edf57d8dafc63f9298a209e518ea6a2e0df78ed0
> > change-id: 20250603-s2mpg1x-regulators-dts-aea4bde3dff9
> > prerequisite-change-id: 20250603-s2mpg1x-regulators-7a41c8399abf:v4
> > prerequisite-patch-id: 9d4a1e0afe6eb45dcd35a9537b7d5b4e35e801c3
> > prerequisite-patch-id: 928fd84e5f6207a2fd98dd8372a91df0776ecfde
> > prerequisite-patch-id: b87abb6b9a8fc104f0f752bca0e9347d17de72e0
> > prerequisite-patch-id: e053834e5bec411f5c512b63a3528e49aad11ee2
> > prerequisite-patch-id: 4fdd195c0b3fea537144ac8d82bb40a38cbde117
> > prerequisite-patch-id: cc716fef97d6c25c0589d7269b8f34e04ea96216
> > prerequisite-patch-id: 20ff503abaf2fcaef4328e1f8009ed3df242bad3
> > prerequisite-patch-id: a0d80e8f49401dd79a7e4dda2517e00228aa3087
> > prerequisite-patch-id: 2368af876ec7c643d9765d3fb1e9bc4991023a18
> > prerequisite-patch-id: b70d5648790458e72db82e26b180bbd7301469b3
> > prerequisite-patch-id: 92be1aa6f95b2a5795df84e11a602e97a41b2938
> > prerequisite-patch-id: 86625bb109da618cbb8aef07fa717257918077b8
> > prerequisite-patch-id: 2016c6cd5e0d51daddada37232e3b99c8f4ad77b
> > prerequisite-patch-id: d323362e84d3991bd949745579aec34897620321
> > prerequisite-patch-id: b1571de42ac7dcf0fe8ddb77650a656244ff751b
> > prerequisite-patch-id: 44ea2393bc4df716427cbac9b7f080a683ba1c0b
> > prerequisite-patch-id: c968c5b557897767bfc2629de79b1ede8ab48767
> > prerequisite-patch-id: 221800199a94e12e928dc9606c82b6eb33cffa3a
> > prerequisite-patch-id: c76d8055f620e0b5fa81101a31db08fd5a60e773
> > prerequisite-patch-id: be0027a934451be02b1c4653bac8b6bc2ae2bd85
>=20
> This would block this from merging, so then please add RFC prefix. But
> probably these are not actual dependencies, so they should not be here.

I added these to highlight the dependency on the bindings updates, to avoid
validation failures. Looks like the drivers in that series will need some
updates, so bindings will also be delayed.

I'll send v2 of this here once the other series is updated, as I don't
want lingering DT validation warnings :-)

Cheers,
Andre'
