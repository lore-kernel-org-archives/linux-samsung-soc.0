Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732B93CAE84
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720385; cv=none; b=eEazXBESOEC9mqnG8fJRlG5GGRyOtiDWjwkCKbf3w6bHAfBkSzyZLT8VWKR8q+OtQKgUIfIJn7AAeVKXoWbbW/XudEg5oYhdwEtWB2Q14FxF25glE3DlnRkRb7vm3gmwbM3nLe3XhLoq0hpvs7OCv3jEUPHR1LRqpSQFPnQqh/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720385; c=relaxed/simple;
	bh=pKTzsHsh+KOl7XVkDAfUJy4MbfFG1awKeay+vTS1O6M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gKYYSTRVMR3ohb1mMllDEkCwniw6U3kks/l5sMK1bG2d7xDY5XN6Em9HTwTLMvjs125IRBkOmqgKCSHe76Pzgu0aHwwd9j80lWgJWbkiL0ZGgSIgJCtDPXc97VuONlICZDXVBYP8XoITSCZjJbKJCuenaygpeE2KX31mnhUEm4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfgSxmbP; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfgSxmbP"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1da63791so587791a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 01:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789720381; x=1790325181; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pKTzsHsh+KOl7XVkDAfUJy4MbfFG1awKeay+vTS1O6M=;
        b=nfgSxmbP5YP6RLt1l/C3o18goqydZY6Jye3F3+ZWnwOWeUSvRQLwsWBwpbUkljNEjl
         U3Kogfx8Xzx5Xsp3GmlYo+KSbSlLLSSNjNwuJktBSjSGX8BX6woXR+xP6Ev9uaea5CSa
         2gRzHkTLpP9tI1CHhNUFMqEhN3BG3U52EsZVoN9+pfbH2dfpmMUB8GolvMeBaH3doWh0
         R+Dzw0FjkOxo5ILY4DA69NzUes/29fE6oHGKmjxqlH6v1xEzCt3kixkYR52BmuXEq2NN
         bGnSGQa4YlulZr14sVkq1FRjCKroD9N2ZRGPH8EfQIkoaHi31ya+P3HM4/l2K1vMuSSp
         IsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720381; x=1790325181;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKTzsHsh+KOl7XVkDAfUJy4MbfFG1awKeay+vTS1O6M=;
        b=zQIHiifajUQYXoDetNRafYDyKUwdOnpuFT2oxSPsf48V2N2BBcYu25/NGxpa9ipR6w
         o3BdZGJYOpLyNgFL54Go36diwPhRZCti0UFRkC4UPbUVACXv9SMHGtJuDegboB7XtPXl
         Lz/b7eMEZXgZQMW28kYG9EYVe+oio1UKdiD926Zs+Ppn4LXaabfIgfNX9cbUcVSLVnIZ
         egxGc3P+L4NbL+4EQkA2oMXVxJLDUO7BNu1N8fMpJgYeHQJliqGWHHqeE6vw5Pbd7iLK
         s1ZdgGibylbmVlkFEhWuxECTctE6CArrPQuJlwYqzSj3F36kM2A3pUZuyReN11sad0HQ
         gaLg==
X-Forwarded-Encrypted: i=1; AKwUvByfVSjyHIBIJL1KrmOAmtfFtF6m5yKGkaNdhbSLmYFm5O0jlXknWVkngDw8OpDlYJegyR/Dpmjatx8mhcJHmf5s7Q==@vger.kernel.org
X-Gm-Message-State: AFuF++m2hiOS/CcTfCRYfUcB1OkIGqNfToifKWowcRxBlczDmq2vXOTZ
	V4DysrPGXyAZ7d1jSIIkJUr1oz72GcFxP+AaVpJ2L9tsGLSmRZpVoGMUA7E69eE4QlE=
X-Gm-Gg: AYBFou3gI6Mxmlo/c2Y/NwRFs1Pd/y0MxBLchDc8UsaJhWnyCALnO3OTSca/UjYAfVR
	TYD0d5JV+YDTWYK4H1ggHYPShtGw0o2cx+c5FZNpaczFfnlFw9om1JcIygjj4+1EKvU60Yd5I0U
	cQmdsg2BmBYQF372m4KtvXDaMl668CbtX+0spwHpppsb9TsL7jmbU7SrYFhKANtln3ONZfKyBck
	+cnpkHVTKt6KeGQO0O6hl6ZQ5JAZyoJOsPJ/3fdiY1VpAZPaDfYRTJZEcG/JIviU21Wq3Rn+p9E
	QHUqyUUYu5BGELd1wB3/AXvfku4jCiNHVThF6KnfOCid/Jpmu6Wytp00ffwbxF2PdR7MbsRIWqO
	JoY1GqVTPh2XRh/aZ73oVs+/3TOFytK4X2CfAVTgzmapDcI+zvYUIZZdSJ6ah8SGK8h8lb894en
	M+pKdydipMz6laDzQXgij1kNoZkgwP4h3cxpfGGjX8xlVHBQC8ArhfM2lVMhOOGDWfl1g1xk10B
	HY=
X-Received: by 2002:a05:6402:4026:b0:6a8:e223:fee5 with SMTP id 4fb4d7f45d1cf-6aa531ef01fmr709732a12.44.1789720381295;
        Fri, 18 Sep 2026 01:33:01 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59605618sm513138a12.11.2026.09.18.01.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:33:00 -0700 (PDT)
Message-ID: <950335110f9d9c22a026fa5174e492c4194299a5.camel@linaro.org>
Subject: Re: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to
 prevent OOB access
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>, vkoul@kernel.org, 
	neil.armstrong@linaro.org, krzk@kernel.org, peter.griffin@linaro.org, 
	alim.akhtar@samsung.com, pritam.sutar@samsung.com, kernel@lvkasz.us, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com, 
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Date: Fri, 18 Sep 2026 09:34:24 +0100
In-Reply-To: <20260831070309.158069-1-selvarasu.g@samsung.com>
References: 
	<CGME20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0@epcas5p4.samsung.com>
	 <20260831070309.158069-1-selvarasu.g@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-08-31 at 12:33 +0530, Selvarasu Ganesan wrote:
> The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
> creating both UTMI and PIPE3 PHY instances regardless of the SoC
> capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
> and ExynosAutoV920) provide phy_cfg arrays containing only a single
> element.
>=20
> On these SoCs, when the loop reaches index 1, the driver reads past the
> end of the rodata array, populating the second PHY instance with garbage
> data. Since the configuration structure contains critical function
> pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
> PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.
>=20
> Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
> store the actual size of the phy_cfg array for each SoC. Update the
> probe loop and the xlate function to bound their access against this
> value instead of the hardcoded EXYNOS5_DRDPHYS_NUM.
>=20
> Assisted-by: Claude:claude-sonnet-5

Shouldn't this be 'Assisted-by: LLM'?

> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---
> =C2=A0drivers/phy/samsung/phy-exynos5-usbdrd.c | 17 +++++++++++++++--
> =C2=A01 file changed, 15 insertions(+), 2 deletions(-)

Other than that:

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
