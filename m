From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 12/14] ARM: S5PV310: Add various clocks
Date: Fri, 20 Aug 2010 16:00:05 +0900
Message-ID: <00ab01cb4035$5486b5f0$fd9421d0$%kim@samsung.com>
References: <1282140084-10265-1-git-send-email-kgene.kim@samsung.com>
 <1282140084-10265-13-git-send-email-kgene.kim@samsung.com>
 <AANLkTim_rJu0RicETYqsdKArSKtzSMdGBfm96dSFWauw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:15954 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751076Ab0HTG75 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Aug 2010 02:59:57 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L7F00KYVVFVXH90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Aug 2010 15:59:55 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L7F00FRKVFVDR@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Aug 2010 15:59:55 +0900 (KST)
In-reply-to: <AANLkTim_rJu0RicETYqsdKArSKtzSMdGBfm96dSFWauw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Jongpill Lee' <boyko.lee@samsung.com>, ben-linux@fluff.org

MyungJoo Ham wrote:
>=20
> On Wed, Aug 18, 2010 at 11:01 PM, Kukjin Kim <kgene.kim@samsung.com>
wrote:
> > From: Jongpill Lee <boyko.lee@samsung.com>
> >
> > This patch adds clocks for S5PV310/S5PC210.
> >
> > Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0arch/arm/mach-s5pv310/clock.c | =A0155
> ++++++++++++++++++++++++++++++++++++++++-
> > =A01 files changed, 154 insertions(+), 1 deletions(-)
> >
> > diff --git a/arch/arm/mach-s5pv310/clock.c
b/arch/arm/mach-s5pv310/clock.c
> > index ec69edc..14c9707 100644
> > --- a/arch/arm/mach-s5pv310/clock.c
> > +++ b/arch/arm/mach-s5pv310/clock.c
> > @@ -61,6 +61,26 @@ static int s5pv310_clksrc_mask_peril0_ctrl(struc=
t clk
*clk,
> int enable)
> > =A0 =A0 =A0 =A0return s5p_gatectrl(S5P_CLKSRC_MASK_PERIL0, clk, ena=
ble);
> > =A0}
> >
> > +static int s5pv310_clk_ip_cam_ctrl(struct clk *clk, int enable)
> > +{
> > + =A0 =A0 =A0 return s5p_gatectrl(S5P_CLKGATE_IP_CAM, clk, enable);
> > +}
> > +
> > +static int s5pv310_clk_ip_image_ctrl(struct clk *clk, int enable)
> > +{
> > + =A0 =A0 =A0 return s5p_gatectrl(S5P_CLKGATE_IP_IMAGE, clk, enable=
);
> > +}
> > +
> > +static int s5pv310_clk_ip_lcd0_ctrl(struct clk *clk, int enable)
> > +{
> > + =A0 =A0 =A0 return s5p_gatectrl(S5P_CLKGATE_IP_LCD0, clk, enable)=
;
> > +}
> > +
> > +static int s5pv310_clk_ip_lcd1_ctrl(struct clk *clk, int enable)
> > +{
> > + =A0 =A0 =A0 return s5p_gatectrl(S5P_CLKGATE_IP_LCD1, clk, enable)=
;
> > +}
> > +
> > =A0static int s5pv310_clk_ip_fsys_ctrl(struct clk *clk, int enable)
> > =A0{
> > =A0 =A0 =A0 =A0return s5p_gatectrl(S5P_CLKGATE_IP_FSYS, clk, enable=
);
> > @@ -275,6 +295,46 @@ static struct clk init_clocks_disable[] =3D {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0 =3D s5pv310_=
clk_ip_peril_ctrl,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=3D (1<<24),
> > =A0 =A0 =A0 =A0}, {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "csis",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 0,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_cam_ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 4),
> > + =A0 =A0 =A0 }, {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "csis",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 1,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_cam_ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 5),
> > + =A0 =A0 =A0 }, {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "fimc",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 0,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_cam_ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 0),
> > + =A0 =A0 =A0 }, {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "fimc",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 1,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_cam_ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 1),
> > + =A0 =A0 =A0 }, {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "fimc",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 2,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_cam_ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 2),
> > + =A0 =A0 =A0 }, {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "fimc",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 3,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_cam_ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 3),
> > + =A0 =A0 =A0 }, {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "fimd",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 0,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_lcd0_ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 0),
> > + =A0 =A0 =A0 }, {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "fimd",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 1,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_lcd1_ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 0),
> > + =A0 =A0 =A0 }, {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "hsmmc=
",
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.id =A0 =A0 =A0 =A0 =A0 =A0 =3D 0,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.parent =A0 =A0 =A0 =A0 =3D &clk_acl=
k_133.clk,
> > @@ -304,7 +364,100 @@ static struct clk init_clocks_disable[] =3D {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.parent =A0 =A0 =A0 =A0 =3D &clk_acl=
k_133.clk,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0 =3D s5pv310_=
clk_ip_fsys_ctrl,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=3D (1 << 9)=
,
> > - =A0 =A0 =A0 }
> > + =A0 =A0 =A0 }, {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "sata",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_fsys_ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 10)=
,
> > + =A0 =A0 =A0 }, {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "adc",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_peril_ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 15)=
,
> > + =A0 =A0 =A0 }, {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "watchd=
og",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_c=
lk_ip_peril_ctrl,
>=20
> s5pv310_clk_ip_perir_ctrl (R, not L) appears to be correct for this e=
ntry.
>=20
> Probably, we may need to sort these according to .enable entry (and
> then .ctrlbit entry) later.
>=20
You're right. will fix it.

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
