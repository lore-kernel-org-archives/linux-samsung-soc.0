Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19E6155C97
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753341265; cv=none; b=Xv2XBspcVDJO/8yuvrDnLFqBDnmWumpGHiiO+WBCpIybH6SFQViRCBpmRAFekz9Y4fEZou4ZpLsN02OJ0MOnjaZt0PzbVV2ik26sRuGz5Ju51T4HQsqRePZBmUPJ+IVL0eBh0S+yEVqdQkHL3hGeovzvGf4I1c50s+ym+VP7hMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753341265; c=relaxed/simple;
	bh=rE5qWWZjndiq49hxBlZf+jiV7j0uDbdzOEQLJLes2Yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TU7pR+jpE5DukXQaKtPPClasYh3fxkCC0+zfso3c8JCxg28hxCM8J0WFAh/AcMxFG3boqjzz7xyX6UT7UwGIZ3ake9nK5Sq9q6Fc7y3b16IWgYxHaOPrLK9Rwyhu9rVO4C6OHcZFG1Ft5cuGYjR5OvTEC12lPxZm6M0CFW4oE3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uMw1sUWg; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uMw1sUWg"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e8dd5602497so522289276.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 00:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753341262; x=1753946062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYtiTl2/vcB5JjeNMht3FQUGQbOf7Sw/0g0qYc0qYCs=;
        b=uMw1sUWgd/kyEaVHyO0gCQsjPlh8i4zKQIw7iR1q+McYVsnggcp0xEcI4LcZHxerIg
         J6Dqhxb83bm3fBqU53lfOuvQrsG3cev/82p61m8rG7GxK3wQruIPEcbauLdU9MS7G3wV
         nxOLADZhnvMJx2QY2gcXZ857x9Y9QG1BJWLYnVkQTtz/oZFEdbOy7fvQlgRZ/q1I2ubD
         ER3jW2pedmhsaXP+NUUOvkKF+FBeIChp4nEDp/8jWB/xM6w2abcRBPiuf733sdTDfjDy
         54Wk1AT6nEmmxNLng9yuZK7HjSmAWouIYXSAqVvCRT+XPkRhMH3+psFrJibni2F378Mo
         CJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753341262; x=1753946062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYtiTl2/vcB5JjeNMht3FQUGQbOf7Sw/0g0qYc0qYCs=;
        b=oz07/XJMLapDhMn5aA6HXgstEMo37VoH8R4UrNbJBhhCUFImxq13HUMGOn/pZVI+T6
         SLFgtz1OIxjJvaO5t+lDscZZjPmeQB8Nk4UXkr21wEcDnci8Pi5Z4SNH3RkiUUJpTcoJ
         +uvn7cvUPa0fa+6F1YOG7S3fW9Y9yJofDaq4MhFBN93Mm7GCE374SimwhZF3kYxjuJNu
         TqgjBlRmMfc6PYIsXbAlzgthH2zAw0EvJXlsNj1rTXr8xb0N7+Uv5GcjkT86H/YzfhVy
         hZFO4TQnxPm51OnsQF2BuGVdd83nAsAlNqCl9FLeu3NuYT962+hzXPU0yOGYP3104r8l
         4JHA==
X-Forwarded-Encrypted: i=1; AJvYcCVobJrg8f9m0Ce/K+EerZvMppCO20IUQsI0bSYfpeG8Z2prX1y+v0wvP/UeLUkgydVa+PVgBjMb4uzNaEN3KVLVWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3uAktUVXL3F+AInKJzsZE3nKnB4j6N3DRXhhteH7dgbNnrIvw
	rpiMFfV8sbsjiO+XvhyxzJsURvtmcouQtRTQeyVQZOH9b7rvnlqYgZYakRHjPo9yNoCmt6OyRVN
	1nOleKAZkrwbG+0s5mgo08bykV+LpeoSTY+JSB3V+SQ==
X-Gm-Gg: ASbGncvHkJR1rfkJkn8wBW/418opJkcKZ8vLpMVbXHvh/66DYPv82xxDTKo0OVvnDQI
	QwDxl/g7qTbsjfSQK0Q8htn1hkKAX8pNUGdKJmVquwe/DtjoFTFEAc+5Qcslss8jFZd55appQ8V
	DjrBwwxmw24oDkpCnwBtfPNcmaukX6jeFXVZmqDetWNMx3wOjC9LDDtDavZBfsELDqWk5zNr+be
	OqQuDg=
X-Google-Smtp-Source: AGHT+IFmnBw44RVqEQy61JKuL0iFrYaWpRDyxUhMmlPDwRzFw5AwUBOybBBoOUdWV5mpQDmcfwgotc7Tx/G30sPFLxE=
X-Received: by 2002:a05:6902:4a0c:b0:e8b:d37b:86fa with SMTP id
 3f1490d57ef6-e8dc5a86969mr7074336276.37.1753341261694; Thu, 24 Jul 2025
 00:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9@epcas2p1.samsung.com>
 <20250714055440.3138135-1-sw617.shin@samsung.com> <20250714055440.3138135-2-sw617.shin@samsung.com>
In-Reply-To: <20250714055440.3138135-2-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 24 Jul 2025 02:14:10 -0500
X-Gm-Features: Ac12FXyeh_teX33m6-oCCNN--bnf0arq8tqlpYQ5bLEOmvlZqoOtQ8w9OKWGEX4
Message-ID: <CAPLW+4=Gsd9VNv6T_e2QMWkPNbjp4c2GQEYpD9icU3r+0QuPww@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 1/5] watchdog: s3c2410_wdt: Replace hardcoded
 values with macro definitions
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 12:59=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.=
com> wrote:
>
> Modify the code to utilize macro-defined values instead of hardcoded
> values. The value 0x100 in the s3c2410wdt_set_heartbeat function represen=
ts
> S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its meaning
> difficult to understand and reducing code readability.
>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/watchdog/s3c2410_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 40901bdac426..95f7207e390a 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -587,7 +587,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
evice *wdd,
>         if (count >=3D 0x10000) {
>                 divisor =3D DIV_ROUND_UP(count, 0xffff);
>
> -               if (divisor > 0x100) {
> +               if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
>                         dev_err(wdt->dev, "timeout %d too big\n", timeout=
);
>                         return -EINVAL;
>                 }
> --
> 2.25.1
>
>
