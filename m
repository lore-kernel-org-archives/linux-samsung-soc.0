Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623BD33DED9
	for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401623; cv=none; b=n7h6wUQP9tVUo/2B7aAZDqy2C2HTYT9XSPIto8ZbejdQCTkO1UbDzRuCXAxa9QRgq3vxzhp+2zWarf3s5AI4NNiLiXNl6pj1Q2ypgeeJxFCrX6v5Df/jNxUDX0tjvqFtOJKSqglWMCtXDRD9Hl5EjVRsSNs1jQ+DaSNOOdkIqW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401623; c=relaxed/simple;
	bh=XRYbluNPP8AMPvjs11ldgv62V308J1KXRstC2EzoBRY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xa+fOhe4G1qFGFSVo1GtbUbh6NoOyFuuMh/dTiHrWwUT9QOP2HUcYUmZJ9t0EbVJr7Lb5RqFt/vulVfZsMfdPL3ZWlQP+61YYtyGd7nROphBu1DlFj18sViyK4TPZjXnM+PqyG94QsqxbuVc56QcULEJh7wFVhyzqxc7XGnlSuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HzDwXL9P; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HzDwXL9P"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c29667ed561so432944566b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789401619; x=1790006419; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XRYbluNPP8AMPvjs11ldgv62V308J1KXRstC2EzoBRY=;
        b=HzDwXL9PtsDZPrCoGHlBfi3c4hkfP5Rkangyd+FB4oy5y3C55KbqWNTTXpBlj4dz1m
         f/kbk37o3+kByzdp86QQ/dmw1wjwzOumcgFZd+OcEd6TuRNr3pdyLU00qQUmbLGzGwuF
         pEvKR28EabW2NcyBFyUTQcmx+GBojbEkBEMdsPquEO9YzjEyLHHMqIYP1eMBpgLi/goa
         ucblFqTsGUyhMYO/XIbIeIyJARiR6ngG0e3QFgF63C6Oq5Mej9ZC2oIJvmV4Q5wqn+U8
         fWyeRadgBEl6DemrkomvZtyPsRq6vp9VH4X14HhrMFmaLz3yvCXhqFZGX/UzT2BUBb+h
         +fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789401619; x=1790006419;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRYbluNPP8AMPvjs11ldgv62V308J1KXRstC2EzoBRY=;
        b=ZxlMdK3ICQGReV2m4WfILH38J4rzJYZu6f/dQjt8XssixcIrIHxsXSWhpHV68LDZV7
         CaRXwDDlvd/T5ONvlC93gkpzDYAwUmJbcl2fMuf0iTG+3U+rSdqig+HHRv2oEszJZX03
         YDNJGXraDxWzT+4H5+QYB5BJEXRwZs2S9nQ88hO0NAR8adEcf/ZkdHuAqAeLCSYBGV3g
         ZSlETBQRXNbbCda1hxT3rmceI8z72nowOSZbUc7hAkYulk66GTVXwGt3lHU+lXdE7ThE
         f558Jl+cffyK/Dv/kvHy+H1TaLHkaqZtzju+x6xjmYgv7Awp32GPuCXJQC2MVemOKvuI
         ILHw==
X-Forwarded-Encrypted: i=1; AKwUvBy6pk9jEleJ3HCDzp7lOpITCHidhL6P8i5/lND/93n/okonl+4dNWHe5lZbho1WkJR/3LezOn1ci8nELxnOfKbI8w==@vger.kernel.org
X-Gm-Message-State: AFuF++knssYmaejIxC86v2NWO18JlM9FJzNiA0WvI/ZWcbxM6s7a3IsW
	Zj3SES74PO+2h4iVKpuQjee5ycMLJhMgdF39J1bZSi/nHDCd1tKeJgDFszfnnixs8C0=
X-Gm-Gg: AYBFou1tX/CSc3Y79SUfMQlO1IOomBNRH5sI/Gvgw2NFaMPxZTnjvpBVSBQ4OUaf0wH
	S0ghbm1ghAkVFHOhuTEcSEXSNbxm9kmro1W2ZmjdstrGv9LpX2EIOboCsogH6s9o6DY5Nv6nNQg
	uf4e23dG/5C6QFjq7on4VHkJ4WrMqmGBcbZH4b3Xci3LM3LN/4SvcwregATImFjOqF8iBzptsEp
	EoFeicLzTguCox66yJeuNtZvgaJrZicWTqKrVm7vLItORC9+UzWHGXyYGKERsuXzvwo6n9iCLGN
	wlAx84MV58VT0ApsnENcGIV+PoO0Ae350rMARddhY9+gKhWyZA5cX1bQdTFfJiJO6JrhGAekjZZ
	20arC9pNoBp1EsS2d2y/Zw34/S7xo7/9gwmlyB/KWjyd31rcsFgwNzbi4o1rssZzP3E12y5MiHh
	Ua25llM44ILx9IErztU/UqvLzdpTJn/SiVmXSJbWECYvWoxkFCGyp4xamkDKtBYr0t0A11x/oZu
	mo=
X-Received: by 2002:a17:907:6088:b0:c26:19de:9ae8 with SMTP id a640c23a62f3a-c29b8734e64mr227554866b.39.1789401619322;
        Mon, 14 Sep 2026 09:00:19 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966021d0dsm467443566b.10.2026.09.14.09.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:00:17 -0700 (PDT)
Message-ID: <6d3fd2d27eb54a926486da34947e843c0f29253c.camel@linaro.org>
Subject: Re: [PATCH] phy: samsung: usbdrd: propagate GS101 PIPE3 lock
 failures
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Pritam Manohar
 Sutar <pritam.sutar@samsung.com>,  Sam Protsenko
 <semen.protsenko@linaro.org>, Johan Hovold <johan@kernel.org>, Peter
 Griffin	 <peter.griffin@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 14 Sep 2026 17:01:36 +0100
In-Reply-To: <20260623135349.42739-1-pengpeng@iscas.ac.cn>
References: <20260623135349.42739-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-06-23 at 21:53 +0800, Pengpeng Hou wrote:
> The GS101 PIPE3 initialization checks the PMA PLL lock and then checks
> the CDR lock. The PLL helper returns an error, but the GS101 PIPE3 init
> path dropped that result. The CDR helper only logged a timeout. PHY
> initialization could therefore still return success after either the PLL
> or the selected receive lane had not locked.
>=20
> Make the in-file SoC-specific phy_init hook return an int so helpers
> with real failure results can propagate them through the existing PHY
> init paths. Keep the register-only helpers returning success and use the
> new return path to report the GS101 CDR wait failure. Other SoC helper
> paths keep their previous success behavior.
>=20
> Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 comb=
o phy (HS & SS)")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> =C2=A0drivers/phy/samsung/phy-exynos5-usbdrd.c | 78 ++++++++++++++++-----=
--
> =C2=A01 file changed, 55 insertions(+), 23 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
