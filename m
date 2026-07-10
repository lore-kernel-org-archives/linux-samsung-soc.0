Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416D040629E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jul 2026 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679368; cv=none; b=KaItcWH6wBGlrqxVf5EiiKZd01pTL96pf/yAbyGuZAJQTQvvApkSIxoe/VHxEd/GefZbqEhnbqmc66ZpqfcwAYMQ7qXDBx/zltetrbXC8D8wP3/PsCM6mB3rVTaoheCy4DPG5+/pDQremtrJ7HaakOk76iEXL2vghkfeDrbJ2B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679368; c=relaxed/simple;
	bh=8Lu8OMpVPc16MxdZvSkmOEt9Lvt01fn1EVEQixIYHBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cotyvk0PkTJ2BBf2ikT3cgkZ2qnpB3mv59Kyxye2HTh1TBQHRlkuAptl5+XXAmbZ90cqb75+72f+OZd9tj89j0Z200y/KrVoOC0Xv1rAe1ZDVsH+6cD7EvN/LgiXtWAVUFoJKB6ckCyNuffxlROLteEpIbMNZZv5auRLd8fizbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66493875766so1312779d50.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jul 2026 03:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783679364; x=1784284164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsVN2cPDw+/JUxMMLcOD68aRVLlq59TmevfTz9ChQ+g=;
        b=LngTGy47Uw1lgz+x303et5PNLPyTXe9S8xxesE7gvSHq3krRUr17Euy2eOZQTunkn6
         B0H22YwO1hQ4UdByThzaIY0y8jCDQYNxv/+cpnmDtvHfJzn6mr9qURyIudy/ozQs8ztc
         2IxQ29MfYgJSDa8CNaK6vRpJfYZol/pToq+wzMzAzNKMA0sVd9lYutToJJLZCKocY6Hm
         B1Cz4aPk3JcPNSo5VEdiiielW5A/TlJ1HvDmTRoq18mmDPXQ4mbCe/tKf/xzPhxKmpBK
         +71t6RtdFokt6NhWreJvC0bzHbaPMyXgCUXPcA1z5kxwDZZNHlpNedzCmIE0e1ZdxoUK
         TveA==
X-Forwarded-Encrypted: i=1; AHgh+RqPhuPLq1AdKy+wl6dCbfM9eZSg1RX2kjuLkr/4iC89CtHO30oLGo3PNVQhwwuRCzaQM809CBXpNhrz16GdG5YPxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZgRSHogWXnrZvBcrkFsh1mSdPL457POZAK952l4edKiwlnRrF
	6RbwhezpV0sWwE8s04o75cEss4R8HRIyNUcV0gGUQBf6K0xK6HMnLS3GJ8ATOaFyAnE=
X-Gm-Gg: AfdE7cmxVBLjNg8wnI3IFnJ9u7oc/hE2N4+FEFEWYDmNd5tZ/vkg7MMfFU24to5Jn5Z
	0D+uL8tSgC3So2EnsHp0zn9apgLzsLWmI6798kycAua3d5iutVfoax6N944P1hx0aoosfAbmME9
	EzC/vk4K90UNlZJDwLox1j4UBeDYpyw/Pevgifuaj6LdG/YeVwHljA83IVfZUjEQ4Se6DFkTyfK
	GFuECXn6hQm7nDc0KfC0sZE8QgvIEEMK71SNuqFN8ohQuJ7Xs6K46z1jDTzPtDIIFkhIZpWiCU/
	1z8St1HbT+OmyTSxui6+BQJEo0/wVAwETVT7RaL093U8FhO+AqHRmSMGlNS6PnHQKdFxEgVaTR7
	sMlK75NrIQtEICtc0T1uoi5m51LGWOOh6/c10Figao8L2ZQ9ouWsFRpmG9u918/HdUveAeX0J26
	ElqTQpjGlk0ftohwve1nu4yeszXWjS5I3QMRXtY8rQyLQJ7jeG27djmOsTWMiFAZvq
X-Received: by 2002:a53:e984:0:b0:667:8b90:3576 with SMTP id 956f58d0204a3-6679f2b2b5fmr5893773d50.104.1783679364390;
        Fri, 10 Jul 2026 03:29:24 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-667874c2d15sm6411683d50.0.2026.07.10.03.29.24
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:29:24 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-80d33d13a23so9671787b3.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jul 2026 03:29:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqvyL48XQlcAHVmt6RomsgppxezZQ8AFOp9xmSN5zqRo7qLibdsP6jPNub3vlNPVyxFZED2/yU3Y4IUeAu59Dbn0A==@vger.kernel.org
X-Received: by 2002:a05:6102:3911:b0:726:e608:6658 with SMTP id
 ada2fe7eead31-744dff43a82mr6415934137.11.1783678885257; Fri, 10 Jul 2026
 03:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com> <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 12:21:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4Thb0en6jeD23KhDp4pTe2F8o5GcBx4fnB+JAxPG-bQ@mail.gmail.com>
X-Gm-Features: AUfX_mxlLApCIjqxIsg4l7Qhe6Rgf_3Xy6YCZC9GZlPPApUQFkmqIVPuBIh_jUI
Message-ID: <CAMuHMdW4Thb0en6jeD23KhDp4pTe2F8o5GcBx4fnB+JAxPG-bQ@mail.gmail.com>
Subject: Re: [PATCH v3 21/23] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Chen-Yu Tsai <wens@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	James Ogletree <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, 
	Ben Bright <ben.bright@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tim Harvey <tharvey@gateworks.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Saravanan Sekar <sravanhome@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Jul 2026 at 19:00, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
>
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>
> Adapt the offenders accordingly.
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MA=
X77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

>  drivers/mfd/rz-mtu3.c          |  2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
