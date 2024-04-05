Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1570A288D7
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Apr 2024 07:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712300690; cv=none; b=ttHEgCEl/e7bXV5tlOO+Q7e9HO3WLjpb3jQvShq+baHU3I1rffhcbudNN7orjPvt6P7IC+GHSu0zpCc4MUUDxbACFw9+3vJasTWiFIA/kN7wcG4ZEgdILEY/sz7MwL2YUJQedlW/H09XR7RVGM9IMvpLkVsxUwm+Rz2bnQc2j3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712300690; c=relaxed/simple;
	bh=JNrIR5alUd3utRpEaAHG1wb4hAjlRLdSxaXh1dOEDIM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YwMTD8c20Kk1jSLFpFYFo3ldOdey8Q5Hq1LCXaue6FIizStmRKm+GI4gzqukiAkbOVzaMBrbbfRLTYCPWfx3uMYty9gssyuYhMJ1Tl8yQEv3e/r/E5R0bth4Uj2n3hEWQ+vbhabDZnsaUAT1W/1UpOJBPApC6l10LIHHaeGJtcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=waSLGKA1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="waSLGKA1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-415446af364so17291775e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Apr 2024 00:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712300687; x=1712905487; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ck0+pssPiWzof/P+3eKb2RoFHftHMIJF3LhSjby3XvY=;
        b=waSLGKA1DQ7kOUfKAc/oyo1qhfT3RPKLMcskXjWM/GwrFyrRt7C5+JqrjyHVsnTiVB
         YK24JOmtNGhBoR+u82p4+ZM6d9pdEhXLG9UKQlWp0aDysRrYItOYR+I54fH4fbI3IXcX
         1NCViEn1a4IOcAXZL6rFQWx7Mq6XwgJKcNFJqNpb3XCLypbJnGo52AKdchCY92l2hBCN
         GY8yGTMecFrRuBNzx4qUi6fSVeUB1p2cr+Y/BvJDWL0hN114GouCidv7P+tYg/elNgE9
         2/ktceM+ADkETytrP9KhkSVvomD/6IfKP7So8GRnmUTQVtLFG0GigLeiljgc8AcLZpk9
         bCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712300687; x=1712905487;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ck0+pssPiWzof/P+3eKb2RoFHftHMIJF3LhSjby3XvY=;
        b=Je5lQK6SUWSKEZC6zPGbUHt0UX6XazAEKnSWUAVtiQ8ubSifIlplmaFbjRJo4S3ez+
         mo46+Oh+QHPpOEbz7K+EeU4ECcOddSHR8wNStQdswTbmcmrXi8vCBqiDpVRbC9UHhAi4
         GQu68wU818aV2HL930dH7NgT+OuvsiXvP2WKC+IF7/iz3Fg6tDMTOQLtLqtUERjrgJIQ
         pvu6k7mRUjRSmllXlRIr7DiN6PVUrTJ/ehSb0lYh+rTfyTaweOgpdQoU8ZdA2VVSCxnm
         zL8FG+JkselY1FWcoo35enD6sHcycrGS9vKB3EU9a3SXMuoG6S7oCYpSOfXcL8eeX4PY
         MbqA==
X-Forwarded-Encrypted: i=1; AJvYcCWAFzDHwr60uovXzJdX4lF4z3axYrT50FF/mViIpr47PTp4xSFiJUKIXmyv6aRsK8/HZ0wRvGg6oq3t2jbkZzpDgj1clbBjbqfW9HQPX8zLGhI=
X-Gm-Message-State: AOJu0YwXdApOIax7LQMtfDo/Vpz5D0JMJC0i3AVQnfqUC9ziOtWm/2kr
	K027a2TNjWRAVTd/SnGoRG0o6pFeDKk/3yN/fOHFVZIhDgbOxZMipfjsTL+xCHY=
X-Google-Smtp-Source: AGHT+IFTmsq/286Yc5zD2qEA6UxgJfpqI99lGS+nfprpglgj+BBT5krGkx7W6lXqCOGwT9UlqIdn8w==
X-Received: by 2002:adf:ed46:0:b0:343:8097:213d with SMTP id u6-20020adfed46000000b003438097213dmr1322402wro.20.1712300687376;
        Fri, 05 Apr 2024 00:04:47 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id n6-20020a5d6606000000b0033e745b8bcfsm1247138wru.88.2024.04.05.00.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:04:46 -0700 (PDT)
Message-ID: <95bcdc942cba564f78a6f2fe4cde892575838d5c.camel@linaro.org>
Subject: Re: [PATCH 09/17] phy: samsung-ufs: use
 exynos_get_pmu_regmap_by_phandle() to obtain PMU regmap
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
  vkoul@kernel.org, kishon@kernel.org, alim.akhtar@samsung.com,
 avri.altman@wdc.com,  bvanassche@acm.org, s.nawrocki@samsung.com,
 cw00.choi@samsung.com,  jejb@linux.ibm.com, martin.petersen@oracle.com,
 chanho61.park@samsung.com,  ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Date: Fri, 05 Apr 2024 08:04:44 +0100
In-Reply-To: <20240404122559.898930-10-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
	 <20240404122559.898930-10-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> This allows us to obtain a PMU regmap that is created by the exynos-pmu
> driver. Platforms such as gs101 require exynos-pmu created regmap to
> issue SMC calls for PMU register accesses. Existing platforms still get
> a MMIO regmap as before.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0drivers/phy/samsung/phy-samsung-ufs.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/=
phy-samsung-ufs.c
> index 183c88e3d1ec..c567efafc30f 100644
> --- a/drivers/phy/samsung/phy-samsung-ufs.c
> +++ b/drivers/phy/samsung/phy-samsung-ufs.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/phy/phy.h>
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/regmap.h>
> +#include <linux/soc/samsung/exynos-pmu.h>

You can now drop the include of linux/mfd/syscon.h

Once done, feel free to add

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

> =C2=A0
> =C2=A0#include "phy-samsung-ufs.h"
> =C2=A0
> @@ -255,8 +256,8 @@ static int samsung_ufs_phy_probe(struct platform_devi=
ce *pdev)
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> -	phy->reg_pmu =3D syscon_regmap_lookup_by_phandle(
> -				dev->of_node, "samsung,pmu-syscon");
> +	phy->reg_pmu =3D exynos_get_pmu_regmap_by_phandle(dev->of_node,
> +							"samsung,pmu-syscon");
> =C2=A0	if (IS_ERR(phy->reg_pmu)) {
> =C2=A0		err =3D PTR_ERR(phy->reg_pmu);
> =C2=A0		dev_err(dev, "failed syscon remap for pmu\n");

