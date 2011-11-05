From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 5/5] [CPUFREQ] EXYNOS4210: Add support ASV feature
Date: Sat, 05 Nov 2011 10:25:33 +0900
Message-ID: <02e001cc9b59$d09ff400$71dfdc00$%kim@samsung.com>
References: <005801cc995c$fee5dd60$fcb19820$%kim@samsung.com>
 <CAJ0PZbQEHXpRdCkcAwNwtK7AmH=nxG+KjOcw91gwagAvFr_pxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36460 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751413Ab1KEBZf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Nov 2011 21:25:35 -0400
In-reply-to: <CAJ0PZbQEHXpRdCkcAwNwtK7AmH=nxG+KjOcw91gwagAvFr_pxA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, davej@redhat.com, 'Jaecheol Lee' <jc.lee@samsung.com>

MyungJoo Ham wrote:
>=20
> Hello,
>=20
Hi,

I got the comments from Jaecheol Lee but his mail client has some probl=
em so
I'm sending instead.

> On Wed, Nov 2, 2011 at 9:43 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> []
> > +static void __init set_volt_table(void)
> > +{
> > + =A0 =A0 =A0 unsigned int tmp, i, asv_group =3D 0;
> > +
> > + =A0 =A0 =A0 tmp =3D __raw_readl(S5P_INFORM2);
>=20
> As I've mentioned in the ASV patch thread, do we really need to use a=
n
> INFORM register simply to save the id of supported voltage ranges?
>=20
> Why aren't we using an extern variable here? For example, "extern int
> asv_group_id;" and define it at "asv.h" or somewhere else.
>=20
> At reboot, we are going to init ASV driver and will get the ASV value
> again; thus, we don't need to use such a preserving register anyway.
> At suspend/resume, the value in RAM does not disappear and the IPL
> does not care this value; thus, it is meaningless to use INFORM2 for
> this value.
>=20
ASV feature had been implemented in bootloader hence inform register wa=
s
used to return the result value to cpufreq driver. If there is no probl=
em to
use the inform register why don't you keep this manner.

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
