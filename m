From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 2/2] ARM: EXYNOS: Add Gscaler device from DT
Date: Sat, 11 Aug 2012 13:08:20 +0900
Message-ID: <0efb01cd7776$f1b6fcc0$d524f640$%kim@samsung.com>
References: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com>
 <1342789723-3949-3-git-send-email-shaik.ameer@samsung.com>
 <033301cd6fb0$7ac4af90$704e0eb0$%kim@samsung.com>
 <CAJuYYwTy5zkeM_cJO7HMm+=v=ORPHD26nQYZwXK6v1noWm1EuA@mail.gmail.com>
 <5018E656.3070803@samsung.com>
 <036f01cd6fc4$120a9910$361fcb30$%kim@samsung.com> <50197D66.1050108@gmail.com>
 <CAOesGMiZMrv4GY=v1WPn_qGZgg=vduO2TbsUOQ6sCah-ZvOg_A@mail.gmail.com>
 <501B1003.1090003@gmail.com>
 <CAOD6ATomKE3WYtGrBTSyjfkNr5ZK+3=NRrZLX0p5pOzPykOikQ@mail.gmail.com>
 <5020164E.90007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:20137 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750850Ab2HKEIX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 11 Aug 2012 00:08:23 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8K00G02OTXMH00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 11 Aug 2012 13:08:21 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8K005K1OTW9D30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 11 Aug 2012 13:08:21 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, 'Shaik Ameer Basha' <shaik.samsung@gmail.com>
Cc: 'Olof Johansson' <olof@lixom.net>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Shaik Ameer Basha' <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sachin.kamat@linaro.org, joshi@samsung.com, sungchun.kang@samsung.com, 'Rob Herring' <rob.herring@calxeda.com>

Kukjin Kim wrote:
> 
> Sylwester Nawrocki wrote:
> >
> > On 08/06/2012 08:27 AM, Shaik Ameer Basha wrote:
> > > After all this discussion, I can see two possibilities here.
> > > 1] If Kukjin Kim is sure about G-Scaler remains unchanged, across all
> > > the exynos5 series SoCs,
> > >          It is fine to go with the compatible string
"samsung,exynos5-
> gsc".
> > > 2] Otherwise in case of any doubts about G-Scaler is going to change,
> > >          It is safe to go with the compatible string specific to
> > > current SoC i.e., "samsung,exynos5250-gsc".
> > >
> > > If we all can agree on this, lets Kukjin Kim decide which string to
> > > use as he has good knowledge about upcoming exynos5 series SoCs.
> >
> > I don't have strong opinion on this, but my vote goes for using more
> > specific properties. Of course the final word belongs to Mr. Kim.
> >
> Thanks, and I will discuss with exynos hardware chip designers about that,
> then let you know.
> 
'exynos5-gsc' should be ok on EXYNOS5250 and upcoming EXYNOS5 SoCs.

If any updates, I'll let you know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
