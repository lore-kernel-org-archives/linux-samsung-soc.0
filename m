From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 2/2] ARM: EXYNOS: Add Gscaler device from DT
Date: Tue, 07 Aug 2012 19:01:50 +0900
Message-ID: <098d01cd7483$aa3dd850$feb988f0$%kim@samsung.com>
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
Received: from mailout2.samsung.com ([203.254.224.25]:38980 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753617Ab2HGKBw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Aug 2012 06:01:52 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8D0091FQIX2O30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Aug 2012 19:01:51 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8D00DJOQJ2W340@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Aug 2012 19:01:51 +0900 (KST)
In-reply-to: <5020164E.90007@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, 'Shaik Ameer Basha' <shaik.samsung@gmail.com>
Cc: 'Olof Johansson' <olof@lixom.net>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Shaik Ameer Basha' <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sachin.kamat@linaro.org, joshi@samsung.com, sungchun.kang@samsung.com, 'Rob Herring' <rob.herring@calxeda.com>

Sylwester Nawrocki wrote:
> 
> On 08/06/2012 08:27 AM, Shaik Ameer Basha wrote:
> > After all this discussion, I can see two possibilities here.
> > 1] If Kukjin Kim is sure about G-Scaler remains unchanged, across all
> > the exynos5 series SoCs,
> >          It is fine to go with the compatible string
"samsung,exynos5-gsc".
> > 2] Otherwise in case of any doubts about G-Scaler is going to change,
> >          It is safe to go with the compatible string specific to
> > current SoC i.e., "samsung,exynos5250-gsc".
> >
> > If we all can agree on this, lets Kukjin Kim decide which string to
> > use as he has good knowledge about upcoming exynos5 series SoCs.
> 
> I don't have strong opinion on this, but my vote goes for using more
> specific properties. Of course the final word belongs to Mr. Kim.
> 
Thanks, and I will discuss with exynos hardware chip designers about that,
then let you know.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
