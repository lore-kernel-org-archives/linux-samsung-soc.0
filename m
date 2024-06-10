Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FD47F7E3
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 11:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718020536; cv=none; b=VwPbasOacZAVEwGlIoIjvmE5i5SweluNTVzIiMJF2nKVx4GKMuaJM6X0ligjCMmxVPASoROuDzhgYYC2Lu+debn/mDcxE3Xw0PthffYe5WX9/oI6Z21FMHWwpbIIK0oKREjXA1xX1krRYU5UqhGYe+dV5JokYv4yOuD2atYCP90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718020536; c=relaxed/simple;
	bh=1+o9d4eXWG9ibf+XOpNmVkNDXzIFZKerkM3qn2ya4tY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjDEmxaqQoyzSkdUR2Ms88wX8KPf4/KCryHwzVe2resQXRjqQ3yTcipDEArUaegVa/4zOQ0UZOI1+PexshhaPj4dQ1EArqZBeGUL1U8D3PKhgJE9T35m2Kp7xZHaYnraAPvmPUd5EMitYcVFCpWL2deF03ZH0mIp+HxwREJYSmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NetCvCFl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NetCvCFl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78561C4AF1D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 11:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718020535;
	bh=1+o9d4eXWG9ibf+XOpNmVkNDXzIFZKerkM3qn2ya4tY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NetCvCFlIH1BF4fn1t8N7ADNSaH3CnozV0IlkaJpEeTj5Pux3HwcsPS/iq7rKM6+F
	 cmHx8xiz9MkLJeGTpJVI5xLnyPfnyN+O3F0j3SIj1+EA04Hc44FdH88xpY/8LyjhkS
	 T78ucW3ECW1cS5n7PoFmNnWp1e+lzqr11+6WfnmaKASpWna7uQbEAZIBvRi/k9ITBY
	 Zc/nTFMmIQbipsGgOHxx+CMvzaLJq73Lx6InlvYbkxLEMcsehIlBYYNt/bkwNweJ9c
	 T84uaBQaCwuaIj1ArJ8rvf7dcDa0wSlR53e6QoLH3FsVN3HDb7fDcWxU/dXFTQVd/C
	 BhTCEkjcU0zHA==
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dfaff6bee06so2275650276.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 04:55:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjbvZk+XANsMyujEGaKtP72WYyRvpMee+/zC1P0xO4t0EUpixT46Aw6qiKfjuG6BwmzPX0Ix8vvN5Zc+R2PFD4QElp7BX7rsuuq9h4YoliiXs=
X-Gm-Message-State: AOJu0Yz8y1y8sTkT927ol1T4EeeC75aTr1ybaV4WT+074YRLxhUssHEI
	o0UY4bwizaUEvOH4ilIxWZ2vKfsQnHhMctzXxUHep/lcNqhOD7pFizD9Jv++FdzuHUPYQfgayoM
	FnEazp+/IrxXH2AN8IAulC4hj8yFF5NXbGkRz2Q==
X-Google-Smtp-Source: AGHT+IEH4XNb0j9KfxS/eZPmrQBXzsoFSjz3KrwJiUBTmeGKjoK6j+ybKBuLbZ0olQxkLwF5R9Ha2ZCRUa/O/3Zh7kU=
X-Received: by 2002:a05:6902:2006:b0:dfa:5d84:716b with SMTP id
 3f1490d57ef6-dfaf65c5362mr9132674276.57.1718020534793; Mon, 10 Jun 2024
 04:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de> <20240503151129.3901815-13-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-13-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 10 Jun 2024 13:55:23 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4tdyBtDJQdEJmXd4yOfo+_0DCwQS_NhDSzOUshnFMYsQ@mail.gmail.com>
Message-ID: <CAN6tsi4tdyBtDJQdEJmXd4yOfo+_0DCwQS_NhDSzOUshnFMYsQ@mail.gmail.com>
Subject: Re: [PATCH 12/14] drm/bridge: analogix_dp: simplify and correct PLL
 lock checks
To: Lucas Stach <l.stach@pengutronix.de>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
	patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 5:12=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de>=
 wrote:
>
> Move the wait loop into its own function, so it doesn't need to be
> replicated in multiple locations. Also move the PLL lock checks between
> setting the link bandwidth, which may cause the PLL to unlock, and the
> MACRO_RST, which needs the PLL to be locked.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 34 +++++++------------
>  .../drm/bridge/analogix/analogix_dp_core.h    |  7 +---
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 12 +++----
>  3 files changed, 18 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 736b2ed745e1..7bbc3d8a85df 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -231,7 +231,7 @@ static int analogix_dp_training_pattern_dis(struct an=
alogix_dp_device *dp)
>  static int analogix_dp_link_start(struct analogix_dp_device *dp)
>  {
>         u8 buf[4];
> -       int lane, lane_count, pll_tries, retval;
> +       int lane, lane_count, retval;
>
>         lane_count =3D dp->link_train.lane_count;
>
> @@ -243,6 +243,11 @@ static int analogix_dp_link_start(struct analogix_dp=
_device *dp)
>
>         /* Set link rate and count as you want to establish*/
>         analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
> +       retval =3D analogix_dp_wait_pll_locked(dp);
> +       if (retval) {
> +               DRM_DEV_ERROR(dp->dev, "Wait for pll lock failed %d\n", r=
etval);
> +               return retval;
> +       }
>         /*
>          * MACRO_RST must be applied after the PLL_LOCK to avoid
>          * the DP inter pair skew issue for at least 10 us
> @@ -270,18 +275,6 @@ static int analogix_dp_link_start(struct analogix_dp=
_device *dp)
>                                         DP_TRAIN_PRE_EMPH_LEVEL_0;
>         analogix_dp_set_lane_link_training(dp);
>
> -       /* Wait for PLL lock */
> -       pll_tries =3D 0;
> -       while (analogix_dp_get_pll_lock_status(dp) =3D=3D PLL_UNLOCKED) {
> -               if (pll_tries =3D=3D DP_TIMEOUT_LOOP_COUNT) {
> -                       dev_err(dp->dev, "Wait for PLL lock timed out\n")=
;
> -                       return -ETIMEDOUT;
> -               }
> -
> -               pll_tries++;
> -               usleep_range(90, 120);
> -       }
> -
>         /* Set training pattern 1 */
>         analogix_dp_set_training_pattern(dp, TRAINING_PTN1);
>
> @@ -634,9 +627,14 @@ static int analogix_dp_fast_link_train(struct analog=
ix_dp_device *dp)
>  {
>         int ret;
>         u8 link_align, link_status[2];
> -       enum pll_status status;
>
>         analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
> +       ret =3D analogix_dp_wait_pll_locked(dp);
> +       if (ret) {
> +               DRM_DEV_ERROR(dp->dev, "Wait for pll lock failed %d\n", r=
et);
> +               return ret;
> +       }
> +
>         /*
>          * MACRO_RST must be applied after the PLL_LOCK to avoid
>          * the DP inter pair skew issue for at least 10 us
> @@ -645,14 +643,6 @@ static int analogix_dp_fast_link_train(struct analog=
ix_dp_device *dp)
>         analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
>         analogix_dp_set_lane_link_training(dp);
>
> -       ret =3D readx_poll_timeout(analogix_dp_get_pll_lock_status, dp, s=
tatus,
> -                                status !=3D PLL_UNLOCKED, 120,
> -                                120 * DP_TIMEOUT_LOOP_COUNT);
> -       if (ret) {
> -               DRM_DEV_ERROR(dp->dev, "Wait for pll lock failed %d\n", r=
et);
> -               return ret;
> -       }
> -
>         /* source Set training pattern 1 */
>         analogix_dp_set_training_pattern(dp, TRAINING_PTN1);
>         /* From DP spec, pattern must be on-screen for a minimum 500us */
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.h
> index 382b2f068ab9..774d11574b09 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> @@ -95,11 +95,6 @@ enum dynamic_range {
>         CEA
>  };
>
> -enum pll_status {
> -       PLL_UNLOCKED,
> -       PLL_LOCKED
> -};
> -
>  enum clock_recovery_m_value_type {
>         CALCULATED_M,
>         REGISTER_M
> @@ -191,7 +186,7 @@ void analogix_dp_swreset(struct analogix_dp_device *d=
p);
>  void analogix_dp_config_interrupt(struct analogix_dp_device *dp);
>  void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp);
>  void analogix_dp_unmute_hpd_interrupt(struct analogix_dp_device *dp);
> -enum pll_status analogix_dp_get_pll_lock_status(struct analogix_dp_devic=
e *dp);
> +int analogix_dp_wait_pll_locked(struct analogix_dp_device *dp);
>  void analogix_dp_set_pll_power_down(struct analogix_dp_device *dp, bool =
enable);
>  void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
>                                        enum analog_power_block block,
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> index e9c643a8b6fc..143a78b1d156 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -217,15 +217,13 @@ void analogix_dp_unmute_hpd_interrupt(struct analog=
ix_dp_device *dp)
>         writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
>  }
>
> -enum pll_status analogix_dp_get_pll_lock_status(struct analogix_dp_devic=
e *dp)
> +int analogix_dp_wait_pll_locked(struct analogix_dp_device *dp)
>  {
> -       u32 reg;
> +       u32 val;
>
> -       reg =3D readl(dp->reg_base + ANALOGIX_DP_DEBUG_CTL);
> -       if (reg & PLL_LOCK)
> -               return PLL_LOCKED;
> -       else
> -               return PLL_UNLOCKED;
> +       return readl_poll_timeout(dp->reg_base + ANALOGIX_DP_DEBUG_CTL, v=
al,
> +                                 val & PLL_LOCK, 120,
> +                                 120 * DP_TIMEOUT_LOOP_COUNT);
>  }
>
>  void analogix_dp_set_pll_power_down(struct analogix_dp_device *dp, bool =
enable)
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
