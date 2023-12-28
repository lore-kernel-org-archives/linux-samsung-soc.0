Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAC0387
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Dec 2023 00:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PZjXOvyU"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5edf3780534so13289507b3.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Dec 2023 16:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703723048; x=1704327848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnZpCbxpG9ZXkJEKbWpCszWIDg90Dh3GgSsbG0XTifs=;
        b=PZjXOvyUqbK9cwTda+j4ivq5zTCdszAVnhlXxXGeP1qv+ELsDTl9/+yCDwoV/U0kDr
         GbJoZYtcoKfQ6qXKE3C4lIBLfc7dkzpMl7AAOGnfzznR2o517vlK13bc/gbQ3vN0QORP
         cDy92eSPOr0T+2JHePNYPnQCub8XDeuSFlSgHlu/aseCfa3/xVYie8Xf+C6I8ikqUNT3
         QkSkgPo2OEEETqTYBHfSFANMoFjGUm5rSPaahZG2xi82CpMpMhZK0mipqqp1PEX2FpxN
         7csNs7rLbBIEW2GA9MsAeEtT8qTAqvHnanSG/8AaztyLOHltPlcsZdkzHvMG32IY4TU/
         g60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703723048; x=1704327848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnZpCbxpG9ZXkJEKbWpCszWIDg90Dh3GgSsbG0XTifs=;
        b=b/nKrPJCgCQawdFBTIkW3SLxocUiFZQCTwaMPmPwp0dnPkRhWp+H/Xf9ML3sFSKaoj
         VI2gNrE/ACjP80uMfm6CMod7LUV0hcy418fStMBkci+kIgmemWA4bO4gB4D8Es24r2CP
         NYFqqGs1GDMs3BrPvnxtxZb4uo3FbuveiDAuI8GIck+gkoybjonDIW0Yk0oBaCIHQgzy
         M/k7LW+yp9VCApVufI/DH4XMFln675GiMl1eCbmjokqMEagntcDYE4/OTBPAlk6FFiqU
         9q3cmajKne+e3bmaqYXNKAmVE9EBwZZ1XVFeRm0y/X2OGDMmHqmwKJUFmiaDDyiYqRp/
         iJKQ==
X-Gm-Message-State: AOJu0YxeTiqq14iMgEcSDGlPzywLYIrrdX5OzXe+7enzeRAidiydFE8C
	Hvf2RIkJY9u06+bR1kypyM3dYtECUxpBSD8JGN0XmHMK5smvLA==
X-Google-Smtp-Source: AGHT+IHR03vSvnVmsAq8IM/pF0LR5N+8EMmwK+moEtYhcqnSeJ27VYApYh9cAOplXTxeV7EiRxv+ruW5Sp+tuHtRJos=
X-Received: by 2002:a0d:dd92:0:b0:5e7:bb3e:606 with SMTP id
 g140-20020a0ddd92000000b005e7bb3e0606mr5250773ywe.89.1703723047806; Wed, 27
 Dec 2023 16:24:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231223191902.22857-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231223191902.22857-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Dec 2023 01:23:56 +0100
Message-ID: <CACRpkdYLXEA3D-_22jsios5-CdpC5CLxFbTUA-Z=dqTHmtH9XQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: constify iomem pointers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 23, 2023 at 8:19=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Constify few pointers to iomem, where the destination memory is not
> modified, for code safety and readability.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Is this something I should just apply directly at this point?

Yours,
Linus Walleij
