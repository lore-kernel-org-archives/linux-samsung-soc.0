Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8C93B7B68
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 13:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147217; cv=pass; b=sje/8vsZMHREiwYEWxh8V22Ji7oNxnScCL+DhwHnLrEtPMDsEwM3cITDLw4msC7wm6Qg522fyABjRRQxnQ390m4sRlM3+XBizucYV+lrzRFu8l5DQgEPdWPwnEon9b4OiPHRNBapNEM3mKyGNOVXQaBWM+LiNmqdAyGNJ/rlgKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147217; c=relaxed/simple;
	bh=7kaU1K4JN2nHoqShfQjPhwIYZu0ne7gMRI9iI645Wo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVKVTb6ZfxwBMieTPr18366ggmUcaEjMMjwsBGQJqWvJFX3VYc3alnK7h8B6xL/uYaA4L0VWxrCgQStuIZWVaCA0MciaBn6TaS2WUEOaPN6PocTs59cPPn36TXU/4Sf5OhdXVlNeiB9O7tLUpfg2gfujVvq0sCRH87rYrOQ7/vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHD6qpmY; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHD6qpmY"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c2cce930cso9883301cf.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 06:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787147212; cv=none;
        d=google.com; s=arc-20260327;
        b=GRJGNqLNgr2p3GUuIv61N0PzRjGVMsP1XK9d6hyNl68PJY7IUEzAGTEeKZXQmAvUN8
         EHRpN7bO9nSiF2wSK1q8FHoghWpBT4pIeMciP47P2Aa9I36cF/1VeQ9AsJPA9SEIE19/
         lLADwXn1DSiMvUQ4m/8me5s96To0YtZqSOvPIiQAnPnj4rtKTmnpaRlLeV8QfcQ2mKCT
         hjDX++uN5nI5vZ3wag4fPXqNP7YHwF6P2K0oE3u7gI6wUHKFUN3pPDwgV8BaaLyfPREb
         ANaECOeDIsyJ2WhBws0glI1wlW3TL+KtUneUKnOA8AmPkB6SztQ+2Joo/fvXHKfnzQha
         ay2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hU/Rrco2eHgoRkaqU/aKPgtdcd60SOy8SNUe3WgzR/E=;
        fh=k32QBm2OwOR3mEq7OoEalCM06foxRfbUmOn2pxNr2Kw=;
        b=b0pexoyt1Du7w9+xWt5RAg6EYEG15upWmRcGO7/t1xx1Q8bffCBOcG8bKS3AH5UXRf
         iwy8+PpudPuWe3qxNVQZhBvMCF2DKB5kqb6t8Yc1dZjFZpAkrq/nt0O6VDoq1DWeoQEc
         yCwsr6vrCn17ggsz8gzDgx4VeG9v0aY6I1/lj3nkLnDk7071NrLnr0WxifI9hW6KFGTu
         XvbXdfPebMEn02d45di9I3ZVjz6ETX0Jrpev6sQU/POon4b22hZKntEToRYDo11QxdFQ
         yyLCZhED7xxIs4efLl6jDOoVfrwr18TGdXAihwRVhlcDEHUqD8LesP1YFf/B1s2OeUHH
         7QLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787147212; x=1787752012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hU/Rrco2eHgoRkaqU/aKPgtdcd60SOy8SNUe3WgzR/E=;
        b=dHD6qpmYksM0DbONALVMvtCkCzrvkyMMIe3ERBcxQrd84UR/sqqwooHz4idKq9K28n
         vbckEfqpUyKKgk2y1dKYVhf/Ona8UMgjyndrlI7g/7lTqUGUuUgCqNyUH7AF7nhwC+P4
         qS0YFQjv+PNqrLdLmSWes3oKqp9fdM6p6zmgH348U5r+OPYI4UJoHVqO6sHaMDutsXxU
         I/F5uLymLDzgaA2jtgYnIC4a1tUhCmVNpaFXUHTb3WBE2PVbwE0k3dCU1jJD2K6J3cvs
         Qec0lZG+ZFv4ib+QSWPClm7UTDZ1lLM2/+9B4sOOWRnH5YkGlOQplTA+QRTImhN4rLVt
         ZZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787147212; x=1787752012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hU/Rrco2eHgoRkaqU/aKPgtdcd60SOy8SNUe3WgzR/E=;
        b=jUCjr+pf/gO4PGjmshhV0M39ywrZNJGdFQd3RvK1Fvl/ynqHFdysT5MEZw5PhhggT1
         WV4xbI72MJcohDknuVEhdg8qwAWIN/6xJaNI2LNDcYNYbSYpcJGujw2Fur07spjZccgZ
         IIR6+GevJsVYrZKtwbtAnmt6tbXDPnGBMigIfeYYQxb4svMpv6Eg+JY3xTAl89a2rNuH
         vktEbkQUe2edBs50GWQFuzqEwTIvcMj1hSmDys0VbyHqJ2oE3xv2CZ/rdShB6lnA8iy2
         bGw1RH+7cxzmTKnZANVONSlUoobDHm0wcFTn4p9av52Ov522JI+Lx3r228lSq5D2No0Q
         skVg==
X-Forwarded-Encrypted: i=1; AHgh+RpZ6Ammah4ixNMgMpWDtthFfkLkGbcMAs2QeS1KllbEYmkAyo2YnWJ986r5LIYec34PEsGUfKhIWkggFrczN4hqmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF1s0wnI6UN5G3c2uVArbj9sVTFDhLniAHltwp154q9iWId9vV
	qak3zdMdiUBLZqT8ZqWFeB5cU24QBKb4xdznvpwRDwYS/KYCOl3johjccjBWcaxVThViSl0rw9k
	sRFVdV/R/BcxliXqw9zfk5yDnE1rTWW0=
X-Gm-Gg: AR+sD10KoFSbJp8p1IU6Qn45rCUI7oX1KbtWnUVO39BwJB5N0LLVfgYCAbIHKlT4P81
	PAUEru+6VemQhaI3LcHGRRYbmK43Ivz/zPX1uNY2Yv/NTFdT4TgbSVnh2Zczhpr+e+0t08DxM/L
	5t7ewv2auUMA1t34+HmEkihdQoSOAR7bpnt5LkLaZYqay/u2GwVOjqvJRL4H65kDRxhbI6zNJcK
	kbC3trzUGS9kPADYs9XwTD1J2whcVZsors7sCYxSA33lOSY0FP+O/5g7Lo4hz5zvNgPfehrdjhr
	+Sdjige9ehda5kZ47TMP9jz2i4RUSouduC3sNTrySsESNlO8wveqE2Udm9l4Eg6geEMlA/aoPQU
	=
X-Received: by 2002:a05:620a:6087:b0:92e:7ef3:213f with SMTP id
 af79cd13be357-9371e6f639amr422130785a.23.1787147211854; Wed, 19 Aug 2026
 06:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809-exynos-dsim-fixes-v5-0-6e63dc6c238f@disroot.org> <20260809-exynos-dsim-fixes-v5-2-6e63dc6c238f@disroot.org>
In-Reply-To: <20260809-exynos-dsim-fixes-v5-2-6e63dc6c238f@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Wed, 19 Aug 2026 22:46:14 +0900
X-Gm-Features: AcwNN1V9uq5rpfpNmzqQRI66nhVgUZiP-vg3h3coBunhivKyzh_w9urOtKY6OKo
Message-ID: <CAAQKjZO1_FORfo5zx_Ywy=pX6qpbS0f9z1PboX4DbtHeFS1+MQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] drm/bridge: samsung-dsim: use DSIM interrupt to
 wait for PLL stability
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for update,

2026=EB=85=84 8=EC=9B=94 9=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 5:59, Ka=
ustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Stabilizing PLL needs to be waited for. This is done using a loop,
> checking the PLL_STABLE bit in the status register.
>
> DSIM fires an interrupt when the PLL is stabilized. Rely on this
> functionality for stabilization wait, getting rid of the implicit loop.

I like the direction - replacing the busy loop with the interrupt the
hardware already provides is clearly the right thing to do. Below are
my comments.

>
> To utilize this, explicitly unmask PLL_STABLE and SW_RST_RELEASE right
> after reset, and wait for reset before setting up clock.
>
> This has been tested on a Galaxy J6 (Exynos 7870). Unfortunately, since
> testing on all supported devices is less feasible, introduce a stop-gap
> measure where the timeout has a gracious lower bound of 100
> microseconds. This will (hopefully) prevent regressions due to timeout
> on other devices.
>
> Suggested-by: Inki Dae <inki.dae@samsung.com>
> Link: https://lore.kernel.org/r/CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy9=
NFDu13VU5w@mail.gmail.com
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 49 +++++++++++++++++++++++++----=
------
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 37 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index fc42acc6b9ef..9f58c7b1be53 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -17,6 +17,7 @@
>  #include <linux/export.h>
>  #include <linux/irq.h>
>  #include <linux/media-bus-format.h>
> +#include <linux/minmax.h>
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> @@ -722,9 +723,14 @@ static void samsung_dsim_wait_for_reset(struct samsu=
ng_dsim *dsi)
>  static void samsung_dsim_reset(struct samsung_dsim *dsi)
>  {
>         u32 reset_val =3D dsi->driver_data->reg_values[RESET_TYPE];
> +       u32 status;
>
>         reinit_completion(&dsi->completed);
>         samsung_dsim_write(dsi, DSIM_SWRST_REG, reset_val);
> +
> +       status =3D samsung_dsim_read(dsi, DSIM_INTMSK_REG);
> +       status &=3D ~(DSIM_INT_PLL_STABLE | DSIM_INT_SW_RST_RELEASE);
> +       samsung_dsim_write(dsi, DSIM_INTMSK_REG, status);

What does this hunk actually buy us? Two concerns:

First, it is racy. You trigger the software reset and then immediately
read-modify-write DSIM_INTMSK. If the reset is still in flight, the
hardware may restore the register defaults and drop this write.

Second, it looks like a no-op. The fact that SW_RST_RELEASE is
delivered today - without any driver code unmasking it - implies that
DSIM_INTMSK reads back as all-unmasked after reset. If that is true,
clearing those two bits changes nothing.

The change that actually matters is adding DSIM_INT_PLL_STABLE to the
mask written from the SW_RST_RELEASE handler, which you do further
down. Unless there is a case I am missing, please drop this hunk. If
it is needed, please add a comment explaining why.

>  }
>
>  static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
> @@ -787,8 +793,7 @@ static unsigned long samsung_dsim_set_pll(struct sams=
ung_dsim *dsi,
>                                           unsigned long freq)
>  {
>         const struct samsung_dsim_driver_data *driver_data =3D dsi->drive=
r_data;
> -       unsigned long fin, fout;
> -       int timeout;
> +       unsigned long fin, fout, timeout_us, bus_clk_mhz;
>         u8 p, s;
>         u16 m;
>         u32 reg;
> @@ -849,19 +854,33 @@ static unsigned long samsung_dsim_set_pll(struct sa=
msung_dsim *dsi,
>         if (dsi->swap_dn_dp_data)
>                 reg |=3D DSIM_PLL_DPDNSWAP_DAT;
>
> +       /*
> +        * The PLL_TIMER value is the product of the timeout delay and th=
e APB
> +        * bus clock rate. Calculate the timeout delay on-the-fly here.
> +        * It is assumed that the bus clock is the first clock in the pro=
vided
> +        * bulk clock data.
> +        */
> +       timeout_us =3D 100;
> +       bus_clk_mhz =3D clk_get_rate(dsi->driver_data->clk_data[0].clk) /=
 HZ_PER_MHZ;
> +       if (bus_clk_mhz)
> +               timeout_us =3D max(driver_data->reg_values[PLL_TIMER] / b=
us_clk_mhz,
> +                                timeout_us);

PLL_TIMER is a hardware PLL lock timer. Deriving a *software* timeout
from it is a heuristic with no documentation behind it, and the values
we carry vary wildly (500, 22200, 80000).
Since the completion wakes us up as soon as the PLL is stable, a
generous fixed timeout costs nothing on working hardware and is much
easier to reason about. Please just use a fixed value in the
millisecond range.

That also removes the need for the linux/minmax.h include and, more
importantly, for reaching into clk_data[] by index.

On that last point: clk_data points at a static array
(exynos3_clk_bulk_data[] and friends) shared by every instance using
the same driver_data. Indexing it with a hardcoded 0 and documenting
the "first clock is the bus clock" assumption only in a comment is
fragile.
If you do need the bus clock rate, please add an explicit index or
pointer to struct samsung_dsim_driver_data rather than relying on
array ordering.

> +
> +       reinit_completion(&dsi->pll_stabilized);
>         samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
>
> -       timeout =3D 3000;
> -       do {
> -               if (timeout-- =3D=3D 0) {
> -                       dev_err(dsi->dev, "PLL failed to stabilize\n");
> -                       return 0;
> -               }
> +       if (!wait_for_completion_timeout(&dsi->pll_stabilized,
> +                                        usecs_to_jiffies(timeout_us))) {
>                 if (driver_data->has_legacy_status_reg)
>                         reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);
>                 else
>                         reg =3D samsung_dsim_read(dsi, DSIM_LINK_STATUS_R=
EG);
> -       } while ((reg & BIT(driver_data->pll_stable_bit)) =3D=3D 0);
> +
> +               if (!(reg & BIT(driver_data->pll_stable_bit))) {
> +                       dev_err(dsi->dev, "PLL failed to stabilize\n");
> +                       return 0;
> +               }
> +       }

usecs_to_jiffies(100) rounds up to a single jiffy on any HZ we
support, and wait_for_completion_timeout() arms a timer that expires
on the next tick boundary. The actual wait can therefore be
arbitrarily close to zero. The "gracious lower bound of 100
microseconds" from the changelog simply does not exist in practice.

Combined with the fallback being a *single* register read, this is a
regression waiting to happen: on any platform where PLL_STABLE is not
delivered - and per my note above, that is every platform except your
Exynos7870 as far as we know - we go from 3000 polls (milliseconds) to
one read taken possibly microseconds after the PLL was programmed.

Please raise the lower bound to something meaningful, e.g. 20 ms.

>
>         dsi->hs_clock =3D fout;
>
> @@ -1586,7 +1605,8 @@ static irqreturn_t samsung_dsim_irq(int irq, void *=
dev_id)
>         samsung_dsim_write(dsi, DSIM_INTSRC_REG, status);
>
>         if (status & DSIM_INT_SW_RST_RELEASE) {
> -               unsigned long mask =3D ~(DSIM_INT_RX_DONE |
> +               unsigned long mask =3D ~(DSIM_INT_PLL_STABLE |
> +                                      DSIM_INT_RX_DONE |
>                                        DSIM_INT_SFR_FIFO_EMPTY |
>                                        DSIM_INT_SFR_HDR_FIFO_EMPTY |
>                                        DSIM_INT_RX_ECC_ERR |
> @@ -1596,8 +1616,10 @@ static irqreturn_t samsung_dsim_irq(int irq, void =
*dev_id)
>                 return IRQ_HANDLED;
>         }
>
> -       if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY |
> -                       DSIM_INT_PLL_STABLE)))
> +       if (status & DSIM_INT_PLL_STABLE)
> +               complete(&dsi->pll_stabilized);
> +
> +       if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY)))
>                 return IRQ_HANDLED;

The unmask change is correct, but the placement of the complete() call
is not. The SW_RST_RELEASE branch returns before we ever look at
DSIM_INT_PLL_STABLE, and DSIM_INTSRC has already been write-cleared
for the full status word at the top of the handler.

So if both bits are set in a single read, the PLL_STABLE source is
acknowledged in hardware but complete() is never called, and the event
is lost for good. set_pll() then always hits the timeout and falls
back to the single read discussed above.

This is not theoretical for the wait_for_reset =3D=3D 0
platforms(exynos5433, imx8mm, imx8mp): there we proceed to set_pll()
without waiting for the reset to complete, so the two events can
genuinely overlap.

Please move the PLL_STABLE handling above the SW_RST_RELEASE block.

Thanks,
Inki Dae

>
>         if (samsung_dsim_transfer_finish(dsi))
> @@ -1635,9 +1657,9 @@ static int samsung_dsim_init(struct samsung_dsim *d=
si)
>         if (driver_data->reg_values[RESET_TYPE] =3D=3D DSIM_FUNCRST)
>                 samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
>
> -       samsung_dsim_enable_clock(dsi);
>         if (driver_data->wait_for_reset)
>                 samsung_dsim_wait_for_reset(dsi);
> +       samsung_dsim_enable_clock(dsi);
>         samsung_dsim_set_phy_ctrl(dsi);
>         samsung_dsim_init_link(dsi);
>
> @@ -2148,6 +2170,7 @@ int samsung_dsim_probe(struct platform_device *pdev=
)
>                 return PTR_ERR(dsi);
>
>         init_completion(&dsi->completed);
> +       init_completion(&dsi->pll_stabilized);
>         spin_lock_init(&dsi->transfer_lock);
>         INIT_LIST_HEAD(&dsi->transfer_list);
>
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index 03005e474704..e3433da21ad0 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -123,6 +123,7 @@ struct samsung_dsim {
>         int state;
>         struct drm_property *brightness;
>         struct completion completed;
> +       struct completion pll_stabilized;
>
>         spinlock_t transfer_lock; /* protects transfer_list */
>         struct list_head transfer_list;
>
> --
> 2.54.0
>
>
