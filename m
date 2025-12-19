Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C4A24A064
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 14:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766156230; cv=none; b=of/NKmbI43Y04AGVpbosMuk0IAJGQa546Tr/2G31FYqlgkgF3X1355tB9l+g1mXUp9qQXuRBja1ra84vUzs6/IleCMRa2p1IVXfFjflJW6we+bPe6rnsEh56/89iBGaWZ2GLaxQDu9r5Im7MIMiMlTSYbtvC9bRWEqECNoe0eNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766156230; c=relaxed/simple;
	bh=8wGFJgfb4wEXs8e+H5Ec45dLu3UmfZvwKEULZrNoyMI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nh/288qE5iq7fSnAixLkKNVid/CWvqcUULlqmj0jZpMacpVD5sEmJFxsAWypvfiYlYm1C3c/wwp4nozJFnbD+KxR113sAPzpTABhRNpAOpuPJSlfdV4fRrkL7wmJ5amfJVh7PuerdXYT5chLRI44pYlzbi8S52PHVj3LP0LbhIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INOM8+kH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INOM8+kH"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47789cd2083so10903755e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 06:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766156227; x=1766761027; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8wGFJgfb4wEXs8e+H5Ec45dLu3UmfZvwKEULZrNoyMI=;
        b=INOM8+kHvgdlaIm0/qVMNyeInM3E6tpkB6SUZ0Lpn2kXTtaGOouIatjvAyieH/+tjn
         HAAVB4qQVE+dwj4Yp8Tq6yqWkwb1a55sJ6ZAzuyMSACvwjmK9InM1C54VoMorWtCXUnC
         XrbfV5YxuBvFSs+cQPZUwtPT3M1h1O0dmA6KkPaJqJIgSnPTgjq64u3rl9uMYAtvkAAR
         VyG9fCF7I3fS2w/iRVpGNumiAy6GwKAhoSaG3eZ36ky6csu1u12YR4NFEvExiTZ6/RvI
         MORVX5IznHFKggVdBzLeOKX0YEzo1u4jZJBoId9p0Cmoig4UQIP3cDcrw3H7p0hkON+m
         +/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766156227; x=1766761027;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wGFJgfb4wEXs8e+H5Ec45dLu3UmfZvwKEULZrNoyMI=;
        b=hnwCgEKV5B3tWwI4NazAZYI6+rS5At1lh8McTjdDYNjruEptV6zwsG1jC+R51fgFZf
         hiw4URRHcrLj08r2ZpzHZ47tdZdRPNkhfPpkv5QSM7AzQbeHM/0+DnmfQ3xZ5/QQ+PwU
         4am/JF+Tzy14uMCa6/EYMgDil9iCdyCIe2ZSAkUbiynVfiMZTTTC0jJye3OccR9mv3RD
         yt9UQ0cf+iu2y78BtJMwdZdjISDVg4n7u1ados8dDXkdFBWaf2L3+RZ3EUqi7UwOaYpY
         uacRpDf4H/YAiJ+cfMoHaPNbQmjLHEa/Gvw9mkv+Ka/MkKoLz3q8uCYfNvuucOo0KFAV
         RFnw==
X-Forwarded-Encrypted: i=1; AJvYcCUfB0+Zf8C2+2gwT7kXVazAtCgN/tTN7IyfU/WNv6E0Df+c1jDquAQZC4OG2cKEAy9I4KiC6JXywrqsNDJPW8d3Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV6qOb8JgoXt5vhpHbJYMkCnPNLlhHOUhMtfTCR7RybovhRtPv
	gfBk6dKNVw/NvEFOuKZY9sytZb92uFdWV4ptIzOXc9QCFBssmgF2/CgOXnfg0rlYl/U=
X-Gm-Gg: AY/fxX7PYooy2z9UkCxLMz3jQhgWXJgjNK2FgHZ/Z8R9z8D+60iI2A9lLX6J4hzodLn
	dwg3cVQIJ5KnMqnTAt68GjB+zM66qgYhDS2TvjwFJxnKeqa1DnHoDCjB//rWtWAxYqYiDv1G3I0
	A1N4DI+aKS44T52TY6HAWLvgWaDoU4HQ1rpfK6zW+Vsp1Ud8yxK4SXv3Wq+dc6RVT/o/oMqSEg9
	fr0pe7yiYrLU4gc3+Ofz3BL/YF9T0+bRdGWwNuzQcDO/cAOiA45HTKUnRRc6UUAa6pRd0LB3BT2
	BLvM/tazi4I4qDKWmxAIHpsSE34c4rNvYt9cfvJVMDPe4q+PqauwaXFwsUFGj9qG/OHo0tDeTpx
	Rq2+BCaMp65eaJXnF0YhLeYxqnhrFx4a4H8UXibT5YCl0j2q7Pr3viQ8nFuzFZ+PiYu4zJwdujg
	iqa5Ip5qrWoSbDtcmPkg==
X-Google-Smtp-Source: AGHT+IG0kuzKihAK2EYClDOPCu190trNqH7HRizVwD4ck4omkH7iQRBsiAgdxyr0jD3KRQLHTUyGMw==
X-Received: by 2002:a05:600c:1c91:b0:47a:7fd0:9efc with SMTP id 5b1f17b1804b1-47d19555b78mr36411585e9.15.1766156226855;
        Fri, 19 Dec 2025 06:57:06 -0800 (PST)
Received: from draszik.lan ([212.129.80.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4e91sm47624915e9.13.2025.12.19.06.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:57:06 -0800 (PST)
Message-ID: <da80f729ae5c8899181f3b35b0f30b59f11535a8.camel@linaro.org>
Subject: Re: [PATCH v3 2/6] soc: samsung: exynos-chipid: use dev_err_probe
 where appropiate
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 19 Dec 2025 14:57:13 +0000
In-Reply-To: <20251120-gs101-chipid-v3-2-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
	 <20251120-gs101-chipid-v3-2-1aeaa8b7fe35@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-11-20 at 11:29 +0000, Tudor Ambarus wrote:
> Use dev_err_probe() to benefit of the standardized format of the error
> code (e.g. "ENODEV" instead of -19), to get meanigful error messages, and
> for more compact error paths.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0drivers/soc/samsung/exynos-chipid.c | 26 ++++++++++++++------------
> =C2=A01 file changed, 14 insertions(+), 12 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
