Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5154828A40B
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Jul 2025 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875460; cv=none; b=TBsFzJKCTObzW9r8h4+c7WQyUTt29ng+cFehwfru9NcVh7pCal/fdPQYQnQxepXCu4npiNNaR9vIdBM2O2z1Z6ojnr32RmlQ30fyft84tuC052oKSTqiErc6CpVo2yi8KX2mM+9vBP3vEFBaq2ze58VPPo54pZ6q08IpLDyMClk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875460; c=relaxed/simple;
	bh=IEoYgZVPqV6REtyvNEYkqmdU4AlOYV3bBv9n+zrtW+0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GPuZ2zMOLbpcEvcSC2+wfAsL5rz7V4B/Z38HcXbEMzbrh+yDp4Qjx3SbUpVlPDg0KQMXRIj/j75bvKtak+cviBPMFbAL2RaMWWJUVFMDbbHFJOut1v83WerzAt9DHNlik1W+zmwbnFOdv7zA9R4h9HI56R4Nvb/72+0P+OAZcKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OrAeMbWM; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OrAeMbWM"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a51481a598so1488057f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Jul 2025 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751875457; x=1752480257; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IEoYgZVPqV6REtyvNEYkqmdU4AlOYV3bBv9n+zrtW+0=;
        b=OrAeMbWMGSqIdFhUjy2qNfv5YBKOfuqvgNPSGBqk9aclu0IZgqRwttTG3akD7TAlst
         Dr5vjqlBcG8iOK4ZN9kQdgO4ShCmi2l1UBC4Tq9UWqGgHsu0p5ysxA+9Rlov7EXp1QdR
         4CYbcr+MD9/bdV6BagNrbqx7CTKPA0V8mlIT6FmTTMaJjJ9jSxSMH0plhbJH+rfDxIg2
         2Ze63+yXKmr991n7Z6jHYBientUxswE8D0AYyPNPpbZ37lPiOCYFzIWmMPVQKhw+ojAM
         kJzuyeSna28MRFSTRuIEnSR22BtxHG7bH9mx1pi7qckY50/UzjDA7bhQcpwAWLonaBOb
         0ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875457; x=1752480257;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IEoYgZVPqV6REtyvNEYkqmdU4AlOYV3bBv9n+zrtW+0=;
        b=HawQiF6OXFCiLyLca0J2CisfUUumfgc/YvOj0RQ3pfuXMlx3J4nBPBlODZBQ4hHK+j
         gULcwHjcB/GVLRPWgEbFhPIUnvN/Js214c6eM2U/OdfCfjNtIuxzXUyJjVHCQo1x1I8E
         ARnogidohJM/JVqFcG50drce3RYlhEJCDABmkWKRvwh3GExq4kXOhoBpUTMBhMRbzqi/
         BQTTCS+C0gtTeNqZW3zib4CozE0YxueMyKpcpLLWSgTHVkRQGqh8lpeDj1HW9hbmevMZ
         Vn32bjEUlK/3D/wf2q8N8lJxwW6dD63Sw0QnE5szeydAyd2uIZ6QPMMc67r9SK0ZOTmz
         RtpA==
X-Forwarded-Encrypted: i=1; AJvYcCXbtP8XFI2KeEiFoqgT0LyXTMsF2IVTsyyOYLALKuGcUgXqYEz4aMeXuZ4td/MH/UzGRScfi/hyxRFBRtdh7JVC4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzetawaL9zVDPe/LWEnnV1kG4myzJfSZ5IT33jgBAtFi/8hcIf2
	I4EEe24OOg6TJK8597ktKljcqf5gbXa2LCrqPUj1h3WBZOMKAjpm5ykrP6ngfgMyPMc=
X-Gm-Gg: ASbGncv7jm/rOFEWzGC9xagoUVfUnkZgMQnM9HT6M73a2fToxOjmaD4Smdqo5v9oNu0
	juDj0MX8pD31gJrSwFHlx1g+AsZZiNCChF1XW8JQTuGFhRd8yjCfUREQNOBLUtwcdpOLf+YVaON
	3zz9r9Y6N6HixrPoLNjvjbPrT7dZTQEyELY26Y2Rt4yNAJeo5zLAYa7x7iFxtAy/8EPL+jsj0bm
	MuINP1dYvuKMkXIntkEgQzyPhAej16lrjok3pue3UuJlfGiKhQ8O1nnpgP2W1pRVRFWjC30YOQA
	PfnqZcAjCrmWHgZpoTFBNL8jBn2yoLjlrPnPj654OPy0jsUWVYMfx6Q3MnFnZbtaPQ==
X-Google-Smtp-Source: AGHT+IHEIeX1O24CgOzuWsNBfkxeH6TOmmWEVLZJcsdlbgvxYrZII56COdsRCTeJJ4eyH1AmqDGCWg==
X-Received: by 2002:a5d:64e5:0:b0:3a4:e609:dc63 with SMTP id ffacd0b85a97d-3b49701fd14mr7926081f8f.20.1751875456566;
        Mon, 07 Jul 2025 01:04:16 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1698f54sm103519225e9.33.2025.07.07.01.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 01:04:16 -0700 (PDT)
Message-ID: <2e26f8f534284b280e9d5e8d4ae556a452e93ff5.camel@linaro.org>
Subject: Re: [PATCH v4 2/5] power: supply: add support for max77759 fuel
 gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Thomas Antoine
	 <t.antoine@uclouvain.be>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau	 <dima.fedrau@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon	 <will@kernel.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>,
 linux-pm@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Date: Mon, 07 Jul 2025 09:04:14 +0100
In-Reply-To: <CADrjBPo2=FajKA0t7TTMdH6iK_qbWCSJK-hEqh+UWEuzC7wyGQ@mail.gmail.com>
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
	 <20250523-b4-gs101_max77759_fg-v4-2-b49904e35a34@uclouvain.be>
	 <CADrjBPqOMOyHP=aQ1+fg2X58NWRp-=MJBRZfpbEhQsTzaZ9LHw@mail.gmail.com>
	 <bc40326f-db40-4657-84a7-152def2ca9e3@uclouvain.be>
	 <CADrjBPo2=FajKA0t7TTMdH6iK_qbWCSJK-hEqh+UWEuzC7wyGQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Mon, 2025-07-07 at 08:16 +0100, Peter Griffin wrote:
> Hi Thomas,
>=20
> On Tue, 24 Jun 2025 at 16:45, Thomas Antoine <t.antoine@uclouvain.be> wro=
te:
>=20
> > I am unsure about what to do about this initalization, especially for v=
alues
> > which slightly differ from the devicetree. I think for next version, I
> > will have the same parameters be passed in the devicetree like android.
>=20
> We don't really pass register values like the downstream driver is
> doing in the device tree. I think you will likely need to add a
> max77759-gs101-oriole compatible to the driver and then have the
> application specific values, and m5 gauge model algorithm as static
> info in the driver applied from the dedicated compatible. It would
> also be worth checking whether any more of those register values can
> be represented by the standard power-supply binding properties that
> already exist.

I believe these are likely battery specific values, and were obtained durin=
g
battery characterization by the vendor (or Maxim). They can change (with a
different battery supplier etc, hence I don't think basing this on a
max77759-gs101-oriole would be correct here.

As we learned from the Pixel 6a battery updates, the same phone may use
batteries (e.g. from different suppliers).

Either it needs to know about the specific battery model, or the values
should be passed from DT in some way.

Cheers,
Andre'
