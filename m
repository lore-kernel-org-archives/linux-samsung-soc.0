Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F622E403;
	Sat, 13 Jul 2024 19:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720899350; cv=none; b=cv8nshIJGb0rCpm5cvgGXbVhQmTpq7kCrzRr08Pv2ksWTwehmH3UwMH54KMAJdWSbkKmZzoKK93zEOsv1SCaTamRbFzHPXz2m0LD3XVH2age71pZWTZeZ30hqgQDlxDtRiqw6KfeGLCsOBQC15Nfe1MXArqAmRE9a9vrI2SMHeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720899350; c=relaxed/simple;
	bh=JI1tEridxdctNaX89ov4Yc87xBCfYvi+2O/1VIJixwg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XTy9Wz96K49lxx45BjU26/RkwQmkblkU5IcVWo6aoyISrWFNvEjGEFtbO07TkWfc46rNdtjrF/efVahBS26RqV1x9uuj4imyTrgj5MmMGJO6qIhmyJVpIQSDaqvFsm//cxw0gN8sr8/8mD2K7b99U+KT93IyshrcgJySJfvjKOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7lYDktb; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7lYDktb"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a77ec5d3b0dso407513866b.0;
        Sat, 13 Jul 2024 12:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720899347; x=1721504147; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JI1tEridxdctNaX89ov4Yc87xBCfYvi+2O/1VIJixwg=;
        b=X7lYDktbFZ5dADn0mEuzssM3k2k9xt6hFcoSMM/3W6LIv9Jnl9AZNV4u1dEFW5uFbb
         psNmcKJM4DO6LqsMc5mFnfZ1yqN8/jGVVWCyFASliHLYa6axNsGvQDTwf5+x0/4VSCBz
         LcVsrHoeoT/F6Iddf8xA2tizjUb2OGlg2DTFfCyFN9XCT0vyd893pT91Y0G2CDgn8xfF
         abMVEWgeKcDH4Coc8tLm7KziX6lB+Xx2kFzpfZ7hZxh+OIrPhYjoMSvvf0mAuNXCY8s+
         GXB36RYf1cuLCQfnl9SuuG0xClUU5YKrqf43BLEuJ6lRDfOm76Wj+PJapsPX9OkiSZXR
         Xakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720899347; x=1721504147;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JI1tEridxdctNaX89ov4Yc87xBCfYvi+2O/1VIJixwg=;
        b=PxX3x701tr0BD2OT6cB6cx1WHblct8V5tT1mef9Vcib7IyoDasLXxyHhkDzAfWJUHS
         j3Z7/qFW+IZZsybJSE9OsuDpDYWUvdiLmP/GCHVtXOBllIAcy/8EEXbLGhtRYgqqBWhy
         rZk10tssneTXzepi4OQCCWDjXPjNaBJ/iYmK9hwO3ukRn2PU5lfjecVH30eS4/Aowpyv
         kpbgVarHDrfv3Os99z7AqMX7i7KjPZzJI8+/S9P3Ml2ekxpttu/EoYu7lAQh++igC17v
         jYwsmoITbWg3EXgXGhxTXTc3BMzCJryyHLSfomfETb0cxeYJLGp7jOtVQoiEkTzl8mBm
         uzqg==
X-Forwarded-Encrypted: i=1; AJvYcCXIUBvQRoxXMIuHPTIh00ZxfbIsTSGKk30iU/ETmLNzaFKQJRCXjKkdZCbt3sMI9YEKbn4LinpwlPMq1kEsXxqfKbOU6Cjh1jSu1K2p0w3IP8C0nLqRSrVUuLN4mmOEaQ60+Dkji40+jxtndi98jpFHWvQFOIizk7wfax3EnSxknFDqgIlSIiVbFNLb
X-Gm-Message-State: AOJu0YxZvYokUeRAI905rAOogN+L7fSJSSgQjv0oGc7Gg7uasZlbBqV+
	lrHsfYNtJkZ+UWa2QW7GSYfyTGnNAyRf7KZGLzRcuH1cPhCxmtEE
X-Google-Smtp-Source: AGHT+IHXffw7T8Mk052bMqhDl0uBwFRitClxFfuNYzi+bLxpKaZn5JcYxOlT6tnDVeUZxPhri5bhSQ==
X-Received: by 2002:a17:906:dfc3:b0:a75:360a:6cb0 with SMTP id a640c23a62f3a-a780b6b3644mr910156766b.29.1720899346894;
        Sat, 13 Jul 2024 12:35:46 -0700 (PDT)
Received: from ?IPv6:2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78? ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7f1cfbsm72789066b.107.2024.07.13.12.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 12:35:46 -0700 (PDT)
Message-ID: <813e0467c323db2eb3bd6997764fcd33b99f6290.camel@gmail.com>
Subject: Re: [PATCH] arm64: dts: exynos: exynos7885-jackpotlte: Correct RAM
 amount to 4GB
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: phone-devel@vger.kernel.org, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 13 Jul 2024 21:36:20 +0200
In-Reply-To: <9cac0d59-47cd-423c-bbfb-952981c49b9a@kernel.org>
References: <20240713180607.147942-3-virag.david003@gmail.com>
	 <9cac0d59-47cd-423c-bbfb-952981c49b9a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-07-13 at 20:54 +0200, Krzysztof Kozlowski wrote:
> On 13/07/2024 19:58, David Virag wrote:
> > All known jackpotlte variants have 4GB of RAM, let's use it all.
> > RAM was set to 3GB from a mistake in the vendor provided DTS file.
>=20
> Hm, vendor DTS rarely has a mistake of missing 1 GB of RAM, so I
> assume
> there was some reason behind it. Trusted apps? Some shared memory for
> other co-processor?

Honestly I'm not sure, maybe some prototype had 3GB of RAM?
The stock bootloader does update it to 4GB, but the stock bootloader
also doesn't even respect the arm64 boot protocol, and doesn't let us
change the kernel cmdline, so we don't like using it.

>=20
> Anyway, if this works 100% for you, then I am fine with it.

Yup, works perfectly!

>=20
> It is too late in the cycle for me to pick it up. I will take it
> after
> the merge window.

That's fine with me.

>=20
>=20
>=20
>=20
> Best regards,
> Krzysztof
>=20

Best regards,
David
