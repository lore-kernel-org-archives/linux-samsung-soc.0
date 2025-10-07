Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45115187332
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 20:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759869987; cv=none; b=DJBS31aN3Imvp6PedXyGqjx0eNgzi8dtEMaB/46LHM0MM7bEvGEEd3BkHWbcbVyVqOzs4crHsfzF17z5KKDFqH5xe0QbAa6QD/l+wnfHoSKp/Nsd3pjs176d1IZhquxoTxwRxCeSDI+iFmcyZ5Kfknfgb3BxFruIUUHp3H9ujxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759869987; c=relaxed/simple;
	bh=LbdMXV3ozTZmE/S9AboaOaM8iqRjDNxZDvdwE/Es4Cs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lsQMTekO+oW8CE4R1238TPqv5msfDp5IdqRvXN8rBd93ySWQrp3MgtK51nMXuv5awsU4pLWBf294b2HPY5IxT4MbB5+0ynt0McoS8sOVXgg6j8bahDa10lO5Res9KDSm4JQVffX3oqA/pNXLY1AZJVfmJpp+/czY5MNvtmvc2FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pUSJO31+; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pUSJO31+"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7bc626c5461so2235792a34.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 13:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759869983; x=1760474783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbdMXV3ozTZmE/S9AboaOaM8iqRjDNxZDvdwE/Es4Cs=;
        b=pUSJO31+QZeiKVVhaGISvowrx0WkWAOveOLBZf2c9BTC1f4qjkIDLfCyoOnxZ/GdgR
         d85Ln+ToATRTkEyEQQ3/nl/MFf1xK7fXIIJggUBYgQjZTtxlFYwYHKPEJg0HNAbqMHWW
         Fd8J3+YQLo3doOOyx7NK6lOTrlRibz0vQm3jHg4g3cRL6Qeqf497GYo1eXWBlerfk3gO
         2TEhuZiHCiuTYSXYLZzSIPLHxaLMNmbo/xp+Mn0HnadDsYR6JfInomB4EwRUipwCWABL
         joW6AeWpugEWwHxq+fQ3FBr7XhDpdRCnXAKBrrROJxAbQYzf1KfGWRTKiaSB/blCYBUJ
         U9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759869983; x=1760474783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbdMXV3ozTZmE/S9AboaOaM8iqRjDNxZDvdwE/Es4Cs=;
        b=D4rB/0MRwP0id0XZVNznL7TxXLm8VN+jeTTvZpU0IrRyUkcMbjkwIEoxOQRA4YGZAD
         6BtmyN0PAFJDbfwQ0DzmCXt1ti9hiQdoj8s7zaLRmQKn278K/MkkJnr0HLfOGkd0ZYtJ
         efpuXRvzFSjovSRKp3NOEupOn2lRPrFSlydLz7wX46tICvXcye3cgxWJXaclfTnGI2OG
         8KRbU/NfXRg5iN5XSD6Ehw1zd2K7ZNVQbVkgK8C8VFsHbaMrtKnLy2PKa4RinjYrFVx5
         sq0rQeWGQV8IgjBcSjzzxbLHei8N/ZOYhcHQghyEKWCnORXoQa7+wv4GlxI3HW7t7Jv4
         u88A==
X-Forwarded-Encrypted: i=1; AJvYcCUVegVShM+fj20h7xXihOEDXZN/qOowuCGNusfX/CcUrrOVsiQA2ZUJ9CPlg8ET1wb4f8LgkaAAvI4+NlT+xCSDvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPeyDFHfHietF84Cc/Kwtdqa20QQ7BzEyNzJxe3hViLv4uCq/n
	u+jVoFU3/NfIhzFAl7yiJ9WSVcDcLnDIZkxB1Tmm0cdMg35w1aBxzdS5nw9dWQtPRKr4jtMgD+R
	2Ds/W+gjhJvzMhl+3RMUehn51e3jXDkMRB0SKvRLWEA==
X-Gm-Gg: ASbGnctDlSDqh1GjGbB1SxomUDAoil0CA+h0vSCD4mNT5kSFs71fGP+dR7qTS2ZN39L
	j8cXQwmXc8XqjE/ML4LkoAFwDLZ8MihtOGwuDaqdy2Ui67Ami3Op/tFqwk+VYSWRjQqf2Nmbo3s
	s8g3Gj1oDAiyBZ9ZvfFvlP7LFQw6BBzsaEiqYCRuMXqLbojejRnpP6M5tK2LNfhkfLl0jsot9WA
	Y33nQNjE6vcu3P874axRWjcnNVX1JW0NfDiqg==
X-Google-Smtp-Source: AGHT+IGcTMLJLJFMRFfxr35P1VFknbDk8xxpM6Ma7bfAlp8Jh6N302g2i+0XPxTMnwxgopW6JsJbBg7g+qmgQgVNk1I=
X-Received: by 2002:a05:6830:621c:b0:746:dbc7:e3ee with SMTP id
 46e09a7af769-7c0df715858mr633841a34.4.1759869983308; Tue, 07 Oct 2025
 13:46:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org> <20251006-gs101-pd-v1-1-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-1-f0cb0c01ea7b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 21:46:12 +0100
X-Gm-Features: AS18NWDxc12ZxAU4LNjeEPKBB8NsjHFZacb56hFZBSRRIbtDZk4xL2W2KL2JXWI
Message-ID: <CADrjBPrT6LVqs2NSu6HMWiQ5Rm59pXcbfcjLc3ZxrVBrMjGQwA@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: power: samsung: add google,gs101-pd
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Oct 2025 at 17:43, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Add support for the Google gs101 version of the Exynos power domains. A
> new compatible is needed because register fields have changed.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
