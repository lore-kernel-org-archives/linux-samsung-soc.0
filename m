Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2CB2D3A6E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 12:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026560; cv=none; b=rWHvXzwACT4Fx+RKYL3Vs/8pC0adYJuW0ioC6aSjyapsxditvpcOLfg87djqJEIoY7Abxr5hlQoYkkKNSvk6sOCR1bomWwrvx4uV7mcjNsGrG1ZM6t2k5zHzSCfwsEMcWwmUpCrEPWPyW+vwuolk8eMwvCGcoymiqcJ8+LlGi6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026560; c=relaxed/simple;
	bh=5bnO/bwKwvz0W9dml3PFN0tff+1CpXP9/A1In0KM8MU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IRpGFyuyjbSyccoZ7DJNp2BZwlgzi8tprCwmKGS0I2+1IFBe0/RLswu3A7BXmPpCIIWLHdOLqi5uNztlHiwUErDcf0suAr1sqxBYmXSGPcJgbBLbmjmJ6AP/BJo3dZTjqhzeMWvN4uKpy7Cj/5j3ul+5Rat0r8Rb/70vT10v9zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fh1mssCM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fh1mssCM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so2085532f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 05:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751026557; x=1751631357; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5bnO/bwKwvz0W9dml3PFN0tff+1CpXP9/A1In0KM8MU=;
        b=fh1mssCMbwMs6+0c8SaQ1DL4WEUjPfHl44PEovi3ImZqcHUlWw/2iokUKIo5jtlw5n
         irNdOSQdtQp4h9+9NULTdwwfErSr5Ew+IAkMflLxbqsWHhrVg++4gARJR0OSwOWtQe9S
         xvdYt5unnfTZ7Go4UItxHEPC7cDqTJ6asy0kBxerZtXhjbDN835E063MTNT5KYxh5MkS
         euYZqoxK1WoMfNSnASUClEnoG6cx+RutnGcu+BaPEtw4N0kT5LSvct2rdddKBimxEyIX
         Z5xAkH5q6zMgatVEAaX8Xx3pmtaWtujrUsLR4zjaEHt8KEPlSPp82t58dRUKlWoL2BYp
         I0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026557; x=1751631357;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5bnO/bwKwvz0W9dml3PFN0tff+1CpXP9/A1In0KM8MU=;
        b=LBCG2/XVLkJDwXoW0O9iuE9QUHCkodHmDLBuA8/LVVj+/Gkwarg6O8WDM9bs3G1CNh
         ztJpWTYk9l/fAaDZsXC0IYg0B20RATdQ2cTF0oJ7p/EWjMwnZb1nSXL82bC/o0d2XBh2
         ge5UZ71o8ptTevcdOoLzFlNmQN1h5jyYYUXf5ZK2BcRLiC7S8TNuVKb1ejB7E1j8HWI8
         5u3KhDdKs65Ug1Wo7mHQ3Sl34G4xTVyNWFxmdcwdwXSQjt3PJwI1e5yBTAXvE92qaVhq
         KCh6KcWxp3AOHpvp4wwhGVbBqSJLogdttwJEk7jaX/ixOh1ELbLVrCaJGpO99ismG3HN
         KA3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJ8LYx+SpaH0OBC0GbRd+h0Ntf9Hp8kGXUqlhJPaBAACvKUoi9RAQT7cIY+wb8Vj7yZ5LqyioxDm3Q7irHr7D6Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyBrvqppTk1vtkv0qFi74P2y9b3afgcwcu/kkc8yMlb19PJ7Tp
	xcbdm/ol4sonRzKmnVUqtQN655tVtwDiEhVv7zaaeUT1GAdRvUv6KscetRbfTBMBX4U=
X-Gm-Gg: ASbGncueveR5U8wgK+YHau8TcCn9vd1O6v0qOP3IRmdzeiqajBZsxhbxFH0UV0+Kn56
	BaVf0pHuJ8PxOxlXvw+N1e5vSF2k+2PlId39I9mDJErrK4dWJ/io637X8uAuC05njCtBMcreecV
	I6ugTVUTjQdWPp03Sj+xT8VCEuG3EJTeMSODTa+Ub0xxn9EUNSdTgHlVXjZ+8LAhMdQj1AumQ2P
	Em+DmTLH0f3VAtQRX3N28lF7Yu1C2eyfGS7nqM15A24ARCguEbIUFh3oYYJMfneX97QLNam2bsb
	zcE9XJ1FfC+Rir2S1onIOGvjqAN0YnNWBo3GgM8mXPlbEkeXFh6lQFnvq4PQJ8+29lM=
X-Google-Smtp-Source: AGHT+IEQFM3pQCiRU5lNSKxbqFCgvUVf7e/LcmOK+L4hhlaL9cMKkmMb9g/3CGCF3L4wxugIwNImYA==
X-Received: by 2002:a05:6000:40d9:b0:3a4:cec5:b59c with SMTP id ffacd0b85a97d-3a6f3162238mr7238080f8f.25.1751026556678;
        Fri, 27 Jun 2025 05:15:56 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4076ebsm48177435e9.31.2025.06.27.05.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 05:15:56 -0700 (PDT)
Message-ID: <ba42a719df8dfb74406336e8adb80b5286bd6fbc.camel@linaro.org>
Subject: Re: [PATCH v4 02/32] dt-bindings: clock: samsung,s2mps11: add
 s2mpg10
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
Date: Fri, 27 Jun 2025 13:15:54 +0100
In-Reply-To: <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-09 at 21:37 +0100, Andr=C3=A9 Draszik wrote:
> The Samsung S2MPG10 clock controller is similar to the existing clock
> controllers supported by this binding. Register offsets / layout are
> slightly different, so it needs its own compatible.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Friendly ping.

Cheers,
Andre'
