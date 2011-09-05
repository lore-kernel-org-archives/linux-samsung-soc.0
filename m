From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/6] Add device tree support for PL330 dma controller driver
Date: Mon, 05 Sep 2011 14:17:39 +0900
Message-ID: <001a01cc6b8b$21708470$64518d50$%kim@samsung.com>
References: <1314348014-2481-1-git-send-email-thomas.abraham@linaro.org>
 <1314638947.1606.157.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:9249 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750896Ab1IEFRk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Sep 2011 01:17:40 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LR100M4MAPB5X90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Sep 2011 14:17:39 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LR100M5KAPFWY60@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 05 Sep 2011 14:17:39 +0900 (KST)
In-reply-to: <1314638947.1606.157.camel@vkoul-udesk3>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vinod Koul' <vinod.koul@linux.intel.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, boojin.kim@samsung.com, patches@linaro.org, jassisinghbrar@gmail.com, grant.likely@secretlab.ca, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Vinod Koul wrote:
>=20
> On Fri, 2011-08-26 at 14:10 +0530, Thomas Abraham wrote:
> > This patchset adds device tree support for PL330 driver and uses it
> > to add device tree support for Samsung platforms, specifically Exyn=
os4.
> The DMA patches looks good to me. Do you want this to go thru slave-d=
ma
> tree or somewhere else.
> I will need acks on 3, 5 and 6th patch to carry them.
>=20

Looks good to me on 3 and 5th patch, I think, 6th patch is needed to up=
date, please refer to my comments on there.

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

As you know, Boojin Kim submitted 8th patch last Friday. So would be ni=
ce to me if you could rebase Thomas' patch based on her updated patch s=
et and apply all series into your slave-dma.git samsung_dma branch I th=
ink it=E2=80=99s easy because v8 changes are small then I will merge it=
 into my -next to prevent useless conflicts.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
