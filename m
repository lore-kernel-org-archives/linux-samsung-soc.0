Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4B9231A3B
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 19:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759864822; cv=none; b=kzcLeACIG0DZ/kK/ErbjJ9JtKznyQYZ1Re2F2hluuxtvs5VXvr139N8sArwfeCocC7F8Y7wif4ItEVrs5lz89fSU6iivSxoxVVzA+hH3wfQWcTJH7hQGpIipceEdIs8m+GOF4a7I+gqYCqpviGbJO9nxkDTUb3aAAzZjmSOXRoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759864822; c=relaxed/simple;
	bh=EiImG7GpvLr04lXxcmldheIyewvjHETXWh8n7xAqUho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=re5RI/GiOUREJ/eubpR+syiH0LC0Ik44NoJCvty38lr+dPYtw34MA1qO3MU58lrFnrSdYVofASL4FI90Vn7ERZloCkg9tgq5/Hzh79XoctLwCdjqWK67DEm9V5hgc9PNGhWib7SsGRXsg6zea2VD0KlbMy2ZKvBBh9XZ6mZdP1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FLJyhqjq; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FLJyhqjq"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-71d603b674aso72092807b3.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 12:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759864820; x=1760469620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyvVzqRAZ+jJPuuow0tWhdGCSI6e0A8fiu8e4y33sz4=;
        b=FLJyhqjqova24Gn0NqwdSse/3yeC1ZrjCoPYrWYCE0RawHJpIx2g9OmzWO31EeqI7x
         XaU+vY2aBAuk31X9O8PHllv4aRo82/LSbfL2pfIGhXKAfncl0cYrff+L8aGuByM1ZRkd
         IdiCgTyCLOgSNH97yzB3oz2WJFZcQ5DqatCHZtVsK4EJBw4weCBb76qXzQx9GeBNoUUV
         SapZeCts0GucVOXmhbPZlRW0qvZ42aQ+bNnWI2H+BWa46Lj+9teE1dnMCG//+tZqEd6/
         CTmnQpaX8+nlyhHdAqRWrMagvQIItY2b95ypIUY06jCabrbKI/8f8wU5BvLyBtK8r6LJ
         nxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759864820; x=1760469620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyvVzqRAZ+jJPuuow0tWhdGCSI6e0A8fiu8e4y33sz4=;
        b=HhdFGlsLOj0IXI8cWbElrH8ULdV9i/BMQ4OSJUr+SOKat8PGjAe9t+WyMEsQbjYBFd
         d6GfXkn7tB/wQKWetBbsIrCOtCZGId+FbhB9KNVdmr0Yhs02aRnaMV/+a83fe6l0/LMb
         DZY+3A2XLXkgL0HnZSuZzAyhJ4R+LKblDucHdPmJVfKxIea1bCvXlas8NpWY/ClO5lcH
         kbT9bl3U7s+IH7TeZGbQiBNPqS4e/6bWDQldOh48zuWptjZTRh2pMgwgfU5GGIn2l96S
         bm+LvL+q6svWMGoSURxs5BRBachMfKVG1G8C3BqWYLTfnJdMklMbZMbytFFYiVbPcRn6
         f3Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVGQ0kcCUVk6YljD36BS39p6Py9zZcNm71HsMFguMs4lY1eMI1Fqhd4S53g667juTv5evE+YyBGwjJPMaD7EWF5HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgJeT6NO8y4V4oTq21iUTnAX1ExMoNW+8RA9nmJYfgElYRiXV6
	Guh2nq77WQvCjwMflDW2/9tymULvKhzTDMJsmfDAPvKhBPXa2ZMMTO5FgAloZuGsuHBLMnt2Bj9
	rVLONrFAhEiwSWxDaoubBJT3Q7zecUrVl1qWqi+YEEw==
X-Gm-Gg: ASbGncvw7t5fqwp7VGiCdM6Yr0dqYmkKIU/YPCQ1Ie0ihURSgc5C8lS8z2TDITw2rwc
	GpR+JQmn12oZtUx6YnE9vcZxYTA2ygizVucrtZXePHstE31DtikdW6yoQH8FnbQkoGYpktT6Y0j
	3reALGYc1E71JasifF7cK5fHY8JgryIU64z8Hgn5mxtW4yYjad7o7pQNJ7Bc9Hyzt6+0ca+/2yT
	EeB3Pi9JaaGUyk4THwUa1vLBZg1RcmYkDB3FKaxvHGo
X-Google-Smtp-Source: AGHT+IEcS4H3ART7XbkyRLcIVlRN9ttSIKXOMErrDhYI7itdbz36cK6980ngyigAxI0SbIW7DumJI/JYvN83SQijQyM=
X-Received: by 2002:a05:690e:c8:b0:622:7517:af78 with SMTP id
 956f58d0204a3-63ccb85338fmr715381d50.13.1759864815549; Tue, 07 Oct 2025
 12:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
In-Reply-To: <20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 7 Oct 2025 14:20:03 -0500
X-Gm-Features: AS18NWCtEcLGJeO6dNMCbDSRSbiDXW6f_hsYoSbqLJrQg-Tj2Vl72UtnnpoTtMI
Message-ID: <CAPLW+4mT+BcK+sLTenaNP7T3iFF1yXj4kziSYiJx2gOYV2NSWg@mail.gmail.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix clock prepare imbalance
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 3:07=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:
>
> Commit f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend
> with UDC bound (E850+)") incorrectly added clk_bulk_disable() as the
> inverse of clk_bulk_prepare_enable() while it should have of course
> used clk_bulk_disable_unprepare(). This means incorrect reference
> counts to the CMU driver remain.
>
> Update the code accordingly.
>
> Fixes: f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend wit=
h UDC bound (E850+)")
> CC: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index a88ba95bdc8f539dd8d908960ee2079905688622..1c8bf80119f11e2cd2f07c829=
986908c150688ac 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1823,7 +1823,7 @@ static int exynos5_usbdrd_orien_sw_set(struct typec=
_switch_dev *sw,
>                 phy_drd->orientation =3D orientation;
>         }
>
> -       clk_bulk_disable(phy_drd->drv_data->n_clks, phy_drd->clks);
> +       clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->cl=
ks);
>
>         return 0;
>  }
>
> ---
> base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
> change-id: 20251006-gs101-usb-phy-clk-imbalance-62eb4e761d55
>
> Best regards,
> --
> Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
>
