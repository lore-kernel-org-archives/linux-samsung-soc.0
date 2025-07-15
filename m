Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBE91E5B7B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2025 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752588096; cv=none; b=ctGo/Z3z2IJY3dYyz9y74Xan5f/GPNgd2B8Q55gkawDjIIe95v13pEcREmFuAqobdRLxpC8IRHahRWp+PlViMHrRJE7ti/n3tDUM9HU/ffpcX3ru4qcfu6po6ZRFfxCAPnbWq12k4uEvQxE6ANXby95CNQtzhlUiwBNLcDakfLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752588096; c=relaxed/simple;
	bh=ZehdloQEUsP88pigCl64ebfictbezAWEu62Zt8m49sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=in3738IZz3cje74Nys62a6MqZiYu7X8MYRBuipL0OiukdJrgSbaPeXedgfB6holnexpHWDrs3Ki1IovCDComo4sr4gaazD9eIHIhvAUYDg5451nbpOxuhqqytFepoxdWk0vxvLIJOAlXyXETj8nGZKGkJF+fqGCKTDxQz2kBzQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QvY0BD7k; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QvY0BD7k"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55502821bd2so5698053e87.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2025 07:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752588092; x=1753192892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMq+z0lTQ5uqzjIe7ORBXN+DvvALIfquyp6XwhodWKg=;
        b=QvY0BD7kEfcCud+y9Vn9la4Fhw8+G1Pj7wEoK8gDPvkl4zKp9bl7iqOzj782EBceI8
         ccReZhCWcgz0U+kk/Fz3fe1AHdpnmsgU7vg9D6uqH4g/knnOoFg/QohesoucuXWobWZE
         Jfwfkv9ACztJIR0ezHVsQKmI2K+lR5LrDCdZjl7NSSpRbbn9vfYxIHCqhMBSgUSUfE+S
         5Bu0psetYdQjfc43FYJ6ctq3aboaPPhqRn+LVVOAumjl7iXH89p73036RDWBPpKFqjX0
         A5JwvrfnOwiJYCkBU8dOenOH4BFru8Ww70tQzbkf6cNWTXcY78PSVDyOTVH6hrbviHrn
         FPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752588092; x=1753192892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMq+z0lTQ5uqzjIe7ORBXN+DvvALIfquyp6XwhodWKg=;
        b=MSbwhyNnQ4wA9w7KpjpKu+365c94o0/TAh6Y+IOW6yCxlqb1MdODgC7sN/h2qp8Kod
         mr43nGrZWFELjNTF3Dh9ZDV5hB/9HkWel3Iidz/UqvuCzN0kLVCC0+NacUsd/x7BRk2M
         DQmhCa52AlOYKXPN1DJRqzbAsDX3OxqW4MUU6PY/POkIuPh9WdNFsk2MiWHMUyGAlitN
         BrySxMnMnttTodHxjRDmJJnDgg+oF48NZGhH0r1x4vmjT0+LxewDgf2vvFW5HiWbqVYP
         fvFRuIKmu9Oo0nR30H86FryatH2RAuzbgHFm6/kNHahyyS5dD73YsEK2JK6SexcQybJK
         4MUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3rn4MUReyuWEZ7euKs19MZxOQYAOLdm+jDyiVrrVIQVLgS8usYmu+4cO+y3+5iUrqsGgljwTEPmrbHp05WJlA8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBDhWmwOoAruArFEfk7PiIdtCDaZmFch9TRqRnl/dqe6KXROyw
	VczP+iZhj3niKCLhbCt/PFuYGetvExx4kGJ8i9uSZgyCFwrcWTnaBnvyQ0+o9ls4aExPxcCMUI0
	9WVI2zdiwHBGE9WZQ1jIptZD11g7QKO/TVaQvo1LQhg==
X-Gm-Gg: ASbGncvbevLOxsZToNwEzfLraJOoWnHC+k3zvKjPMTgRZY8OW3Sj/QW93N3AXEkNmDI
	I147sLC1j0eLwXuG9VB7R1vzNgLgpprJ0g6jAIqqag3Pfapbe3LzFwL2ng1KOoavpVOuTfPa+oq
	mpo660HFMTSjExPnJXZLPAIWVRHnTT7mzF5NdxA+lsHNti8QRUwj6uOLEHiQC9ww0LlD2sodFZq
	NTCUlLHI2c9powSmg==
X-Google-Smtp-Source: AGHT+IF13ylGotB5yILT4bHb/RqmaS522PnGXIijvb1MELLLon8vaTv/g4ADQmp0eDqrLOLp5d2POnBSPsqQfLVeuyg=
X-Received: by 2002:a05:6512:3d0f:b0:553:2f47:ed21 with SMTP id
 2adb3069b0e04-55a0460950fmr5418782e87.41.1752588090141; Tue, 15 Jul 2025
 07:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715100415.60487-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250715100415.60487-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Jul 2025 16:01:18 +0200
X-Gm-Features: Ac12FXxwgG17tM0pR7Wbn7eqRk8ggfOlZMUUBSReGExBS5bLfNdm4fWxeml3fXM
Message-ID: <CACRpkdZn9ePtwBnxNoy+nijc-oqu5zWoKc2O9QDe=MsgZpRdKg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.17
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 12:04=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.17
>
> for you to fetch changes up to 683d532dfc9657ab8aae25204f378352ed144646:
>
>   pinctrl: samsung: Fix gs101 irq chip (2025-07-05 09:35:22 +0200)

Pulled in!

Thanks Krzysztof, excellent work as always.

Yours,
Linus Walleij
