Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAC6386572
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 May 2026 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784764; cv=none; b=GaW2Sz/RJXXkwfPfixm7TAC0pF5BuaRGzroQThrqpkk+5Jm4U7MsU7/dKFKmLLQ9220qOjxaB7iRdpPe76GKQYW07IMIRohaE9/hWpWz3rUvNSLU23RK9ua8S7Ev/UkU1nuobZRyhkekSPrrV3oP+qEK/8bd8Kk2wpN8WbwcEJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784764; c=relaxed/simple;
	bh=exUQGs186Aq+Vzbz4if6JSgxOypH0DW9dazCN5aVGK4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hk378n4Pa+R3BBw2fsyK6H0nO8srqYOzu+R1jy/7Ar54vj0DVrlZ7/Gh8k4J2+UkP2rtm8y1JQGCFW4PgzradrSmQmjpR9PqC5nEJil/dHxY/d+h4tZ9+I1EkDRb6MY6gOEdJtmO38bqjkoAyN72v1jUhihQyZJANgR5s4FEPGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kr0UtFXX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kr0UtFXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FD91F00ACF
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 May 2026 08:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779784763;
	bh=exUQGs186Aq+Vzbz4if6JSgxOypH0DW9dazCN5aVGK4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=kr0UtFXXJPEtIyeAWU2iQjM7xblfpXmolip0IC6jg2bGMHE7ihBWJtNH49ZFf8fIL
	 FXxBICA4Y5gGdyl0jTfBt+p1GleLU8NlOI3fiMO5cUGFXUwkERW9qcEVQHk6iH1hwA
	 XXCPlk+qsflOAcxTXcv/KOgB9yyRUfrF0H+gjoVRmixzOJLjIgRGsPmYper3XfxNUO
	 FaB+jDZfaLtB8HFV3WENG7Cxdugp2Rxp7Z4GAzDk/CJA0wxMSjMfQ6I/wlSPCm0OW8
	 syyo9oSEEknju8cflqizHRFUXAphhNnE0p1YBQWsIJ/qFUFqHAsvrsuaeBuBC4Q8mX
	 fUhXhHBaQxTxg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-393c93a0166so97216641fa.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 May 2026 01:39:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9+u+E27jttmR4sjNFU+bm5i2ciCIHAdVo7qH0YS9GipjOtIkxZ6Es53kCB392TLE5bFT/k1CKGOgebs1gmbCd5ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgiL/29YrM+i77eb6GEEo5kL0dIx0U7MFvgraQOZa0GnYSjnqK
	A81BdfHDebk2ZbZYsvyww8XsCivkpRZn4JKRwuhiw+BLIPAUZMe/NUcZOjVb7n4tnpfcL14lNDO
	SG+1+a9Xo9MseobPuA+BIzoHpJDU5SriLEIyW/vp8cA==
X-Received: by 2002:a2e:b8cd:0:b0:393:a5ed:7dca with SMTP id
 38308e7fff4ca-395d8c08274mr63525631fa.10.1779784762028; Tue, 26 May 2026
 01:39:22 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 04:39:20 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 04:39:20 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260525-s3c-camif-descriptors-v2-1-d703e47c4f96@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525-s3c-camif-descriptors-v2-1-d703e47c4f96@kernel.org>
Date: Tue, 26 May 2026 04:39:20 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdnmwvZkgW9yiMJDMKRXAmirQS_XQa8TnJsQOEGo8OQig@mail.gmail.com>
X-Gm-Features: AVHnY4Jsw9CI6wuy_ristr08_BrJrSKHzuLkXDIWO8DXMOBNmupoP0enp6DIEeQ
Message-ID: <CAMRc=MdnmwvZkgW9yiMJDMKRXAmirQS_XQa8TnJsQOEGo8OQig@mail.gmail.com>
Subject: Re: [PATCH v2] media: camif-core: Drop GPIO handling
To: Linus Walleij <linusw@kernel.org>
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 May 2026 09:55:42 +0200, Linus Walleij <linusw@kernel.org> said:
> The driver and platform data refers to the legacy GPIO API,
> doesn't really use it, and also calls some GPIO-related functions
> passed as platform data.
>
> This platform data is not used anywhere in the kernel.
>
> I'm not outright deleting the driver, just deleting the bogus
> GPIO handling. If outoftree developers want to fix up the
> driver the GPIOs should be defined in some kind of firmware
> node and be obtained using the gpiod_get*() APIs directly
> in the driver, but I don't even know what these GPIOs are
> since they are hidden in platform data that is not in the
> mainline kernel, so what can I do.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
