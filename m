Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932DF1DF256
	for <linux-samsung-soc@vger.kernel.org>; Sun,  9 Feb 2025 15:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739115945; cv=none; b=BYi1qCAg9EGEhKXDF1b/0Qteeqd8S7Ht8dFg7z0Nt6q93/LkTu1Ig2xSHQKY+2l6MkYXHqalcSH0C84ws4l15PSBSb9gT9jhlebZ/5murL5tWhKBTJn5Z8XFjsMJoXo3EXPkdXJvI12AC1KyNudE71se9LDimWCuaCPgogFtu+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739115945; c=relaxed/simple;
	bh=3gxfD1sGulzTxTC3HzNaZx25H1bSoJxtnCdOgYxuQVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bg7CKAPGEt6o97Ij7sESr+5gP6+5zmzngo80nCI677lLTIjrGkI62H1Kz0Go8aCO+LXJUeLsyYIxjdS0HvF5fFMq1mqZKF2O4wxlKDC81fJybzTh6CcC8QiCnV2u/t/Zm5KZeJxUqnzquT0sFwkM6F5GPNkeE9eyW9Thy2s+jtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dGZ5sNht; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dGZ5sNht"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5fc7ff13fb8so124934eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Feb 2025 07:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739115942; x=1739720742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gxfD1sGulzTxTC3HzNaZx25H1bSoJxtnCdOgYxuQVg=;
        b=dGZ5sNht4OWKGVAHbbG4DLazyszX7dSV5lhOi9poiNg88TJIZD1ZVSwlKEGxFE05KI
         +oLC1rcAu1qfgR0VS4PTr6zX6/g4Rrsv/vfiPY4I6OvzWx6RRq1s+mficbrxZDeE+HlW
         V1gvCgjASNYFWku/e2D91oIsgIpAKXQ9otfwyACeH0lm57vwsBfgd3j2d636Cm8n1htv
         SQoGA9uaRaCsJ2WGenVkrx96E8VBKEqP2DaRN14DgLg8nuKqQT0xjOUokk25rlbeJrVB
         BcG2Y/5DjqkVvQkAznAegY/v8yb82bJWcQ+wXtuG6RGEAb03zJ8PAU53Mgsk0cS0gGas
         6q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739115942; x=1739720742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gxfD1sGulzTxTC3HzNaZx25H1bSoJxtnCdOgYxuQVg=;
        b=vm2hLkN3G1wm8HvNwGYZfChwsPmv2WyLnBKc5X0HvnB7TkUrwZFXAXw0Y0/Jl0Xt9T
         2OxXFyUSYmAJT2T6QLjauHZBHI2JoVaaj0US/JYooZy2l2s8hbnbEHfVD+UzDFEfOQ3d
         4+MEbuNnc5JO4Tyg53b+oWCI7/G2q4DKzcdnJ1oEXeKy1Wl1hc3GJUYqwPWhooZCqVit
         euY8hW6R2sDehb2/B/v70l4o8MQhoHJCCLkO1xFQbr/iPkVxXkl73Vig1exIxLDJ4LUt
         2bMfX23emxZGR8Vot6BGZIYDrc8zv3gHh33xclI8wsCP4W+OAciQkX2HoW+uTqAEKxjI
         Li3w==
X-Forwarded-Encrypted: i=1; AJvYcCXO/b1XaiZShPdJz15ozB2QOH9zfEy5pVgLCXxOhCxpr4EQ5sXwqUZEImgkypGu5xKBwEh/1REs/ext42PKen5TuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YztU9lhjweiDRnWPDHWgNb1Pwb/MkgtDJnJah0OQ2F3s2ulYUdK
	OJDW/p2K04rB9ueHkygvrGj5iQ3PBfEApjNEqCDsGL1BJxAjoia/D7sVqjGIxPqaBIrcjVLqqcc
	aEN27OE2UKIhO/jCtkCYXHWhEB8YrFe3KTcMG5w==
X-Gm-Gg: ASbGncsi9wDEDXEVrG8hqiROpUGCip0JxdPMw9USykt7YzZVJmm2ahCJk1r1zDrayhD
	UKsqOSUlDGHjMdHFbQolh0sECOQN3dEIHPQNbc2SnO+2S8kU8V9NM5CBt2kKgla12wYsdqT/z
X-Google-Smtp-Source: AGHT+IENz8t4vUeXGtVHid1JXOXuNJTbdadkrLtEQr8ilv9ZuDGPzHbJyKQfQcMH15TIJAyObgIJoVuODrlm6BQNqBM=
X-Received: by 2002:a05:687c:2187:b0:29e:75ff:4d0c with SMTP id
 586e51a60fabf-2b83eb5153amr7084882fac.4.1739115942497; Sun, 09 Feb 2025
 07:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org> <20250206-gs101-renppt-dts-v1-1-cdfe993fb3c5@linaro.org>
In-Reply-To: <20250206-gs101-renppt-dts-v1-1-cdfe993fb3c5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 9 Feb 2025 15:45:31 +0000
X-Gm-Features: AWEUYZmSRsawKgL0IuzGCyXzwqdW4eDJSShnscBuwYbznWcXl18S7O0nhsTO_i4
Message-ID: <CADrjBPp0nhUEP3W-GG1xf=SqAmSmkDeqzP--wRmrin0JYYQDcQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: exynos: gs101: drop explicit regmap from
 reboot nodes
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Feb 2025 at 13:08, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> The regmap property for syscon-poweroff and syscon-reboot is unneeded
> here because the poweroff and reboot nodes are children of syscon
> already. It also is deprecated.
>
> We can just drop it to simplify the DT.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
