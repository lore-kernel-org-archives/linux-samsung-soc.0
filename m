Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C35B37F00B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720050; cv=none; b=bqFxE30LUKrteXsw7lJ2N8yLR0DT05kAFkroPDnBLRM/2cuOINSLuOFHQcpOG/DoVFV2u0gkpFxO38w9CXGArNlIdd6EeKJ3p39drs0hR6+QAUvkCfcbdM5LogW8x5oYjPEb6zIrIEsVrg34nPHP31BDew22F2pbofxg80bBkX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720050; c=relaxed/simple;
	bh=YeoWLTkt6g+7QQ/XCxHLmavHJDwmMxaxbM6DKy497OA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dB1LtGac2WwrTfQDPJG9JyaYc0aHWE8zLbHutLlPtR8pBew6WcaD4D/RUCUDNzNQEhcDaHJ0E2rlONHxNvoPOhVQ1kAb1Q0Vxb7jn1zo9zXERIz9HC0oYndqo9gHFJUv6OPFzi9UKMe1omiTlJccUBdTkyKLkxGCJzwpZ3TFmrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dlBWdqDB; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dlBWdqDB"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55eff0so63980366b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 01:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789720047; x=1790324847; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YeoWLTkt6g+7QQ/XCxHLmavHJDwmMxaxbM6DKy497OA=;
        b=dlBWdqDB98VlAbFVyNLGHbECcRvQsOsIZQ3OuO2lBnzd3LAakvCtFxbX5dmkM7Dx6F
         lSl1v8Bc/++kOkn3YYItf0PhlICnUE/+69zvJ33u+w1kg4yKaWPPZ1XoHLQry17/Zeeh
         yYjQecRrwHo++gw3JEL7ZOQ+nzeHDuwKvkQDJ2ZgpMumZB45LHUUEJO1/6eGsMmTde3z
         7JLMhnZIB0uvs245H8pcU0Q2108PfY8HPN4tVi7RDQbep4b+0/ZSzRg7txalCC0YtUZN
         RjPiV2LENxGAJCS4G83ttbF1KyEGUDaOkKTJQgYBI2fq/oi9KLt62DAjiGppBOPCIGqV
         oonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720047; x=1790324847;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeoWLTkt6g+7QQ/XCxHLmavHJDwmMxaxbM6DKy497OA=;
        b=E1NSWFHyOXR6xLk0VKAeiLV2wvpNrtsWmj2wXTyb81paMtVuppKiiifMGxLfKfHxEB
         dkGTMsqjw2WawvHN0+5tkrcxajD5CZqWSQd5Zpj8gJJIMl92WChZZlRTFMegaE15JLFf
         lbncAhl87MFZiCpA0hYTwzsR0xgdDRKi0EypNPClx2Cv6JNSsFJiTl2evdzCT5pJYOI7
         lqlMbgYKK937ogv6xIQ9v9fa9vNvITng7Ow1KGXNE/fn8qodE7gGn6wnp1mXRi34Oyde
         /0BKR6BPm8kHES4cdBK6wVtWuf3sAiQgoRE/z4gx/Uo1pdUTbm436lVF3ztg62UVt1E5
         LAPg==
X-Forwarded-Encrypted: i=1; AKwUvByYEFxHy+GX2M1loLseo6YC5qLIPpVktg+dYbxchzjfHRveOm72yaw+YtQsAv4tDj56WKPF1mhU6YcJ3l/xIgnEbg==@vger.kernel.org
X-Gm-Message-State: AFuF++mKwtv9N5RRebJ6YZ2KvdrUz6qna2XtmXFkuyVDseDKyVlc4GRM
	bMrw0NVbj69rByxz4EBtcaR46kKzNFmjs8ia8mOoXNQqRcBTWZ38SF4WGui9224G39E=
X-Gm-Gg: AYBFou1FtsILJlgGYjsPCLbK4gynPjclm1Bba7bmuDQSbdscEaQ+PSr1DMLcqGjS6xQ
	lcUz1zVCOHwBt5WMNUXVJbxY/DMuqgzUK+53stvoABHt/C7w/AjfIbsuSDH/a2+R5DE8kATlx+a
	0kdLAwyiFO1rouGmdliytS3mDWy6uSQiFgmP6SwkhBB0ZpptCNAnY2qODlTgRfjlzA5bEBgQpzW
	RyEG45fTRnTTtKSjZwKZIYHNqyykGAD67HhSAOUGaxMQ1ocL0HFEQKuwBNgsE9g43Azhb/9cEc6
	TF0aY1OEaKKCeUXxHWyU0LtcIQntLRIIuO2xi49jo1Bdsa2bYS1lGBTxq1eBEKYudGpIn61syn4
	RMIMWaDdroY2yIbGUPKJq2xrXSBlBjtp00WcHnkMyIYoy0kK/WOt9IULM1Qc0cIWwzvkUynee1x
	MkL9AZiFIHvoHGCVUBazjMWs5GYq/0fmmgcJkFybXN3RW9jL0vV900xrm4S8kVfYna9oFfN+7DA
	M8=
X-Received: by 2002:a17:907:d01:b0:c26:1691:b364 with SMTP id a640c23a62f3a-c2a157c2f4cmr178472466b.29.1789720047299;
        Fri, 18 Sep 2026 01:27:27 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb87e5dsm32871766b.36.2026.09.18.01.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:27:26 -0700 (PDT)
Message-ID: <6c762160b22cc801d26de2f2186717e41f7e640a.camel@linaro.org>
Subject: Re: [PATCH v2 0/2] arm64: dts: exynos: Few strict dt-style-check
 cleanups
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Jesper
 Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>,
 Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Ivaylo Ivanov
 <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 18 Sep 2026 09:28:49 +0100
In-Reply-To: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
References: 
	<20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-09-16 at 19:06 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Do not reorder CPUs because cpu@4 must be the first one/boot.
> - Remove applied patches.
> - Link to v1: https://patch.msgid.link/20260911-b4-dts-samsung-cleanup-st=
rict-continued-v1-0-9aa55051c42b@oss.qualcomm.com
>=20
> Not yet complete, more files will follow. I probably won't re-order all
> Exynos5433 soc nodes by unit address because it is way too disruptive.
>=20
> Best regards,
> Krzysztof
>=20
> ---
> Krzysztof Kozlowski (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: exynos5433: Re-order nodes to =
match coding style
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: exynos5433: Re-order propertie=
s to match coding style
>=20
> =C2=A0.../boot/dts/exynos/exynos5433-tm2-common.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 93 +++++++++---------
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 108 ++++++++++-----------
> =C2=A02 files changed, 102 insertions(+), 99 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
