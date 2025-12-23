Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2E132E737
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Dec 2025 11:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766489042; cv=none; b=mwfu0sA6ORJOfkzvdLR/2u7zsi/317plDF2qIZeJbpl1Foj9Nextqc6NjoaSz5hDMOGX2qdcvwlmX3KNdaKTfJi9BlO+q5RDm8YdCr5smbA8FLPCm9OdOAUc4bK1+Y6pXSRtkX71s5E3Wllouo4rOsYs9K+d+1JD9LCEqfjOS30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766489042; c=relaxed/simple;
	bh=37RUNcK4I4PT64rzfy/R8cHrYSg57U06mGC+3iQ2/Cc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gjgOWf6kM62IizYAJBOxTnplQmWCXt86SmpTePbFQL5YNOb33nszVJtPaEHF3ks3LndZGo8eSITB4UuV9KkWSIrfxsihq091rVYtrv0eVEmRveKVE0vveheKlbCVuDRxVnZnhV9Yb+dEW9cmZQDDPWX/SAdwoeV5zlZWtG3UfOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tKPFxQAW; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tKPFxQAW"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7f216280242so1815934b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Dec 2025 03:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766489036; x=1767093836; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=37RUNcK4I4PT64rzfy/R8cHrYSg57U06mGC+3iQ2/Cc=;
        b=tKPFxQAWWy7WqeLWw4aCui8xwjf1CuYXKC17dHGNP873KGKNRlArUUNtC+Ae9eGbIe
         rH9QDGXmQdEl/cyFzF4cZJZ6ijCadHKqe5xR/d/XdupVvlg5JcwjfuFhCfJAUDT8aMTt
         S6VbQUVpwJw7aG+SE/t+w/Um3ocTAqlkke3ChlTId9biwe0kh+HFp+VNIhA0KO/gPmc6
         CR1T/sYGfaxJGFTDvw58rzt3Nnwe4e/3f0MWu+gGiCQtPYgEmavdeKsOABxEj70TDpTW
         /YgWJg7dXBhJ1vpunElw6b8TjhVyNW1gL9eTDrYZk8f1L5BIXVuHWQ+HQuM1tiVAgHif
         yLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766489036; x=1767093836;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37RUNcK4I4PT64rzfy/R8cHrYSg57U06mGC+3iQ2/Cc=;
        b=hg8atfbhCwWLWEdajHmWPuwWpsZTd3Aivzf5/4JBkhvGZDWQm6UoFDsFYaFZ/3iPUT
         CPUOInh8HwyJMrRb50J8PdgZXe8GZPFyS87Bi1GSamn+PInCwOhBLUCrMBXciS5+jIOH
         2+rqhhVVzXJ2GYsKjFbblatRV8X+TnuIpvM43tPQEgHmtvzUookAxrfy4MQpvmBYlQ2V
         C3HCAsTGmH084/2XwJu4Dw3VKWw/c1ZlfAKW1RIyoAwtnvTMwAFpclAiFzs1LL6tI0T0
         HDOiQcZ4Z7XT273nmp3W+BQjS2HQfrPoQ/StRUcqX32mAt07TXS3p3J557qO6Nz7j/V0
         iR0w==
X-Forwarded-Encrypted: i=1; AJvYcCV46SI4JFtx7U7svcTCquwMrAKy8yMZWsITtZMDGExNi6WdeAfEHt/iMwnBWHegqyBB1Yg7xII/nFgYNd0LdlN/BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx67XsvfrHy6Vyc9wbNx9p8LVKmyHL6XkcWbpUAG/99HGuNfbI/
	CFcsxzey3s/D5S3dNMcVPhpWg1WltriHqUQtPkmvgeWhDqvKRCv46hxZPmU2xvsOFcE=
X-Gm-Gg: AY/fxX4M1rD6T5iAbjjp2nMujTFq2HCQ3bTwmjn6jwC+wEs2LV5uubfDnQ8UOth09Uw
	o0vq8cn1z8RndiCAECrFDngfsxZpnb67rGJcGkgSdfCdcV8EeYDidUkwYc7v2hLstyyjIBDjhcE
	CiZisMFCqbp/d94HiJICbZIbIZ6TV7eS686K2ruNd5YJcS1WRLpcg0588+Z75IKyrlbCqeQ2phz
	jJ5uUct2jLUic8Mw711WoaXlV+CH1dEcIYQuJigavNLdwx+BkT6hdjY08CMA4KG3YXYNf6fr6kp
	c3XX8MxiHq/ykHin/FVyG64uU2MyAf8lPgcL0cXMKjUS+TtYG0DopwAKbu7afhX71BK/ndxfAn9
	U/aG+x6nXAoeGqQFyO1CBkYontDGf+JTyo/fUwd+O3SdufvYT9iSK9e4sSvRVtZJohP3gHW3Igq
	x+24CU1e4SNw+626kZ
X-Google-Smtp-Source: AGHT+IGxox0BnKpXIXpIkILbnFvlZ2cigLgZX+lwkyuIDPT6BC7th92Abu5fCPBNRSHMzVeVYDoTUw==
X-Received: by 2002:a05:6a20:a11e:b0:366:14b0:4b15 with SMTP id adf61e73a8af0-3769f933424mr13267847637.32.1766489036518;
        Tue, 23 Dec 2025 03:23:56 -0800 (PST)
Received: from draszik.lan ([212.129.75.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfab836sm13480878b3a.36.2025.12.23.03.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 03:23:55 -0800 (PST)
Message-ID: <a3b89ce1a88e9efb2ff6af27bd1bd48dbc06c2fc.camel@linaro.org>
Subject: Re: [PATCH v4 4/5] soc: samsung: exynos-chipid: add
 google,gs101-otp support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 23 Dec 2025 11:23:56 +0000
In-Reply-To: <aa55c3865d151697120a2855e711d59468bdcd0a.camel@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
		 <20251222-gs101-chipid-v4-4-aa8e20ce7bb3@linaro.org>
	 <aa55c3865d151697120a2855e711d59468bdcd0a.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-12-23 at 10:18 +0000, Andr=C3=A9 Draszik wrote:
> Looking closer, why is this not val? Now you're shifting the sub_rev
> register value by the main rev shift, assigning the sub_rev register
> value to the main rev variable.
>=20
> And then, all assignments to main_rev become identical and don't need to
> be duplicated.

Anyway, it does work for the SoCs supported, my RB still applies. Code can =
be
updated in the future if the need arises.

Cheers,
Andre'
