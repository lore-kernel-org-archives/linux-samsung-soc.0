Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE5C4D8DB1
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096992; cv=none; b=m+AhdwVx9P5fZA5T6ia87N41/tYKXqutn/GmAmxvXAKjVSJpp/l8dP5hm5hjKI0scRfOINYp3VmKEZTrew46gAB6aZ1T1WeGSY/31GjpPV73qY7yVkapmhyNpUp1wZbrlFSR2uqYErRt5rFDXr+7xgPAil51XN6Dkp8dNcfatyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096992; c=relaxed/simple;
	bh=+e6wsl5d67gepE+dFjWdKbJ6vjQoBdZjQhDABfPMTsI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AOdvqE6p58wFK3dY3nVNCXewJjzOIbTK5o28oztGwx/ZtMlvYXcxmEvK+W31zqx4q/v1oDIrrGl89oz5hrr7184dxKRafeAvfFB/yY5+kZoAibaHejTdORIhzAzaewbg7H5EIUW1wnPnqeFHyYlQQETgMuJi4KlyUakiiLV4cNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLc348yH; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLc348yH"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4801d98cf39so9051745e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096985; x=1769701785; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+e6wsl5d67gepE+dFjWdKbJ6vjQoBdZjQhDABfPMTsI=;
        b=SLc348yHoHg26UnNunRhyrescOI5qvVkN5xUjhfwkyu4I3hisalmDptiYWkPbuxWtJ
         C6sFMS23VUuNv8VvLfd5eeMaCOk9lGo8crjO5IJx5T/+yoMItEl/hDWJMMn3w9vVJBXy
         0vY/RrMvEzOZF5hq60fpAekJtXNJBP4zN7/RD/vaPBgPqGud3Ei06hRh4tLVABYgibaq
         HaT14NjVQqYN5/DPr+o3jP/Z/bcAoJWDTYpajNx2/v6IBd+s138l4erRwnHkdXr3zVrR
         gcSUTJvGKpn7e9W7PbIEw5b6Vb04jx5rpMZjTvglYNWkTg7Y7M8RdN3/B0Verz/IdpFO
         ckew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096985; x=1769701785;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+e6wsl5d67gepE+dFjWdKbJ6vjQoBdZjQhDABfPMTsI=;
        b=OGrAhw2HHZ3BXsvixKo8R8i6KgVtlBv+iekIRJuSzf8viwvHtD2jQtA5a/z+1suSMH
         zMa5QRRtKxObWFTKdswZYt4lyWXvnZgQ7ZHwizpRpHgsjUkppY+Ezme2DqZzvyz7RaEj
         N0vjyCTRN5PxRX96nrcLjOlP6bZKSLyE+9kAeP1PsyLbyrZoPQwcSgIiChlsIy8Lnk4m
         sqmjqVs3fOh0VOdqMYifj0ymN85b1EgHs1clSmMAv7hhWfclfkzzTPabC+F8giJPjpUz
         0Y/74j7ObYumSl2uO7yvVHI/pV/2ToE0UGBRDU9KGU2wUcTBaJbnpSSu76Aby69IxIhn
         g/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWWjQiCX0KX9zuNZ2NtMOl65z6t01ctQ9QaM5VojH4P3FWzGu2994uNNFOAfrDFIDDrsvXEcHyJSCumGzE0QgJAqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhSWxHHeG9xbb3kYoUQj4dxGIKgoSQFv08Lv/sVn14U6BGq64S
	WjOaDgAx2BF+iTMWJ5sDE69Lt7fZppnl3gQAOVQYSZDA+2KLttffbGbfG602KqVLpvs=
X-Gm-Gg: AZuq6aLEfksp1A+IP27Jv6TF7foUKzLu+W6Juc5vqyORW76e4x3DEHHwSexoCTv63IT
	I/Zfh/60kpikkduo6MNNVoJJDed7l/azbZLuwcL9Ox3jCcRfZ4AUbLsPMbbM9N9EUP29kdqwdRP
	HX0RQYwpnbvK+PTaTFnWdeDjEPz7v+76gvZrbpniZUuSL3cK4iF70+aJaEDGjzkR/WyThoTPKCq
	7GRmx7W1K3ZCb6k104w/3mAbnAYIHxSkghEnaYAhD1yHPx8GnEyiNEITbVQzb43G0YfCRKqJQrv
	2oNG4gHIf+2buB2aI+FmF7uVjA3DrMLNh+joitz2wqjcS1+yAcAQZp0FvwJCaKUc0o0pf/TgEwH
	d6h7WTkJxDM1TeybO/2QiE+y5kAzqNE9SkGfVjc+Kwrg9VnkHYivqghI9eao7NY69qpQnH8OHwz
	TxFwG+HZ+sxwUiTaxDcwxkWolr8hJP
X-Received: by 2002:a05:600c:8209:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-4804c9aff3emr1043695e9.22.1769096985161;
        Thu, 22 Jan 2026 07:49:45 -0800 (PST)
Received: from draszik.lan ([212.129.87.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480424d4912sm56957665e9.7.2026.01.22.07.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:49:44 -0800 (PST)
Message-ID: <d6f25eb87630f2ce6a155c8ba758a131187b5aa1.camel@linaro.org>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski	 <brgl@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker	 <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>,
 	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Bartosz Golaszewski	
 <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 15:49:44 +0000
In-Reply-To: <20260122150634.GK3831112@google.com>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
	 <20260122150634.GK3831112@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

On Thu, 2026-01-22 at 15:06 +0000, Lee Jones wrote:
> On Mon, 05 Jan 2026, Andr=C3=A9 Draszik wrote:
>=20
> > This series extends the existing S2MPG10 PMIC driver to add support for
> > the regulators, and adds new S2MPG11 core and regulator drivers.
> >=20
> > --- dependency note ---
> > This series must be applied in-order, due to the regulator drivers
> > depending on headers & definitions added by the bindings and core
> > drivers. I would expect them all to go via the MFD tree.
> >=20
> > The MFD patches in this series also depend on my Samsung MFD patches
> > due to patch context:
> > https://lore.kernel.org/all/20251217-s5m-alarm-v2-0-b7bff003e94c@linaro=
.org/
> >=20
> > While these patches compile, regulator probe will only be successful
> > with my deferrable regulators patches from
> > https://lore.kernel.org/r/20251227-regulators-defer-v1-0-3104b22d84cb@l=
inaro.org
> > --- end ---
> >=20
> > The patches are kept together in one series, due to S2MPG11 and its
> > regulators being very similar to S2MPG10.
> >=20
> > The Samsung S2MPG11 PMIC is a Power Management IC for mobile
> > applications with buck converters, various LDOs, power meters, and
> > additional GPIO interfaces. It typically complements an S2MPG10 PMIC in
> > a main/sub configuration as the sub-PMIC and both are used on the
> > Google Pixel 6 and 6 Pro (oriole / raven).
> >=20
> > A DT update for Oriole / Raven to enable these is required which I will
> > send out separately.
> >=20
> > Cheers,
> > Andre'
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> Applying patch(es)
> Applying: dt-bindings: mfd: samsung,s2mps11: Split s2mpg10-pmic into sepa=
rate file
> Applying: dt-bindings: mfd: samsung,s2mpg10-pmic: Link to its regulators
> Applying: dt-bindings: mfd: Add samsung,s2mpg11-pmic
> Applying: mfd: sec: s2mpg10: reorder regulators for better probe performa=
nce
> Applying: mfd: sec: Add support for S2MPG11 PMIC via ACPM
> error: invalid object 100644 11a56154d36d251d40b40e91da514db0faa15ae3 for=
 'drivers/mfd/sec-irq.c'
> error: Repository lacks necessary blobs to fall back on 3-way merge.
> Patch failed at 0005 mfd: sec: Add support for S2MPG11 PMIC via ACPM
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am --abo=
rt".
> hint: Disable this message with "git config set advice.mergeConflict fals=
e"
>=20
> Doesn't apply to `for-mfd-next` or `ib-mfd-rtc-v6.20`.
>=20
> Please rebase.

Strange, git rebase onto for-mfd-next had no trouble. I presume you used b4=
 am / shazam
above? Just trying to understand why the difference.

Anyway, rebased v7 is
 https://lore.kernel.org/r/20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@li=
naro.org

Cheers,
Andre'
