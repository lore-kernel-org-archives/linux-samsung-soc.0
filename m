Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C399154C0D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 08:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737446631; cv=none; b=Jpn/5g1a8QiQ3NBxAxs0m71Iat3xe/xmjeONTtDG+3sa9pe4K8d7xP2HzOs5hehzBjF/6qjx0hk8CjQdLwRf2XUiAQYxg/AqmlALz+ifkb4prpEng2FPVIsZuHgxS3YTu7aN5ocgRC36Afmr0LR25248NiP7jPj5FinLJGBFQW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737446631; c=relaxed/simple;
	bh=N8zx6HqiP0IYCIOJkJv49NyaMCMfUqHrZKQYAY9p22I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dAIAD+fQPhjqtbrcZUQlKmw1DK0KcRU1U+ioaUOoqJrzlkXYiRLC7klkGkPslHLWr3W0UXb9fELC0j4yDeSYzCNgyLnHgxbV5ndToyC9gj7Ga9HlWOyMCT8HKTGN9spCJW8w91+tRgsGA064hTUAwFJUPQPK0SxR0l9O0de40bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jBtbI2iQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jBtbI2iQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43618283dedso54118965e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 00:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737446628; x=1738051428; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N8zx6HqiP0IYCIOJkJv49NyaMCMfUqHrZKQYAY9p22I=;
        b=jBtbI2iQmWwYxcUXNpWWTaWr9oj9rqGvWSwUBQ8FQVeTZ0whfL+PWgd9V5LNszK1dJ
         VQHrtrJkxaz2qZ1VifJYwUmXv1eVdgOqCgwY5Jz6qsMnsS/KWFKmTLyLaw8vh6I97854
         BfxYfJqp65G5qxhMUzIbyul52mLR0+mcFtvuBcdK1nYHULbJA3FAxqTjnYFGwFPXsv7i
         Qt0/OOoIw7KRhugi4tbPQxv/25ZdgcGCUeguAXcx6l8pNnyQvaH5LH2vV8DvAbcY3Zw7
         C4nnDqdKyO+qQ/GJtqQwHnS5gjNS/0v1HCo8kb2v7w/X6o031o4t1w8SJ+pDCeuGl8ED
         0gSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737446628; x=1738051428;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N8zx6HqiP0IYCIOJkJv49NyaMCMfUqHrZKQYAY9p22I=;
        b=oJ/6uN9jaC4ihNJsANUpeIuzxROSVoOuH9hwnbHz4XcitQ6rKYVMmUTXiCSwTW3Tdz
         CHafaEtv3H9kidBi+QGItR03pFF0x5jbXU948QQPT33JxU8iL+NbKLQCnNbLEKnitsl9
         4mDUkG1KIJ6rVlfrFlUFQkGNJGQnEtCUcSmxLug4Cxr1k0M/61UwPWH6Su+AS0EyPn9j
         DLnW13aKTnbVThtsmQSu46JdVN30hnMF6JQyeGAzfAQRn3yzfoOJPEob2Zr5n7NzSW/C
         +3UbvMxg7rl5LHPvhuEGqBj1fYWY1efB8dZOTDMwsW0r0I/j2/ZOSFy2iLUfDQ3mutIl
         rNQw==
X-Forwarded-Encrypted: i=1; AJvYcCXI5d7sfgqeHAgrMoINtbB1ReBIJJRbJEs+YMhJ9YwAXb0A1suW2izpHj+jN3gstsITUMY0yTtvNC3LjrM0FisW6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsmloYa40fafTRywbHgfOaz23WlrWScKxI0BkmkF75kVcpDJAv
	Q/6e0m5zNXS9dMKTnl4NBPvQHJzFQBu2y55U0A71NyOwAUhDCXrVZVrkXxjRYNU=
X-Gm-Gg: ASbGncv/hUKLXUU6s+hs7GjiYMds01rSGOkARuFlQrz/I10vt7/Oyxr5bwRfoARV1+F
	glCalJ32a+XbLoybdqZuFNLbJ/7ebaohMRsNg2J0+jiyzopR4HchDnnCkLBSigheqf01anA3TOM
	gX8MT8Af9bJEGP6IUSTdq8mge8+ExC9c1fqtRv1itz6Mfta481mGu6tnlXuuQcrsiXM0qpoTRZL
	GxjkKhydes3jJAiBphXiowLdYDXBbSruQ3CrOjV2yhg4nkglHTppAK9E9IsEMp7WAhUTyIbe60=
X-Google-Smtp-Source: AGHT+IHrNBKASCNdy9476OAsuENS8PkN67B0BVHI6CbHYNScLbwyX+0XbsUcr7Ex8YfKUrH7iaH6kQ==
X-Received: by 2002:a5d:64a1:0:b0:385:f44a:a53 with SMTP id ffacd0b85a97d-38bf5655b07mr12484539f8f.4.1737446627668;
        Tue, 21 Jan 2025 00:03:47 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf321508esm12791757f8f.10.2025.01.21.00.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 00:03:47 -0800 (PST)
Message-ID: <09af67d5ab80c6891d546cc74261866999af4433.camel@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: samsung: add support for eint_fltcon_offset
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
  linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org,  kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Tue, 21 Jan 2025 08:03:46 +0000
In-Reply-To: <20250120-pinctrl-fltcon-suspend-v1-1-e77900b2a854@linaro.org>
References: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
	 <20250120-pinctrl-fltcon-suspend-v1-1-e77900b2a854@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-01-20 at 22:34 +0000, Peter Griffin wrote:
> On gs101 SoC the fltcon0 (filter configuration 0) offset
> isn't at a fixed offset like previous SoCs as the fltcon1
> register only exists when there are more than 4 pins in the
> bank.
>=20
> Add a eint_fltcon_offset and new GS101_PIN_BANK_EINT*
> macros that take an additional fltcon_offs variable.
>=20
> This can then be used in suspend/resume callbacks to
> save and restore the fltcon0 and fltcon1 registers.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

