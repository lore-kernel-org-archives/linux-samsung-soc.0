From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/9] ARM: EXYNOS: add clock part for EXYNOS5250 SoC
Date: Thu, 09 Feb 2012 19:50:01 +0900
Message-ID: <068701cce718$92abdd70$b8039850$%kim@samsung.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
 <1328024354-4277-3-git-send-email-kgene.kim@samsung.com>
 <CAH9JG2UjbC7-qRUirj_QqR92duyh+1FXLQufL-QW-N5te66KDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39339 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752345Ab2BIKuD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 05:50:03 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ400401GR9U6U0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 19:50:02 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ400B0LGRAGD80@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 19:50:01 +0900 (KST)
In-reply-to: <CAH9JG2UjbC7-qRUirj_QqR92duyh+1FXLQufL-QW-N5te66KDA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net

Kyungmin Park wrote:
> 
> On 2/1/12, Kukjin Kim <kgene.kim@samsung.com> wrote:

[snip]

> > +static int exynos5_clk_gate_block(struct clk *clk, int enable)
> exynos5_clk_block_ctrl?

OK, looks better, will change.

[snip]

> > +		.name		= "mfc",
> > +		.devname	= "s3c-mfc",
> what's this?

typo :( should be s5p-mfc.

[snip]

> > +		.name		= "hdmi",
> > +		.devname	= "exynos5-hdmi",
> I think exynos4x12 has same hdmi controller. so It will be changed as
> exynos-hdmi.

OK, let me check it but I'm not sure new exynos will have same hdmi later.

[snip]

> > +		.name		= "fimg2d",
> > +		.devname	= "s5p-fimg2d",
> s5p? exynos?

Hmm, let me think again.

[snip]

Thanks :)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
