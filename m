Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159BA2571BD
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Oct 2025 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759421995; cv=none; b=rUasgoRYDCkHGy1XaJrCEC8aB6s0/S65bIcdLJxcpkKTI+bLjODxs8dtQ8xq07ycrjz1MG58bjoDL/KzgCwDrd44SAOMB9iymetJvFdtR32ChfkfuC6QgEDdz5WMR+lnia6c2elKzbX3oCnkpyfE+9QBUjNUNIIOpFmvMMyXhrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759421995; c=relaxed/simple;
	bh=Lr0irlvhfvHdwzVt5sqkWNyNfM8w5CssLQBlywqWjhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVgcm7Kg0Oa1xlxOa+PVCimLauhNYxx1BWc759rJvd/DxjlsQXO6w2OiZmo9a2U/9Zma0PXjPyQhRmmrtHsaP5IFHGA3H/8u6gpVIzaTtzviItJNdmfJRKelz8PpONquVEMDtTrNyxt5Qa4phwpI6Jayxsi6/m8GbFxC8+MK28Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J53OGMWk; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J53OGMWk"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32eb45ab7a0so1401286a91.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Oct 2025 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759421993; x=1760026793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZZ5d24XDIxkk+JwavCHmACQ+MmvpDMF7i8UGLWVc1U=;
        b=J53OGMWktO4WrOY4qas/5obLCi3RSlyddNPze7pi971NqYdkqDNi4PDwV7ZncxI248
         vjHmk/2no52jeBSiIx8+vflVEdketiz57qB7W6GQqZkCInAth/v6A7hX+yIYE9S7AfNF
         bZ+zWXLwmW0iHfxMVrvwHTm+6K59VrcLKkk7kfgO2So1Gcm5MJXfHKa4D3FhyO5OB7TB
         0vuxWtd1655w9USfJiSj3+cS8bEReEiBBfHhfKj9Lo4YCSKvD9wmfG7fAbG9X++A+FzD
         qCFeXbaKSCYEUQYDdiNqngpYdvES1VjO99AN0j3ngeHteGjiex4HpxOM3Rq9pqDWH4nS
         Y/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759421993; x=1760026793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZZ5d24XDIxkk+JwavCHmACQ+MmvpDMF7i8UGLWVc1U=;
        b=Tk46NN3VM2A0i9zOo2kG5EyRod5XjOdks2d0DcwO7041rdgUXHpRL8VTYKmDitG4MA
         m9s+d5l/LgFTE80QApvYgcnQ+vkuKQ0fCJO2mtZKWGeYCxTHFZbFTVAFcNcRErzEwFiG
         6NMvoRddZt5ibEmeXBACLXjF2j7FLmLirIEIcw3zZOW8n7b/wrcCjWksfhh+MwlcGA0M
         uGNs011LZdAXI2AqSgsa7uDOA4qqoUwmdjE2TFfaRbKd0c3wfTk1NP85sZbVFPLcnPPH
         vn+dLIaq9lmWxJaeafO6wzTV1IV04cTt43jGSmc43BZcWXqtArE7c7GEmt7pRwnrNp6u
         A4vQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/OWrWCofjbFSdAdnUQ5Bnj+xBMaYIszE/HSEGwMVCQ2Yk8x0gINuzu3Da0UnVw+xF/KzDxzZvVGRZ//VRnwQJBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw00JactFbzK+vXT9pdDyijiJEP6r3Fy26YJOEd+UTybhIUK0Ph
	RGMPAZSFjz9o123g0n5Uz3Hhe/o+y9rflDHrF4K1g6kh9SlBNeWbI1Yyy1Os99nViXDuD3CHrFQ
	qZb5QAhrZSDY++ChXT2R6hVa2aWCfb3w=
X-Gm-Gg: ASbGncuyGEeX/UEvdDFJDPkDHopSyMI+0tIUV3svx96z7vxbvKzm8bfy+DwTyBGOKbe
	G/ZNp96OPJ03C1Pcd0+bY1/5gHDJ+IzyVcLhBbxT1WwXtHF19dhqzgtixS+ElCehAXzLAOEYUFC
	UZKN+lgKzM57kKRfzXzIDdYlmeAaqd1A6BbZJnaJH4Ms/hCugnlQXB9L2DYvewWilfMkzHg+taC
	ZkO2rFgb21/Pu2RrHIxctmFtzTyPjw=
X-Google-Smtp-Source: AGHT+IGDpezXRZoKRUAmvsGEGRKGV3Cca8QMZMZ4Xe0LAt5a7sDWIZ6cqn+OuFMFCBuqxZGgIpVxUstpBqxpNK7ovio=
X-Received: by 2002:a17:90b:3145:b0:32b:ca6f:1245 with SMTP id
 98e67ed59e1d1-339a6e6329fmr8873915a91.5.1759421993437; Thu, 02 Oct 2025
 09:19:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com> <20250822-enomam_logs-v1-9-db87f2974552@gmail.com>
In-Reply-To: <20250822-enomam_logs-v1-9-db87f2974552@gmail.com>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:24:49 -0400
X-Gm-Features: AS18NWAkW_WGgw7RLjcHXntiCLOoMqdr7Jd-sVtGc97imtAcuufyjRqKmj5BmR0
Message-ID: <CALC8CXdUzp=sKeOaPnwJ3GWg8=qrXrZKNsKg6XeXxvutty-U-w@mail.gmail.com>
Subject: Re: [PATCH 09/10] iio: proximity: Drop unnecessary -ENOMEM messages
To: Dixit Parmar <dixitparmar19@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andreas Klinger <ak@it-klinger.de>, 
	Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yeah, dicks it.

On Thu, Aug 21, 2025 at 11:53=E2=80=AFPM Dixit Parmar <dixitparmar19@gmail.=
com> wrote:
>
> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().
>
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> ---
>  drivers/iio/proximity/ping.c  | 4 +---
>  drivers/iio/proximity/srf04.c | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/iio/proximity/ping.c b/drivers/iio/proximity/ping.c
> index c5b4e1378b7d..e3487094d7be 100644
> --- a/drivers/iio/proximity/ping.c
> +++ b/drivers/iio/proximity/ping.c
> @@ -280,10 +280,8 @@ static int ping_probe(struct platform_device *pdev)
>         struct iio_dev *indio_dev;
>
>         indio_dev =3D devm_iio_device_alloc(dev, sizeof(struct ping_data)=
);
> -       if (!indio_dev) {
> -               dev_err(dev, "failed to allocate IIO device\n");
> +       if (!indio_dev)
>                 return -ENOMEM;
> -       }
>
>         data =3D iio_priv(indio_dev);
>         data->dev =3D dev;
> diff --git a/drivers/iio/proximity/srf04.c b/drivers/iio/proximity/srf04.=
c
> index b059bac1078b..f9d32f9aba1f 100644
> --- a/drivers/iio/proximity/srf04.c
> +++ b/drivers/iio/proximity/srf04.c
> @@ -253,10 +253,8 @@ static int srf04_probe(struct platform_device *pdev)
>         int ret;
>
>         indio_dev =3D devm_iio_device_alloc(dev, sizeof(struct srf04_data=
));
> -       if (!indio_dev) {
> -               dev_err(dev, "failed to allocate IIO device\n");
> +       if (!indio_dev)
>                 return -ENOMEM;
> -       }
>
>         data =3D iio_priv(indio_dev);
>         data->dev =3D dev;
>
> --
> 2.43.0
>
>
