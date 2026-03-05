Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA7F37EFFB
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704944; cv=none; b=Tx4X0l9FjE17OH34gr9meI8AKGhEpCkP16nPNasdKpWAyvF6Ij8K2jdh5eherEMiQr+pmxwT7Y/Mg9JaBlpvD1wRNQSV9SbXsfDX9X7kemuY0clo+1c+MfYix1Xxw3M3zVZzgDuQTGWP+JXQ2BFfUF5ePerB16QvqimZApnRPi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704944; c=relaxed/simple;
	bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qnN1Pn68m1VwohwbqjSKcvALPGjIkvUNpLLgxex3XvfUYGktWka8Uk4KWscRsvgAno6qgKIE7A4eO6MgD/tYgLr6Aym1EtgxYei3H6L1RMZmiw1IeTvTq0lgNAIIX7xCERBHTfQNHZjJM/DSV2jibFILd87+KRkKaiCm0tdnpes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cD4UFgoA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cD4UFgoA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483a233819aso77125985e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 02:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772704940; x=1773309740; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
        b=cD4UFgoAocJuZT5S6/FT4tLvo8eHic6win/PVVlM7THi42GfYkSi1TmQKp9oFjEvC9
         4DuAmh8ioVJ3l0t9cfDz1F4uH57IMEgeY61EKqf0J4hgzotd10bzAWeqkIY3qxwq+gtt
         KyD/BEhAcZymLIC+jEV+iqZhfRlSpIO7G5fxOWyrn6ZeoxUBzXJNaGNiXGXdwAwygc++
         SJ3ShMbEL/2wC0WJ/VhDdOAftX90PfAz60BcupIG8OAGaPrCOCMIA27aaK++isLH44Iv
         ENO8y4ePFW102JPN00G4qmjO8l3H2KXaQyAiU4DD52kTRmizIQUzeyakkq8kcPe749lH
         0MxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704940; x=1773309740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
        b=L+Sn6IgnqCdilhwzIo1OJEHXBMEK+s9ZWIPUyWoXT2X8lbqcxENJ+/3WH3kWrXKzEf
         WkjhmqWHnu6o+H0VbkjR2xWgjtphpu4OnDc79mvwk+pDbO/WSNcmNtHRGelz5QJaJ81a
         POWjnMtTYSBkmsamHBojN5tIIBe8X0/a1SveEGGoN5Qq5kMmJ5q97CGmaGQFqNyaZcou
         iZJY/isqkchA59VoJcY6fTeosu4hN76+VmhSkLJSS02NInI6xuozr60uv7GS0YWr/Sp5
         yEmCBNNa/VlLiwOhWmLdnaYQoYml9/E4MTLLVyrl42YosK+abyhr9a1zLoY6vmNlo8Me
         X4BA==
X-Forwarded-Encrypted: i=1; AJvYcCWa9TWjl8kZlaKu3b4u8Eovw4bwjq+P4brJFabg+qmMGK8dSBElgllkiIoeZwb84SY1KVLt8w1s2PfpW0iAutwe9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxinrYs1ltVxi3sfreQOm0KHCCnwP+upPSxlIcNTEdzhA7xV1tu
	gDt2mnBuyCxx0KDpGe8DD71f/YC3F+Df48/2k1/cRMU6GLI5+5Xc/NIAHFoHsc1nXkU=
X-Gm-Gg: ATEYQzyvRcHeKMLx2r7o/ETgOkHBGgxDIbTBFQkMj78kHco7mRwwMI2g3aAhie0yc3K
	PwQ+FyfqND78IaCME8wAqn4Wz7qqK66tIwx069xeupKTVnRp5Tlo+q4XxKKAXXDh5zLm83MaEA9
	0R4hLl7g6XQBRZYKMOBg9ox2KSMUFFiXw2GqRqNtuzDj+5yOt0HZj/oO3OEbnbybHQryJPYiqTZ
	crdC8QPyZaNY45Qvh0ojO/W3TqWMZr49TfrhPUyGNS8wNq6JctsIDD/6egxtboqqWral8egBBqU
	xPlOj8TeQvT/aVXHwkycRlcKMBLkJIXmN6DKPTo8dnfqGTkYP4PI4c762ZqNUZGeZl+P4jF0psD
	uu21ESccTQflcDvbMOVB/qwDKmXwCqTeO60HQf5NqVc0HFxF0P9Ahm9Kt762wrCSKGZdxPMHxjw
	XiKXKAxAH70qrG7CNyrfjyH1figb1s
X-Received: by 2002:a05:600c:a07:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-4851988f31dmr86977045e9.23.1772704939633;
        Thu, 05 Mar 2026 02:02:19 -0800 (PST)
Received: from salami.lan ([212.129.84.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fade9fdsm59453655e9.4.2026.03.05.02.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:02:19 -0800 (PST)
Message-ID: <030737fd255a49288349f06e8c1217a126ea9081.camel@linaro.org>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where
 missing
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, 	dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 	linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, 	linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, 	spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Peter Griffin	 <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Heiko
 Stuebner <heiko@sntech.de>
Date: Thu, 05 Mar 2026 10:02:16 +0000
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
	 <20260304175735.2660419-6-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-03-04 at 19:57 +0200, Vladimir Oltean wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>=20
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>=20
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

> =C2=A0drivers/phy/phy-google-usb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +

For Google:
Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
