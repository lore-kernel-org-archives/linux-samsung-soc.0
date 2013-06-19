From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH 3/4] drm/exynos: fix interlace resolutions for exynos5420
Date: Wed, 19 Jun 2013 14:59:47 +0900
Message-ID: <008901ce6cb2$33f6e4c0$9be4ae40$%dae@samsung.com>
References: <1371559778-9359-1-git-send-email-rahul.sharma@samsung.com>
 <1371559778-9359-4-git-send-email-rahul.sharma@samsung.com>
 <51C142E4.1000806@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51523 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756444Ab3FSGAL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 02:00:11 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOM00G0TLZV3GR0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 14:59:56 +0900 (KST)
In-reply-to: <51C142E4.1000806@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: sw0312.kim@samsung.com, 'Rahul Sharma' <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

Applied.

Thanks,
Inki Dae

> -----Original Message-----
> From: =B1=E8=BD=C2=BF=EC [mailto:sw0312.kim@samsung.com]
> Sent: Wednesday, June 19, 2013 2:34 PM
> To: Rahul Sharma
> Cc: linux-samsung-soc@vger.kernel.org; devicetree-
discuss@lists.ozlabs.org;
> dri-devel@lists.freedesktop.org; kgene.kim@samsung.com;
> inki.dae@samsung.com; joshi@samsung.com; r.sh.open@gmail.com; Seung-W=
oo
> Kim
> Subject: Re: [PATCH 3/4] drm/exynos: fix interlace resolutions for
> exynos5420
>=20
> Hi Rahul,
>=20
> This patch looks good to me.
>=20
> On 2013=B3=E2 06=BF=F9 18=C0=CF 21:49, Rahul Sharma wrote:
> > Modified code for calculating hdmi IP register values from drm timi=
ng
> > values. The modification is based on the inputs from hw team and
> specifically
> > proposed for 1440x576i and 1440x480i. But same changes holds good f=
or
> other
> > interlaced resolutions also.
> >
> > Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>=20
> Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>
>=20
> > ---
> >  drivers/gpu/drm/exynos/exynos_hdmi.c |   14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c
> b/drivers/gpu/drm/exynos/exynos_hdmi.c
> > index 8752171..2f807d5 100644
> > --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> > @@ -1557,8 +1557,7 @@ static void hdmi_v14_mode_set(struct hdmi_con=
text
> *hdata,
> >  			(m->vsync_start - m->vdisplay) / 2);
> >  		hdmi_set_reg(core->v2_blank, 2, m->vtotal / 2);
> >  		hdmi_set_reg(core->v1_blank, 2, (m->vtotal - m->vdisplay) /
> 2);
> > -		hdmi_set_reg(core->v_blank_f0, 2, (m->vtotal +
> > -			((m->vsync_end - m->vsync_start) * 4) + 5) / 2);
> > +		hdmi_set_reg(core->v_blank_f0, 2, m->vtotal - m->vdisplay /
> 2);
> >  		hdmi_set_reg(core->v_blank_f1, 2, m->vtotal);
> >  		hdmi_set_reg(core->v_sync_line_aft_2, 2, (m->vtotal / 2) +
> 7);
> >  		hdmi_set_reg(core->v_sync_line_aft_1, 2, (m->vtotal / 2) +
> 2);
> > @@ -1568,7 +1567,10 @@ static void hdmi_v14_mode_set(struct hdmi_co=
ntext
> *hdata,
> >  			(m->htotal / 2) + (m->hsync_start - m->hdisplay));
> >  		hdmi_set_reg(tg->vact_st, 2, (m->vtotal - m->vdisplay) / 2);
> >  		hdmi_set_reg(tg->vact_sz, 2, m->vdisplay / 2);
> > -		hdmi_set_reg(tg->vact_st2, 2, 0x249);/* Reset value + 1*/
> > +		hdmi_set_reg(tg->vact_st2, 2, m->vtotal - m->vdisplay / 2);
> > +		hdmi_set_reg(tg->vsync2, 2, (m->vtotal / 2) + 1);
> > +		hdmi_set_reg(tg->vsync_bot_hdmi, 2, (m->vtotal / 2) + 1);
> > +		hdmi_set_reg(tg->field_bot_hdmi, 2, (m->vtotal / 2) + 1);
> >  		hdmi_set_reg(tg->vact_st3, 2, 0x0);
> >  		hdmi_set_reg(tg->vact_st4, 2, 0x0);
> >  	} else {
> > @@ -1590,6 +1592,9 @@ static void hdmi_v14_mode_set(struct hdmi_con=
text
> *hdata,
> >  		hdmi_set_reg(tg->vact_st2, 2, 0x248); /* Reset value */
> >  		hdmi_set_reg(tg->vact_st3, 2, 0x47b); /* Reset value */
> >  		hdmi_set_reg(tg->vact_st4, 2, 0x6ae); /* Reset value */
> > +		hdmi_set_reg(tg->vsync2, 2, 0x233); /* Reset value */
> > +		hdmi_set_reg(tg->vsync_bot_hdmi, 2, 0x233); /* Reset value
> */
> > +		hdmi_set_reg(tg->field_bot_hdmi, 2, 0x233); /* Reset value
> */
> >  	}
> >
> >  	/* Following values & calculations are same irrespective of mode
> type */
> > @@ -1621,12 +1626,9 @@ static void hdmi_v14_mode_set(struct hdmi_co=
ntext
> *hdata,
> >  	hdmi_set_reg(tg->hact_sz, 2, m->hdisplay);
> >  	hdmi_set_reg(tg->v_fsz, 2, m->vtotal);
> >  	hdmi_set_reg(tg->vsync, 2, 0x1);
> > -	hdmi_set_reg(tg->vsync2, 2, 0x233); /* Reset value */
> >  	hdmi_set_reg(tg->field_chg, 2, 0x233); /* Reset value */
> >  	hdmi_set_reg(tg->vsync_top_hdmi, 2, 0x1); /* Reset value */
> > -	hdmi_set_reg(tg->vsync_bot_hdmi, 2, 0x233); /* Reset value */
> >  	hdmi_set_reg(tg->field_top_hdmi, 2, 0x1); /* Reset value */
> > -	hdmi_set_reg(tg->field_bot_hdmi, 2, 0x233); /* Reset value */
> >  	hdmi_set_reg(tg->tg_3d, 1, 0x0);
> >  }
> >
> >
>=20
> --
> Seung-Woo Kim
> Samsung Software R&D Center
> --
