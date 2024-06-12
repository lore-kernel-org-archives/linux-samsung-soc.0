Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA6C1802A5;
	Wed, 12 Jun 2024 15:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718206663; cv=none; b=FlGUmokOagqA+UNxRFfR7odYQsNlfmigQh8zHt6imkiKpbYKI7orbbOoDwUydxaJ7hmswf01q3819wzM3HzNgmurQAwFl9t8ON+7YYuTxbATnwxlTJNPGQuXf4jWdbgN00a4rPMh7CPXPepWT1PFCUrpecMYoLtg3DeON8D4Ghw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718206663; c=relaxed/simple;
	bh=zEoSv7xC3KbRRieI1G1loz6QJ3w9qP5EAl0oJ/gqkz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOC8boMPyfVMf7Fut6fywwRLkABxdFVfw9M8BMMnDDXUCBKQ1E2A6UPw+gtEolmp0UkmMiNmm7zTV6Qvf4w9jdF54vZ2nX4OBsjvxhx8+VGYd9R6a7qx2y3xiYJnYszhVmaHTBQ6QvzjZEEbTj5SsRUplJv0DdfcXQzqK2G61WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2l0gBlR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2l0gBlR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24939C4AF49;
	Wed, 12 Jun 2024 15:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718206663;
	bh=zEoSv7xC3KbRRieI1G1loz6QJ3w9qP5EAl0oJ/gqkz4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K2l0gBlRlMxzfHPPadUb5MC23rfAfH7rZy/fErcGjf8ESoZfKwg3dLhrzJPlknrQ1
	 gfPwTQ//4krhGXfnAnzb9EaN1pxIlMsF5Mtwjgf6io5jM/PVsZRPTsjDRMbm66RgAW
	 95U8B74tnEvlGvNdeMSF9Xj0Mkk/iOroBrK7pwuFK2R+GyNaJ5YSb9D+pkkZ/fwYnM
	 hTX2gQ3W1KTCe+2zyqIX1FY4fj9WoKRq0Ivazc0yDHCrQBI+EwB61EeX8eKjU2iQlk
	 0Aso9umyxDPdagefihfHHiMftCRbfgDEpvuYx7lSkgJhUVaiDhSgCflEa/GaNMbEVy
	 uUTbJeMqbNy9A==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ead2c6b50bso75478861fa.0;
        Wed, 12 Jun 2024 08:37:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxypYS8aoTEmHRWs1SrCoBaH7MnbJAOjwzcKu1IYbAu5QzgXl8d88U8Q5Q1TRrqQL9c661qmeH5eamxmiIM6dYfeq38VWJBk4PhjeJ/HOfH7JEdithJ5pQvO5FvXb5TydGIB7+zBzfQJo2xoVWI+ONfyd+rA5z3fQrFo9jUWPCVncUtUuaV7mH6s18
X-Gm-Message-State: AOJu0YzMi176uO6u+/suC6XA+rQWXhgVLXP9Srv/aOWWCbMgbW9i08WZ
	mGlpTgPvRhu/cWLyriFZHCvgWih2/q1rI+TgmlUp+pIQozkCgJobsmlYIly4rE+qd3ktvdAbyvI
	fwJnS8ML4PrS1gmeBV4k8G3r/uw==
X-Google-Smtp-Source: AGHT+IGl+ogyE6sHWGUc90Hvb7mC4rBJ+Ta5I1YQRQJ5YW4/fVcbcLzryqnOqMTHma3GIk0PNss8ABXfmtsFVV4O4fs=
X-Received: by 2002:a2e:8ed8:0:b0:2eb:e840:4a2e with SMTP id
 38308e7fff4ca-2ebfc94de68mr12672271fa.38.1718206661498; Wed, 12 Jun 2024
 08:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501-usb-phy-gs101-v2-0-ed9f14a1bd6d@linaro.org> <20240501-usb-phy-gs101-v2-1-ed9f14a1bd6d@linaro.org>
In-Reply-To: <20240501-usb-phy-gs101-v2-1-ed9f14a1bd6d@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 12 Jun 2024 09:37:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKDyrYBTTcpmoM-LbQUWch_qd3t47WC0yafVJcz+Se4yA@mail.gmail.com>
Message-ID: <CAL_JsqKDyrYBTTcpmoM-LbQUWch_qd3t47WC0yafVJcz+Se4yA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: phy: samsung,usb3-drd-phy: add gs101 compatible
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2024 at 3:19=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:
>
> Add a dedicated google,gs101-usb31drd-phy compatible for Google Tensor
> gs101 SoC.
>
> It needs additional clocks enabled for register access, and additional
> memory regions (PCS & PMA) are required for successful configuration.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---
> v2: avoid having nested else/if, and instead change the existing 'else'
>     to explicitly state the platforms using 'if'
> ---
>  .../bindings/phy/samsung,usb3-drd-phy.yaml         | 61 ++++++++++++++++=
+++++-
>  1 file changed, 59 insertions(+), 2 deletions(-)

Going to respin this? Because it is in use now and undocumented.

Rob
