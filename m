Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95163387349
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Feb 2026 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770187562; cv=none; b=IPP1fn/GplbMXh0RBHYO9GoTKleY4cu5AWpow+3KtGgC4NsfyaYLVFhaIwb4WM/BtfFghdt2F0vaWftXSVNryYbglhAqn4r4NhNenAiQpYq9q+nOcnqoPi+DmkS43rjCNqkfXD3fJ/VQFZfYKs0Bkt/xBd/2GLs6AweCsL6TEY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770187562; c=relaxed/simple;
	bh=IdONEzeO/kcku0TNPRScc8YoDp0OPcTwD4lfoMWDGls=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N6vnN9w08hWiO0vkujXPB5C1sIgVXgtcWG5zp6IZI476Eaw0xJ5ISl6+Otd4Gxs5nAyCTIEYphWyg/+SqjvSKzTkF8FqVV1ZhiGBNPMW5nK6N5Gc5WM0ta7NlEDE8IaL1QRX6s9e/+k3aDMgt9qeli/w2wX7CjJ3C8NaMq4d6yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MonAV9Wt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MonAV9Wt"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so51500895e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Feb 2026 22:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770187560; x=1770792360; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IdONEzeO/kcku0TNPRScc8YoDp0OPcTwD4lfoMWDGls=;
        b=MonAV9WtdyE7UMKkwNZh6mmFeiqnI7HjPePX1UpVAEJa/uIbRessX3pQTShd1OxggQ
         wf3O4s29UibTQ6tdFC+rqh+YThiEUz715lmKSkCHWd5usJBpbq7L1PYrSsUEPgz478QU
         U4HMVw+2YuO7p/tkvZvrTOGRxiTeJhWWR1VsIfoN0MOjhSjyoH8RN2ONnCScBGK245WB
         lzrVu6gpPF3syjHUf4FO+95cHMZo0N56o1EKOBJ81CiJsMS71jERgHSAHMKM1qLWEL9L
         LESXIxXOMKnuYmx8Gkb6iih5wlvAxAoSK/dd8ahoYIXcKii2BbMAaKQfNXn/JltkS8QF
         MM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770187560; x=1770792360;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IdONEzeO/kcku0TNPRScc8YoDp0OPcTwD4lfoMWDGls=;
        b=boPRho8SL3+yNBJAG/hnqVtGSD/jVqpr7tq+TgXl2dL26fbiM2q+lE51fnDghOiojn
         QOi9pl0PZb1fm1QdgYOCLPYnVlXPLbx64FY2BySVCe+3eBzf4zSNHT+yvAySUbURZtg9
         Bg7ya+/qTAId0JATKlcLZnK3m5MHNKAypKNlcGYh+5sCWhH1Gfqv4Nr16yq9/PHJdTFP
         OwuTRgixYMUVrS2d5Nanib6o7Q+0M2IupNKUcZxVd+u3ToNTzinHD+TsvuYmU0MgTvwd
         Qpa+rioBpMkq8m/1SMqLbjyiP6ksYYtL8CLtk9kON6BsaqiAoVMYsdHMrzwSgUtRNRj1
         SE3A==
X-Forwarded-Encrypted: i=1; AJvYcCVvMwouXKKXBkVwH5O2kMJq5JG6LFHSPCAkj+4q/jSTzSYzsWT8ufSZPOBkj1uR3R0DmBh0pPGwtqzPB+6Ksz7DYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh2AIzsEqSwletyiCibiYZmP+5vrbZg4qSMLwaiKVGfvX45aVK
	v6+scLmeKtm0/hPXHMAPVDiFQJ+exbOiEm/8QS9NvlCbZIQAROOhimoET3yX4OS3qRU=
X-Gm-Gg: AZuq6aLwAQHkAKbvaBPLtBoXnKm1dVs0yUUulxSaqcyHHxT6s7qsAl4sLGSZFpHuHb/
	9zrC/wExXTUE0PiDRHJ9w51/BwCX6sOmgArsSOZ80wT2jQ6avmSTgGF7xofM7pGr4sZY9y02JQZ
	Ah8wHZLCJS1oD0bC/kdUwdPKaARcRoEiREdw4FZrTMD0JCoV1Kxy/F9Owsj49yE3pvPh1W74tPE
	UB1A+G6Wqh8nofCE/PeLiRzgG67JregJWs658yU1K+5oRGawO6mKiKz40luUuLiNK+wcrQK9L9B
	3xWfyXjGN+9em8fXSdeahJqJg5jqv8/VsJ8zj0ocyHFuIhY8yy2z+PO+QNMxFMaXI3JE4Q1K57a
	hNa5cFZirGTteeTNxOMKmEVIO3lZUxBD9/0iodUwSP79Pjta58vJXkC4sswHdAuk3M3z4spO5ej
	8X6u0NwbCGKqsuJs9Ljg==
X-Received: by 2002:a05:600c:4fc4:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-4830e95d692mr25283575e9.16.1770187559933;
        Tue, 03 Feb 2026 22:45:59 -0800 (PST)
Received: from draszik.lan ([212.129.76.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831088d318sm36527855e9.10.2026.02.03.22.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 22:45:59 -0800 (PST)
Message-ID: <977c081395c664a110389255e0cfa7eaafac912a.camel@linaro.org>
Subject: Re: [PATCH v5 3/5] mfd: max77759: add register bitmasks and modify
 irq configs for charger
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Wed, 04 Feb 2026 06:46:16 +0000
In-Reply-To: <20260203-max77759-charger-v5-3-b50395376a5f@google.com>
References: <20260203-max77759-charger-v5-0-b50395376a5f@google.com>
	 <20260203-max77759-charger-v5-3-b50395376a5f@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-02-03 at 22:50 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Add register bitmasks for charger function.
> In addition split the charger IRQs further such that each bit represents
> an IRQ downstream of charger regmap irq chip. In addition populate the
> ack_base to offload irq ack to the regmap irq chip framework.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
91 +++++++++++++++++--
> =C2=A0include/linux/mfd/max77759.h | 204 ++++++++++++++++++++++++++++++++=
+++++------
> =C2=A02 files changed, 258 insertions(+), 37 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
