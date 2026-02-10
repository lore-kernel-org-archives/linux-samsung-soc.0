Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0F82D838A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 11:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770723998; cv=none; b=dis6EKYrPid724JCHhx7lI+MiAmmG++Lzd6YaqZoaJvxUNoHdIvhnnwEgOfCUSWT/NJcJWovGdH8dkGEVfXKcDbrpzJBgEGecEEXmDeHDKjcH2uTmyYMgIwHV8/PxUxGeq4rTHNnxdPk+6zNHB3ZYPxvI0cImnlR1kNarWtojXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770723998; c=relaxed/simple;
	bh=zc5tflQ79bUhmMOCZPDFHjXYBcQcDGycOKsVYYk9oQQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KM+nt40m+VZmDkZFqt1WmGD0GT9Fs1+++l4PFGBJXI5CRQb50Es7cwTAmyZ4ggnOiCcsTG8N2cPnQ/SuXihrJaTHIp7FUA4Lry1y2sFojsAVREpsvulwj2D8wO/6Jzec7uKZqUwe1i6aJSDD5XUEmBLYqmV0a5wMLZYNvqSo0h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I4ozTvC8; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4ozTvC8"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-65a26c220b6so147395a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 03:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770723995; x=1771328795; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zc5tflQ79bUhmMOCZPDFHjXYBcQcDGycOKsVYYk9oQQ=;
        b=I4ozTvC8sFSui3fJZpM0ZeWbMtjGFIisRO/xYqIkbwtS17BC94OWrJ6Uzni+um8Trx
         8WaH/WJ/AGK3dsbLZrKuehvu94v6H11C2FUzHgCXeQH5nxwaVpgntGOn7UfBAKOB6Dtv
         je+KlpnXQwB89s6AFE6z1Bex20Csppnm+JZvsUEUx0PC5CuyTHDvuzr8c+NqJ4iLr0Pk
         ehABxddwMztCeLkLc1GcHbEMucoOvn2DV8FiZHxBWZ9vT+hpzk0mwE08KiVDxUGJDwnx
         3MePQUVYvQnyfwHykY+1bu0YHx2h5sGXGiRO8ocn+89EfP9+8oL0eLJdKfjQ9FBIKA9d
         GYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770723995; x=1771328795;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zc5tflQ79bUhmMOCZPDFHjXYBcQcDGycOKsVYYk9oQQ=;
        b=CRiSTTRmtIM6RmBYsaznlo48iJa7FmRtutwm5IqkYmI1t+4te4GqaYIchheqQkv6I6
         J96qAthfCqiLBBjwxgsFe+zqpHVtxIsyqGy3QOyNdgO4Myj0/mVDvaDRorZZiZSItkqP
         yEMKU5UZqMBokPiN6WM3kYPfyZvH90STPP7uO/RO1MS7KZmSCHXsKfkf+sE/omJD4nH/
         73RwQLU8gFG6vcgU6rNcu5l5QPpR60NHdvn0ma5XjCpUxPiZpLPq7OcsXX76dLuYZ1uC
         XYKaW6DWOegcmq6O+XEulBN7Lpy1yVlIeRG/uPEVwwFkuxieCM9p+B8wWclPsxUxcU/O
         ZSrg==
X-Forwarded-Encrypted: i=1; AJvYcCWn489pe1dUyQrhtV5lsNo0xIseuosLOGcCnYDoic9qRcQN2NLSrp4wcdbDsTB+NvmMCvmY5BLC5Bo+VJR2cxgRPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6P8760yq8A3Nlh5gg18lD9izYCv4RK62MujoPm9bGa9aneXV9
	AQ1ve2jSQ0HKjXuFQlEHmdF1fAwcQGe+iuHLXayXKAxvxruq3X5BU01GHkEhsR+ekpI=
X-Gm-Gg: AZuq6aKI7nuRn6idFnsdsplPAp7Zns33IQrGeOQgCGmGEpMC40xnlR9edbr+Ur+o8vV
	nm7QnPXrHcJ/RtLqaKL3CWo4T4oYRDDsYR6LwqK8cdIT+Igd3W8kQj0sOG4vCuS2DFSUXMv1a3g
	kYKRPan8BAFjGsX/EWE69ll2LF/SSErNRaLVhhzUNIgo82RkmchHsVKkuHqUW/A3Lcd9Nxm0DEg
	2IDPR7UQUKeuMithwy5IDyUc+y2o2VPfBDFU8vbFUFrIR5gC+q/agao2RPofdGWT+5DSv/zRS/4
	5aq+AvMhz1rrI0HwrhyaCCyGDIHMwBs1JDhyUpU/KmVzEO1cyk7E9euWPknfchWgeuVkEiV23vn
	duWc6GkhJHxHxaCssI42OjjctAk7Ce1X9VHQPjSwXuhGXSO4WkzGJgokVTno12g700tWO40NbTt
	OY/Zzs916GpQdIIqEw6Ur9CUWwkVxiXw==
X-Received: by 2002:a17:907:a4c:b0:b88:637d:aa75 with SMTP id a640c23a62f3a-b8edf378326mr922391166b.30.1770723995271;
        Tue, 10 Feb 2026 03:46:35 -0800 (PST)
Received: from draszik.lan ([212.129.79.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae3ae99sm530445566b.60.2026.02.10.03.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 03:46:34 -0800 (PST)
Message-ID: <81ef51394b2612368bceb81466dbb090260578e0.camel@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: exynos: gs101-pixel: add all S2MPG1x
 regulators
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>
Date: Tue, 10 Feb 2026 11:47:02 +0000
In-Reply-To: <cf4073c76c2db84fd8fac3e1c2a63918bf9d45da.camel@linaro.org>
References: <20260210-s2mpg1x-regulators-dts-v2-1-68783c9e0a32@linaro.org>
	 <cf4073c76c2db84fd8fac3e1c2a63918bf9d45da.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-02-10 at 11:38 +0000, Andr=C3=A9 Draszik wrote:
> On Tue, 2026-02-10 at 11:30 +0000, Andr=C3=A9 Draszik wrote:
> > Most rails are the same between Pixel 6 and Pro, with the following
> > differences:
> > =C2=A0=C2=A0=C2=A0 * only Pro has UWB
> > =C2=A0=C2=A0=C2=A0 * Pro uses l2m, not l14m, for TCXO
> > =C2=A0=C2=A0=C2=A0 * Pro uses bucka, not l31m, for NFC
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > Changes in v2:
> > - add comments for board-specific and unused rails (Krzysztof)
> > - link simple-framebuffer to display regulators
> > - Link to v1: https://lore.kernel.org/r/20251113-s2mpg1x-regulators-dts=
-v1-1-80a70ef42be1@linaro.org
> > ---
> > Please note that this patch depends on the bindings updates for S2MPG1x
> > from
> > https://lore.kernel.org/all/20260122-s2mpg1x-regulators-v7-0-3b1f9831ff=
fd@linaro.org/
> > for validation to succeed. Almost all of them are in linux-next, but
> > patch 1 from that series is still to be applied.
>=20
> =C2=A0 ^^^^^^^
> patch 7

Krzysztof, could you take patch 7 of that series? I expected them all to go
via mfd and/or regulator trees, but seems final decision was otherwise.

Or what's the best thing to do?

Cheers,
Andre'
