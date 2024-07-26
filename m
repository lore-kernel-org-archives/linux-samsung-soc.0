Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0105918AEA
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2024 17:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722016586; cv=none; b=QHyhzf0UWIDMP1O52YuFd19h63JrBUy6BgDA6B/efH5SacN1VNm0/+v5+IZdWfeBoPZV9UIvMVU2mGqyxGZCg5RnKw2BRBjXgrBuqVZTJ6M+fGFV0pS4OTj4SN0C7ovUVxb6oAAwYpPmBq/SkefArxTTVxBYyr8pDhSwe3DJjb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722016586; c=relaxed/simple;
	bh=D0JVdJPhPCLp5esR4XLwLE5OGpidKIvLh93BHT5WLxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OE37tx19mnOZjAw/arpeReq5wm1wYwgxqcgPoAZRXNlf93vDjlSIlTyOxPdx5DPkZc23FEcfPgLqA3MIw76hENSCf9rtWBGqV9NVNAuovODsBJoNNbdtqzC1LG6NB0qYPy1JWxtivoCyO/DQeEowvx5v59lPOpmMs200ERAoUaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hmk4H21h; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hmk4H21h"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e03a17a50a9so2283925276.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2024 10:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722016584; x=1722621384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhUrBslr8NYAo9/MyQYN73x0EDRASpHspmRycm+GNrI=;
        b=hmk4H21hNCE2HaZfJCJd67DSwkAcmdhWfb2i4z4d+VkBenwhonIVE79nB6yOfXcQlQ
         FOnK66DRu7tJBylr2GhuX7qW2eT+XseSkpdden2AAHg5qRnBlguILlrXDLMPWVp5E5bb
         0tNvcXbDlO0WEeBEAHc6NoG0mI1sTA7O3rht2kQ4C6m7UCRjLlUqtZ+ywmvNcKSTLTkV
         XR8hOnXiTJZ/W3JZCH76znHlk5mQ8kfeIRFH2ZV8hVH/a6fA256Ft4wzvLwGMaej6KpQ
         qMJqKKVgTEkNHaNnoDGslZlbSIdoxmwHOXp53w4qE0hK/OvYRrHPYbGMgm9SGrpMzub8
         R1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722016584; x=1722621384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhUrBslr8NYAo9/MyQYN73x0EDRASpHspmRycm+GNrI=;
        b=xPPbsvquTWp6A4eVBY86UMXx/MHEppHrjEJwvsfoD0qREyIF+ZsCDqHPNOiagYez5z
         CEBOUL2VryxqzN1/l9GL7xWPL4N2Zh7nebkL3BHZ6njA3F2orSsIx+1qJ9g/Z9nlpGMv
         W8VE3cHwHdU7WLeKUJEjwhV4sxt/0SOuE6LHmfmGVB/B2GbhP9kf3MTGrffqZFxGAP5b
         kqCmZVEVbKk58Y4BSQc/27+lNFSJ/TseF5Z6rqGhmBKfKUoH7eM8HZLbZ7XfcTpueM76
         PByfSsPGKdsDp7gZgIeRnmNIVAKsygYWBhtOwZFUrNd23kUi8PnGhpDIx0qKfGmsYRCV
         wHPA==
X-Forwarded-Encrypted: i=1; AJvYcCUe+876XZE/srBZTNyTQPf/atvp0uOKZK/tIeoQO0DRlphgnmyEN0iKpYMyv8ANT93Oh5nUC1m2r2arB+Q1mlVLCKYIpn51l6a1ZA6F5ipc6w8=
X-Gm-Message-State: AOJu0YxASMuYmhXN4EocAwqXQnxRkejAguDq6sNLRY4mItMA5AdisoiP
	LaKPN3caiIgkalqySuUzBoTOS+CsxmRBhxCnF0s7ZmtRTm8wwOXCnxx8Q0PkiGzXSDXlRYUHW+T
	iYmlR1qUhdy7FT4S/jVMCq7ZlgQjAC+mUP9cAkQ==
X-Google-Smtp-Source: AGHT+IFRD79UEjDaEHKHCsvV9s7KnHcAuekNi2ZVuvc9B/6COZfuwaKlCuHkfaA1N/a3WtELB0IlOea81E3BIThlJOo=
X-Received: by 2002:a25:ab11:0:b0:e0b:1407:e322 with SMTP id
 3f1490d57ef6-e0b544485afmr656498276.1.1722016583941; Fri, 26 Jul 2024
 10:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710-phy-field-prep-v1-1-2fa3f7dc4fc7@linaro.org> <ace0b95ad77fe044881068a4cf1944e10b306730.camel@linaro.org>
In-Reply-To: <ace0b95ad77fe044881068a4cf1944e10b306730.camel@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jul 2024 12:56:12 -0500
Message-ID: <CAPLW+4nrxXOz_gaKR6dLZxiNW5AEMUZRMcmAyzpnd_GKzdVdnw@mail.gmail.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: convert some FIELD_PREP_CONST() to FIELD_PREP()
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 1:02=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Hi,
>
> On Wed, 2024-07-10 at 07:45 +0100, Andr=C3=A9 Draszik wrote:
> > Use of FIELD_PREP_CONST() was a thinko - it's meant to be used for
> > (constant) initialisers, not constant values.
> >
> > Use FIELD_PREP() where possible. It has better error checking and is
> > therefore the preferred macro to use in those cases.
> >
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> >  drivers/phy/samsung/phy-exynos5-usbdrd.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
>
> Any comments on this patch?
>

Looks good to me:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> Cheers,
> Andre'
>
>
