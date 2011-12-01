From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 1/2] ARM: SAMSUNG: Add pm_caps into platform data
Date: Thu, 01 Dec 2011 16:30:24 +0900
Message-ID: <045f01ccaffb$17038320$450a8960$%kim@samsung.com>
References: <1321438848-3607-1-git-send-email-sangwook.lee@linaro.org>
 <CAJuYYwQ56z2jwE+PXrGO=Wifz-e0F6Eo=twhaPR0kpgq3V1FNA@mail.gmail.com>
 <CADPsn1YCsJC1j9jyz3UiL9w3qjWjZDckFAXbww-8XNpds-21rQ@mail.gmail.com>
 <CAJuYYwTm4VHWefSv8yqot-LRuz=pXTm06NnWC4c4y-yvrFy-Sg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:17249 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753321Ab1LAHaZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 02:30:25 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVI00MGRKSMWXF0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Dec 2011 16:30:24 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVI00JUOKUOZFJ0@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 01 Dec 2011 16:30:24 +0900 (KST)
In-reply-to: <CAJuYYwTm4VHWefSv8yqot-LRuz=pXTm06NnWC4c4y-yvrFy-Sg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Sangwook Lee' <sangwook.lee@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org, 'Sangwook Lee' <sangwook.lee@samsung.com>

Thomas Abraham wrote:
>=20
> Dear Mr. Lee,
>=20
> On 16 November 2011 17:48, Sangwook Lee <sangwook.lee@linaro.org> wro=
te:
> > Hi Thomas
> >
> > On 16 November 2011 11:47, Thomas Abraham <thomas.abraham@linaro.or=
g>
> wrote:
> >>
> >> Dear Mr. Lee,
> >>
> >> On 16 November 2011 15:50, Sangwook Lee <sangwook.lee@linaro.org>
wrote:
> >> > Add pm_caps into platform_data. This is power management, usuall=
y
> >> > for SDIO device such as SDIO WLAN.
> >> >
> >> > Signed-off-by: Sangwook Lee <sangwook.lee@samsung.com>
> >> > ---
> >> > =A0arch/arm/plat-samsung/include/plat/sdhci.h | =A0 =A02 ++
> >> > =A0arch/arm/plat-samsung/platformdata.c =A0 =A0 =A0 | =A0 =A02 +=
+
> >> > =A02 files changed, 4 insertions(+), 0 deletions(-)
> >> >
> >> > diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h
> >> > b/arch/arm/plat-samsung/include/plat/sdhci.h
> >> > index dcff7dd..fcd02d4 100644
> >> > --- a/arch/arm/plat-samsung/include/plat/sdhci.h
> >> > +++ b/arch/arm/plat-samsung/include/plat/sdhci.h
> >> > @@ -40,6 +40,7 @@ enum clk_types {
> >> > =A0* struct s3c_sdhci_platdata() - Platform device data for Sams=
ung
> SDHCI
> >> > =A0* @max_width: The maximum number of data bits supported.
> >> > =A0* @host_caps: Standard MMC host capabilities bit field.
> >> > + * @pm_caps: SDIO host PM capabilities bit field.
> >> > =A0* @cd_type: Type of Card Detection method (see cd_types enum =
above)
> >> > =A0* @clk_type: Type of clock divider method (see clk_types enum=
 above)
> >> > =A0* @ext_cd_init: Initialize external card detect subsystem. Ca=
lled on
> >> > @@ -63,6 +64,7 @@ enum clk_types {
> >> > =A0struct s3c_sdhci_platdata {
> >> > =A0 =A0 =A0 =A0unsigned int =A0 =A0max_width;
> >> > =A0 =A0 =A0 =A0unsigned int =A0 =A0host_caps;
> >> > + =A0 =A0 =A0 unsigned int =A0 =A0pm_caps;
> >> > =A0 =A0 =A0 =A0enum cd_types =A0 cd_type;
> >> > =A0 =A0 =A0 =A0enum clk_types =A0clk_type;
> >> >
> >> > diff --git a/arch/arm/plat-samsung/platformdata.c
> >> > b/arch/arm/plat-samsung/platformdata.c
> >> > index ceb9fa3..0f70718 100644
> >> > --- a/arch/arm/plat-samsung/platformdata.c
> >> > +++ b/arch/arm/plat-samsung/platformdata.c
> >> > @@ -53,6 +53,8 @@ void s3c_sdhci_set_platdata(struct
> s3c_sdhci_platdata
> >> > *pd,
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set->cfg_gpio =3D pd->cfg_gpio;
> >> > =A0 =A0 =A0 =A0if (pd->host_caps)
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set->host_caps |=3D pd->host_caps=
;
> >> > + =A0 =A0 =A0 if (pd->pm_caps)
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 set->pm_caps |=3D pd->pm_caps;
> >>
> >>
> >> Are the 'pm_caps' specific to a (on-board) sdio host attached to t=
he
> >> sdhci controller?
> >
> > No, this is not specific to a sdio host controller.
> >
>=20
> Thanks for your confirmation. Looking at the code, there are two flag=
s
> for pm_caps - MMC_PM_KEEP_POWER and MMC_PM_WAKE_SDIO_IRQ. Though thes=
e
> seem to be flags for linux specific behavior, the same could be
> supported from device tree as well allowing host system to use and ac=
t
> on these properties or ignore it. So, adding pm_caps in platform data
> should be fine from dt support perspective.
>=20
> If you prefer, for the both the patches in this series,
> Acked-by: Thomas Abraham <thomas.abraham@linaro.org>
>=20
OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> >>
> >> If yes, then this change should be fine. If no,
> >> please let me know. I am kind of worried of any new addition to
> >> platform data. Because, if that new addition in platform data is n=
ot
> >> board specific data, then it becomes difficult to represent that
> >> information in device tree.
> >>
> >> Thanks,
> >> Thomas.
> >>
> >>
> >> > =A0 =A0 =A0 =A0if (pd->clk_type)
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set->clk_type =3D pd->clk_type;
> >> > =A0}
> >> > --
> >> > 1.7.4.1
