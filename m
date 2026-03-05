Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41807373C0E
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 08:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699403; cv=none; b=pcWknpMLoXJxt4A4Mv9yOs2mV4rrQqSu6Ql+4kYiJo8TUCQe0NH/R/0lagHr2lfZSuJmHgjUUOH51rHxX0ZM7kaW/QFVJU9McJvMuqxHyYFLYf3OfZjOILIZS3Keybnm2lYbc2M2r+tuotTOsz+9cqIDL/xFtC7+A+SyI4VjHfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699403; c=relaxed/simple;
	bh=CSh/OPgCewZMrxAGotXGAjNREHTmD2ri4RotS2E+6yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lJ+AnAc8pgPsE5Tco0MpXxXjkXM0E9/liKP7ePh/DD7ob53GVRZzRo5lRNqm2caA9q2SvKFgefrmRvvCwRrzZDnGk755gxFX6FYKr8n9SwQCKZswacIRooorG7I4ZH7S64154TXT054dAlvMnI4oUWO6rnwGTi7W/pQp36uqzC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5674d8be45eso3130777e0c.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 00:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699400; x=1773304200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ymdw+XC/6Jy9fN+NX35+E/o8bLZmtxZBZ4e3pQeTxE=;
        b=UgSafggKeRVmya2ln8tQeEklg4IHx2VHyCGrIiTrWGxulew2is6zDBOyuFrHo2Iotl
         yruntpFEDdcsthUfUtziSe7eMRPj99psPRN0jU82aRT2rRU3nyD5gu13kq5mmj9DsSdM
         gMXvMEQ/J5FTKIzWbY28rNXV5U5NblfnkcR5+umlkixBzRN5sNQT/qVgVHaeHA+TbuoW
         3GcmRw9RL43dc7ZhBFO2U9BHzEwKxt2RxQY7kbao+53yZ/ZdjY6UBmXNw+411+k/Wzqt
         yBTc93VpxrC5JAUZ2BXfXkuo6h2X0rYLsRmvEGAYrCB5gPIFgWcNjfd8CVIeaZB1Ej1X
         2DLw==
X-Forwarded-Encrypted: i=1; AJvYcCXCq3Gb12LaSFMWnAfpEpchi2cJekM/6jvaCmQGN2AdqY2EbMxp9BOy/2fEa2gtmfR5LL40bFH8xA9rsoY1uYbTGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR2EBXl4WQmX80BOrFtoWBgLlSV5ThgqFYjnhnm2nCW9wmXaHa
	4gnatH4ufqpli/xwXITzaFdp7M7gQ1OXATP1JQDhLIPXrwZimtKrayZNuIrB/4VF
X-Gm-Gg: ATEYQzwQ2ma0cQJDkaCa6bDdIsFxTa/mO5U/pY5z6hc1jpywVo/SYc1lIvU7uej9Cm3
	+r4PYpu5838EZmWVMP2juuwwfAL1BP3jeSfIbr4/ha4wDXJOyISU4UtnNPejfUYMqtxbUblyeTC
	C5DOBu1GMnMPX3P4t5UhM1eIZd+wKwVkloYFFgZJHbsYoEguBdcAo8ht9VAeTx8CwqjuOaLK46R
	smXyU/otYltFoOeOc7oViuIQ/+vQO2InERWwz5V6+wPYcgOyNC1aNr5b4oSr/sNJgeaLLTiqt8O
	eJi4fE8Pfntfl2l8FJ1daOQltp2DZ/UArWRa2ukCXWsl2UchekZDMV2q42oulIFoqzWzPyT/zPf
	e7I4VVU8ARczPFsy91raRCrJQNF2Np0RkwFVetPiNSoMVe6QqvGwsW0z9m2FUquydgqfXkEraZL
	aA7hsru3nnX4Y2qz2dhTq61duMoKfiSO7srJl8v0+pKGW1J5jUghosT3eDHe8x
X-Received: by 2002:a05:6122:3c47:b0:56a:8e00:5df9 with SMTP id 71dfb90a1353d-56ae75e7911mr2353931e0c.5.1772699400241;
        Thu, 05 Mar 2026 00:30:00 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df6577693sm20403505241.9.2026.03.05.00.29.59
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:29:59 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94ac5cb71feso2227711241.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 00:29:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWiHA+jnjyE/X6s8tVJTrk2NfmIRTLCdchTc5Psy886NGxdPgYot40ffEWCjQ5lvdC1pt4UC3KTM/PsMwv2OVKdqg==@vger.kernel.org
X-Received: by 2002:a05:6102:2ac9:b0:5f7:24dc:3ac3 with SMTP id
 ada2fe7eead31-5ffaaa86250mr1899404137.7.1772699399463; Thu, 05 Mar 2026
 00:29:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:29:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUBhpnFEnnTfyPdECWqNmKLweupX=FY2SedYA3bapG2g@mail.gmail.com>
X-Gm-Features: AaiRm53mHozL13yvxji6rv0MKzaGvWxuhr7SWHD2SjBJ0VWNhqppZZeXezGpDhg
Message-ID: <CAMuHMdXUBhpnFEnnTfyPdECWqNmKLweupX=FY2SedYA3bapG2g@mail.gmail.com>
Subject: Re: [PATCH phy-next 17/22] net: renesas: rswitch: include PHY
 provider header
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Michael Dege <michael.dege@renesas.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> As a PHY consumer driver, the Renesas rswitch dereferences internal
> fields of struct phy, something which shouldn't be done, as that is
> going to be made an opaque pointer.
>
> It is quite clearly visible that the driver is tightly coupled with the
> drivers/phy/renesas/r8a779f0-ether-serdes.c, which puts heavy pressure
> on the Generic PHY subsystem.
>
> This was discussed before here:
> https://lore.kernel.org/linux-phy/20260211194541.cdmibrpfn6ej6e74@skbuf/
>
> but to summarize, it is generally expected that when a Generic PHY
> function is called, it takes effect immediately. When this doesn't
> happen, the PHY provider driver must change its implementation rather
> than the consumer be made to work around it. PHY providers which rely on
> a hardcoded call sequence in the consumer are just lazy and wrong.
>
> The most obvious example is commit 5cb630925b49 ("net: renesas: rswitch:
> Add phy_power_{on,off}() calling"). Problem description:
> - Ethernet PHYs may change phydev->interface. When this happens, the
>   SerDes must learn of the new phydev->interface using phy_set_mode_ext().
> - drivers/phy/renesas/r8a779f0-ether-serdes.c implements phy_set_mode_ext(),
>   but this only caches the mode and submode into channel->phy_interface
>   and applies this to hardware during phy_power_on().
>
> The commit author decided to work around this at the consumer site, by
> power cycling the PHY for the configuration to take effect.
>
> This had a worse implication from an API perspective in subsequent
> commit 053f13f67be6 ("rswitch: Fix imbalance phy_power_off() calling").
> It was observed that phy_power_on() and phy_power_off() calls need to be
> balanced, and so, the consumer decided to start looking at the struct
> phy :: power_count (the technical reason why I'm making this change).
>
> This is also wrong from an API perspective because
> - a consumer should only care about its own vote on the PHY power state.
>   If this is a multi-port submode like QSGMII, a single phy_power_off()
>   call will not actually turn the PHY off (nor should it).
> - the power_count is written under the &phy->mutex, but read unlocked
>   here.
>
> The rswitch and r8a779f0-ether-serdes drivers both need to be completely
> rethought in terms of Generic PHY API call sequence. There is no quick
> fix to apply. Just include the PHY provider API along with the consumer
> one, to keep working as before when struct phy will be made an opaque
> pointer to normal PHY consumers. But this is a bad offender (and it's
> not even a provider) so add a FIXME.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
