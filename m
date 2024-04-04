Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05F0126F0F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 13:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712237083; cv=none; b=DAgvMT0cEPi89j43oI1FN7fh0RZcIu0KBii7972o5J4pN1zZCJkW36JWeAH1AZ50WIRMqEdV3OZ1ecgDiGXWK/BxxmJvIVLtwRfUST8Smlkh45Z9gZ3P9dfbEf0qiTuNn1whXSOk4/4v0yg6zn5mvaighbWBBeVrHDAvYPf18Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712237083; c=relaxed/simple;
	bh=nBXwkA4A0krstFpyvfjsEVO0w0Xz+CnGhEwhMIz2nxA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sn/8hHoXq6YSjmW4ZFFcRvjSO2Q2c5XGurPilGmKeG2Eitq48bLcn1+1SaEe4s8KZxnCmuQTVygGUzTihdSGcMNGBBuNqvV79yyErXQ/93C4OWobUzS7vZ2TxTZa4Laxa2kpEDrwGoBL2dMTaG1g76Hey9ag2iG7KSzu8I4F+po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=STX2NdSO; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="STX2NdSO"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d718ee7344so11485791fa.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2024 06:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712237080; x=1712841880; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QPezEfD0t1esOw49T38S7/dvcH4ZrRMz2JA7Keo/jF4=;
        b=STX2NdSOVMuHrqgjp5g0ZlGQ3/lhfA1n/DToyUa6dsG1jme+LaJV+O+ZDeiU1YN0ST
         UlqSF+RKNCBNLs/P7taD2sF1Wp/peVWN3MnryMvCCae5gPD5XmBLfDZCAWX8xEUX32iX
         QGQgA+veb2nXHXHAqxi6rA734/xn+TouYaU7uwAo1gF7nOaKboymvviE+YJ4s3GVN1tZ
         q4XHZM+1HHEMF5MriJOKsiBCHqS+HblnZcB23DlFxUajGItk3Rlu398kxgXNTLeFOWr4
         livV6E/0xQZO/lwC2K1dfZUZqY3kYTH3iWknanPYamF76AzNzuovVSyTo/+WPSUFwgzi
         yBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712237080; x=1712841880;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPezEfD0t1esOw49T38S7/dvcH4ZrRMz2JA7Keo/jF4=;
        b=u1eXlGzp3WzNoYTf/w+vVWxoNtHUQKBo34C9zss2ujxYLeE0dn1XyOg46gBZm63Fjn
         ty6BUFAz5x1VFeTJfFZz9WQVAFkq1fWmye+YhoYaKKVjapt2QlsZNGk5KRgrMka6C1br
         D7IDhBfosQme4KbMWZL56+Q/bmnsNbejejJwgTKTjAyRcmqjU1mRbXlMVl3ikyPSwHbR
         ypL6Wo7IzdJgVH9mhH1r1CBYFbw3+jne8ljoe/pNudyySywxSedGbmj6fw6qQE0IhP5f
         H1ZX4jk3E30tNhLSBVMd3DOel/uMdkGvluPCq6RdbEs8HEbiY3b7TefmSEHIRfESF+xM
         DJfw==
X-Forwarded-Encrypted: i=1; AJvYcCWKTM2JCwxL4Oj2zK29KQWemsaTWMyR522xhvKnMCz5Fmb2RjKm92VoE7ARUWNfLuXdSr/s/EGrJkv4IKrgaPbaAS4KHZ7LNNwGcer+35zAC8M=
X-Gm-Message-State: AOJu0YwKglzcuMCR1XSxlz60plZYulLJnkh0S8VT8hfxbe5CxAV/qdX1
	OGG7YQ8P8Zkxfg8WkHLHU04iW170NjsyXH1h4P7nQ1VTO29r6quL1QvAgYUyuY0=
X-Google-Smtp-Source: AGHT+IGxgH9A5s0WiNgOB7bXFCAvV00A/PQ0OT0BzurZEBZ4YAccdY+QiP2+2qjmMUfFLq93x9ZqAg==
X-Received: by 2002:a2e:7c0a:0:b0:2d8:274a:db16 with SMTP id x10-20020a2e7c0a000000b002d8274adb16mr2125485ljc.17.1712237079816;
        Thu, 04 Apr 2024 06:24:39 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id v3-20020a5d59c3000000b00341cc9c1871sm20435575wry.0.2024.04.04.06.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 06:24:39 -0700 (PDT)
Message-ID: <61f427ab3793def23d80d94457ff1568cae5ee11.camel@linaro.org>
Subject: Re: [PATCH 08/17] clk: samsung: gs101: add support for cmu_hsi2
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
Date: Thu, 04 Apr 2024 14:24:37 +0100
In-Reply-To: <20240404122559.898930-9-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
	 <20240404122559.898930-9-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Pete,

Thanks for this!

I haven't reviewed this, but one immediate comment...

On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> [...]
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs=
101.c
> index d065e343a85d..b9f84c7d5c22 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -22,6 +22,7 @@
> =C2=A0#define CLKS_NR_MISC	(CLK_GOUT_MISC_XIU_D_MISC_ACLK + 1)
> =C2=A0#define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
> =C2=A0#define CLKS_NR_PERIC1	(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
> +#define CLKS_NR_HSI2	(CLK_GOUT_HSI2_XIU_P_HSI2_ACLK + 1)

Can you please keep the #defines alphabetical (hsi before misc).

> =C2=A0
> =C2=A0/* ---- CMU_TOP ---------------------------------------------------=
---------- */
> =C2=A0
> @@ -3409,6 +3410,560 @@ static const struct samsung_cmu_info peric1_cmu_i=
nfo __initconst =3D {
> =C2=A0	.clk_name		=3D "bus",
> =C2=A0};
> =C2=A0
> +/* ---- CMU_HSI2 -------------------------------------------------------=
--- */

and this code block should be earlier in the file

> [..]
=C2=A0
> =C2=A0static int __init gs101_cmu_probe(struct platform_device *pdev)
> @@ -3432,6 +3987,9 @@ static const struct of_device_id gs101_cmu_of_match=
[] =3D {
> =C2=A0	}, {
> =C2=A0		.compatible =3D "google,gs101-cmu-peric1",
> =C2=A0		.data =3D &peric1_cmu_info,
> +	}, {
> +		.compatible =3D "google,gs101-cmu-hsi2",
> +		.data =3D &hsi2_cmu_info,
> =C2=A0	}, {

and this block should move up

> =C2=A0	},
> =C2=A0};
> diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindin=
gs/clock/google,gs101.h
> index 3dac3577788a..ac239ce6821b 100644
> --- a/include/dt-bindings/clock/google,gs101.h
> +++ b/include/dt-bindings/clock/google,gs101.h
> @@ -518,4 +518,67 @@
> =C2=A0#define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
> =C2=A0#define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
> =C2=A0
> +/* CMU_HSI2 */

and all these defines, too.



Cheers,
Andre'

