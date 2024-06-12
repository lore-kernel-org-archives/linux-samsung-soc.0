Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B3216D4FF
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2024 09:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718185085; cv=none; b=MghbMY1JBseI5ZDN6RvG/GwPJ8ZVrUSS+z1aAoHFHZrtQ9B5OklQLHEVU096X8R/sYFhKAYZWWp6kSxP9lYXWP/rfGLDG0P7iyP92eqqQ759xAVEarHm7RSMtodK2PADO1KuF1vrlC4fR3dV3roJnTSODgmjehCf3g+BLe60O48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718185085; c=relaxed/simple;
	bh=/OLzwTXfKEVgX1FDemg7z7MaKi7DyqZprPCae8jyq/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U3Jz+oOz8z0kVWIDpDYb5af3Rruuz+Kp8OaS563PRot1oCiv6tNhuUtFeHqRwnx51Boy5PPZYYAqe8MWCqJAMg/OWCK0CH6jOwUOV95Gi05AZXRZK+DNgKwzulNVDGXaA3zE26X2e6Tnucv53/FLw5ZCM8Tu3ipB7MfFe5NGFkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HaSue+0H; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HaSue+0H"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-254efc9ca45so1010634fac.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2024 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718185083; x=1718789883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BD/9IUJ0GX5iY+Im1dJVEqyByZWn0TG0w/F44NXDHLc=;
        b=HaSue+0HEf1EKaAvFHDsyFqIGIRUCyJooADNpL5tStVFr+fmpdvkCC2WiY82KLTdrB
         Q27l23DB+nRAdUr92geFocVTLhICYdYSxFnUItA2P2JH91ylDOzsW2IetDA3QO/lKx1Q
         IOmc7ZHjXjfBDIg/m68wRsGgp6WoL/hjQ2UuNshqSNAAS1DXPotuvw07EGxoOZ+sBZgg
         EG6S7v/mJyjNjnPQMvMECrvUt/QhibQRbux0pjQiA+wyBFIK3azG8Xyx+yGeXEqQEPfR
         lptY/aseWxp4IDeTa+JdJI2+41MehHjA25N2MrWv5vRn43P1Sa1IN6MdIhZRJfg1qeRS
         wGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718185083; x=1718789883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BD/9IUJ0GX5iY+Im1dJVEqyByZWn0TG0w/F44NXDHLc=;
        b=FTTqcrUCOJ9ungXSjI/ZKFenUrnlHvrJFrELDRB0Pke1KKN2tyW2KCVeBA4mujV1hN
         mWpqIysWdkVODpTXEHhG/BJdKVJRkNtYTH88qK0fDPm8sgf4AM/xSAmgA/dfO01Lrns5
         0IjphvvChHfraNh3F277nLNj6cZcK7UhrJ4NOkCMgx5qm03oHP9CYCO/KMp0ofmOWpJu
         pMmFaR1uwtIoB2e/uBS3RFfvqkM9c3/X2yXmdZ/nxZNg9WXA/WpkDi39RfW8Oao0Pedd
         +Ye6WJlTPz3fi8I2hzJPGTqHfwABgiSIefk6U6lAFsiOIenQ3mw8iv0YjgBhot+C1UPX
         5P+w==
X-Forwarded-Encrypted: i=1; AJvYcCVmzk7c/vgpa8j/TG12oLGKI9zFkGVvII4D4gEYEydqubwrc9e49cYqNL/HCACIizYdqpjzxE+ZSD0rcqld4TqVBp9pAy/r1dbbkrzdn6o4Gn8=
X-Gm-Message-State: AOJu0Yx4/O7mNmM+j1VXQYvm+SnMDFnP9EbRUn/oqdgwsO2+cC4OwW6I
	QIbgthlikhBw7bgxLDvxKqchD828Xvq/a6GsX4Rs/A4L/wKxhEdT85LzuAl8y6gKTZ3nMKFxMed
	pwGIwAos9pTjxXa3mlz3vPkwYgg29eXpqnkZ4Nw==
X-Google-Smtp-Source: AGHT+IGm+RwZ0B9L/QOSni4O4Rx1n2ES+x8U9sHD7LvNXczdj6rZMABLoZ66Mwklcv5iX/J6wqTx4u/KMr664uropCc=
X-Received: by 2002:a05:6870:5e12:b0:254:a57e:1aed with SMTP id
 586e51a60fabf-25514c799f2mr1439059fac.26.1718185082718; Wed, 12 Jun 2024
 02:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507-samsung-usb-phy-fixes-v1-0-4ccba5afa7cc@linaro.org> <20240507-samsung-usb-phy-fixes-v1-5-4ccba5afa7cc@linaro.org>
In-Reply-To: <20240507-samsung-usb-phy-fixes-v1-5-4ccba5afa7cc@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Jun 2024 10:37:52 +0100
Message-ID: <CADrjBPqvdBsLVNeXVtqWp=hGS0G_=0jYQ_91pyg6jvFPN+2CvQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] phy: exynos5-usbdrd: set ref clk freq in exynos850_usbdrd_utmi_init()
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Tue, 7 May 2024 at 15:14, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> While commit 255ec3879dd4 ("phy: exynos5-usbdrd: Add 26MHz ref clk
> support") correctly states that CLKRSTCTRL[7:5] doesn't need to be set
> on modern Exynos platforms, SSPPLLCTL[2:0] should be programmed with
> the frequency of the reference clock for the USB2.0 phy instead.
>
> I stumbled across this while adding support for the Google Tensor
> gs101, but this should apply to E850 just the same.
>
> Do so.
>
> Fixes: 691525074db9 ("phy: exynos5-usbdrd: Add Exynos850 support")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---
> Feel free to drop the Fixes: if you think that is unwarranted here.
>
> v2: add missing bitfield.h include (seems this is implied on some
>     platforms, but not on others)
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

[..]
