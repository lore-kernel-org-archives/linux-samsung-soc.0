Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ED0182D0
	for <linux-samsung-soc@vger.kernel.org>; Sat,  2 Aug 2025 04:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754109571; cv=none; b=pkeguprM7g3C8L23UfgOxtdmoh4OyvKG3KwsK7Gn4daTan24CNhoXVDzvVvWAoplP3Nr1PQ/hxB4Qc9/u7eB5NXBwzCbDZkcG8xPKb2TJ5vKr3vv1QBUwe0sW6Jinn2Hhn95wV1V7MFHF0IYuKHcJjSm0VsObQgPv9dseS0q2RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754109571; c=relaxed/simple;
	bh=4Dg34mx4qxko4XxpK2YIUD+lvidXnjY1AMEKq1PsdMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=llDpSpfGAR0Rbf1eINquv1TQcEKDG7UYKqKEtCiLnPQtbTahyJk23gNkJrorIfpLCr2t/tlpJGqkkT0bYgCmiwjwJ8dKwjXY9Oqk3NPUxlCI0p3BEGYjEInyXDOuu/ryV/+9LkxWlci5fzUM1rG+ylElvvQ7y/lMvbJ58o9GU5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k1AUHxVk; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k1AUHxVk"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70a57a8ffc3so24886147b3.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Aug 2025 21:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754109569; x=1754714369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwedNykX1uMkjq1G07l2poxKV3lFWdGMwyK077ctHSU=;
        b=k1AUHxVkTdrRG8QoCLAOwIJmklsUQAh1z+pWCNhEDKxlhf9tl0q9N3CsrTpGaxfePC
         2r/jQQN67B8q90WLY7Dj8jiipJ8fcmVZNZQwAPTmwUEfBDjIgJOU9DO4AdTeeJSduUq6
         68NLDXXwWSnQBiB3ljtzUowzzcUx2510ZZ1cjCHMWBVB9sZC9qFMf0V5nUxVOvnRt2rM
         3ojPvEK7VcPVAagw6J4GgH+23A1sSpqnsl3lOoJbDoYX3huhTS5F6d9fJuN8D9YRM6UX
         htVujS7wLbTQQhsqEDf6DZRBwuCgvm/t7X6CO22/GwdS+ym9v0yLW9+Xdh2sRKpuyO0d
         F+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754109569; x=1754714369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwedNykX1uMkjq1G07l2poxKV3lFWdGMwyK077ctHSU=;
        b=WkBbMQZqLcX7Uk09RtBwB2gYuAbkIV1FXVO+50S6set2JRRBuskZyoLmMVE4RXX/4l
         DPEijFlfDvK2p3wcLSRXncyjNW6QlTYXx+3xptaPk/RdY0899uWP2dHmrIX2BBotAf6t
         HGQTYaHaJWiPn/Pue99+jjRjeiNqOai1F9fjoY0XczOMlyk98Bp3mtV6w3bRt9Y5ZTwF
         7UrfET/3oCFNN6gkW2Q3shqE7u5NICrCykLvjqPVmrAH7FplvrFezjXJT/qtWTsgVxCg
         wNbG7icJBCbdeD9N5v55zJuUdlSxhVQBLNmBkC5/ovWY8iLFDd2eRIhdw3Auc7CuzdKi
         /yTA==
X-Forwarded-Encrypted: i=1; AJvYcCUPNSev3vad8EJTTnxYatllKue5F4b8sFUT/D3LIbvFQNxYsZDV1HQ7n5dmsHcpG8S/sSQeST+36fEgEQDv1jJL5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCNz16DVoFKmeDzbnAyyQaQZPXG7lgroY2uAne2EPmmF9EyqTH
	m2ZBKpeYzMjfTlvODEwFBlsmBLzRn2RatrO40Tz6PS3FSKta8DSGMCwmUBs4HFVd9UPyvWyClzr
	UD7eL7bmFy79Q87nVopb3mjjReJOnK3l3dTpUUDVPfg==
X-Gm-Gg: ASbGnctH1ixK/0T0uBvR1RczsKPmoIyMy+k6+tSI9CfEUnbphtURoS0X03zizlDquBx
	BYLRweTYysuKv96cm2CzXQ2qFWssGRRrVpiw+o4yG7p1IFUDdPTAQ7clF7JGmj5OkD0HA6FYfUM
	F8S5IeRAkKeQg9D5NjnrcH+kW0ilInhHJDvA+Pc+UqK5NAyinnKwT0VYXZj+kMhgk88BKA5RsPf
	ZRf0TFKclCRcSNL
X-Google-Smtp-Source: AGHT+IEHE4XW/c08xnfJpKw584beuzxAr7sJRcO6jVJsJ6rlMG13mbhm7ts+7ePCLEPAybkCbOBp1u2oY29yCQQpE9E=
X-Received: by 2002:a05:690c:d92:b0:710:f46d:cec3 with SMTP id
 00721157ae682-71b7f5bc0cemr24750957b3.5.1754109568692; Fri, 01 Aug 2025
 21:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250724081337epcas2p430db7d7514b8cc05e41001f17b8b0d45@epcas2p4.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com> <20250724080854.3866566-5-sw617.shin@samsung.com>
In-Reply-To: <20250724080854.3866566-5-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 23:39:16 -0500
X-Gm-Features: Ac12FXzXiIgqxqB3CLv0jhcuQWL0uuYoB3Fa71uV_JWyZNdu94J92BGrpnV5cXk
Message-ID: <CAPLW+4=CZ=VsWerWEXGyXkomsAUJkd8eYycCRktKZjsTi-RVgg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, khwan.seo@samsung.com, dongil01.park@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 3:13=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.c=
om> wrote:
>
> Enable supported features for ExynosAutov9 SoC.
> - QUIRK_HAS_DBGACK_BIT
> - QUIRK_HAS_32BIT_MAXCNT
>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/watchdog/s3c2410_wdt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 184b1ad46ca6..16a845f41e74 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -305,7 +305,8 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov9_cl0 =3D {
>         .cnt_en_reg =3D EXYNOS850_CLUSTER0_NONCPU_OUT,
>         .cnt_en_bit =3D 7,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> -                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 =3D {
> @@ -317,7 +318,8 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov9_cl1 =3D {
>         .cnt_en_reg =3D EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
>         .cnt_en_bit =3D 7,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> -                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_gs101_cl0 =3D {
> --
> 2.25.1
>
