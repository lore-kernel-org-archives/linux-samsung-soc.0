Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CD742AA3
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 07:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733209971; cv=none; b=VP1vwP9kL0uEs+agLxZ9Kb0DonwR+s77WYhA4boqAgM6slzfXY83mQDq8XE2COVK933m2HPqux/0LAxFz4VxyLK1cPr3oHsxM2bsWMGGTDJLw213OwN1uZIzVeaDSAClXyNXnPRzmqofLdhJftBiQkglCvuARO4Si+krDbiLBqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733209971; c=relaxed/simple;
	bh=EVBM5qoQmU3xuxiwaVTztbikwXOSdVscc5nB635UeFk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RsigQ7qDILHUUX4R/Xr+SgVqPgN9XT6fIsozzq1ieAD5zLWWTZtCCA7oYapq6fqgp4xwS50j6s1/m5NpVyEMyNaJ/AC2BF4pSUGbd3tXvv60xDUItkp7Qe92SVqv6iI4+/MJXm0tnQpjSoAoudAUwk51LzX5qezSBsB3SCwT3Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qDMG7BJ8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qDMG7BJ8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434ab114753so43125285e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Dec 2024 23:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733209968; x=1733814768; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EVBM5qoQmU3xuxiwaVTztbikwXOSdVscc5nB635UeFk=;
        b=qDMG7BJ81Lf/g9f1GghHh7MzczQegiRSoRy7y6fp4ppq0iDNaCpXGgIhmJrtUaVfMd
         QSkx9LYCNcS3+UsmkVo11zXTf6Gm80uofi2ZPSzYg5EmJ47IZ6GzDuBR6rGw1ABVP6Et
         /biKtlYuoVdh3U0+qfeDt3A7BkX5nkJKF4I1cV84UZAqmFuLmFJLjR9+FUsi5pZNw043
         cVF50/JTLOqj3kMxI2oTs8VdYXBwzV7DifO6ytf9i9rjjhK1YolfCn+Ym8NDKCwdAYXH
         NdCvO4RhIXlCtksCcOU4dJ4ozHAMvzVS0SUI6W+JG2n1ZTBjArh8JIU/5pkOL4ZcA8nH
         NjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733209968; x=1733814768;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EVBM5qoQmU3xuxiwaVTztbikwXOSdVscc5nB635UeFk=;
        b=hMXmluB7Jnqfgn3Zae1wZ/ZonfBpeUBqrhnGeLyX/+HXD7h4Bfw0RZKr8/maaUKPR5
         1iXnbAWLriUj/G/FD+3rFHB8D0z2dqpVFBrds12Br9wEpEdT4AbMyU3MMe3eZqPKEbpi
         JI51GiJ3efCG+L52CsWoarMZr5T8ijo9w6swT2Rp2t3R8Kr1wxXfHfpHWZPiwH81KknE
         w+INsZR3us2I+dyGojCRnC0l/Ss40YyJfSKfTKuXCreRHaJep6V8ZulKD6X8elctN53h
         N7R4YQAItnXoBE2gcQHmN9Jaxyk6UUMvjS8dfk6PE1+e6cKrMq+1Y3vxY3gLMpXsjGTN
         L2VA==
X-Forwarded-Encrypted: i=1; AJvYcCWW3WlZOMS5Tr3PW1foOQdcWhKJwWsANA42h6o80hf8ByPPyjN7LnWzVd3faZ9GhWY4WgXt3LTw79IRRP7LeMSh8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YygPiy9rxz0aqhvbPdBndnzWQ7/l5wYDHvY3l/t7OPH2koe8pmQ
	QRKTG1UGn4hZZswd2zleV7s8EHqZP1ln+dpBTUd5Xcld/Yj6xGDF80eLSpGY/H0=
X-Gm-Gg: ASbGncucs+OvL8arlhujoKS8jrCzCREHShuOWoNaf2jlyIY5xG/ZBvgoQzxYGhBmSV6
	jXyVJffISFhfmapyxTm+XnHmneuxUaomuMRho7x5VADG6stfTXU610q9R95wbm4GzxAhxs66eaI
	u1uRLF0jDh8HlDaI9qpOIPVP8XuuMWB8zwmjBwmW10U+z4XOaE0iQD7yK+fAeX75wqWjdLAGIvD
	TMt6jmod2AL2h8zVxIEtmNL3NVCVBNjtAoB+tMoJnQzHU1XZsUJyrg=
X-Google-Smtp-Source: AGHT+IEplB7jYEBVeBsm9qKzYjb6Q/52WlhBD/Tf3x0VCfolLamrC+TuTTucz1KuLRGPu4rrqQllDQ==
X-Received: by 2002:a05:6000:1fa7:b0:382:51ae:7569 with SMTP id ffacd0b85a97d-385fd3e8f28mr1191117f8f.18.1733209968624;
        Mon, 02 Dec 2024 23:12:48 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e2c84d52sm9859752f8f.49.2024.12.02.23.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 23:12:48 -0800 (PST)
Message-ID: <e23721ebd766f410103ddfb8705f3d7d6e5ae3e9.camel@linaro.org>
Subject: Re: [PATCH 2/4] dt-bindings: power: supply: add max77759-fg flavor
 and don't require nvme address
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: t.antoine@uclouvain.be, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 03 Dec 2024 07:12:47 +0000
In-Reply-To: <20241202-b4-gs101_max77759_fg-v1-2-98d2fa7bfe30@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-2-98d2fa7bfe30@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-12-02 at 14:07 +0100, Thomas Antoine via B4 Relay wrote:
> From: Thomas Antoine <t.antoine@uclouvain.be>
>=20
> As the Maxim max77759 fuel gauge has no non-volatile memory slave address=
,
> make it non-obligatory. Except for this, the max77759 seems to behave the
> same as the max1720x.

What about the battery characterization tables? Aren't they needed for
correct reporting?

Cheers,
Andre'

