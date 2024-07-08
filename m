Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB4B14B94E
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 20:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720470417; cv=none; b=Os/VOPxrqlo2XjmmkSOQo89PDZMh3bkJ0P/3x0GGyqjDW32f8Nt5gz1Qdf8ChfgQBTrbZ8UYVMQx5d2Nr6/Px3bYuGpHVZOG367JObQejiHnWQblFtAf9l6lyijydvJjA7IR6kD7oypGPrCgOpOgVEzl+bdJzwo3KPAVDbxjY2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720470417; c=relaxed/simple;
	bh=iP0jvq7PGIFczaEA5bqaPg8rzTLnc33XdldzK181P5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Md6zSVTGL6LsUe1WuyLF29IIcjhDn5d3hbDjoGZJE9sh4IxnZ8e1VY2ayR+hhECjGnXC0gf57Dm2dXy2OoFxeUejK7AH+q41Eo8SjVPzaFz2jks4yaWjXjVTKaNTbuQl/+foYp0F3lhbZR8vI1Etfsf/XnV5ow252/NXuD9HVGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bpBFcbj4; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bpBFcbj4"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e03a9f7c6a6so4709848276.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jul 2024 13:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720470415; x=1721075215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQqAxoPni/sISUNtLPGbi6yaKTLLkE7TWz06MwgXUpw=;
        b=bpBFcbj4V+g9sYzyufrCz+ceNYlJ8B73U96MDIBLf8IBoUzymmB61yuip291Ci8fgF
         iZNDkatbR/84jHsW26gu1p1J9s8dJOFOmTR2qa7TbXtLx3MNLGdagquAx3xGadeN13tg
         hx2Dx3Y4W3rD8C9xMvbJOFUR9s+IS4u7OMhnLm4IAMIA6hN1vn4gWzBE973ffeeugQYe
         d6MMfsRBTp2Rh8aj1A6o56UPpp1A4YMhfH/tNtkFPR36rZFhK+W9BsyZ4OZ8ETiC6lAA
         t8ljsWtS5g2koclncYr7vQyW1giEPdUiHAdE1XIybYoSYuDoERDjDmojUzA+j0XcErYo
         KBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720470415; x=1721075215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQqAxoPni/sISUNtLPGbi6yaKTLLkE7TWz06MwgXUpw=;
        b=acQVrpIPXPIFBrJgkSrPmSYHR/5DbpNxdjxJBnOW3jWqcJYbxbI+glaWWEQa604739
         GGIQ3GfXSLeDlzQJ8MWst5yHhl9Q28dDHQvNm0+ZDi+UWXmFWdlThQCA9k2bXsXQvb9V
         naqrmph6eOB0ICkS8oRQRZWH/J9A8LRgF2aoCxX0LcfBAjDNvUbJD0zUlRxZgJwFklYI
         oHYO7VoL31ZokT+Sn17eWyNZcTZBh740JcFrtSPjP03ZbzBX9r15G7uhkZSVuvLZiunf
         5Kzn1JVpKffixZ8XXgBi3ZthLX26kA8hebUwgezpdqu9AZfiVgsVJ49AWAv8RFhHhskg
         o6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXLk/89U009xTPHPtj1JJybY0HFA0R50jrtbYZblY4VBN6PQdg7JuGceHPX35LZX1w0Q04nEhkFfdwPHWEoUuIlo2PfmWMRHKZqIUxLeIHxmwc=
X-Gm-Message-State: AOJu0YxslPIVN6LZcPjRvr0O3SOOaMxNqVcavrf0KrkzOl8Qb4h13jou
	1AZHuUeRQzn2yaaaHtJhWDJREj8NcHqbkaaVD0NO4cz7Ht3zII0XiRAYnH0m26R2VqVwbkqY0Un
	yZbnY27XQF5sHV5gdZ5JAoZMlwfYwZFt72lCnAg==
X-Google-Smtp-Source: AGHT+IGO2ni/QPKZ5DyTQznLmq+yxlD7B6UffX80ITsFXuqHyccHxv2wbcoz3FyUQBIlQaTdDB4QDOW83uoQ6RkVu50=
X-Received: by 2002:a81:ae04:0:b0:649:fa54:1f8c with SMTP id
 00721157ae682-658f11a595cmr7769077b3.48.1720470415272; Mon, 08 Jul 2024
 13:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
In-Reply-To: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 8 Jul 2024 15:26:44 -0500
Message-ID: <CAPLW+4kwiKUUdwPW-TjdXEWivWbh4dTe+LYqsR+YssYy6XSzvg@mail.gmail.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix error code in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 12:04=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Return negative -ENOMEM instead of positive ENOMEM.
>
> Fixes: 497ddafe915e ("phy: exynos5-usbdrd: convert Vbus supplies to regul=
ator_bulk")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index df52b78a120b..9cbf90142950 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1745,7 +1745,7 @@ static int exynos5_usbdrd_phy_probe(struct platform=
_device *pdev)
>                                            sizeof(*phy_drd->regulators),
>                                            GFP_KERNEL);
>         if (!phy_drd->regulators)
> -               return ENOMEM;
> +               return -ENOMEM;
>         regulator_bulk_set_supply_names(phy_drd->regulators,
>                                         drv_data->regulator_names,
>                                         drv_data->n_regulators);
> --
> 2.43.0
>
