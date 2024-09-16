Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A84215B14F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Sep 2024 19:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726515736; cv=none; b=kFd83nbEYSGdKNKxwtqm26RUe2/OGV0o4u9YS7bKUSXAqps2zGmyOvBMfMVDhgfjs/E3MLt/7c2YnGWSKzDLMH+aWAzTalprsf+QMYAatO/CmAl1EukF4r46FXLA1HlofciHv6tABmDLAi3Z2COTHO8qnrmzjGhywsaaQOlxVr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726515736; c=relaxed/simple;
	bh=lcyglchujBFBYarX+9+nRRvNPewZg/te6keYre7+4yU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yx7uV/GaDth5Qw20QeAQeDSiPiM2p55Bx0sfh18JBuBiIGNVHih65U9p53ckDqyWAZRsAvrWe60XOQKScVBP9h3aW8RdSnUwKqyz7lBD0QqCRM6pawM0oRYudMHt/Va7izvhpOIbpfDtEg2GeS1ySuPf6kCojzuHSHgQHybd2oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qg958p/w; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qg958p/w"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3e04a6feef3so2423380b6e.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Sep 2024 12:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726515734; x=1727120534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Vae9vaF6ym0VDAA7RUapTpBvo3oRMpI6vM8EcaxDOw=;
        b=qg958p/w8pJztKTRswHxgHWg83toM/Dv9zqSi/r5EQwxtgj9MCpjfDOCHO8vXeIfI5
         X0mm7V0RCPYcY1hUWsxbiXmM7xzUeu5geoaXJUh6gY7NVTfyDy7PlaIfh/FM3hD0jYay
         bg7yneAwiu/0eMwIBthH+6ewVoHE3J68EPfKLB5dM9bIFBdmWzjGbsJuzeSla1UKsqr8
         YB2SdoFUnfZNyqMlM4pfAsWzTyqGAKVGHPiCwHmQog476c8G41/AMNoy9UgWTPeH8ypC
         tnzTo4Fh5X4TrZpEmaJ9JggTuXOKidsgZGrlyWGU7QYz0pUAS3G4uDRnsqV1jDaKZGIr
         bc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726515734; x=1727120534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Vae9vaF6ym0VDAA7RUapTpBvo3oRMpI6vM8EcaxDOw=;
        b=PV0G3cqq/mdacM/ER+4OJGpYhGV2pQ078/H5W3VhqbIk9GyuOtgNWpCRDUTP4Q1hcv
         bb3QtHlBnMoeHKFhDUkr95h0qvTyKSLxT8T/Ho4w2sb36fm2yonmTdCKZDNdWf9Cd8FV
         pj7kPhmL34Xb+/AmkTx4yKuV8ZPjpFsvhAKiMhZdBEhGoJnBYCfAKeeK8ZJxc+hkMxes
         or65lkLvJbonsJxPDMWeLZf2BW7j2gEeMOO+qZAFVoYxDe54xerOiV0hvrpiVFeXdApT
         8uaX9P+XrYqXY+cMGQAdkWcaBEsropMw6kPbR6Dj7Zv3BO3HeDoXd3q98iKyGxpvtz3q
         1zww==
X-Forwarded-Encrypted: i=1; AJvYcCWZZQl8Sd2WtOShSmOYZtVHhi9Q+pXFfhiwxZNiXVXS7dFxvYiXi6tix4vfcUkvQ5+p4fY/ZdyhtwhsknUmXvbO0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPmvtnZx5/55FuoTEPRFIyiy0fQu123NpOBRA/LOoBiuOZFkY7
	W4ghTzbr9IK86Dq5r5oH6HssyNeNTo+CQlsDDQ8vpOXyEikLyNe8NwSKPHHt7DdLs5K71f3mPWD
	/w7sF9EUkPVnWo4w+Onvj9b2ofJtuqqxImeg1eQ==
X-Google-Smtp-Source: AGHT+IEHRJqyTEP7TNGkPq0m/qtvbDXGv+SBsWnxLIdk1XL9NbvM1jaSDfshFTukNMQc8kU5usEIX11Xxvcs27pmdok=
X-Received: by 2002:a05:6808:1a1f:b0:3e0:456a:9f66 with SMTP id
 5614622812f47-3e071a8512emr10131270b6e.3.1726515734157; Mon, 16 Sep 2024
 12:42:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916-max20339-dts-v1-0-2f7ed7c24e83@linaro.org> <20240916-max20339-dts-v1-3-2f7ed7c24e83@linaro.org>
In-Reply-To: <20240916-max20339-dts-v1-3-2f7ed7c24e83@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 16 Sep 2024 20:42:03 +0100
Message-ID: <CADrjBPoOZu_79OaXaq=5KzUT=eEhRdESwK7Np74Nsjx7cTRm8g@mail.gmail.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: add myself for Google Tensor SoC
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Mon, 16 Sept 2024 at 17:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org=
> wrote:
>
> Add myself as maintainer for the Google Tensor SoC alongside Peter.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2cdd7cacec86..b6edb21b4f2d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9669,6 +9669,7 @@ T:        git git://git.kernel.org/pub/scm/linux/ke=
rnel/git/chrome-platform/linux.git
>  F:     drivers/firmware/google/
>
>  GOOGLE TENSOR SoC SUPPORT
> +M:     Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Please update this to: -

+R:     Andr=C3=A9 Draszik <andre.draszik@linaro.org>

The definition of which is

R: Designated *Reviewer*: FullName <address@domain>
These reviewers should be CCed on patches.

regards,

Peter
