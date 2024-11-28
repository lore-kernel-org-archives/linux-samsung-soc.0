Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D47912BF24
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Nov 2024 06:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732775139; cv=none; b=ImXBtktGbJ4TTAcYqD4wh+djb2X6gBKwrQfjKFOYndxeG9qEzR2IT4G1VTnXxK933WfMMwMUhMQ52zOmY6O0Se3Osu9reMr7tooNfDCdMyt/xO1v9mpYJf0xLPvqo/5Pz6XY+aK/VHZJdba4RgT7UtRt3tMemeCNdjlrTKS7RCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732775139; c=relaxed/simple;
	bh=dYPE4ZNCJFy6FX0sE9ClVhGv4Cf/dafDkKNJVsMswuI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BGwBtmUxdEX7Y601QdiJXD+dSR+G7H0AfyW3HSlTndgsRCmWb912iHutPBiMMoT4zUELAYFowXV8LbCoy7qNI/myzEAQMHNgG8mYiCuE4XW1tlGhxsju9JW7KXUSJSfG0tE6+/jtj+RO9TB0XqpLZZT9oQvBb7qTYTk1raNg+m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j5M0wFn8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j5M0wFn8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a1833367so2574385e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 22:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732775135; x=1733379935; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dYPE4ZNCJFy6FX0sE9ClVhGv4Cf/dafDkKNJVsMswuI=;
        b=j5M0wFn8FQX5MLBPE849ILdmuPXyPoVemuRHMOZ3n4QEfPzN5ez6eOcfptytx16cmX
         DxDMnWsrqPNqPX7iiwCxCdjmjb6TggNrGt7fyzKuGcvCaJzmyFGmb0q27xJeF4fzD4/9
         N1hvfSa8SMAj19GPx6jDfznXDsfKnqX9sNgJQAvelawOmacTywHT9m9u0NMQ5g3hpJaM
         b800NrCOy11VTC+B/kN8ODMwpkF9ZzugVfgPJsv12poEqoQ+AXU4UiRVMQOtVUXw2JK1
         9k7w/IqQM6FPtRTl3qU4EzeoYo4FbBG8OHaw0dKXp3t5TalEt43/YBAZWsLPoaZme5pn
         98jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732775135; x=1733379935;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dYPE4ZNCJFy6FX0sE9ClVhGv4Cf/dafDkKNJVsMswuI=;
        b=QHLKfVkNffNjeJV2GHBJmXi9oeM7aXSywPW4YM9i8Eo6gBA89yH5EI1vWrWViBK/n6
         kEyA2pKEc1Bd0uHlfiTvnKdqvj2de8pWSmYl/vAQKkLD29Brx5dC3e6Snq4YhLU82l0K
         w68aA2ecgqUn4alX01rL6pP8GupWMAwUiPuOjxgOrc52EjEgzB8Uf/YiwGDbegFp7kd8
         VhzwfOTO+viytRCpGJn3AK+ZeTbKa2+yn7VJfyus5XE5BcshO7bBbdE8wSdeJKVcdTQ2
         8fxNLI0/gfOCe97psoUeeI07EADgbySjwKZYBia15yT1NvxUSomKos6VWvRvvTOENAl9
         IN+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhvyfnXbfxODejAJiVi6mmGWZyqehxv5t3WnpqKbC0sOFjxx6ZMkN4Av1NH4noptj3T4/82+k5I8vzzS558b8TnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYAF4uCQM+tWTRQLyRY3zw23k/rOcXC18X4WZFgi65J9YWC1Jj
	bIMTn8md++/0Gv9fE8EUE576o0IEbttfvrkffuOjJlknGKJKkwJtg67zKwwwg2M=
X-Gm-Gg: ASbGncvMccxsqZ2vhFAAPhKKuL4pL8mw9kRYtBo1wyIwFAGgM2HG185fgfNxNGbfDxt
	HvnG+6aj8fLXggNgFDf4ho755ZEzZyHxHG36W0Tde+qob5pvbUaXj1hhJf/fjRPUWFo5wVfSXIZ
	XwutkoFMkZzVkjr4L0VTwKb30VhBzV3K2TQVE5/fW2y2+O1fnHkfyRPZKiB6rEbtU9r02/+zi0H
	1nuhcfcVhHRzTWS5Th7IWfXhaYCyzzuX9fQVMXQdycDZYGC3h0XwnU=
X-Google-Smtp-Source: AGHT+IH6Ml7J+veNZgcHRluAVpujI8NQLzYAgYOdmWcaTC51mp1SAFlDYpCulVDkM5fF9/EPeYf0EA==
X-Received: by 2002:a05:600c:1c0a:b0:434:9fca:d6c3 with SMTP id 5b1f17b1804b1-434afb9efa7mr14137785e9.9.1732775135356;
        Wed, 27 Nov 2024 22:25:35 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2db0bsm775126f8f.2.2024.11.27.22.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 22:25:34 -0800 (PST)
Message-ID: <8e11e1c92d81fa39a2881086dc58f6262dd719e0.camel@linaro.org>
Subject: Re: [PATCH 6/9] phy: exynos5-usbdrd: gs101: ensure power is gated
 to SS phy in phy_exit()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I
	 <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Szyprowski
	 <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org
Date: Thu, 28 Nov 2024 06:25:33 +0000
In-Reply-To: <82f94ea4-2533-4ebd-a9e5-96ed64bfbc05@kernel.org>
References: 
	<20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
	 <20241127-gs101-phy-lanes-orientation-phy-v1-6-1b7fce24960b@linaro.org>
	 <82f94ea4-2533-4ebd-a9e5-96ed64bfbc05@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Wed, 2024-11-27 at 20:42 +0100, Krzysztof Kozlowski wrote:
> On 27/11/2024 11:58, Andr=C3=A9 Draszik wrote:
> > We currently don't gate the power to the SS phy in phy_exit().
> >=20
> > Shuffle the code slightly to ensure the power is gated to the SS phy as
> > well.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
>=20
>=20
> I think this should be actually a fix with cc-stable.

Will do in v2.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for the review!

Cheers,
Andre'

