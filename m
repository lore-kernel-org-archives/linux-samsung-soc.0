From: =?EUC-KR?B?sei9wr/s?= <sw0312.kim@samsung.com>
Subject: Re: [PATCH 3/4] drm/exynos: fix interlace resolutions for exynos5420
Date: Wed, 19 Jun 2013 14:34:28 +0900
Message-ID: <51C142E4.1000806@samsung.com>
References: <1371559778-9359-1-git-send-email-rahul.sharma@samsung.com>
 <1371559778-9359-4-git-send-email-rahul.sharma@samsung.com>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28034 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751325Ab3FSFe3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 01:34:29 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOM00CWFKS2OXN0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 14:34:23 +0900 (KST)
In-reply-to: <1371559778-9359-4-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Seung-Woo Kim <sw0312.kim@samsung.com>

Hi Rahul,

This patch looks good to me.

On 2013=B3=E2 06=BF=F9 18=C0=CF 21:49, Rahul Sharma wrote:
> Modified code for calculating hdmi IP register values from drm timing
> values. The modification is based on the inputs from hw team and spec=
ifically
> proposed for 1440x576i and 1440x480i. But same changes holds good for=
 other
> interlaced resolutions also.
>=20
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>

Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>

> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c |   14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/e=
xynos/exynos_hdmi.c
> index 8752171..2f807d5 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1557,8 +1557,7 @@ static void hdmi_v14_mode_set(struct hdmi_conte=
xt *hdata,
>  			(m->vsync_start - m->vdisplay) / 2);
>  		hdmi_set_reg(core->v2_blank, 2, m->vtotal / 2);
>  		hdmi_set_reg(core->v1_blank, 2, (m->vtotal - m->vdisplay) / 2);
> -		hdmi_set_reg(core->v_blank_f0, 2, (m->vtotal +
> -			((m->vsync_end - m->vsync_start) * 4) + 5) / 2);
> +		hdmi_set_reg(core->v_blank_f0, 2, m->vtotal - m->vdisplay / 2);
>  		hdmi_set_reg(core->v_blank_f1, 2, m->vtotal);
>  		hdmi_set_reg(core->v_sync_line_aft_2, 2, (m->vtotal / 2) + 7);
>  		hdmi_set_reg(core->v_sync_line_aft_1, 2, (m->vtotal / 2) + 2);
> @@ -1568,7 +1567,10 @@ static void hdmi_v14_mode_set(struct hdmi_cont=
ext *hdata,
>  			(m->htotal / 2) + (m->hsync_start - m->hdisplay));
>  		hdmi_set_reg(tg->vact_st, 2, (m->vtotal - m->vdisplay) / 2);
>  		hdmi_set_reg(tg->vact_sz, 2, m->vdisplay / 2);
> -		hdmi_set_reg(tg->vact_st2, 2, 0x249);/* Reset value + 1*/
> +		hdmi_set_reg(tg->vact_st2, 2, m->vtotal - m->vdisplay / 2);
> +		hdmi_set_reg(tg->vsync2, 2, (m->vtotal / 2) + 1);
> +		hdmi_set_reg(tg->vsync_bot_hdmi, 2, (m->vtotal / 2) + 1);
> +		hdmi_set_reg(tg->field_bot_hdmi, 2, (m->vtotal / 2) + 1);
>  		hdmi_set_reg(tg->vact_st3, 2, 0x0);
>  		hdmi_set_reg(tg->vact_st4, 2, 0x0);
>  	} else {
> @@ -1590,6 +1592,9 @@ static void hdmi_v14_mode_set(struct hdmi_conte=
xt *hdata,
>  		hdmi_set_reg(tg->vact_st2, 2, 0x248); /* Reset value */
>  		hdmi_set_reg(tg->vact_st3, 2, 0x47b); /* Reset value */
>  		hdmi_set_reg(tg->vact_st4, 2, 0x6ae); /* Reset value */
> +		hdmi_set_reg(tg->vsync2, 2, 0x233); /* Reset value */
> +		hdmi_set_reg(tg->vsync_bot_hdmi, 2, 0x233); /* Reset value */
> +		hdmi_set_reg(tg->field_bot_hdmi, 2, 0x233); /* Reset value */
>  	}
> =20
>  	/* Following values & calculations are same irrespective of mode ty=
pe */
> @@ -1621,12 +1626,9 @@ static void hdmi_v14_mode_set(struct hdmi_cont=
ext *hdata,
>  	hdmi_set_reg(tg->hact_sz, 2, m->hdisplay);
>  	hdmi_set_reg(tg->v_fsz, 2, m->vtotal);
>  	hdmi_set_reg(tg->vsync, 2, 0x1);
> -	hdmi_set_reg(tg->vsync2, 2, 0x233); /* Reset value */
>  	hdmi_set_reg(tg->field_chg, 2, 0x233); /* Reset value */
>  	hdmi_set_reg(tg->vsync_top_hdmi, 2, 0x1); /* Reset value */
> -	hdmi_set_reg(tg->vsync_bot_hdmi, 2, 0x233); /* Reset value */
>  	hdmi_set_reg(tg->field_top_hdmi, 2, 0x1); /* Reset value */
> -	hdmi_set_reg(tg->field_bot_hdmi, 2, 0x233); /* Reset value */
>  	hdmi_set_reg(tg->tg_3d, 1, 0x0);
>  }
> =20
>=20

--=20
Seung-Woo Kim
Samsung Software R&D Center
--
