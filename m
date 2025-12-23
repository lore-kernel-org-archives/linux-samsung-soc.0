Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086B81E5B94
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766485139; cv=none; b=bf+kac7q/m59mYPxXJy/tIXJcwASe2j+mZNPxZsGqeIeA4RnCrTqSK453W29aMak8uGEZ8sOFzDNMw1qdqr1mL7HhKeLhW2EnoBnV1qpiySR+VcEO54eyNntDQOV86YHB9YY7JWiPZF1V+GTPME0GqNUoy0gKfsu3g4n3YRn9jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766485139; c=relaxed/simple;
	bh=u70hgefTY/mXd1G3u+GGwKuQRu6lcXks88nn/gIGKbE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rKJkU1Deom586/njJiO5tA4Lz1wkebUhE0wyC9YZbVwoToEN2rKbaQza0Fd/eXg39upr7YDaC1G28GcROXRudy2ZSmRQWZdnCC9s7yBfs8kW9bMz0dJpWgkP+f0VncN2PvgtZRXf8yqZsB499GIGjQ9qTKlanMZ2c2sIWQY/1YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=fail smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gng6rYuh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gng6rYuh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c21417781so4770756a91.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766485137; x=1767089937; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VW/cRPo8LKvRyH919j4YxeyMCTrtYxKo0u6s8/ZPXcs=;
        b=Gng6rYuhlZ4avygrxZ120HKf6FriVqeBpK7OuqLtykNnkDVoS2x0MIQC0RdIAh17Xk
         iUi1cRbrCS6gHQPpUXXo68RzR1Cv+2s7RLFRDl57IJbCmVeRNYbQd4rV0bVKV+pc/2+Z
         jprU0Ey620jAfTFV0H9BU2VcCMtwFjM5gTm/J7IvVjc/LwkUdmrRCNdq2ohXrPDDNV1N
         8aIiwS8fehytg7kc5fPW5H3Hh7aGmjrT1I4Wn5IWD/mgD46MsQ9QZXxrPwZfcnL2Ltib
         0p1voQydIF8DlMd3dsJf+fkOhpCIX9o9REcwNAm2QqyZrqgz/I4/XJCYdsRfWuVeywHB
         yJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766485137; x=1767089937;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VW/cRPo8LKvRyH919j4YxeyMCTrtYxKo0u6s8/ZPXcs=;
        b=tOOs/cZG+HI8LfXWNHReY737ySDwzdS2vZL5IBB1Ex+m/HR0JlpV8j1cKAfCfpk+6f
         P0tJhBsWQd10CNTMshHRXAuTnsBwbvO5kmeYQPQBVJWKoeglEjsuTDSHv9NaBrjfBXiT
         nsdzWQCu3nTRYeIPePttKqjXEWUSBihQWmgoS05X+OSrGXuqEYorHH+aKPaXl8IVDNQX
         j+UcvTZ8bg1naaxPn3a54UmssKLhdNXKZo/AhIt/FXQJLi/jfQyVQo95+zeHf1DyZaEG
         ZR71qzwfuNtlXjiWXCfWRstFP0cUK5Teq0rBhFjD6/Zxz27ZW16gbaRAm/6Mh/nfiu0S
         UYXw==
X-Forwarded-Encrypted: i=1; AJvYcCVUTIF7GB/9r/KqzjX67m5H3eJ6mgeF1StSY84TIdI6mekMVOlBBS7GOcnGfrWmhIDK2lUC+z2Hix0o1KNKx+TXMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUy1DjQcb9UBHAbADNKDx7KkTUeqOap0e/OkTsG0FyBjVuIqct
	0vDnhrQG0kIOAsg7kMe6AqPZ2TmlLA4yE3bPEja8kcIdolHo29/XenUzVtq7NGCJU1Y=
X-Gm-Gg: AY/fxX7zC14Icj4N1ZK6OAEWnrpPRQL+Vzyo5m7WweCizqiGwt5MLZqebvlLCNBbcBT
	eFSGRRbS5A2rMx3JkvnAnLWDZzmGKpqgZMXTUCvz7bdgnVv23u9eQNOzz6Q24OFZ7RGZ2O7O422
	ok9r2hpvytdMTlZT3cHIj39yASvbVfcvoQQLs5RjdQKbTIpmIBfvcmZtKv/A82ICqFUdpduKOlP
	SkDaK6cObD+7P0Q/zE0YcvuY81Dznk2TRKYVIJ1kG0XbwM9xx3pELn0U5+l52BPbDvO1ClR6qI5
	z7Y+p5YZ+BCsVQlHHZKmFNm8y2V2JCePLDHtzeBTu8MSB+x81EKEzKks4a0GixkHkO31buukiEq
	Agntt438gmxdbStUXQTb/5yZWpbd3qK13uOBG3THzGjAusukuHZ3cipqlY1LKrWII4YVtnvSBCW
	+AIXUirp2i8vrhbq/C
X-Google-Smtp-Source: AGHT+IGp4L0lCDedpR8cpLerixGXZgyRPWS/NrfGTL438LLgC62TRKM17kQJDDB4qVnzc0Z89xbxQQ==
X-Received: by 2002:a17:90b:5245:b0:349:19a8:e00e with SMTP id 98e67ed59e1d1-34e921bc767mr11429789a91.31.1766485137075;
        Tue, 23 Dec 2025 02:18:57 -0800 (PST)
Received: from draszik.lan ([212.129.75.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd61b4csm11634759a12.18.2025.12.23.02.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:18:56 -0800 (PST)
Message-ID: <aa55c3865d151697120a2855e711d59468bdcd0a.camel@linaro.org>
Subject: Re: [PATCH v4 4/5] soc: samsung: exynos-chipid: add
 google,gs101-otp support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 23 Dec 2025 10:18:56 +0000
In-Reply-To: <20251222-gs101-chipid-v4-4-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
	 <20251222-gs101-chipid-v4-4-aa8e20ce7bb3@linaro.org>
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
> GS101 is different (but also e850 and autov9 I assume) from the SoCs
> that are currently handled by the exynos-chipid driver because the
> chip ID info is part of the OTP registers. GS101 OTP has a clock, an
> interrupt line, a register space (that contains product and chip ID,
> TMU data, ASV, etc) and a 32Kbit memory space that can be
> read/program/locked with specific commands. On GS101 the "ChipID block"
> is just an abstraction, it's not a physical device. When the power-on
> sequence progresses, the OTP chipid values are loaded to the OTP
> registers.
>=20
> Add the GS101 chip ID support. The support is intentionally added in the
> exynos-chipid driver, and not in a dedicated Exynos OTP driver, because
> we estimate that there will not be any OTP consumers in the kernel other
> than the chip ID/SoC interface. The downstream GS101 drivers confirm
> this supposition.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0drivers/soc/samsung/exynos-chipid.c | 70 ++++++++++++++++++++++++++=
++++++-----
> =C2=A01 file changed, 61 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/ex=
ynos-chipid.c
> index 5c8660374269c87ec38ebca242918bd7b1d362e5..6ef9751e2509c94bd9625072d=
0b81ddb93048d4a 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -15,7 +15,8 @@
> =C2=A0#include <linux/array_size.h>
> =C2=A0#include <linux/device.h>
> =C2=A0#include <linux/device/devres.h>
> -#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/ioport.h>
> =C2=A0#include <linux/mfd/syscon.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/of.h>
> @@ -28,9 +29,11 @@
> =C2=A0#include "exynos-asv.h"
> =C2=A0
> =C2=A0struct exynos_chipid_variant {
> -	unsigned int rev_reg;		/* revision register offset */
> +	unsigned int main_rev_reg;	/* main revision register offset */
> +	unsigned int sub_rev_reg;	/* sub revision register offset */
> =C2=A0	unsigned int main_rev_shift;	/* main revision offset in rev_reg */
> =C2=A0	unsigned int sub_rev_shift;	/* sub revision offset in rev_reg */
> +	bool efuse;
> =C2=A0};
> =C2=A0
> =C2=A0struct exynos_chipid_info {
> @@ -69,6 +72,8 @@ static const struct exynos_soc_id {
> =C2=A0	{ "EXYNOS990", 0xE9830000 },
> =C2=A0	{ "EXYNOSAUTOV9", 0xAAA80000 },
> =C2=A0	{ "EXYNOSAUTOV920", 0x0A920000 },
> +	/* Compatible with: google,gs101-otp */
> +	{ "GS101", 0x9845000 },
> =C2=A0};
> =C2=A0
> =C2=A0static const char *exynos_product_id_to_name(unsigned int product_i=
d)
> @@ -93,19 +98,53 @@ static int exynos_chipid_get_chipid_info(struct devic=
e *dev,
> =C2=A0		return dev_err_probe(dev, ret, "failed to read Product ID\n");
> =C2=A0	soc_info->product_id =3D val & EXYNOS_MASK;
> =C2=A0
> -	if (data->rev_reg !=3D EXYNOS_CHIPID_REG_PRO_ID) {
> -		ret =3D regmap_read(regmap, data->rev_reg, &val);
> +	if (data->sub_rev_reg =3D=3D EXYNOS_CHIPID_REG_PRO_ID) {
> +		/* exynos4210 case */
> +		main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> +		sub_rev =3D (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> +	} else {
> +		unsigned int val2;
> +
> +		ret =3D regmap_read(regmap, data->sub_rev_reg, &val2);
> =C2=A0		if (ret < 0)
> =C2=A0			return dev_err_probe(dev, ret,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to read revision\n");
> +
> +		if (data->main_rev_reg =3D=3D EXYNOS_CHIPID_REG_PRO_ID)
> +			/* gs101 case */
> +			main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> +		else
> +			/* exynos850 case */
> +			main_rev =3D (val2 >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;

Looking closer, why is this not val? Now you're shifting the sub_rev
register value by the main rev shift, assigning the sub_rev register
value to the main rev variable.

And then, all assignments to main_rev become identical and don't need to
be duplicated.

> +
> +		sub_rev =3D (val2 >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> =C2=A0	}
> -	main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> -	sub_rev =3D (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> +
> =C2=A0	soc_info->revision =3D (main_rev << EXYNOS_REV_PART_SHIFT) | sub_r=
ev;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}


Cheers,
Andre'
