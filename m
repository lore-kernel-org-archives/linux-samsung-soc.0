Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794201365;
	b=UkyREA41lhioB/Nn1zDvlVgdXgUZl9JUBiGgyx+k4mQwQ7aG3PlmsEstbZ9j/w1DWCwh
	 IGeiVOyNCIJpzqGkl4Hz4nz4ER7IRFFMzOmp7i9wuFxNICFROXnhqy38HnAT/sqjpu/7g
	 LKnkhhIPGf6PHSk+jVpjz3dfZ1vr09CS4hwIPaYQYhNWGLjzRe7tyg5XMtrcEz+WOnzv7
	 QwMl7zzKF43F7mrql+LA44nCUe3MoP0KgTGGmWj6hQMeYvxGZMI65Al8eTsSZ6LJNue0Q
	 IgjIHIegyJmy2p2mO92cLaFmyLCVE/PGG5Cb8pIrPgGQqgNX6rOSuljeflk1LKpPUKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+H+W40F3xi/JoWhY4dp3q7kYo1VTM28uEFHWyVVy0qE=;
	b=eoW/uSdJIqyLcxwf8jGjkwM7UKV0qLDZwBq0Q9vvg8lrcth9/WGZhegUAt4oYey463YR
	 7BVZm3Q1VRE/04vIS5kHl3Dnp2Cj2gSD+og+5ljpZiPoXwHIcNrGMRNsNp1vXPsQRNXp2
	 7qunSqF8ZrDsivtVEZdS9c0wllTlXpN+gZxfXRKdxD4Qqr6WlqyZgxRPHtlmku5w9LRUw
	 A332XRYVYtgjsjnpicDFh0EiEqd+drQGtydOsf7vExe5DscPRtzMid0IWl1lk2QwGD71Z
	 SAezuD/V+y4Vr2YB8DNMT/JT5jXMPx/fDD0RJ7Nrl6Gh08j6xtLcjdkiccDFns58oQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mIMuVG2Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B6C606A31C
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2026 05:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56B6C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mIMuVG2Y
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso83024666b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Nov 2026 21:16:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794201363; cv=none;
        d=google.com; s=arc-20260327;
        b=hlQlrM5ivDPIt6yI3VlDBacJ/Gk2gdFjlCoEiKY9IaHh1ZmMjbo/py//EhFZ699JXp
         avAUWNYgSX3A07u3qq0p99czzX3ArxmlCjMcVJxunrFLxnfFLf98f4nsMjkTaoSOb8p8
         JQBRp8zH7xK9FR4g4PHDJmJCzNE8PZybFw4Gips2lYQF6vg0zE+H3C3Rt3MnHAIw+c0H
         mgr6eWnpqw8GMPkJGsgjGOOTBWoxNtwu9XzDw66TYvxIysDVaSQYnqqwqyHQh93mmOBi
         fMM2KFc/4IvjGFaFV7j5j3wK52f/uU+cPB6dfbP8btCxsx3Ov6PliF7lPnD8lc+zuzKL
         XsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+H+W40F3xi/JoWhY4dp3q7kYo1VTM28uEFHWyVVy0qE=;
        fh=I0e2LmRb0lc9tp1DrycSJp+HeSdlUEWEMPuTsCgx7CQ=;
        b=MtRu2ewj/FaPu2lq/WL4+w5Ep0VC8nmgIDwSaBQuUXxZqVuhCFuXQITXvrYqeJ/WA1
         z811gqs8eGt5Jxj6EPjUsegDJD2pvTq+bq6OmjOO15kU9WICLZ3duyHWLKUdrvY07Zec
         RtydrnWorwPwYqm2bbHfY+gDyGCWVEWWzkC/sEGYYcVLxr7eV6/7lgXWfe4JBw5AsuRu
         hzwOPMebfZLFif8jH7xC1bK4UUelfSQb3rgOPgx6NBBGfOkDlUXqy4Up1+Xi6aaDcQz2
         jeK37nBok7nnI0oQTSueRLHHCV8a0O20fv7Pe5Q0o7CJoSvvTRch+S69q+yIZkuibS6S
         P31g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201363; x=1794806163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+H+W40F3xi/JoWhY4dp3q7kYo1VTM28uEFHWyVVy0qE=;
        b=mIMuVG2YwmZ8iUvr/GAIe5SAepM+Yl9wDfEGskmrElhinADuN7UP0oU+4Yj2h8z1VT
         Ulw/3Jn7tgkuJfrqvOOXhH+0MAcezdrJ6ToJSkMlJ8rZzYQOVXOQ5XiyfEOacOsRWExE
         ms6hxIopqYLt4ynVaYn9JkElOJZId5lwmWGv99wWWkroM0LacH9zz4dMlgQxUQQA7FEB
         p0TfzbkYd3qcH18l9PDZ5jxJMwKMPrGrxQmM0/bzQZuHf/6vnAO3Tnz+LhZO2F4V1jbJ
         ICRhftdon/DBDjwcbaDCQPSYGbwyY1yORYGWZYxGW+EVna+CAkmICKoMN1MQ9+Rz7zcW
         oqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201363; x=1794806163;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+H+W40F3xi/JoWhY4dp3q7kYo1VTM28uEFHWyVVy0qE=;
        b=Cn/L+X2V0N+CBUcank2hYfGpZ16KbAUk7ieoWaLNVMSy4j0IwN/A0RLyiLuDQ4Wass
         p0NRqXYQ/4chTo99ZA0BGfj2c8WGH1agRLWl5bDSVGEOTSvOB6YS5isc4ed9/9gXen1f
         kYRNFCPkMFAGKNDK8cmMIwKc20BEiFfZWfKSRGgcRn2RMzWQTMaFfeL/LPxt2odejmOA
         hr5hEmIeM6iO1k6Vaz2Dj/qw3XSbA54NpN7dnkuOXn+9IWGqC0iIXRsrc1E4umFUBg/u
         D0Mvalqy3Leror8ttPjGH0KlaHBgP3sJU4iBgPbS7b+hSRfn/EInAcKQZLwwB6z4hdVF
         ZbmA==
X-Forwarded-Encrypted: i=1; AL+hErHZ0llK7NFbOVY27Bnf5mYCx68DPeFSO4FjiFhAtEy3CkTNGtFkzNCAmX5s0buM28xVtJaSUm0hRlC9JrfA4PTxew==@vger.kernel.org
X-Gm-Message-State: APuU4Z8oNzHSu7axN8Mcl52F4reLwehMXyJoa/VDFs/kZmBxlgrjlT3O
	P5WNqdZUG7mtNzw3VkjRpH+B+dhFx770Tna4ELLljVLdTUkShL3ifipRHP4d2mjBdmkgUhTgvn0
	6cTBOO6V2AewBwJn1msnn0qNJtTXM+DY=
X-Gm-Gg: AYBFou1hj4FXg5gqNKnW4Nzp8hl6tIPMBmKDUMwrEYnuo93ZVjIdQO81QJlaJH5ddF7
	bJC4lh9CmVb5RuOfcBpvqVkdnS5/4Hn8ANXJqvnbVUnAibNeBQjJTEcSlxcLoOCyoQG8BmNcVGP
	KVrERI6ay2GB8T4LL86oP8TODopLbZcx52P89bGVoLGKEr8rBaH2QV0xXJgw7td7nInEB0Ym8XW
	sOumOwZ2TdzzDB277JlflkppAUC7wf7COHGZehoPWSN77jxBQiY6bF2i3+ph8r07RZCS1UOSVIV
	T3gP5tDSWEqne7Ycv7VHj2KC5h4X5aQxDvanrqXPz//wF31Ut/AffV8WdLcywiCnfT4TB7Xg5Le
	ZXBHIMbwX36ouvM4LBiiOjVw6tugY58m2nj1PImH9LczUULqOzRq6bvZGYdnBaelrOJM=
X-Received: by 2002:a17:907:94cc:b0:c48:a838:c17e with SMTP id
 a640c23a62f3a-c4d5278459amr332595566b.14.1794201363497; Sun, 08 Nov 2026
 21:16:03 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
 <20261027-drm-misc-next-manta-auxbus-v1-1-3a45c3cf531d@a-marquet.fr>
In-Reply-To: <20261027-drm-misc-next-manta-auxbus-v1-1-3a45c3cf531d@a-marquet.fr>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 14:15:25 +0900
X-Gm-Features: AclHuK-Znic_YSiZSxmlzXLOPryrS4zIPNf3mp5uhFcTlxhpKBhiJT7EHmt8c3E
Message-ID: <CAAQKjZPYAn98+8Wtjesr7GCh1s_pX8mWizW=HoY5Pj9xO9St=Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: analogix_dp: deassert DP_PHY_PD on
 power-on for exynos
To: tb@a-marquet.fr
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Douglas Anderson <dianders@chromium.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Lukas Timmermann <linux@timmermann.space>, Henrik Grimler <henrik@grimler.se>, 
	Hendrik Noack <hendrik-noack@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2026=EB=85=84 10=EC=9B=94 27=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:17, =
Alexandre Marquet via B4 Relay
<devnull+tb.a-marquet.fr@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> On exynos platforms at least, calling
> analogix_dp_set_analog_power_down() to power on (with enable=3Dfalse) CH0
> to CH3 or the AUX bus currently produces no effect, unless the function
> is first called to power on everything (by setting block to POWER_ALL or
> ANALOG_TOTAL). The reason for this is that DP_PHY_PD being asserted
> (which is its default state) renders every other register bit
> ineffective.
>
> This is particularly an issue for AUX bus initialization, that tends to
> happen before anything else (e.g., to request EDID), and thus, before
> anything has any chance to request a power on of the whole analog
> section of the chip.
>
> This commit allows analogix_dp_set_analog_power_down() to power on any
> block, by deasserting DP_PHY_PD if needed.
>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 19 +++++++++++++----=
--
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> index c1344a3f013a..9f634d4e4793 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -256,6 +256,19 @@ void analogix_dp_set_analog_power_down(struct analog=
ix_dp_device *dp,
>         if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_t=
ype))
>                 phy_pd_addr =3D ANALOGIX_DP_PD;
>
> +       reg =3D readl(dp->reg_base + phy_pd_addr);
> +
> +       if (dp->plat_data && (dp->plat_data->dev_type =3D=3D EXYNOS_DP)) =
{
> +               /* On exynos, register AUX_PD and CH[0-3]_PD have no effe=
ct if
> +                * DP_PHY_PD is asserted. So, when powering any of them u=
p, we
> +                * need to deassert DP_PHY_PD first.
> +                */
> +               if (!enable && (reg & DP_PHY_PD)) {
> +                       reg &=3D ~DP_PHY_PD;
> +                       reg |=3D AUX_PD | CH0_PD | CH1_PD | CH2_PD | CH3_=
PD;
> +               }

When DP_PHY_PD is set, this path clears it but leaves the bandgap
power-down bits unchanged. If the register retains 0xff from
POWER_ALL(true), an AUX_BLOCK, false call produces 0xcf; both
DP_INC_BG and DP_EXP_BG remain set. Could you check whether AUX can
operate in that state?
I suggest limiting the new handling to AUX_BLOCK and CH[0-3]_BLOCK.
When the bandgap bits are set, keep the other blocks powered down,
release DP_INC_BG, wait as the existing POWER_ALL(false) path does,
and then release the remaining required bits and the requested block.
This also avoids changing ANALOG_TOTAL, false, which currently only
clears DP_PHY_PD.

Thanks,
Inki Dae

> +       }
> +
>         switch (block) {
>         case AUX_BLOCK:
>                 if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_dat=
a->dev_type))
> @@ -263,7 +276,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 else
>                         mask =3D AUX_PD;
>
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>                 if (enable)
>                         reg |=3D mask;
>                 else
> @@ -272,7 +284,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 break;
>         case CH0_BLOCK:
>                 mask =3D CH0_PD;
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>
>                 if (enable)
>                         reg |=3D mask;
> @@ -282,7 +293,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 break;
>         case CH1_BLOCK:
>                 mask =3D CH1_PD;
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>
>                 if (enable)
>                         reg |=3D mask;
> @@ -292,7 +302,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 break;
>         case CH2_BLOCK:
>                 mask =3D CH2_PD;
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>
>                 if (enable)
>                         reg |=3D mask;
> @@ -302,7 +311,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 break;
>         case CH3_BLOCK:
>                 mask =3D CH3_PD;
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>
>                 if (enable)
>                         reg |=3D mask;
> @@ -321,7 +329,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 else
>                         mask =3D DP_PHY_PD;
>
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>                 if (enable)
>                         reg |=3D mask;
>                 else
>
> --
> 2.43.0
>
>
>
