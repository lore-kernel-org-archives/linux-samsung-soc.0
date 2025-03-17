Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5368A248894
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Mar 2025 14:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742223330; cv=none; b=JbsRG0YJSkvpWPllnxp48+olwbXcK3bT90tzzAANgC/7/ldKfOXn6vUCeRIYUwMLUoKyjjzv/XyT0hI32RAN6Jvr3mQ3QE0/w20QNqlUKn8V4ZeIaG2M1xSqH3gmiyJfe8xvhKq/YdcU1RO69u4AI09Bn342YbpdpqBHDb0yuzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742223330; c=relaxed/simple;
	bh=17UdANjAVTcelMOQ4DNlejZ2Ce9FcJpH2K+ozwWVPTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIyRCZvh0sO/01oyUMrjHU7+b/qGxjwo8ioDyIDrhjMRUKbHSwvlOOta/3uT0uCynnTsTImL0ykaS6oWLoSQwMzCY60GbNCN/pbM0MmXwkM+TsgWVym0nYEjxdgDpEimDTnLALrbDg/ybaNO5YZ3ODOMHDXymhvPdWTjQp0Q4JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kKvuc1Dr; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kKvuc1Dr"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3f417de5e25so1675290b6e.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Mar 2025 07:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742223327; x=1742828127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jNzh4wPsc/2+sERlQmcDT54HRK5zRLKBArFjwQQ8DQ=;
        b=kKvuc1DryQCbSVaBGLaDhiimzifPA1/+vWy5Oidkrz6z37iZQfnZhJR5IksOTb6bL7
         toTwPj10SzvDwgmRUHhOlYXCJkfenGjgr61NjdUH4Fft6zEhNIRV4U0NmYNzmA6eptYP
         ZkbtLa+0hyJEqzZqMM6dhXqfO3CH7gtQqx0lzVhIugTZc7jW+5z/r73CXfNwnmrmOitH
         dykwAqTiUn6wv1eBlpWafYpH+qeiSlfouu+rQpdIFP4DFC5sXI+k0BhJ+RS3O2LjlhxK
         oUZGPAL900MWZiRBKBGSFKDeHp1lfq1aHNNvtU7hhj9pSyXVhgHNlj5VMQRUe7UHY0Do
         0ENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742223327; x=1742828127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jNzh4wPsc/2+sERlQmcDT54HRK5zRLKBArFjwQQ8DQ=;
        b=bpguGmLL6yX7tAM/fOmq4OKpxSxAi+d9YCAXED7DnJBBsVMHxoN2flZLQQNUpXMGGC
         bDo+4cdH1h39BGRByLrUY8iSHVTMuI4h4HSfEYJp8PWT1Xl60+TnJEr6roDO+XVgWmeY
         wFWt6cD1kFFP0XD0dwwYi3kyC30+T2Xdh8PHu/QnjqIO++fqDlzqYY7tKB9UZI5leTh5
         Iw4QosRBZySh1I4gnCLHyGoDZP4xS9n+XmDlMqorEBOsVMEpRL7cwob8564cEunT6ZvE
         IWb4fbUfQMHX6193VHCYrahLOalMfEjioWoHeSfpUDjz+H4NPHrdR3x0x9bFOSGHVR5r
         jjkA==
X-Forwarded-Encrypted: i=1; AJvYcCVpjTmNIwl2NNLYY2wV1oeWuwg+4i7C91s85S10Q6xARR0SOfDz8ZfarQUexlzb3ui5YVZQIai+H5WG7nDPP2CYJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqDKeAVN8Ho/boYditKhg2/zpwnSREx5xTqqfwqqPVpmlLmUfg
	cg7hKRcoe6lJXNBqD+vYLt3VWi/4KcbxDdH5hJCyKMtCvLuu5fQ9BNuAVgYAgcGEzotKwH96NRG
	M3uq+1Ra0fhe8qv/3+9/H6XJmpxubsRbGiLGK3w==
X-Gm-Gg: ASbGncvJAVUGTzDZ2v64eGnnYj0nE7kKXldRJmMBlqnWZbEwuUQjoEbD6a02dqEWZBi
	47YkBNq+Gd0k29ycFJq2Z8TSLviNc4SLwR7RAotBYvu/QB2SjgMOUYAmwnw/reoVxBOoxbs8g1O
	pAqW26OGOZFue1Rmm6o6X7lTmtc+yu66xDn+f/Wuc=
X-Google-Smtp-Source: AGHT+IG7IjY16t5eI+Uq4mhx6crav2fOJBQfWeSG630jb10M49QIM1vSar09EM0x1tUf2BaE+e0vaoly2VXwdW756V0=
X-Received: by 2002:a05:6808:999:b0:3fa:c549:cfee with SMTP id
 5614622812f47-3fdee27903emr4770583b6e.6.1742223327241; Mon, 17 Mar 2025
 07:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
 <20250314-ufs-dma-coherent-v1-2-bdf9f9be2919@linaro.org> <931e5e0b07d598912712b091d99a636b796fe19f.camel@linaro.org>
In-Reply-To: <931e5e0b07d598912712b091d99a636b796fe19f.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 17 Mar 2025 14:55:15 +0000
X-Gm-Features: AQ5f1Jq4uxqhD4QuKFFVh-mTPnz4ZIKWFOQ5G2m93FuUYrfiK5B9xukpdzF4pCI
Message-ID: <CADrjBPoESd7D4H80prCtFXTGaWOg-HV_ovNdwZ4G7Y8n-hFdsQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] scsi: ufs: dt-bindings: exynos: add dma-coherent
 property for gs101
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	kernel-team@android.com, willmcvicker@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Fri, 14 Mar 2025 at 15:59, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Hi Pete,
>
> On Fri, 2025-03-14 at 15:38 +0000, Peter Griffin wrote:
> > dma-coherent property is required for gs101 as ufs-exynos enables
> > sharability.
> >
> > Fixes: 438e23b61cd4 ("scsi: ufs: dt-bindings: exynos: Add gs101 compati=
ble")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.y=
aml b/Documentation/devicetree/bindings/ufs/samsung,exynos-
> > ufs.yaml
> > index 720879820f6616a30cae2db3d4d2d22e847666c4..5dbb7f6a8c354b82685c521=
e70655e106f702a8d 100644
> > --- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > +++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > @@ -96,6 +96,8 @@ allOf:
> >          clock-names:
> >            minItems: 6
> >
> > +        dma-coherent: true
> > +
>
> This is allowed globally already in this file. Did you meant to make it '=
required'?

I hadn't noticed it was already handled further up in the yaml. In
which case this patch can be dropped entirely.

Thanks,

Peter
