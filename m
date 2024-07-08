Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A535208B8
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 10:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720433926; cv=none; b=IaRbt7Fv4z3hbaElugj2X73xPBnDb/HQNLytM7TSMBLApHFO59ytkZUaDOrdXj5rr6xgX1tjy8Skn50ftG97q75QX/JNFWfEKPv9ZgJpz2x4kmwo9DZQ78ldYsWsGwmhwmxg5QSkaPp1/pjidqoscMdPV3ZrtuWAm+5K+eLf4kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720433926; c=relaxed/simple;
	bh=vEGAapFRjI501MYswUKdFdLhmHF/1NB+R8R2PfH1hLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZwvtIeiy967JP3BzeRo1lqlMg9mc/np6KfUX6WtM4x/Id6/mh9MprJmExUVdafmH3TN6RaiEk5C3ngYJYi/X2K7dzm0ELiK+s1lTs8aHdqlLqXDe1fUxdwFzQMBLn/LMEaZsHDd99AWxlkTBV5GcOIYyle3MowTX5+7LTZ4ZRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k3VcjDjA; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k3VcjDjA"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3d925e50f33so1118553b6e.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jul 2024 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720433923; x=1721038723; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C05iwDI122P+LyKKeS9yPk8Jmk0qt5vE9oNXx72X8Dk=;
        b=k3VcjDjAU3UcQoIV0HO0OVTPggUkwDzN1kTO7lc8dfKXlwaTYbaHBBLit+32WOfrOp
         ANGa6irislsm4sZWnSs0i3/WBHv1BhUFcCoIH2qH5kFyhnhd1klBYqViUxr0jLKn3wdo
         mvc3jXSBY1hSWJCN7Bytd1q5L1gRXjs2f8mCgAD2iS0tqE6kKIIywGu9BHNzhMscKJxI
         WQGKaKiica6YFMbmNFHHPXwuJyN/CkFM4u5eK9MsfmL0ZF63Ynpwl6VXrv786aN/Qe7P
         zbEZc1KODUyCkQSpdqRjFBXcaVIm3ju6Y991tmbA2HchtIN7qv3e5U1wdhSqIc2Xrejt
         Jrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720433923; x=1721038723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C05iwDI122P+LyKKeS9yPk8Jmk0qt5vE9oNXx72X8Dk=;
        b=UbP8cZPvGSNfXQ+Va4kLfuEIKp4YEGNnGfLIGdD2A59/7zNavK2SmKOueI18XpzL+N
         42mnoZd+idHhbLW6rDCkvzk87aiW9P9OgK/llnU00LQ5zTRhaWjaV5PZNsGhkv9SnG19
         CbzTImRcM62aPWojyfYki6mqKh9xlQpQXGJKY3Ke5p8QzadwDTbBx/VFF8CbjDjNZhyQ
         g8nVZXkA6+tFQ8tHIeZ6aptqjLu4c+VsJueTT4olEjQlUw5zVSiKumHYj2mXAvtzShdK
         IxTbDwo0/oQPXv6E41uswI3bzXr8FEGYJ86QREgBu20y5wHRwyn15zFhUPpxlhr1UH7E
         6G8Q==
X-Forwarded-Encrypted: i=1; AJvYcCULwDVs6y8lGLXSUaYGOl3gmf5vZjIb0UDPEPD31X90X8Y+ylnVEEE+ImdULfor7QnBhcbckEEDOX93H43yq1D9i08BU4o/hJ1o86I3k31F6y0=
X-Gm-Message-State: AOJu0Yw29XrBiRrzc+e4phaXrkGpz6Xm+mn02p1euMO1M4BTdiPCuTiJ
	laQjw1CpkrfjSz3ZDs0ogBY5Wd5vA6Df2Kdp9B2LENzhAvh1WzCU71wH50t5fplqrDHj0+K8WW+
	ntctvaFts70dNgSrG5TqayLdFga40PhnU0yypTA==
X-Google-Smtp-Source: AGHT+IHnExyWB3RdFty63aa+Ml5nM5CwhGI0pyjKmeyRRliSl5t4o2vh3/Hq8s1DvYqWwZ68mL5LA5GE7W8C78uPIjs=
X-Received: by 2002:a05:6808:10d1:b0:3d9:2ac4:5d63 with SMTP id
 5614622812f47-3d92ac46007mr6215261b6e.25.1720433923157; Mon, 08 Jul 2024
 03:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702072510.248272-1-ebiggers@kernel.org> <20240702072510.248272-2-ebiggers@kernel.org>
In-Reply-To: <20240702072510.248272-2-ebiggers@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 8 Jul 2024 11:18:32 +0100
Message-ID: <CADrjBPoSQTni8a8Ok_kYZWb_Q2FKX2suZkH5xYS2rVLALGAR=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] scsi: ufs: core: Add UFSHCD_QUIRK_CUSTOM_CRYPTO_PROFILE
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-fscrypt@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	William McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

On Tue, 2 Jul 2024 at 08:28, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Add UFSHCD_QUIRK_CUSTOM_CRYPTO_PROFILE which lets UFS host drivers
> initialize the blk_crypto_profile themselves rather than have it be
> initialized by ufshcd-core according to the UFSHCI standard.  This is
> needed to support inline encryption on the "Exynos" UFS controller which
> has a nonstandard interface.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

[..]

regards,

Peter
