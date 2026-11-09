Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794201788;
	b=3PIfhWgyRvxOXpYHIJmgetvXwhZEpQoLVOIl/mMm3FnnV3UjQQb09t7XqZuB/8Bc3CFe
	 rAgERQhE6jfLOr4RSuSMkGxxPkh1DXZL0QhbxY7ud1PbG/JKkNrQyHieosA+pdsGZx7VK
	 Eo3sS1Y5o12VBbwMYC+J+lc3q8oluLJXzIIxqvUWkGBb/fD01cQBPqV33gTzMA00bBxTF
	 YfejXM27IWc0qMmfCvbmAA5E7p7OvyoDiMOmTbW1bvyRgl0UbHLe49jOrebyeMkhZ05MY
	 MAzmvxJHA5B0ps59cdwVGmnbJ48H8axTix58hZ+NBa/4jwlqG6bGW+x0+xqiaXeUoXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WIf0dJI3704E56UOzqLD2NIWJwb6NLuXPSl2wIJw8fs=;
	b=QOD+rBPL+iifOPkWywjoPiIKqmS8M26bi9kleDfs+3103dxT5Gp6vRzXzJJ9mO8wviHv
	 9JKFkn+Bq8/FxA4DjVhh5sZhjEuYsiKGubT6Gv6FtQJHR+N2yh31gTFa9k9vOHrQhernG
	 3mKfuf8zG6pBQJ9VMwcJ2TxtJWooYvuPUuyHZar+kFrpPM9xkuSCUYABUu+TWbHdcunsO
	 oN1LCei5uikLvKY/BK1svKlK90SO/jwbwvcpsFi6CI5CLiKRVLVZnYX6Ad3P18tO+v9B3
	 wyALzjSxNrdugUA+Qvs914vbplW+3UPeMKp0QFe/KkqzTN2WXjyVfzbTqT7JaPLVEoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=beAqg+sY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3A0606A322
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2026 05:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A3A0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=beAqg+sY
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c43373ae89aso64737166b.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Nov 2026 21:23:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794201787; cv=none;
        d=google.com; s=arc-20260327;
        b=S+nQuSN/bUVdikW4dGrVKMPadpxM2BGFuO2QoTwCedOVO3A24zJpehzKt4mpAeIucG
         HshbAUOnm8EKmdj/aLE/ekiZVdsEdmTme4s/3XH52xaznCD2n8Ppdd9FY/sjhtGh8feC
         0eBD99hudxmECweaNFvnJqh7ftfu92unnLrOvXnZIKhoy1962h1WRiF0yJeskBf+2vyM
         Fnsyq2c8zaPlOn2eVD9Y/5t/yLfps+sx3gwzHoE05yQNcMm7iC3aQuZ+MlRBq9atp82v
         8YR46Mu9DcwF+VUCI6CuX9usMPIq3YOCHp/nW34OGyLEmhiS4Xxd346PHEcwQNyMdlfe
         lR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WIf0dJI3704E56UOzqLD2NIWJwb6NLuXPSl2wIJw8fs=;
        fh=UjZ4y71cgp91s48DBfo9Eky+B/MRNeoX0ZtGSnZeDwM=;
        b=A53P7SrL0kkksO4VsHn7gWEwS00ohi72X5doYCzq3lIuq/ew6dBxXV82cuahdQauzu
         QkZDyMCSc4x+DBGnhLrf+Wg/sXbs5cGRpDY22flJFF48NLe0BlJA0UV4uXPbEYTHRPiz
         nEDzH3b7OxzrahfJmBph9exB8bHk9TMkV2nkRtPZaGL+2YkpefipCh+uTqj0Ex7qhSpa
         ip6oBIi0F5IDHuXXsgoQLkTRHYQhCQjSQgaPn3OQrEfUxKgeZMcQfbXdYF/NORmYzwkq
         9hfQ5iaKufjm0pXnfbzr8d1NO5Okz0GjA0pMJrdcmPVfcLNo9tKNDEF9EdOXI9MN261z
         8vDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201787; x=1794806587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WIf0dJI3704E56UOzqLD2NIWJwb6NLuXPSl2wIJw8fs=;
        b=beAqg+sYyt9qCgMR0MefwQJHBP6F3SNo43T/wNyMBSEtHybyQhjG5gUFzzxSyuxY9t
         lOP9HNFhByeoXGWnyFtmQtJGoKbvYv27Fc+IImspICCuxHoOxsqFgtvzTrLVv0a2kRxt
         gcafF1RMy0rM41sE5/qBa9epTQEYsDyWEk0iM43/fVSDGODhDxrWHItr3W4F1Gt5rXE5
         w36K0YBsoNnk3P+PgGkS29t5KyBzL1BIZd+eKDGeAflsDuiFMizH/mtF4JHpYVKZnSR0
         jd31xfSekQQmsH2hD1qXZXAiVeBQ1SVw5ZrDj4yTcoZ80x5UJ5GoUpcX1d95e/8AoaFU
         TwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201787; x=1794806587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIf0dJI3704E56UOzqLD2NIWJwb6NLuXPSl2wIJw8fs=;
        b=e/N+bW5dyIOaDrpDa2lEr/p5lfh8I9S1nAcYPTnB0dxsjJLBLsEG363dHjiRkIqIcp
         DEXY24FVQUZ8QRWyBT4wv6JRd5vyQ6q8ge1CMOGqc3VQxeCTujiiNHeJlhcMJFd7QBTg
         pJ4VmJYeQJUgHOkCVkxT1NVdJnxA8Tn0Dx2fHBpiTrsw8eVimWZknSmfw+5ilANbb+z+
         zQOmtHR8gtrkjBpNW6Tsn/RyF41lX3aRvCawZ1a+bhG8M+CIRhWVziqSZlBC84KvbHab
         LmvQd5jFqnX8HHwjA+xMtS0R1JX1kUeSfw3u7X6S1jV88ErGeHrSPsoAuDujNZ59r1Ec
         kwiQ==
X-Forwarded-Encrypted: i=1; AL+hErFKnt2FsXMi8kZDt+HjP1wpgpU0RVSzu0ygv2UXxD/v46eoa5VTTSEmslTTbIGIAMxSXO3LgLWXqhL57tfEymagvg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+VWSmkvX44yfpYLTVYHjp5kJN+VQFHSt6Rp0quD8TFsy0T+hdq
	9qKUnR1gmFlbOAPR1kYg75zHQMRqi5mP7TDS4O7x6cba+RttgFuhBuPIipdTuabf/Y26prgXEE4
	Q5rhMiuqafyeYh3obQci1Di0yJ9QSVBs=
X-Gm-Gg: AYBFou0wV0DNXU+YJQdP8WYE4yadAXiHLUEy50azGTi/eb7wBqwLlgVf4imd+GXhDKY
	0coz3CsHnRwogMg9ZawIIP5+/GKvrUA0w+rswAL6wv+90Mh0ka5p9A2ATYXNyp9lpsIxTbA4cNH
	GZkPphCi5B4+NzqFdMmB+KR9ikwWzbhfulaekhuit8bNUxinOeaNayHThhs/N7S4/B7APug4W+D
	V0GU9+2VOqI7ywZi1XNgRSpx3cFia8hcFf8SyZ2jigERFGP9Yuv5EoweipO9TobiOXs0egh5s06
	wYlj73Lskg2ebdjb+ThEHg9o02N51Bk4bj0VohHpvso2di4bvpofmskG0xyHLWl0MBkBdxSlHyc
	Sm1hbj0BfaWE0/IdDpaU21gv182zejm+dK2OQ1JCsiFc8uD6gr6llQoGPhgF4YWMzyRZi
X-Received: by 2002:a17:906:99c4:b0:c40:80eb:c541 with SMTP id
 a640c23a62f3a-c4d6d162393mr200408166b.2.1794201786662; Sun, 08 Nov 2026
 21:23:06 -0800 (PST)
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
 <20261027-drm-misc-next-manta-auxbus-v1-2-3a45c3cf531d@a-marquet.fr>
In-Reply-To: <20261027-drm-misc-next-manta-auxbus-v1-2-3a45c3cf531d@a-marquet.fr>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 14:22:29 +0900
X-Gm-Features: AclHuK81atJWOGvLDgXq9hG63fw54it5ISsaMjIoBGuiYyjTASlvmDvAtFTGEpY
Message-ID: <CAAQKjZNBb4CnhBn-TSD=8zbrOtWbu7fdpJDjOOvfAZQmAhNcYw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/exynos: exynos_dp: change poweron/off to encoder enable/disable
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

2026=EB=85=84 10=EC=9B=94 27=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:09, =
Alexandre Marquet via B4 Relay
<devnull+tb.a-marquet.fr@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> Current functions exynos_dp_poweron()/exynos_dp_poweroff(), that
> supposedly powers on/off the device, actually only enable the encoder
> clock. This cause issues where poweron() calls fail silently in
> analogix_dp_probe(), leading in some cases to a state were the encoder
> is never enabled but the rest of the driver assumes that it is.

Moving the FIMD DP output clock control to the encoder callbacks makes
sense. Analogix runtime resume can occur for AUX access before
encoder->crtc is assigned, so its power_on callback is not a reliable
place to enable the display pipeline clock. The DRM atomic helpers
call encoder enable before enabling the bridge, and encoder disable
after disabling the bridge. That ordering keeps the clock on while the
display link needs it.
The change looks good to me.

Thanks,
Inki Dae

>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 40 +++++++++++++-------------------=
------
>  1 file changed, 13 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/=
exynos_dp.c
> index 82c238829921..16b00aacd55b 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -43,39 +43,27 @@ struct exynos_dp_device {
>         struct analogix_dp_plat_data plat_data;
>  };
>
> -static int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *pla=
t_data,
> -                               bool enable)
> -{
> -       struct exynos_dp_device *dp =3D to_dp(plat_data);
> -       struct drm_encoder *encoder =3D &dp->encoder;
> -
> -       if (!encoder->crtc)
> -               return -EPERM;
> -
> -       exynos_drm_pipe_clk_enable(to_exynos_crtc(encoder->crtc), enable)=
;
> -
> -       return 0;
> -}
> -
> -static int exynos_dp_poweron(struct analogix_dp_plat_data *plat_data)
> +static void exynos_dp_mode_set(struct drm_encoder *encoder,
> +                              struct drm_display_mode *mode,
> +                              struct drm_display_mode *adjusted_mode)
>  {
> -       return exynos_dp_crtc_clock_enable(plat_data, true);
>  }
>
> -static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
> +static void exynos_dp_crtc_clock_enable(struct drm_encoder *encoder,
> +                                       bool enable)
>  {
> -       return exynos_dp_crtc_clock_enable(plat_data, false);
> +       if (encoder->crtc)
> +               exynos_drm_pipe_clk_enable(to_exynos_crtc(encoder->crtc),=
 enable);
>  }
>
> -static void exynos_dp_mode_set(struct drm_encoder *encoder,
> -                              struct drm_display_mode *mode,
> -                              struct drm_display_mode *adjusted_mode)
> +static void exynos_dp_enable(struct drm_encoder *encoder)
>  {
> +       exynos_dp_crtc_clock_enable(encoder, true);
>  }
>
> -static void exynos_dp_nop(struct drm_encoder *encoder)
> +static void exynos_dp_disable(struct drm_encoder *encoder)
>  {
> -       /* do nothing */
> +       exynos_dp_crtc_clock_enable(encoder, false);
>  }
>
>  static const struct drm_encoder_funcs exynos_dp_encoder_funcs =3D {
> @@ -84,8 +72,8 @@ static const struct drm_encoder_funcs exynos_dp_encoder=
_funcs =3D {
>
>  static const struct drm_encoder_helper_funcs exynos_dp_encoder_helper_fu=
ncs =3D {
>         .mode_set =3D exynos_dp_mode_set,
> -       .enable =3D exynos_dp_nop,
> -       .disable =3D exynos_dp_nop,
> +       .enable =3D exynos_dp_enable,
> +       .disable =3D exynos_dp_disable,
>  };
>
>  static int exynos_dp_bind(struct device *dev, struct device *master, voi=
d *data)
> @@ -171,8 +159,6 @@ static int exynos_dp_probe(struct platform_device *pd=
ev)
>
>         /* The remote port can be either a panel or a bridge */
>         dp->plat_data.dev_type =3D EXYNOS_DP;
> -       dp->plat_data.power_on =3D exynos_dp_poweron;
> -       dp->plat_data.power_off =3D exynos_dp_poweroff;
>         dp->plat_data.ops =3D &exynos_dp_ops;
>
>         dp->adp =3D analogix_dp_probe(dev, &dp->plat_data);
>
> --
> 2.43.0
>
>
>
