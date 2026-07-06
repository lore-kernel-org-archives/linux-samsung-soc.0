Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBA83939BD
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jul 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325205; cv=none; b=LSKmEqSq8ctU6aac9+iiqyl3ztIvmJAs83AwffcYHFIjsXFJ02nWm894MJq4XCuf5e9B6JMjXLgcX79KUDcHA7W4UGwKga8RhcFOxj9oaowoJXHserxHxVlyUsb4vrB0bprZYW/oMJ97USu/QQ/KYxLEJA62doNFxKbY8jD0Iwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325205; c=relaxed/simple;
	bh=6FRXXocn1lfRgJnxiPkpYYSBB5w4wnBEBhNnIuipX2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pulODYiDMCYk6d383ZESsZ+NiqFMU1FHMKBOplRiLWFWv995IT3E/n3CcaI9onnsJNJuO5lQMVkWalsqJIlKd2SbhfkZ9tCF8J/hPdydSAlZ4LQcml/U3EYQ8M/CiEhoGPEwb+NT/aj1ScE+u8uINEJk7fZ+BcdE1xKMsZXbHd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59ebb89109aso2135847e0c.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jul 2026 01:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325196; x=1783929996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xlcdnSGCAGaaD3Qtz41jPpd7wkV1TEYjW94sOKYd3zY=;
        b=bHBiQCTShin1iCZ8YAucVTLRUPM7BR4WGTsNnRrtI7qZQrZzvATAdMQyi8ICCJ9Xxq
         HHMwaMAea8B9HaM+F6xFjb2geFDZw4cdLOFrR8JUt85nxkNzF3bBmzQAlGnFYYbaPABu
         YONFB7YUw3rw37POKmLk1RYPg66rABYKPlv2ss8YfFJe7YYJCYetEv7EgIuHjKLbKcNG
         z/UfdhCi2gotnClOPMsXoQT9n394cXGpeHysDGEIuItH4UHAkRFgwFEK8NvMFJoIQxyO
         gSXlqLlC0S/PpUH/CwubDQFvv1lc++hrTYa1or4e6Fht2rW9T7wSLe19WNDIM+pM80HB
         chGA==
X-Forwarded-Encrypted: i=1; AHgh+Rr72453SBPB5LaOYppNCT0sNWzCJRe5MXQwkzc0ZA2VZmHZZYj6KemeD4ilX1uv9s1AFcAHr6y3AR4zgvoOsoG0ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoK5rusmDcd+3yrqLkyTRC+h6X1+C9vA3HFnegF5hSwNHh5n1g
	J9xgx7VfkY1m1LqeYEOY3RpMC1vND09V/iVKcLkE2pIYXNQ7b8DcqSWpP+j7OXth
X-Gm-Gg: AfdE7ckpfMSTL03N+qz2udjyk0bXz44rr4DmEplUxA2TxiBDk8HKMwYxrFOC4fD/lFI
	aBed3uff1mqFLfpA16l/7frNZgaRZB9UoNPey9p+flVsmJOKlMB32R4rdsGK5/Sdv/gPB8et8sV
	F0ZpZx5KdZxe+W6p+hIOTM7GWm7KuLBOGB/yBZt2HJBYrbCR4DWJE7LTMDVQZTCVh+g4LESyLpg
	J431IgtbVsjdLryaMmZ2dcbcLlW+E1G0PgX7LPcIis0iLYutB+Q+fA/m3hu4KGUhHxWdZuYbUTM
	v/YvoFv1bb23gY0TVY+OEMHofZQ/UL9SiSxXorePJIolx4Cs2fTD6DWXpQ4x4wYDaSuRoag3+Iz
	3OXUa2ofIZy2bmvm0SgDgZ0IOL2cxXvZd/DfmoZhTu53WOFauamHkz2hWGW/D/bjqjhwy89HnDB
	wZvXXG/FIETrXa654pX1ZDsrHKFkwBNIbmmbN26qC0Qfb2xCDRZ80LPcKcaloa
X-Received: by 2002:a05:6122:547:b0:5bd:ecad:8f9c with SMTP id 71dfb90a1353d-5be101d9e4bmr3210275e0c.6.1783325196005;
        Mon, 06 Jul 2026 01:06:36 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be02c4414csm4405131e0c.13.2026.07.06.01.06.35
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:06:35 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-735f73287e2so1584607137.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jul 2026 01:06:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RodjpuGctSaVC/JP38FJhtezEEfexWx8MCM1Vugfb8dnayqI9eGeF9kZNTFAAA0/tAg/kKUghhLAFCYMMnIOXrVAw==@vger.kernel.org
X-Received: by 2002:a05:6102:800d:b0:722:826e:1423 with SMTP id
 ada2fe7eead31-7427f0478a0mr3286706137.20.1783324855096; Mon, 06 Jul 2026
 01:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783263835.git.ukleinek@kernel.org> <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
In-Reply-To: <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 10:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
X-Gm-Features: AVVi8CfQACxAMot5VlqKHI6FXvkOZpEWhTZp1dlkgWSruFHOk1f-I-dS5kVo31s
Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Michael Walle <mwalle@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Alexey Charkov <alchark@gmail.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 5 Jul 2026 at 17:14, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
>  - Use a single space in a of_device_id array terminator; A single space
>    after the opening { and before the closing } in non-empty
>    initializers;
>  - No comma after an array terminator;
>  - Also no trailing comma after a named initializer iff the
>    closing } is on the same line;
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

>  drivers/pwm/pwm-rcar.c            |  4 ++--
>  drivers/pwm/pwm-renesas-tpu.c     | 10 +++++-----
>  drivers/pwm/pwm-rzg2l-gpt.c       |  2 +-

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
