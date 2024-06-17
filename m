Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DDA188CD0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616908; cv=none; b=Ht8+jbYtGJQeV2T1hNnL3hQ0heo7tBiLS5tm0Ho8HsFLJewN2oYoo2xmcPBSXGaBluiuZgc7mfSZq5+moVJ8mg4sB7jA/JEggEPsBRxPrnFKZLf48HkntIpDrnEZ2OuLaA9oo0jMDTF7XYcDtAoO23Q8JrFlBx4w9ebmnfjjMlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616908; c=relaxed/simple;
	bh=pGsKYSsuVqYhnQGqi4IUCl0rXwhURd33quQLgivZ3+k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y73uEXPBsRU316vHZhe0PWY4B1sOzI5LHnWDX2HkLfcORLMnMQ9U6gvuYKH71cyJmiCNLsSJlf+66db3tjlcREWpXda9Utw2HcepOXGtZYJJYa6puQIA7Uv7m1fJ9DuC6BlmGuh0efGG9q14z9W44qaG2oRrciu+ZfIJJbeCSM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lTemQ+Kw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lTemQ+Kw"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso43236505e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 02:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718616905; x=1719221705; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pGsKYSsuVqYhnQGqi4IUCl0rXwhURd33quQLgivZ3+k=;
        b=lTemQ+Kw+ojX0sDCbGlEKD8ALBuEUScwLLm7wRcV2/bFeJlM/Ik/Fm5sokh/VEjHOq
         P5Ip2x4PqEpIR1lXjUmRKLg7/3fS50V+pmte/FsdgIcokyv+0DTTqyVrdEYZtmvcdCYO
         DxzcEI1jrOtgXhDWwcg18uypSKgxFN3FSczRxx8GTxn9XCqIl+hxJ4g92TcZ4nRHcmP0
         tdx1pCv/AB7Ww5nmNrL4NxZaDiUlAMQeUaes1goUihRrPJbYPfiTE33bu9G8ODcgnlAp
         4nkyg3cCgx1PJmsV7n81PaX7Gx0KWDs/dWaGmyZIdzLR5HqploRnxQsXB4nQsu+oNXgI
         p3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718616905; x=1719221705;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGsKYSsuVqYhnQGqi4IUCl0rXwhURd33quQLgivZ3+k=;
        b=K3XAhKsGd6eXM2cz+XR8jF8jlBtVyeQB7SyRKIYym4w/K94Q6o7KtS7syWW0S2Vfx5
         fh1afbrxSDZQLgHJWg5KuvvGJ9d94M3FzqwGSd4a9IY63cosWNq6BtTjH4b2wNwGhQSa
         pF74LRqMbQwrcicIiAWzgrHNSzILCqhJDrf1XasiDQcgZc5rj2PiTB9tbjSnuV6ut9Ze
         iVzmaXGpSChJd44fgfor9tMBZFwaTspv9ooUNZrYwECweyitV73oHwC+AYtty9AN1D1v
         WBnd6AjHnHIDeDzo50NnUz+S3LJZ9sMUqUseMFLrXy7sPdYp5MHtht3Fw+ol1WBHGMw9
         +qEA==
X-Forwarded-Encrypted: i=1; AJvYcCUJBfDN//PG4r6tA1ZXeDiaUZtTtcspjnUv7yVP57Ok8fFWJ7RRJ9MW6ST9EkjeV2NIWNnq6yFVNOx6v3iemT8upsQ8D3z3bb3S5Z8EUa3p5+M=
X-Gm-Message-State: AOJu0YxPvz9wGJRH5TvlAMpWaLu/t/rEBmsppWoOB2WEQ8YwA/b37Q1O
	NEY6MdEk3nu05tUAMuak5BLobfs5mVeqvc4QRNABYunEfe9/yF1eVh/iNdmgjB7ilxdSNWIFReX
	l
X-Google-Smtp-Source: AGHT+IHUl9su+9vEGw2u/MC6cJy6tBHnuW8Q+azq1tOrCWK3Hcpkd3jQ3R0UUBO09JjSMYv6YCAO0w==
X-Received: by 2002:a05:600c:5118:b0:422:2044:a0dd with SMTP id 5b1f17b1804b1-42304825795mr77677235e9.18.1718616905237;
        Mon, 17 Jun 2024 02:35:05 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f5f33c43sm156505395e9.7.2024.06.17.02.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:35:04 -0700 (PDT)
Message-ID: <dec7f7542d1445818a02d2adbd4d5942fe80ce7d.camel@linaro.org>
Subject: Re: [PATCH 1/2] mfd: syscon: add of_syscon_register_regmap() API
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, lee@kernel.org, arnd@arndb.de,
  krzk@kernel.org, alim.akhtar@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
  linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org,
 saravanak@google.com,  willmcvicker@google.com, semen.protsenko@linaro.org,
 kernel-team@android.com
Date: Mon, 17 Jun 2024 10:35:03 +0100
In-Reply-To: <20240614140421.3172674-2-peter.griffin@linaro.org>
References: <20240614140421.3172674-1-peter.griffin@linaro.org>
	 <20240614140421.3172674-2-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-06-14 at 15:04 +0100, Peter Griffin wrote:
> The of_syscon_register_regmap() API allows an externally created regmap
> to be registered with syscon. This regmap can then be returned to client
> drivers using the syscon_regmap_lookup_by_phandle() APIs.
>=20
> The API is used by platforms where mmio access to the syscon registers is
> not possible, and a underlying soc driver like exynos-pmu provides a SoC
> specific regmap that can issue a SMC or hypervisor call to write the
> register.
>=20
> This approach keeps the SoC complexities out of syscon, but allows common
> drivers such as=C2=A0 syscon-poweroff, syscon-reboot and friends that are=
 used
> by many SoCs already to be re-used.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

With this series, the exynos5 usb phy driver works on gs101 without
having to patch it to use exynos_get_pmu_regmap_by_phandle() instead
of the standard syscon_regmap_lookup_by_phandle():

Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


