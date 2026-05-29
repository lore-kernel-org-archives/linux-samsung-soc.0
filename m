Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1FE3AD507
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 08:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041750; cv=pass; b=PLuxD4VvRGprHQWAJx9mIrZ7cqH094uZLnMbMFRr4C4lTAC07yL8H/gIaTf4G9KEwJbHbR4uc0laeH61YW7bGnLYgztg0GC68FnDSWaynCR/6DZDYVkFRpFb1cbEU0/YG1uOGpKZ8nNQZLb69RPbsQCbVUjZk9wlhoZBvs94AJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041750; c=relaxed/simple;
	bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dKtZz7Hfh8g7qMyAZgz+E4qbD3qJXmLPIQjTdd077YjgGgt1Q1jhRhJmFjqNua9Mgwx20LmZqCsbdwPIWpSxMPVezbEM6CwsMpCJwT/h0XSCWdKucrIvLeTamWsxBnyKi+2EUdmfpSMTcoaa4eAGpnIVn/R5jXLYdHJCxHn2qr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyzZTbtr; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyzZTbtr"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf22d29dabso2848595ad.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 01:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780041749; cv=none;
        d=google.com; s=arc-20240605;
        b=SlFWPynqmfZruj70j6TU6SSbfrJlT0oXx+XaX5Ecdjq8936f3LmZrYWWTziYxMYW5f
         LdN5crNBFirOYUzvdo/WngHIq0Na/+hYlKPiyH6SvZNb+yxoTIFLmVe2vGHsYqESz1Bo
         NrVw6alFJzb+Xe4ZK5fcxkXx4wQ6YDYcXx1gwnnY963D2RZxUOZudbkVBVlpZRH9/jQs
         IOUB2izs0WhtrlxHS0W6JIyXnqZKNnHKBPm5BO1vfyVXnabkntA/nNyDPmUQfkI035n/
         Ko+yG8YGs0tw20dRBlAv0KYbHSQ/aoyz6s/shWV/jw7wXXMEHqm3povb70qBgD4mPokb
         0ewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        fh=tCpfhjJ8gCrWu/wrNc6y8k7ZGcWYj6AtnNZKMLPho5I=;
        b=agJmFMz/zoWExUvZbN4F4X6a+EFK5dWiW9Nd+knrSfY6wCoXq7Z/s3Kw0BnSqJRq50
         OG3M/Fd2ccF4UtTnO5XG0/5880p44Wb7E9aQMinV7HBvqsXjXvo9yNSirw5S17CUFy/W
         zD5ffnqdl4i05nni0aOr4fwgiAcyGP3rj2DU/x8v0yRIdgUTfCU6le5h7ae1ZFtEvQyp
         3kcPZfI8hxpFCNxJEfiQypwpkiFNiYzVSAtEJj/v6n4tdajhxRjq0n/TMhWeVBQdpLcP
         Yv0d9QoBvOy8T8bTd3jYIbV+PbmSGesp5KwrDKI4rf+mQzjqzm2au8C15SmR4qgAcXUd
         mQ6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780041749; x=1780646549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        b=DyzZTbtrZ1n2pUax8yd/K5VlIptCfq8x17Y1bBwWhPrIij0QTiJOPUXga9Wk1PStt/
         Z/UX82Dpe1ItakllYC6viWCR6Nre9Fnb6f60qOEMga+MfWzZ9OF6lLU5CPCWDvZacO+0
         KvFL6AHvHXA7EM47EcHtijw8SuWz3liQi0gcdlWIi47OWjg8JDj0BULD+kZ29dnPnP4k
         vUtHvuLIgjrRORImdUB7i4bk7qjvA5BoJixLH8dryHWOir77N0KT8m147f2PoC5TxDye
         KSSpFvXYuOOLLoFaA59M593VjSX5/qQmA2vbWvJTivlCCErGxgg5GEUYH9Qkc/j/nQ+5
         Ycpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041749; x=1780646549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        b=DdYGN9s4TX2Hq+bMNEMgM8mk5BwJHFW71JvSkHf9X6B4qNlBSUQeKY2L0Zsmi8EYvo
         DU4sYbQXErRhXprUXr+82RwQ2Q1P37F8jIHA60bTG/bvU/A3CquuEv08nU7sSIGt7kdq
         YTv+D1O/swCqUOIAfeLYm06oaKr1Fhjdmj/Txgf6A+kC36YJATiGRisLuUzblQiWqUPr
         Kfo6E8jSCvK6Meehp0XASkmDEHpom4tJ4NmMRpr2CIJ5Im3e2uf7AD0yYnsnP2gqA1u4
         Sk/OQYrhAzHWDjME+AZdPc+txUwUtSJzXRZb605Myry2hDQy237BBqP+//Ttarmd9J+L
         xfSw==
X-Forwarded-Encrypted: i=1; AFNElJ+UAyl8PskUpSoVzU6Z3Q8ZW6JarYS9LsavVhjDryTjx7AO2hZX2fthCDGugQJ2Z6bgftef/Kuq1wZzDVIujqMiHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhc4ID0js7sQW21X5TL8nu/FNxsKl4U0QE6aCFIhu7nHCW1y7B
	8H+BaK3+yrugmVxDIp0HSnAswe1IZoE5Opxbe6OeXmN5zOJYknEYfZ82ONFCM0RXr/QQJMiFogH
	OTf10nn+9bQgFAPymNNrCjp7BC8u7DjM=
X-Gm-Gg: Acq92OGo3Z/uKTTMnWp/FO9LvBM1EiOxeS43akCJjegJvVmYGcGOZAfZnKXb50VJmWI
	mwKmJXowGaopXyp9eCwr1adUv+01SJ1cq5Wku+JAuCBGDam6wSqdPhYsPZDYnOrHLtUu+Me4mIf
	JFhjHGJf0+AUPKiV9MxjkSopoUwxi+asTVKlDOXAfAe364h9oER2MXBsGmLrwteGWOvGTuW9Nyp
	4AOlp57q35cgvs6sv9JuiZKr5BXz83dRiidF2ItGVFIv5swrfoqbhrUOGtR22XP4jvqstymyczn
	wPkoB6uH857ZlP8+WeA=
X-Received: by 2002:a17:903:fa5:b0:2ba:6ca2:be0 with SMTP id
 d9443c01a7336-2bf2053340bmr25566605ad.4.1780041749021; Fri, 29 May 2026
 01:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779878004.git.u.kleine-koenig@baylibre.com> <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Fri, 29 May 2026 11:02:17 +0300
X-Gm-Features: AVHnY4KLQby2GKgYCaNbHrRuPj0X0-ETK3PqgCK0q7F1iL-UnUKeln5tOfAvRio
Message-ID: <CANhJrGNyB7aqMhR5DiLXd6OPmsE4Vox=K7UwMPZ1ZZc2-Ciw3w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] regulator: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Karel Balej <balejk@matfyz.cz>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Samuel Kayode <samkay014@gmail.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ke 27.5.2026 klo 13.48 Uwe Kleine-K=C3=B6nig (The Capable Hub)
(u.kleine-koenig@baylibre.com) kirjoitti:
>
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

--=20

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));
