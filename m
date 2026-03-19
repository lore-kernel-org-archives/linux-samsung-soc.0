Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4355D3A544A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Mar 2026 11:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921476; cv=none; b=GU8y0hvLZFLqnyyDJArCxgKI4kZnXFeAWLDgH2+Qs0OgHWAZ/rXzzMiMT9h4aBjmDN39+2xocGDAcWTgYLGAwpwhxtxMKEzyaVju0iHBDPuzBjKic0Br5LxQEepSUt8D0aEjoPzZb6UKdzRAbTB1gX4G2mKSBA7uSiBr2cV8Vpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921476; c=relaxed/simple;
	bh=yC6Ijh7vCR3XdkIrIV9yo00I9p5DCq5XZe85XCd2G6Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EAEaziU9vbWGyarRIBsT+oFfP3h1hK6HX3ZZnsUJzIH2iUwYwEwuayI6GFLa0kLibeKwom3O4p4w/W1+IoawSiZZxQQBfsuWyabGN5BKTLJEAU8NtqYf/tVBftCIEcJeP0JxFsxvffnJJw5bsMyKoMDoEVB4kzjcJOvImNt96/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N3+croW1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N3+croW1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4856cd3f1ffso8866825e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Mar 2026 04:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773921470; x=1774526270; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yC6Ijh7vCR3XdkIrIV9yo00I9p5DCq5XZe85XCd2G6Q=;
        b=N3+croW1c7ST5J6EHCB6cZhFtMCt3CFujblmcv9rU+YpIk5XbBR7diwuQ9dh88r5Ea
         s3gpqHoWW/GSSXNBsouH2LvA8pngRkWNIs2r20VG9PggrPD0vNOSaFMq3rN/QVG+As5l
         wMaSiQStyFr0Jn7eIup6GYOlWjWol6h7EBW9ET0Kwn4QNrqch89DBtvndzZb68YUUejZ
         1TSRsHd2hNlmRIuTCrnOvIzO3cHXU5gUQmRdoTAnlYn2CXegZolOwJgphhcl4uU+mQR2
         /Vd7L58+mMQ7pFJl/q4fEDrjyMQnTdXH6MrY4FgYc5wDz5EzvW3AqRxoZEgbK49bya/N
         rZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921470; x=1774526270;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yC6Ijh7vCR3XdkIrIV9yo00I9p5DCq5XZe85XCd2G6Q=;
        b=FrVtYaxf4qS0qOCArWikT1fBfeZvjqcmexytz8fwiOJbMta1ovQxBxLi0CKhxjV8U2
         r1sh0Jst5sWEHKuuwuKUyN6fnKwnvDCOX/GOpbhTfWaQCF1+HXfMaQrYOszkrELy0jat
         SotNbCllSu5VoRwI+lNOha7GDx0NW0rdclbyWboRN4ecu2VarZDwnwkJHlGa+A1Fs4qN
         /lgOm7t670k6y1/iI+z1CE4L5CCJeUP/9G2EqtC8otSaMbegq7qL5LyZtZuP0KUXzdob
         CweH1SyO7sAAEKmh7WZCuSFx3Mf6eBvVkguCQjYLGfSHWcSS2PU8fwh0jwBC930dIrwL
         RSIA==
X-Forwarded-Encrypted: i=1; AJvYcCVYqA/m82p0PNlmjattO1nJ4cYezU5ScOdipq+uC9g2puirw22yjxjZNoHvwxeS+EOw2i+Unv0jFG+0IpiNCmIlPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUAwdBOOIOKAHv9CQzp50xo6lSvxaJ/I965MmLgt42gkG4P4Tq
	eSrW5uwspzmg164HzQHDroTMUurrPW5Eu8yHrv7QMwl5Sa9wbEhEqb0pmBbdCWHGDr8=
X-Gm-Gg: ATEYQzzBC2XPjbl5/AQGd02TjmFd7yBh+SOivDV2AmKMmWxvv+OAJoLn4n5MKEMdsw9
	PazJPkIH7MJyX+UGe6dmBFaO45dCvRIb6EVMNBn+44l7PmX4yTfy8FulJQ4SnxSoKD1I15QRDYY
	8IfTTWUvp0LkfU/Jc4S59JUpgsOBi6yD8rGIpVcojDTIHQCZBt73AOZWvk4Ba1P20LIYGhTISmq
	DypBiY3pd7SWEOYWM7FdNorn9QeVbO5UiLe5sle1OkEbh1rr5fLtoYg7Wqu1fvn9sNTtoDqfGcV
	r1/8YCjKIhJ9HZdSc4EC0t5tOZryAG1kaghgyJl0B8uwNmjKMsjSrajzz7MZU9194pNWpzFK/jg
	lpTWMIODXVT5ysVEp6i9VikGL84oLIclNXMQG2AYKfQn/82/L55GaWlmC5IvA9Hl0+AG+Cz6sn5
	cXKrvluF8RI48BeBflbDmY5GP4oo0=
X-Received: by 2002:a05:600c:1992:b0:486:fad0:b166 with SMTP id 5b1f17b1804b1-486fad0b2c8mr30813105e9.17.1773921470276;
        Thu, 19 Mar 2026 04:57:50 -0700 (PDT)
Received: from draszik.lan ([212.129.73.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8bd5f7csm65030485e9.0.2026.03.19.04.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:57:49 -0700 (PDT)
Message-ID: <ae31c62c940e99077d44e1935465dce7db0e4c06.camel@linaro.org>
Subject: Re: [PATCH v8 05/10] pmdomain: samsung: convert to using regmap
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Ulf Hansson
	 <ulf.hansson@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Date: Thu, 19 Mar 2026 11:58:45 +0000
In-Reply-To: <c5ba58fb-50f1-4067-a099-97169ea81f68@samsung.com>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
		<20260318-gs101-pd-v8-5-241523460b10@linaro.org>
		<CGME20260319101424eucas1p2d5dca06240e8760046fb40507ffb3bba@eucas1p2.samsung.com>
		<CAPDyKFrprMSLOBMB_BHbi=j6UXV4dXBn-H8M1BsqDWNSCJwvuA@mail.gmail.com>
	 <c5ba58fb-50f1-4067-a099-97169ea81f68@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Marek,

On Thu, 2026-03-19 at 11:29 +0100, Marek Szyprowski wrote:
> On 19.03.2026 11:13, Ulf Hansson wrote:
> > As a follow-up patch on top, please consider converting the open-coded
> > polling loop above into a readx_poll_timeout_atomic().
>=20
> This has been tried and it doesn't work in all cases required for power=
=20
> domain driver:
>=20
> https://lore.kernel.org/all/5c19e4ef-c4fd-4bf5-88b3-46c86751b14e@samsung.=
com/
>=20
> Probably a comment about that could be added directly to this code to=20
> avoid such conversion and breakage in the future.

I am planning to revisit this in the future and am hoping that we can
figure out what goes wrong when using regmap_read_poll_timeout().

Hopefully such a comment would only be short-lived, so maybe not really
worth it? I can add it, though, if you prefer.

Cheers,
Andre'
