Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32669170A0A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Nov 2024 09:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732871010; cv=none; b=N9NLRAxGASApjxytAhyZXD9csPN+DAy4P5U5qTf92km0ZeTnCEOI3SIdZEOfgCMsU8jZO1GCB4d3B895AXOCzcFyomjgamb8BqhRO5hOZvSq2Mc68lD+HFsxMqlL6jQVrIM8XePzVwjFsmj93KjyRCnm1LMwbYaBe8KdV7vW/PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732871010; c=relaxed/simple;
	bh=wW1UPfI2pZbnJAJq8B5Y02AKlDZ/ksTo9I5RBhqTvuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWF5LbCyR3uXb9g+4bi1HGQ2fyLolwQjvturQMa4oZ/msd2X9vHOWJR2XPf93gd8Xp1nwKSzPkRlG8/ZAWWBIsVhJemBAXzO4/MGJjudkhbJ/QNR7u+YSM8kBbomQnwrmwncIggEPPbH5xUDNyNerI9Ok/Z9rrMM4D+61d5vjyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R3V8E2/k; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R3V8E2/k"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-294ec8e1d8aso1050441fac.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Nov 2024 01:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732871007; x=1733475807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wW1UPfI2pZbnJAJq8B5Y02AKlDZ/ksTo9I5RBhqTvuI=;
        b=R3V8E2/kw9eOTTCF15X9Gph5mh24F0GkbGtFO0dNLnPJnBPY7Iq/kExGi6J6l+gp7C
         oIwvzU2bjDqU7n5m4K/NJW2pXOIlDvIuM0hjgDVSyBo0+FayvXzdmAtLPlvSRpa+Hxno
         ZPVQBcOBNwCdItc/oZvUDMcDr/5MSZoylQMvVaErk/4A78JEMQgy66WXsAT4RckqWtV1
         3GPPq9X0B1WxkLIMGCHidGgGCeo0GbDqOdCZS8dUB+gK/hRcWEzO+EvoHhwP/V5/uvFf
         9jVwCd35X4zc4T12W2NQWXPlJquAiqD6yp/AWSPrDN6Xq+tv/f5To/7M4nBtFDEuCzsE
         aHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732871007; x=1733475807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wW1UPfI2pZbnJAJq8B5Y02AKlDZ/ksTo9I5RBhqTvuI=;
        b=l+78HWIZZ3ieo2i17fENls2RaPYXc37FX+F6Vk0rPpf0Fr0dbIfj+T3Njuw9EWJrcx
         jYQAg5rgAGaLfxhbtIOYTxDbSj417zhKCDZzfCzq9lVv/a8pfClm+X54+RUKEk9g16ch
         IQmVisPbT0IFUskhdajxoveCF0UTKfCxk7h6rOTSVyoyHK5ChjHisqKqSuBZFtwJCt36
         1ZCdTscb4O13zznW0hYVBOLCluq6juJ2u1sfKzxSAw+UHpdvLHBHQGJTRQXxstG68zRt
         JZaoUUfp/Lk8Z/tfwu+nLbquOkxdtSQ9sm6/ePbDncAm3cxy676DpnO9S8/7AW9yKtJi
         ha6w==
X-Forwarded-Encrypted: i=1; AJvYcCUU9NxXGERRKdMChv89W1NPr+5LwUZsHxicGkj9EzxTR6mZiaQlqQIaA2b3r6f6n9ZAFlET5qw3uKwQr6IsGXP1Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3arV2JS7fATKmNhYWVgtbawLA85gA3Z27UU9xfF9iXpo5tpGy
	dW361u/g2PqntWUeG2+SSG8bStUtWRYE1g+OOJ5fsGBcCV3AhwqUt/7PxcMAvWwjaNsRniwvciM
	odkOlMgDNcmMMC17u0NkoBlo44ITNy6DpogDKSA==
X-Gm-Gg: ASbGncsZkJGS0Hr5QjeUH/wmKrv6iRnOdWvJ+ErkU85/HcVnxGj5E+0GrH5hiQLBHWK
	+YsT2dIYVxKw8+PUHp3DifZXva/ws+5GE
X-Google-Smtp-Source: AGHT+IERoPgZEiqiqez2SpbM2z9r3e17P7M26vSOjg5eYLpH30rXYi96JJOb9xGSNWtscEvyPnFpElGY/PMRwNHOdqA=
X-Received: by 2002:a05:6870:948b:b0:288:a953:a5c7 with SMTP id
 586e51a60fabf-29dc4033a56mr9209530fac.14.1732871007224; Fri, 29 Nov 2024
 01:03:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-1-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-1-1b7fce24960b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 29 Nov 2024 09:03:16 +0000
Message-ID: <CADrjBPopeTk5d0irJ3UDBBG2=gJF4F7hKWbaGP80x9F+p2jhUg@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: phy: samsung,usb3-drd-phy: align to
 universal style
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Wed, 27 Nov 2024 at 10:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> In [1], Rob pointed out that we should really be separating properties
> with blank lines in between, which is universal style. Only where
> properties are booleans, empty lines are not required.
>
> Do so.
>
> Link: https://lore.kernel.org/all/20240711212359.GA3023490-robh@kernel.or=
g/ [1]
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards.,

Peter
