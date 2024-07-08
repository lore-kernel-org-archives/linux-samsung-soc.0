Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DC976025
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720433587; cv=none; b=Rb6JnKfntq45pq/bYOeGcSzKngZrOhMdA234XSfKOaWIGxHaMeJIN3uNMctqWUd+TgYzKZuaJtNv+yLIcwCuYuEwQ9NuGhCOxUdPUfwDv0X6t28HiEoCTWeEUbKtrc58F5jPW7eVTRxr7Ckyk0loOQBouJXByUPXPfXojIXyKbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720433587; c=relaxed/simple;
	bh=2RmdxV+3VSNyvZhEEgpIWbdydLkzqKnXJBVxNC6Ml3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R11Myof+MlC/F1y9Woo3b0jBreniB2kWelc2YRIN9WxVtMMbAmDXpgrKf0tOGmtF6M+X7lDvbE/ewNPHk4lVkl8SF00OtQDbHFEd7+o6pBQ2jL51J35sZZxE1Epc3rVstWzs7Q0ttGa89AyA5Q5ZmRU9btM7/q1+aQ3tJ27hOSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hGBA/mAh; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hGBA/mAh"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5c229aa4d35so1847667eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jul 2024 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720433585; x=1721038385; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NynB88z8W6QEiHA6gsmDf2tTIxeEI7sjADoAf98ZwG8=;
        b=hGBA/mAhUJsOR8FxfY9p67HU1zm2G8Pqq5jkJJlEUDbLS3FO9VNmnsXcMh45DczdyR
         Zo1ckDCcYiDVt+YLl1hjlgKYBFBnYhA6aQdio+/65/gYn4QDd1fOO2X2PpiHOUud1ebH
         qdZKnppYRMmNm/0FmEtzEq781Srt61tdrv2COra9Ti9TyUfLxddtuP9JAlmFfu1B9EOa
         HvSD9pKtUYubdg1yULJ5LzHcnJ3WvcIC+7xCOHwXjtcY6g8qHhB3k8zZN8JiZYDVNzNL
         s30cdkH0x12wZm0N51KqC2yUpuioSwLo9xqoKAtVuW7n35gcKlo4Or/4ZAWdssHgN02z
         8C0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720433585; x=1721038385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NynB88z8W6QEiHA6gsmDf2tTIxeEI7sjADoAf98ZwG8=;
        b=n5FuQnPEt6NBUDvo5/igy14TMK8IfobGXB1RP4S16NGoOvZLOT4mkTWYbkiZmafGuz
         Mn/IY9QCAHO0lwwZ/8IKSejIlXjPq5ZaGox7YobPbZ7Yr9XUfzJfSgQE96fgjcYkOG7M
         uFx/lVbvop1zWUur122QNV10UcEADrqc0IDlCF3xN/3RlmoyK+YYYJCwhr4HJqLhF2P0
         gOmr2CWmpKOPIXtFI7obLlJdRArDcf2wWwIu8Ou6CM1MrWARuJmeUePSrTieU7o8SjGX
         VyyMiU2ATpY6vf6gvd2MlTYRyCE+Efcm3ovqG+ACMyZSKZFQG/fD3OS0WxRWPmL4VVHN
         4+yg==
X-Forwarded-Encrypted: i=1; AJvYcCVMUr1TzZ9i352L80T+n2/tdbPFhYqrAKviYLsG3XFMj8toyzF2IMSzj3G4WGZtildjw30GKgqkG8Uunzo7duJUFprdJ5abQkjQR6+7+xlqTAo=
X-Gm-Message-State: AOJu0Yw7EZDnSNKM5hL1w9shxD8C85peyfVqBva8GZO2giPh02kWPmLT
	ev3iLvZB1yvjqObhkX0P5NxxY2ppJr4GI5ygR2DeSQffU+wfQlwrGaDg5PNXXkl/jTVSJxcKvHC
	1Dr2V5da92B2cur8XRqIKoXf8CpjKODYzE9BzOw==
X-Google-Smtp-Source: AGHT+IGivyDRrIsg9lng9e/JVVkngxmkaCgNcGy0evjFYNtJazKIxfyqs/mZGknAEQ9yczSNL2j+NXR7PUtpSN+8eKE=
X-Received: by 2002:a4a:5404:0:b0:5c4:57b6:ffbf with SMTP id
 006d021491bc7-5c646cda66dmr9779604eaf.0.1720433585464; Mon, 08 Jul 2024
 03:13:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702072510.248272-1-ebiggers@kernel.org> <20240702072510.248272-5-ebiggers@kernel.org>
In-Reply-To: <20240702072510.248272-5-ebiggers@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 8 Jul 2024 11:12:54 +0100
Message-ID: <CADrjBPqXOJ6h+Vx9tUgvC7fGPPySzZDA+M80rEDBsqBHEMsCqg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] scsi: ufs: core: Add fill_crypto_prdt variant op
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
> Add a variant op to allow host drivers to initialize nonstandard
> crypto-related fields in the PRDT.  This is needed to support inline
> encryption on the "Exynos" UFS controller.
>
> Note that this will be used together with the support for overriding the
> PRDT entry size that was already added by commit ada1e653a5ea ("scsi:
> ufs: core: Allow UFS host drivers to override the sg entry size").
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

[..]

regards,

Peter
