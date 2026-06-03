Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54C7407CF2
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Jun 2026 08:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475347; cv=none; b=HijCjRquXhuS32c/ZbczSnFE0H4RWqxxFv07jF0zSApTB+i9VMnPqkExJQIRZw21eRjdU2sXm+q6YmyrhVdi6aLT8u0eOWnFAg0u2gdvG32Claisdy4MyaZdzBemaEMUhMhSze9ry4QyEnkoVD/pBoJ6UoEnfU1wz1bwG6ZqwBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475347; c=relaxed/simple;
	bh=bloimK55FpfGsQLgS/eRSYfIoH0XLCbUnwSE5SJK4mA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GessjhAzB3zpHyEx1OUAmBliH8HbrgaATC7wfAwYmKTyaPrtWb1S34UeSg4WqgoytcwQlWk1Tu6rTEUBBdTsm3RtIybS7pag7Lmc2XRuETBhTMQCVYEwRnVKclu7McdeqldAGUvvJVyNCsbZx7DRjUo5NwjT24s3NKGZ0UtKliQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWNcTRTN; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWNcTRTN"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef616daf6so4940665f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jun 2026 01:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780475344; x=1781080144; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UFR5yeANXS1ym7dwBfhF3G3wNluixUtSkJDeWkxZK0=;
        b=EWNcTRTNT7pDA05mXrH769q8zlWlrxXDTZsceI7a+eI2mwvm/CFjPvFhngCqQpnf29
         srTGnAkEzRHnZOFVbZ9wDjyA7NnuXxjwwwzJwh5gpuDRaIkoiCdV5KYCK6LDcL79g08Y
         SVCOhIlhpcKFLOo+UZXyLH6MUeCm2tgyZiSYeiipUZ4lSA/pSGTwGXh01+fS3+O77lI6
         tJ6tKef1JgE2i3o+3EH7AmaQjcwlZ75A0qToc7AlQHCAIaN8jQjoRM03pZ1nbGHiBvlD
         h1YRCm5+oawq2kj0/711nznw/tEUAc+0K1I0msDkv8f/ELYR8JirQYzP6dFdVWiIqIMv
         +E/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475344; x=1781080144;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/UFR5yeANXS1ym7dwBfhF3G3wNluixUtSkJDeWkxZK0=;
        b=Fz/frV1QU+Ubyts3nwlI1nH1CrIMJXGfJfujUlAF/8Ep2vpyL3mTGhUmcpiypXj7HY
         pkDg8eYk1J8dDf4LltU4SByI0mri8wWBH5vFB6X+4dJ5A+zF7c8zqMrFNPuIi/MRIOxg
         +Yehb+UiAvfooqkr3TyShqnZk3bQ67JPTr+2/QgJLt/VNO+1HnzhKINO/dRUu0vu2iEC
         ig66vuuo3kmyVJPfjEGFiiWRKJn6a3jSt/XUnMMOa67PO2E1Vl8zhtZD5xsT+M1CM/Ys
         I84aAfQ0pGlzXIDBOrKc95o8Ui4po+7o9P9o5IMxdNnsirbVhC+aTJjaQwaWaMDJ8yDq
         HFoA==
X-Forwarded-Encrypted: i=1; AFNElJ99jmX1bVPAwdo6MiLP7RWFfgkKD0N8wsDQbgx/AKxE99/5waMdZ+5YwbazPoYEyhlxfXye0ts2gdajJSeBbunYBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxtLXcbYIPKQxligSoJIP5oTmz4Zq8W3gbhdpCdsM1XewdSkfV
	bHWrz3dBgTY4q8l61dFRuEcd3jg+zDT5Zl0+gjOSc/HtF3z8cYL9SZpxFkxrxLV6sHc=
X-Gm-Gg: Acq92OGkEgT+S7Gy2AzWlSCeXhu9yyrQ3cxPXoRJl3NZdiZ5BleJTmbdEnhODqzad94
	yFF0EERIsRUv1Rs0JtpCr0etQ1J57CsIs2YjkzLYIRfUK10gGNCZEX/MqkcAny0A84LVgSKgPTR
	YVVXZtQTr8Iuy0pmo8Fc3F2rQvJZWSEoQs4YiqTP5qbnRPQkRe/1wWm85RIfDjXgQrncuY8iEtU
	cTgLeAyA/kN2K+lS6xdZrnj89Cq6dcltnFrlsA2d9pciy2ckhTyTONdh4y9BuOCiTTZGknBb1Rw
	zxvOCxX4WaOFJPo6d0UAPxkqxiBt3yfSCM+a87RbuaXP5ZiIXRFRcda5xf7h2TkPuEXo61hbIgy
	L0Qkak9x9Vhgu1SfiDLw9QFO9IGJ32TJlJ4QFv29/ZGpB3DU8dMoj8dbPCeZxBp1U3i3EgOoqJ+
	10JCGxcCEGgDm9UhghqkMd7J9bFWMv/QGDK2E/VDZc35nZSZVi207k1Y8n+/Bwoz7W6RhzhC0Va
	bdMjpvHn254soqVlS00XwtfC6LBir/FIIi9/FM=
X-Received: by 2002:a5d:5389:0:b0:45e:f2bd:2b16 with SMTP id ffacd0b85a97d-4602182dbb8mr2455986f8f.18.1780475344302;
        Wed, 03 Jun 2026 01:29:04 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9b1c:c9e0:4645:9af0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm6191614f8f.36.2026.06.03.01.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 01:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 09:29:02 +0100
Message-Id: <DIZ9U0RE11CQ.3QJET21NQ2QJL@linaro.org>
Cc: "Bartlomiej Zolnierkiewicz" <bzolnier@gmail.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>,
 "Lukasz Luba" <lukasz.luba@arm.com>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "open
 list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] thermal/drivers/exynos: fix clock ordering race and
 shared IRQ handling
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Rosen Penev" <rosenp@gmail.com>, <linux-pm@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260603013018.239703-1-rosenp@gmail.com>
In-Reply-To: <20260603013018.239703-1-rosenp@gmail.com>

On Wed Jun 3, 2026 at 2:30 AM BST, Rosen Penev wrote:
> Fix two pre-existing issues in exynos_tmu_probe/remove:
>
> 1. Clock ordering race: The driver manually unprepares clocks in
>    exynos_tmu_remove() and the probe error path, but the IRQ handler and
>    thermal zone are devm-managed and remain active until after the manual
>    cleanup.  If the shared IRQ fires or the thermal zone is polled in tha=
t
>    window, clk_enable() is called on an unprepared clock, which is illega=
l.
>    Replace devm_clk_get() + manual clk_prepare() with devm_clk_get_prepar=
ed(),
>    and devm_clk_get() + manual clk_prepare_enable() with
>    devm_clk_get_enabled(), so clock unprepare is tied to the devm lifetim=
e
>    and happens after the IRQ and thermal zone are released.  Remove the
>    now-redundant manual cleanup from the error path and remove function.
>
> 2. Shared IRQ handling: The driver requests a shared IRQ (IRQF_SHARED) wi=
th
>    NULL as the hardirq handler, causing the kernel to wake the threaded
>    handler for every interrupt on the shared line.  The threaded handler
>    unconditionally returned IRQ_HANDLED without verifying that the TMU
>    actually generated the interrupt, which could cause other shared-IRQ
>    devices to be starved.  Change tmu_clear_irqs to return the interrupt
>    status register value, and return IRQ_NONE from the handler if no TMU
>    interrupt was pending.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 81 +++++++++-------------------
>  1 file changed, 24 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsu=
ng/exynos_tmu.c
> index 47a99b3c5395..5dc22006d7f8 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -196,7 +196,7 @@ struct exynos_tmu_data {
>  	void (*tmu_control)(struct platform_device *pdev, bool on);
>  	int (*tmu_read)(struct exynos_tmu_data *data);
>  	void (*tmu_set_emulation)(struct exynos_tmu_data *data, int temp);
> -	void (*tmu_clear_irqs)(struct exynos_tmu_data *data);
> +	u32 (*tmu_clear_irqs)(struct exynos_tmu_data *data);
>  };
> =20
>  /*
> @@ -760,24 +760,28 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq,=
 void *id)
>  {
>  	struct exynos_tmu_data *data =3D id;
> =20
> -	thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
> -
>  	mutex_lock(&data->lock);
>  	clk_enable(data->clk);
> =20
> +	if (!data->tmu_clear_irqs(data)) {
> +		clk_disable(data->clk);
> +		mutex_unlock(&data->lock);
> +		return IRQ_NONE;
> +	}
> +
>  	/* TODO: take action based on particular interrupt */
> -	data->tmu_clear_irqs(data);

After that change the TODO comment now feels misplaced.
From a quick glance, it seems it should be moved as well to just
before if (!data->tmu_clear_irqs(data))

> =20
> +	thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
> +
>  	return IRQ_HANDLED;

Best regards,
Alexey

