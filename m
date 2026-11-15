Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.183.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794781242;
	b=pBRKYWr7F5QFlp+qvGj+/igYvrZRR7JGudVSEKqsr5k7cReBr1+HVklCpEmXPX67j79b
	 8DV4Zu7OecHMox+PCILbg8Z/V6aqpr8OHDmMnzogHM63ukv+6tCNOY5OlQU6wLz1CiBVm
	 FwD0I8KUd7qON3zR+f7ARUT4Hp19c6i19vjEFsww7fO0qNxUgsA1X0QE3OD5H1DA6StfB
	 F1j2aETzyipor44NdRPmOMnEzzpZN05YgGs8TjHgK8sYMKSVt37gh6NIkA6ySr+1XVImZ
	 kGS3CXD+4VK2LrHMD8mxX38/skkdXfi06Re2B1JmGvB58+1xl/8JsACIqHbKeYPYKcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781242;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-GND-Sasl:X-GND-State:
	 X-GND-Score:X-GND-Cause;
	bh=uVVWpXtmmKaz/e4u5ACa4C96jB5l+frR7pn7W/z1ssQ=;
	b=xpvsYXQu89bN1E/g5cDC9Txw7Dk1PgRho4MZNH+z3MTzf0jLeypjNloBzdKPJeJOwcHE
	 XKxb4kfNmfjyZ9aqs3zdmXmT4I5mayz0iwQTkYlXnYS73uDzj4bxOEtJf4RrGB0es+AIi
	 EGIuQXAuUdOLVeWKpZfoV2VSYadFSo0/qhM55kpuHABTPzuQtrDuO5Ap1PtfJIdB3ReYr
	 h2+GCUkodvG8Ep3e0QZJv9AESPRbDsWo25CMf3ntTFVFUpYT8nvS4ORf3AdZuVg9ncst8
	 VemIISRVM/zLVMquiIKLLB7bawxxR5tNYTId/9wJHuvFSCK1b4TqPbvPYsIgVDfgOzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=a-marquet.fr;
	spf=pass smtp.mailfrom=a-marquet.fr;
	dkim=pass header.d=a-marquet.fr header.i=@a-marquet.fr header.a=rsa-sha256 header.s=gm1 header.b=PCcS4G01;
	arc=none smtp.remote-ip=217.70.183.194
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB12606A31F;
	Sun, 15 Nov 2026 22:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DB12606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=a-marquet.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a-marquet.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=a-marquet.fr header.i=@a-marquet.fr header.a=rsa-sha256 header.s=gm1 header.b=PCcS4G01
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FEE1429A6;
	Sun, 15 Nov 2026 22:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a-marquet.fr;
	s=gm1; t=1794781233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uVVWpXtmmKaz/e4u5ACa4C96jB5l+frR7pn7W/z1ssQ=;
	b=PCcS4G01N/7oc+BSzISLMHLPlWllbCGKxopRR+PPW5K62whwu18llqJYWI3KZt+nvD8ZUV
	MG2w2BYr9WXXuHfLPZw7vPkTsf6Kg7P6FeUE1zBmT3k1bu8/C8sIPD83HgJYvatZZfEDH3
	mXrrmk6d+H9E+MxwGuBIa0W8BR7SCHwuJsG1NlxKn4K305MAQXmT2cFkOUfnHTBvlYV0ni
	AsbT9VgQWDYn6uS68+28Z9AEZ2Yrup+g+MdqlTrCv2BofwlpTknfXF4BWCS9WMOvHcNVUv
	AMnTiTUaBfQanm0ie0DUSDBTuneTa11fQpleRspM0dIoYuowRNNXWbkqoe8QjA==
Date: Sun, 15 Nov 2026 23:20:24 +0100
From: Alexandre Marquet <tb@a-marquet.fr>
To: Inki Dae <daeinki@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Lukas Timmermann <linux@timmermann.space>,
	Henrik Grimler <henrik@grimler.se>,
	Hendrik Noack <hendrik-noack@gmx.de>
Subject: Re: [PATCH 1/3] drm/bridge: analogix_dp: deassert DP_PHY_PD on
 power-on for exynos
Message-ID: <avowKMv2v5gCxkIT@laptop-218>
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
 <20261027-drm-misc-next-manta-auxbus-v1-1-3a45c3cf531d@a-marquet.fr>
 <CAAQKjZPYAn98+8Wtjesr7GCh1s_pX8mWizW=HoY5Pj9xO9St=Q@mail.gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAQKjZPYAn98+8Wtjesr7GCh1s_pX8mWizW=HoY5Pj9xO9St=Q@mail.gmail.com>
X-GND-Sasl: tb@a-marquet.fr
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTGffJcFJiJh/3cNGj1MflHHS8lHdWXQPN/F7+YeyQJd8apnbMT9uBaByhqhThT3SwSVwNViRvDZ1+RgV+72iZnsonfba4nb1Pso/LksWX/AIFh1o2tFyEBZwEwylvkV2m00Wuq4XMPZVOIfhtkT/XAriiWqu2LuJOgzHDkx4fVGchrJJN2SgPl5n5EFxfF1t2x5qAqZjPK3pZZyUahNEXQ43z0OD31N8LVKJj+uSBRrdEEuXtK2g8aN9YrTUMWWhxvvz4Mc+Ym/xs51O/ER2UlTWDHcRJthgSMGcG7v7jaRGhaCruc/1h10IIgErJSdU+lLK9X5GSvqi4m87VUsAOdNF+IivHZ7Qt6xuB9wDS1TVLJQyQPd6oYlZ4hkOFnTNcBksvPZD+DLyMJuVg3GrKtJ+BbXrJMDTSYKxoGOxZiXl5TVijW2F72/PvNMLyAi08fKM6ngyOu1btKB0josxYaFF5MxqR8uQgUj2wsxF/0wu2yjk4ty+aZJ2hZzYJzheVb9CvEfsA7kq5kM4c2ZN+h0ZdQuFkizyHgZH0edpsDbeqKdO8l+ZFw3auOHTa4fkgZ6pBCqSmk37k1P9SoORMvsJvxLm2hfUcnpR7eMEJ6iMX3qF0+0o4l1GZnbrIjXvOYvGJ9+mOfDUHmLYcyviwKmbyAjU0DLkmErHS2nvuuRxQ

Hi,

Thank you for this feedback.

Le Mon, Nov 09, 2026 at 02:15:25PM +0900, Inki Dae a écrit :
> Hi,
> 
> 2026년 10월 27일 (화) 오후 9:17, Alexandre Marquet via B4 Relay
> <devnull+tb.a-marquet.fr@kernel.org>님이 작성:
> >
> > From: Alexandre Marquet <tb@a-marquet.fr>
> >
> > On exynos platforms at least, calling
> > analogix_dp_set_analog_power_down() to power on (with enable=false) CH0
> > to CH3 or the AUX bus currently produces no effect, unless the function
> > is first called to power on everything (by setting block to POWER_ALL or
> > ANALOG_TOTAL). The reason for this is that DP_PHY_PD being asserted
> > (which is its default state) renders every other register bit
> > ineffective.
> >
> > This is particularly an issue for AUX bus initialization, that tends to
> > happen before anything else (e.g., to request EDID), and thus, before
> > anything has any chance to request a power on of the whole analog
> > section of the chip.
> >
> > This commit allows analogix_dp_set_analog_power_down() to power on any
> > block, by deasserting DP_PHY_PD if needed.
> >
> > Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> > ---
> >  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 19 +++++++++++++------
> >  1 file changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> > index c1344a3f013a..9f634d4e4793 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> > @@ -256,6 +256,19 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
> >         if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
> >                 phy_pd_addr = ANALOGIX_DP_PD;
> >
> > +       reg = readl(dp->reg_base + phy_pd_addr);
> > +
> > +       if (dp->plat_data && (dp->plat_data->dev_type == EXYNOS_DP)) {
> > +               /* On exynos, register AUX_PD and CH[0-3]_PD have no effect if
> > +                * DP_PHY_PD is asserted. So, when powering any of them up, we
> > +                * need to deassert DP_PHY_PD first.
> > +                */
> > +               if (!enable && (reg & DP_PHY_PD)) {
> > +                       reg &= ~DP_PHY_PD;
> > +                       reg |= AUX_PD | CH0_PD | CH1_PD | CH2_PD | CH3_PD;
> > +               }
> 
> When DP_PHY_PD is set, this path clears it but leaves the bandgap
> power-down bits unchanged. If the register retains 0xff from
> POWER_ALL(true), an AUX_BLOCK, false call produces 0xcf; both
> DP_INC_BG and DP_EXP_BG remain set. Could you check whether AUX can
> operate in that state?

It can. But what happens is that after calling POWER_ALL(true) (thus
setting the register to 0xff), when reading the register again, then I
get 0x7f.  Hence, after calling AUX_BLOCK(false), we get 0x4f and not
0xcf.  And although DP_INC_BG remains set as a result, AUX still works.
That being said, it sounds wrong not to deassert DP_INC_BG. This was
likely added to POWER_ALL for a reason... DP_EXP_BG, on the other hand,
does not seem to have any effect (and is not used anywhere, as far as I
can tell).

> I suggest limiting the new handling to AUX_BLOCK and CH[0-3]_BLOCK.
> When the bandgap bits are set, keep the other blocks powered down,
> release DP_INC_BG, wait as the existing POWER_ALL(false) path does,
> and then release the remaining required bits and the requested block.
> This also avoids changing ANALOG_TOTAL, false, which currently only
> clears DP_PHY_PD.

Right, in this case I'm leaning towards writing a small helper function
for AUX_BLOCK and CH[0-3]. Something like (not tested):

void analogix_dp_write_analog_power_down(struct analogix_dp_device *dp,
					 u32 phy_pd_addr,
					 u32 mask,
					 bool enable)
{
	u32 reg = readl(dp->reg_base + phy_pd_addr);

	if (enable)
		reg |= mask;
	else {
		if (reg & DP_INC_BG)) {
			reg |= AUX_PD | CH0_PD | CH1_PD | CH2_PD | CH3_PD;
			writel(reg, dp->reg_base + phy_pd_addr);
			usleep_range(10, 15);
			reg &= ~DP_INC_BG;
			writel(reg, dp->reg_base + phy_pd_addr);
			usleep_range(10, 15);
		}

		if (reg & DP_PHY_PD) {
			reg |= AUX_PD | CH0_PD | CH1_PD | CH2_PD | CH3_PD;
			reg &= ~DP_PHY_PD;
		}

		reg &= ~mask;
	}

	writel(reg, dp->reg_base + phy_pd_addr);
}

Also, since DP_INC_BG looks functionally equivalent to DP_PHY_PD on
rockchip, I'm tented to make the behaviour consistent accross exynos and
rockchip. But I have no rockchip board to test.

> 
> Thanks,
> Inki Dae
> 

Best regards,
Alex.

> > +       }
> > +
> >         switch (block) {
> >         case AUX_BLOCK:
> >                 if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
> > @@ -263,7 +276,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
> >                 else
> >                         mask = AUX_PD;
> >
> > -               reg = readl(dp->reg_base + phy_pd_addr);
> >                 if (enable)
> >                         reg |= mask;
> >                 else
> > @@ -272,7 +284,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
> >                 break;
> >         case CH0_BLOCK:
> >                 mask = CH0_PD;
> > -               reg = readl(dp->reg_base + phy_pd_addr);
> >
> >                 if (enable)
> >                         reg |= mask;
> > @@ -282,7 +293,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
> >                 break;
> >         case CH1_BLOCK:
> >                 mask = CH1_PD;
> > -               reg = readl(dp->reg_base + phy_pd_addr);
> >
> >                 if (enable)
> >                         reg |= mask;
> > @@ -292,7 +302,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
> >                 break;
> >         case CH2_BLOCK:
> >                 mask = CH2_PD;
> > -               reg = readl(dp->reg_base + phy_pd_addr);
> >
> >                 if (enable)
> >                         reg |= mask;
> > @@ -302,7 +311,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
> >                 break;
> >         case CH3_BLOCK:
> >                 mask = CH3_PD;
> > -               reg = readl(dp->reg_base + phy_pd_addr);
> >
> >                 if (enable)
> >                         reg |= mask;
> > @@ -321,7 +329,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
> >                 else
> >                         mask = DP_PHY_PD;
> >
> > -               reg = readl(dp->reg_base + phy_pd_addr);
> >                 if (enable)
> >                         reg |= mask;
> >                 else
> >
> > --
> > 2.43.0
> >
> >
> >
