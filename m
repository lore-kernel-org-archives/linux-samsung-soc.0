From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: dts: Enable PMIC interrupts on ODROID
Date: Fri, 22 Aug 2014 19:39:52 +0900
Message-ID: <07e201cfbdf5$69d92770$3d8b7650$@samsung.com>
References: <1405500606-5752-1-git-send-email-drake@endlessm.com>
 <CAAObsKAokjDmpVy5cm_iFD52bCq+3jYeGDWzACsmh-JKktyjDw@mail.gmail.com>
 <53F22D1B.4010900@samsung.com> <3413299.OcpyWkc82q@amdc1032>
 <CABxcv=mkqmg_b+vwbVPAW7AaB86Fxx+LTuMSyC7L_mUy6u2+TQ@mail.gmail.com>
 <20140819201859.GA7929@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43322 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751556AbaHVKj5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Aug 2014 06:39:57 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NAP00863EYJNQ70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Aug 2014 19:39:56 +0900 (KST)
In-reply-to: <20140819201859.GA7929@localhost>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Javier Martinez Canillas' <javier@dowhile0.org>
Cc: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Tomeu Vizoso' <tomeu@tomeuvizoso.net>, 'Daniel Drake' <drake@endlessm.com>, liquid.acid@gmx.net, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Olof Johansson wrote:
> 
> On Tue, Aug 19, 2014 at 12:15:41PM +0200, Javier Martinez Canillas wrote:
> > Hello,
> >
> > On Tue, Aug 19, 2014 at 11:57 AM, Bartlomiej Zolnierkiewicz
> > <b.zolnierkie@samsung.com> wrote:
> > >
> > > IMHO they should go to upstream ASAP as they fix the boot for
> > > ODROID boards and they cannot break anything as they are limited
> > > to ODROID dts files.
> > >
> >
> > Agreed, this is definitely -rc material IMHO.
> 
> Yes. Definitely.
> 
OK, agreed. Will apply into fixes.

Thanks,
Kukjin
