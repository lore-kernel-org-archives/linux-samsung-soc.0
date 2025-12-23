Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EE732AAAD
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Dec 2025 09:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483707; cv=none; b=eT8l5wuw8SJ69mYLFjz1C/ig43SGz6kRRjN+yGGyDjd2Sga1rVm2dtvSFDggVA8POUGCOkRT9aFiujNGva/btUCGe/VOgsYHJqm9obMu9vIt6tCdNM3xkl8czLIeeazEmgQtLWxwfGfQOTCzu4mbv1IHsWtMBKFo/VJQzfcV594=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483707; c=relaxed/simple;
	bh=j6tgXLyeMDtY81gzu+UAwTardCPOFsj4A05vaFcvi1E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g+wo5UQld3z6s86OIKHpLK/HDHVCLujLdoj9N0BbtbZ7UvzSF8VOQ7uA9yUS1lPXeJeuNGPmz6O9hkcKdaNwLfpDskl6F+QhIC0Aos6uks5jsfQD4599btobPFUsPEXtyIOQJabfGagDYADIiY/9O+qilDkDF4o1QgMMvbo0K18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fM/Gtwtv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fM/Gtwtv"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso2456049f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Dec 2025 01:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766483704; x=1767088504; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/YO5Uvts04jHxPH1E+Sg8oVaj5XxMMKC7fUH8OS5AS0=;
        b=fM/GtwtvqNJcMiXL0moeDxFN9c+/k3ZEg4dRjAep0jE/qMqUoVsWB8SmknulNwhGmN
         AYVMeRgKjalrwMvev7XkzKtrRDE/4BfB4Bq8vuRKK6SSxvVYOezueo2YFDe2uXV2uIAI
         RSBxFworWfHUw48oyNXXnsSIZH1FhsySf5LFesfr2PUYRUShoG4vnPMb2a91poss2Crd
         wZ3WN2g6eQ04XEi2LlN+nBsShkLSQVqwwRizilzY9UzcjqnI1PbODa6KY2LolM5lJmmr
         LQMu+C73ZietFLPnI0L+7Y27oPEc4eXqZjAgfR60tWKt4mYKrtNCOaKX6YDNazXL7IYI
         PdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483704; x=1767088504;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YO5Uvts04jHxPH1E+Sg8oVaj5XxMMKC7fUH8OS5AS0=;
        b=jmRvmLqA75CtLgLKIjj2JuldvxZUEtSEyzozDKyGvB31SJFnlK2uEkdCuK370+luxK
         FamQIzyTfvA9PvoXIRFLaTXqxbXTEDqgTiTnKmdvRc5NAfuen5lOap3dhAOICK3E0mcN
         H6G6S8kMvx0av5T4aenIHvNMDzK+fRMr4rQ3md9K7mpLEBq/z6sENZZSCz9W0W0Q3QQx
         +96FFlrAL1CVfmOg03f2TrtLKbaphzKqs+soVVT66GgINz+EF6yVRwN9b8gqphScC9nV
         GvS/Nde0YQsT6hNQveGn5K4m/w+vnHKeRyeX4udfYTfattgG6cAqqJ+PWEDLE9fa/IC0
         +CnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW77yH5pyty8fC/YxbfCdem25te7cVTyXb4bZwYIL5Y9UT1HHqOzU0n5pIOXI8jSvLYysVMbVLpimMil40W+iHLew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7yfsm5kgas3ywWuzn71sGFn+e7UKKq0nmxus+nSUdi6hoxgdB
	u5Wwta8hQ6jPxAzTwkNPbj3uh2jiGyKTYTp2TD+1RZiIn5uUb4k6A2b2GtHScp4gna0=
X-Gm-Gg: AY/fxX7pxpxC2tj9aBaGp3jgs/rv9Xl77t43DLZdiL8jvbCtSS+5cQacHG85LqiIC1+
	loUAOrvR4qBHIGfh47zYH3y8UU9+36dD263beHDE1r/drAhRmA470orC2cAza1HBQZ+pdzdmgqq
	J3NWj+PKsGHZRzi+hSUwTjJ0RjpJhjhkosw44l6RmrnCK4Hfollc0xuxfPV8xpbDJL/dayLKm4G
	BMbBNjtmJIJbigPLTZrwf8hCG9yQNPGweZe59O0QWQBQ5gXYnTkGHCbPrxZ4Xp/H8mhngV26eyb
	foGnqMiV5a9xo2XqiFHeP5ySHRw2kFkyaifT/mcfCqN6QTRewLstCMAxVxxeG/6QcZgJ+X+G5iv
	3RTwmpNBr9PzNUJbAt6as8grWTb4ICdNsMgsV7EfgXotoHVEfu+aOPvhx506vqbuK33yj6Jptgg
	I64o+BOp1vRCFp1o4y
X-Google-Smtp-Source: AGHT+IHn1GlPRf1Fniuh1RmFfsJ96HpQRvJXXzVmZFTdyuEV9fySR+khcoZkMgxQXIqdh1loSsJh8Q==
X-Received: by 2002:a05:6000:25c1:b0:430:c76b:fadd with SMTP id ffacd0b85a97d-4324e4d3f7dmr14473947f8f.28.1766483704413;
        Tue, 23 Dec 2025 01:55:04 -0800 (PST)
Received: from draszik.lan ([212.129.75.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm26479438f8f.22.2025.12.23.01.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:55:04 -0800 (PST)
Message-ID: <bf1bca0af63f161afe351cb0e449896cec11cdcc.camel@linaro.org>
Subject: Re: [PATCH v4 2/5] soc: samsung: exynos-chipid: rename method
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 23 Dec 2025 09:55:15 +0000
In-Reply-To: <20251222-gs101-chipid-v4-2-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
	 <20251222-gs101-chipid-v4-2-aa8e20ce7bb3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-12-22 at 16:30 +0000, Tudor Ambarus wrote:
> s/product_id_to_soc_id/exynos_product_id_to_name.
> Prepend exynos_ to avoid name space pollution. The method translates the
> product id to a name, rename the method to make that clear. While
> touching the code where it is called, add a blank line for readability
> purposes.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0drivers/soc/samsung/exynos-chipid.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)

I'm not sure this change helps with anything, in particular as the
return value is used to assign to soc_id, but in case it gets applied:

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

>=20
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/ex=
ynos-chipid.c
> index b9a30452ad21c326af35c06a341b28491cee6979..88d264ef1b8835e15f774ff5a=
31f5b3de20f74ea 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -71,7 +71,7 @@ static const struct exynos_soc_id {
> =C2=A0	{ "EXYNOSAUTOV920", 0x0A920000 },
> =C2=A0};
> =C2=A0
> -static const char *product_id_to_soc_id(unsigned int product_id)
> +static const char *exynos_product_id_to_name(unsigned int product_id)
> =C2=A0{
> =C2=A0	int i;
> =C2=A0
> @@ -150,7 +150,8 @@ static int exynos_chipid_probe(struct platform_device=
 *pdev)
> =C2=A0						soc_info.revision);
> =C2=A0	if (!soc_dev_attr->revision)
> =C2=A0		return -ENOMEM;
> -	soc_dev_attr->soc_id =3D product_id_to_soc_id(soc_info.product_id);
> +
> +	soc_dev_attr->soc_id =3D exynos_product_id_to_name(soc_info.product_id)=
;
> =C2=A0	if (!soc_dev_attr->soc_id)
> =C2=A0		return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
> =C2=A0
