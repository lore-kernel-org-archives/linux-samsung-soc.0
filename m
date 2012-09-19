From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 5/5] ARM: Exynos: Add basic dts file for Samsung Trats
 board
Date: Thu, 20 Sep 2012 08:49:42 +0900
Message-ID: <09a401cd96c1$70df2860$529d7920$%kim@samsung.com>
References: <1346748609-11115-1-git-send-email-t.figa@samsung.com>
 <3039444.Ol4zGlGWJ2@flatron> <24dd01cd8d6c$41586970$c4093c50$%kim@samsung.com>
 <7700294.NPoOn06yTZ@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16301 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753106Ab2ISXto (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Sep 2012 19:49:44 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAM006JQFINL150@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:49:43 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAM00MPIFIVIE60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 08:49:43 +0900 (KST)
In-reply-to: <7700294.NPoOn06yTZ@flatron>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, jy0922.shim@samsung.com

Tomasz Figa wrote:
> 
> Hi Kgene,
> 
> On Saturday 08 of September 2012 11:47:15 Kukjin Kim wrote:
> > > > > +       memory {
> > > > > +               reg =  <0x40000000 0x20000000
> > > > > +                       0x60000000 0x20000000>;
> > > > > +       };
> > > >
> > > > Why does this have to be split. Why not have a single entry with the
> > > > size as 0x40000000?
> > >
> > > The memory node corresponds to struct meminfo and each entry (with two
> > > values) makes one struct membank defining a memory bank.
> >
> > Well...
> >
> > > I've been talking with Kyungmin about this. Originally bootloaders
> used
> > > to report 4 banks of 256 MiB, but it turned out that real bank
> > > configuration on Trats is 2 banks of 512 MiB.
> >
> > I think, following should ok here.
> >
> > memory {
> > 	reg = <0x40000000 0x40000000>;
> > };
> 
> This will not boot with CONFIG_SPARSEMEM, unless maximum section size is
> increased to 1024MiB.
> 
Well, see other Origen board. As I know, it works well under environment you
said but I'm not sure about its boot-loader environment. Anyway, please
check one more and let me know. Then, if you still have same problem, let's
use double entries for memory temporary.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
