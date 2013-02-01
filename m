From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] cpufreq: exynos: Initialise return variable
Date: Thu, 31 Jan 2013 17:11:20 -0800
Message-ID: <0b7d01ce0019$0cb230f0$261692d0$@samsung.com>
References: <1358932932-14094-1-git-send-email-sachin.kamat@linaro.org>
 <1358932932-14094-2-git-send-email-sachin.kamat@linaro.org>
 <013c01cdfb29$86d37b90$947a72b0$@samsung.com>
 <56645451.dJrUCdvOAX@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:45591 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751264Ab3BABL3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jan 2013 20:11:29 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHI00K2HOMSS910@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Feb 2013 10:11:28 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHI004FZON106Q0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Feb 2013 10:11:27 +0900 (KST)
In-reply-to: <56645451.dJrUCdvOAX@vostro.rjw.lan>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "'Rafael J. Wysocki'" <rjw@sisk.pl>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, jhbird.choi@samsung.com, patches@linaro.org

Rafael J. Wysocki wrote:
>=20
> On Friday, January 25, 2013 10:26:41 AM Kukjin Kim wrote:
> > Sachin Kamat wrote:
> > >
> > > 'ret' is undefined when the function returns from the first
> > > 'if' condition. Without this patch we get the following warning:
> > >
> > > drivers/cpufreq/exynos-cpufreq.c: In function =E2=80=98exynos_tar=
get=E2=80=99:
> > > drivers/cpufreq/exynos-cpufreq.c:182:2: warning:
> > > =E2=80=98ret=E2=80=99 may be used uninitialized in this function =
[-Wuninitialized]
> > >
> > > Suggested-by: Jonghwan Choi <jhbird.choi@samsung.com>
> >
> > I modified above to 'Reported-by' because checkpatch complains like
> following...
> >
> > WARNING: Non-standard signature: Suggested-by:
> > #10:
> > Suggested-by: Jonghwan Choi <jhbird.choi@samsung.com>
>=20
> This tag has been used already, though, and I think it makes sense (m=
ore
> than =20

Yes, agreed.

> Reported-by in this case).  I think it may be regarded as standard re=
gardless
> of what checkpatch has to say about that. :-)
>=20
I see. Let me keep the 'Reported-by' here.
Thanks for your opinion.

- Kukjin
