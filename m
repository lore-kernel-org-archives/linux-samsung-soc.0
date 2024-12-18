Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887661ACEA1
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 12:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734524162; cv=none; b=kkaupuM67pCjduFoktGcH09ttdIash8Efv16f8PNej+uK9qhH/KjDhP5KS4f0bQezC0f8rW3bwgye6xLhUZRvUSQLR03iFOXhfvH7jYlxITgksalCi7ZnzrpyVYJimarKSUimfbPAkvUklbsSpyq5yg+ha41oDGQt6dyt5lKA9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734524162; c=relaxed/simple;
	bh=QbZOpRsiSXZYAgcFjG90jFYx1m4NfzP1gX00iKnIzaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpjFbKFHvRW5AiXY3rcPO0ITu64Fs5uUGVnieTo0lkoDl+3UqLzLHY3BMxvo+YawErz5wNtft31i7hRZuF1htVsSeo4NpAavRXVpD9TeHpb7I6DIKQUrgbKr1DCgxLO3ZV08BxhvMGgwYr2PAX49G6HRLg+Dy7znjlqVQYBn41o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dSGAs0wt; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dSGAs0wt"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-71e3005916aso1149865a34.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 04:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734524158; x=1735128958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbZOpRsiSXZYAgcFjG90jFYx1m4NfzP1gX00iKnIzaM=;
        b=dSGAs0wtyBPd2XJSE8lYRqtG2ZMtRuCtIFCuy9M+cxR7WdMjGJkK4Y8f4ri0IMajbS
         gMDoTQ4YdDxXmy+H6dSEFV63S+GQolKBfpjmvhBq6+2bSLVHaQ+71+aabtGTg9eZtRh/
         mg9RIxCfizevzV5dtyBcrXx+9OzkQbEOHbicOdD4bYmYCzgpff1hdq9MHURqSpXek+m+
         g4ayC+k5S6g5Cw4VlZJt100DTyvBeupFR/mJjpFXJfDqGMpsIP5IAP5tUX4FbjUNdywe
         erjXheomUnjW/zI6wNleuCbN5OUCF1k5K8X0uv+1Q1e84qp+YjoNmB5FpvTJwkS/o1pj
         qrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734524158; x=1735128958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbZOpRsiSXZYAgcFjG90jFYx1m4NfzP1gX00iKnIzaM=;
        b=mQJ2bAipLrUZwd2B5yNNsv6IEotqTbBvtBHb5DAaoU6hq4+6sdW2JjordsabIyRO71
         28CnN0VDTbRxq5lEKviJWaLATZJcs7iBz1+ThymId93fD9tWY42bRTzBDgMzIUfrhuqx
         LxQFblqv3QcP3Q4/gcpo3p4RCPX9tP0GXTOFGHqz4U/Pil9XL0fQQETyPcBdc+ipUR18
         KoU9t+5MwVkoUTpFXZe5PIIlE++V4JNUmCBQGokqXUM+wvPjAoht/woIMQVSvO28l1R1
         Qt/zqMijaZKtLsZWNEFAT+IslfuLwVW6WyVW9laXhKRg1ah3GrH51FcESy9tfMwdxwEB
         gw8A==
X-Forwarded-Encrypted: i=1; AJvYcCXJeev5DqQJq4FN+pFu+8zhfiPccAhEzNexyayiOS8RcPy3PU56Y/yUPoaZ7L+O4WTaj56UJ/Lu27Tn1VWAbbgI6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYUVR5WpXJnhaun8cQlC/f+7Req6dblzhtAWUlTq+0gygYGLKZ
	AnAEL23AVND5z677PIW+IUjWE5x/9bPWTEQIVcNuP+de2Kf6nsVfUtLCbExa8b6qn3TkPWKCyG9
	OkRoxrSK5dgFFvhvFQ5AipmFNcGgnIAxNrbzgtA==
X-Gm-Gg: ASbGncs4Hg/wV9qxYAjbsH7qswN1rEBtGMTQlFw982iz4XAnxEE31+hQ5XQznNXsveb
	+CujCn9dierdYU0w9E5vrBbhpfAp2/0GLpT9B12A=
X-Google-Smtp-Source: AGHT+IEB63i2cYMG7WdX1Xsg9eBVP077FZ/6FN587/r1UUMaJDNgIjEtYPcAmsRGqIbdLwv5jK6fcF1IQNO+tAEOYAE=
X-Received: by 2002:a05:6830:71a3:b0:71d:fe25:1a88 with SMTP id
 46e09a7af769-71fb75d5818mr1307448a34.17.1734524158647; Wed, 18 Dec 2024
 04:15:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org> <20241216-gs101-simplefb-v1-1-8ccad1830281@linaro.org>
In-Reply-To: <20241216-gs101-simplefb-v1-1-8ccad1830281@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Dec 2024 12:15:47 +0000
Message-ID: <CADrjBPptsP1XeY1Z9ZsPrVKMPn-pgFwaq71e-+2Rjb+4rsnWQg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: add gs101-raven
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Mon, 16 Dec 2024 at 13:06, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Raven is Google's code name for Pixel 6 Pro. Since there are
> differences compared to Pixel 6 (Oriole), we need to add a separate
> compatible for it.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter
