From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 5/5] ARM: Exynos: Add basic dts file for Samsung Trats
 board
Date: Sat, 08 Sep 2012 11:47:15 +0900
Message-ID: <24dd01cd8d6c$41586970$c4093c50$%kim@samsung.com>
References: <1346748609-11115-1-git-send-email-t.figa@samsung.com>
 <1346748609-11115-6-git-send-email-t.figa@samsung.com>
 <CAJuYYwTV1giNYJ7RTz=DHqK=i6FD2GsV4rNY2p5scVAnQz0kdg@mail.gmail.com>
 <3039444.Ol4zGlGWJ2@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:59118 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103Ab2IHCrS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Sep 2012 22:47:18 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MA0004T3FQSBD80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 08 Sep 2012 11:47:16 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MA0002SDFQS3010@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 08 Sep 2012 11:47:16 +0900 (KST)
In-reply-to: <3039444.Ol4zGlGWJ2@flatron>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, jy0922.shim@samsung.com

Tomasz Figa wrote:
> 
> Hi,
> 
> Thanks for reviewing the patch.
> 
> On Wednesday 05 of September 2012 09:35:49 Thomas Abraham wrote:
> > > +
> > > +       memory {
> > > +               reg =  <0x40000000 0x20000000
> > > +                       0x60000000 0x20000000>;
> > > +       };
> >
> > Why does this have to be split. Why not have a single entry with the
> > size as 0x40000000?
> 
> The memory node corresponds to struct meminfo and each entry (with two
> values) makes one struct membank defining a memory bank.
> 
Well...

> I've been talking with Kyungmin about this. Originally bootloaders used to
> report 4 banks of 256 MiB, but it turned out that real bank configuration
> on Trats is 2 banks of 512 MiB.
> 
I think, following should ok here.

memory {
	reg = <0x40000000 0x40000000>;
};

> I'm not into memory management internals, so I don't know if this has any
> significance, but I defined the node to represent the real configuration
> (otherwise I would have probably used 4 banks of 256 MiB and drop the 4th
> patch).
> 
> > > +               max8997_pmic@66 {
> > > +                       compatible = "maxim,max8997-pmic";
> > > +
> > > +                       reg = <0x66>;
> >
> > Probably, the interrupts can be listed when we have pinctrl driver
> > merged in Samsung tree.
> >
> 
> Right.
> 
Note, you can do it on top of samsung tree :-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
