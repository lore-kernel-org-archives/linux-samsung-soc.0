Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C67158857
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 18:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764960519; cv=none; b=kwQP7lBgZ4H+wmIDrQ1MivhN8pLRo3yPjT00Jja8+m+5UEXsEQZDzQQw1tnlOLXmjskS2pjWhmi9rAoHlXqcDlfDw0jlgK138l/L4QvmDmhYfzDxdwNFDF8eCLmfN6sK1vbAOoST57g2ubFknZJg+VBddzc62a12Ny3bpYsm4M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764960519; c=relaxed/simple;
	bh=1Q6EcbywE6ObkGLQJKdWlwUFKpn2ScLerpcjwePaETY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EFwreV+hslSuJwHmR+ByvnMCX49ioxEAd1Yc0OCmYOsj6AE7hSrWdlxgQIK1dISgXR49tkyVamLhANcZ/fKpoXtvwgm6aAe1d+U4ia+XV9YyTQN87xmvCiCiu659MWyHWKZFyLOu0EWM6WWoxyY8+dZGDHE0Av2y36ljQAHNYWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pjwfeGui; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pjwfeGui"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7bb3092e4d7so2671078b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Dec 2025 10:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764960514; x=1765565314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Q6EcbywE6ObkGLQJKdWlwUFKpn2ScLerpcjwePaETY=;
        b=pjwfeGuio6qMcI2rfrjJE5XnNbZk9mW6hMOr1Bg4Ox6cHHRKyffC3SLTGrv4hdCt9Z
         lLI4a+XxtXcOREOQHCX1dqQFp+n23t+b82ftFiEkNre248r2b1VDmX13jqNGyuiSuKPJ
         eqaIJunw1SfClfKngR1n7PRMJMW8xQyJf4uZZukf9IkmBiclAHjz0ncugPaE7PzK4A+U
         DSGQ0ZFmpIMZrWM9VIeJTKFmNKMhsu7qYZQiusYshomMDTCeKStTWEjo1t9mDPR+nUGP
         D+NoB07DL1kOJmPGeqWSQKGc6qV2fb276VTX1Lpi4Hz40rKxE6lquhV5OwpucDVMJLgT
         5Jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764960514; x=1765565314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Q6EcbywE6ObkGLQJKdWlwUFKpn2ScLerpcjwePaETY=;
        b=g8fUrDvXJgWQ912ibkT6SanAJi3sF55Wx30O24IY+gwznFBMhb874l3gYheXE0eC3s
         GNpviWoiOMPvvfJTeq8/EOiU8yNLqH6ZL64ggt2YGR9rQl3P8UARKBL4VTmJDlscwmwP
         HKeuv83aR7009jQIJdKI2aVnGFXAxQ4gcEO3ZRHgGnXRfHQwTdXJhKMCiZxw53LjzCIC
         qwtGS2wuZGE2sLj8+hS4ll1YZ/G+yO8dZxS4WCTA4l4l8RnFo5UpSHxLmjj9uWWw803V
         WWBZLyXEMHeDd1AVS0k3ipduNz7+ARU/41dkrHdvq+4wnZwHUneKrSj26ANYDxgxiv31
         SR0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWD7cSq6q6l50yeBffAmYJ7ZX6Wz10inv+mlJNqHhsHiFSon/0JWRajxZQEtZa7gXfLI3Yb3BJEa5NMT/GimUFZxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxseQZ6WTywj9pekts3v8Y3xfcshpi5v0AxU7pxaa/3V9cbiRTh
	zvf2FQirDPTMB+4bv+Cua3dTuniIj5bcks1yWU2O55xoR3Uv7P0ntIbEmCAOLlvsrWIoapvJx/X
	7S9dPHDXPE8epDDuofT5v20zNPCjIr+/68B89GFMH
X-Gm-Gg: ASbGncumbg3/RVVIPYavFDWoQ/dwg6esYf7jD2WmNNw59yjgg3xd4Uar57WHGaUNYZH
	NTa8khgTN9urY5w9buRuNZMsbDocgklTl/HCKRYCh4qnZmqomcpIBaMR9vGKeeHn/v3fc1hYd4O
	p/BoWSuz8jvHyfj2H6Z9RN0udZpyn7qGSnBHZ02kgHFwfe51JGK1yv8CAp7Z+315Jb8hgOY30vE
	xAMvWqyxwJSHIOLqcpcPGTk23a3RAPwGN6KCWjM8Emr8HAWebAawo1sqIXltYArg+V5ocYyng1G
	NGEJhGsZwOFKb6dAd20hhsQ9vOIfk+94QALIAw==
X-Google-Smtp-Source: AGHT+IHPjKxmUgUnc41hN8InTFTUB04ZMTHM8NxbTIHlyyEkurGa6h5cB+riJJxf4O6UOMxvtJ+cStktzfIrQZXN+UY=
X-Received: by 2002:a05:7022:24a4:b0:119:e569:fb9b with SMTP id
 a92af1059eb24-11e031662c8mr92285c88.10.1764960513510; Fri, 05 Dec 2025
 10:48:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205-phyb4-v8-0-c59ea80a4458@google.com> <20251205-phyb4-v8-1-c59ea80a4458@google.com>
 <18eeb1c5-d21b-4505-b6a4-472f6e191864@kernel.org>
In-Reply-To: <18eeb1c5-d21b-4505-b6a4-472f6e191864@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Fri, 5 Dec 2025 10:47:57 -0800
X-Gm-Features: AWmQ_bmySTT8joxXt75c1w2iUmXVlvf9G0SNEi5yExzmfdZw7r8lYP_ul02mNBU
Message-ID: <CA+zupgwa+m8Pa=+8shORaOA1OO6zoo6zYEojFS2UDuP0doBq7A@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 9:13=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/12/2025 04:54, Roy Luo wrote:
> > Document the device tree bindings for the USB PHY interfaces integrated
> > with the DWC3 controller on Google Tensor SoCs, starting with G5
> > generation (Laguna). The USB PHY on Tensor G5 includes two integrated
> > Synopsys PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo
> > PHY IP.
> >
> > Due to a complete architectural overhaul in the Google Tensor G5, the
> > existing Samsung/Exynos USB PHY binding for older generations of Google
> > silicons such as gs101 are no longer compatible, necessitating this new
> > device tree binding.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
>
> Why intentionally dropping the tag? How are you handling this patchset?
> Rewrite every time from scratch?

Hi Krzysztof,

I dropped the tag because a new file is being modified in this version,
Although it's just MAINTAINER file but I thought you might also want
to take a look. I wasn't sure if modifying a new file qualifies as
"substantial" so I erred on the side of caution. I should've called it
out specifically in the change log. Sorry for the inconvenience.

Regards,
Roy Luo

>
> <form letter>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
> of patchset, under or above your Signed-off-by tag, unless patch changed
> significantly (e.g. new properties added to the DT bindings). Tag is
> "received", when provided in a message replied to you on the mailing
> list. Tools like b4 can help here. However, there's no need to repost
> patches *only* to add the tags. The upstream maintainer will do that for
> tags received on the version they apply.
>
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/s=
ubmitting-patches.rst#L577
>
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
>
> Best regards,
> Krzysztof
