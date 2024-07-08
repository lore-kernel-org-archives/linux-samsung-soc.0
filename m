Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B05A770F6
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720433199; cv=none; b=rnWkLcWVUIrVFeP9wDbaQ0se81+QzP2jYwgV7xdwg/dVV7eLEOB/XjC3T7wvQs/VEewHFc62L8MFQODuXKzzzavyOoMdhCEmmJ8LdvSprCONjafBpr4lU5EULENPIj3SiVXRAD31yPaJQgCPyFvUEWGDmwggFrc3pNMuCOO/sQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720433199; c=relaxed/simple;
	bh=P7OaU1ezIgpW6/4WHytXBtMimP58RhF0QQzrz4kizWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5DGivNax2noR+ngOK3FLvsYbMnuUPPQ1DmhVPu5T8Ipu523ApC8zCoZ+UKcRwYOhEWz5c/TVg2Q69mELVDAGS1eAjj1gh9DmPVVbB5+U26dNoRY0+hQKEW/HdFtzuZeM/Ffk1jvA7XoBIKTxwmgCMVH+xeULdr2KrEARE46V/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dK/6uR6G; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dK/6uR6G"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3d9231a8dd6so709512b6e.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jul 2024 03:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720433196; x=1721037996; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qWX5Q5O5NiALQ1tJK5ppQuf8O8WFA9Gn/tOulONtFsw=;
        b=dK/6uR6GigwEiu8Jg+E+PwJtnzceh+Yf8HPkKqDUSTE83sabD9HqcI0Yx1dG8yB0Im
         FYdldXPEadysLEm9nsYjE44BA/XMfJ9C3NlZ5bw49QVt6pHozjHgExATuYb69weKk6OZ
         yzOaf6FUWJEsVBaQjQ3KmqEZX8mN0KMCT53fx31CnScoW1hEYmAsGKiWnkwqs0Qq5+g5
         zkvfqqg7C3krJeugC/P2ga0NHzXO5AyVnk+oYJhAtDmI+oGLhuXL2lsNNawMJ5ChrUGg
         9SaD/IqnUNEiEd9oWGTX5ckAdSKFVDqSLePZ5iw2j+aw6TuE0SJSlp6f/5ETmuH+NA0z
         la0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720433196; x=1721037996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qWX5Q5O5NiALQ1tJK5ppQuf8O8WFA9Gn/tOulONtFsw=;
        b=SOMhM0RknK09LV87Cs3UhPTA4dYRwfU93GsyUoS2u/MY2Tf6ujDhkBIzw4Np6Joz8Z
         w5AeqrY4WDuiP/iIWGcgZZAu9H9Nxd7ntZfrt9qF2X3eqa6Y0ZAARsfKFbziQp8Ag7iZ
         zVLlh58unOPWYifum5fuHsy8IgeakIxmISUu89zk5lq6/Vsa/XJRDNFGW0vj/pk0mq2H
         uVe0YZ9YirNXV1Z41n+7jEmUmbNi+BdDnedqA1aX+3G3n7WaCV/j3Ou3pNyF2hao5VMd
         4anJHwv53JwRuWl0G6WzHls0BQ7RGgOacC7TZNsJDmYFEjxuZDNr0Brcr1OH1DEWPD3t
         bk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXp1RWfnhzL7KYB0UawGs9grQgU6cxNOipSiZbj96xAu6Wp7xmi89c+LdrCvcnVK128AEtrRAyLXh/PdF2nS4eovyWcxpFkpXSCB9UiS9CLGAI=
X-Gm-Message-State: AOJu0Ywccos3eGFWGq9P4B7+IIFlyVQeTZXpZ467/uJBoJvhY9Pue/jG
	q3JlZLprUgUbeDLMdiwMWzBYA12oFBcAuKKT84HthSKtC3Yz6TqQ1xFET8dXCh3sfNcWthqxhLU
	Vg1FE4LktQeyOXMdEYpIAiPMNBX1u1c3ag5a9OA==
X-Google-Smtp-Source: AGHT+IEgQYbQmWGrt9fgyJiO0ChAtyKfDdrUCIsSNJAN0RS6Om+uFgWmAgNurVJ6JWmy+EN9h5OUoOAEjttb3PLpzLI=
X-Received: by 2002:a05:6871:798e:b0:25e:1551:a2ec with SMTP id
 586e51a60fabf-25e2b9ea912mr7049472fac.3.1720433196248; Mon, 08 Jul 2024
 03:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702072510.248272-1-ebiggers@kernel.org> <20240702072510.248272-4-ebiggers@kernel.org>
In-Reply-To: <20240702072510.248272-4-ebiggers@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 8 Jul 2024 11:06:25 +0100
Message-ID: <CADrjBPqVXHh1gPxQxuLHej76yWh6imJ9CAe-fFrX84gccc7_-g@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] scsi: ufs: core: Add UFSHCD_QUIRK_BROKEN_CRYPTO_ENABLE
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
> Add UFSHCD_QUIRK_BROKEN_CRYPTO_ENABLE which tells the UFS core to not
> use the crypto enable bit defined by the UFS specification.  This is
> needed to support inline encryption on the "Exynos" UFS controller.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

[..]

regards,

Peter
