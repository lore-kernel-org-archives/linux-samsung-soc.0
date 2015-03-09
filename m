From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL 2/2] Samsung fixes-2 for v4.0
Date: Mon, 09 Mar 2015 17:19:20 +0900
Message-ID: <076f01d05a41$be568660$3b039320$@kernel.org>
References: <54F4B33E.3070803@kernel.org> <2064108.qlOP0oDx90@wuerfel>
 <02cd01d057f6$ab1a8e40$014faac0$@kernel.org>
 <20150305123358.GC25728@developer.hsd1.ca.comcast.net>
 <20150309084418.227b3e16@amdc2363>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19783 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751254AbbCIITa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Mar 2015 04:19:30 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NKX003VZR483L80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Mar 2015 17:19:20 +0900 (KST)
In-reply-to: <20150309084418.227b3e16@amdc2363>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Lukasz Majewski' <l.majewski@samsung.com>, 'Eduardo Valentin' <edubezval@gmail.com>
Cc: 'Kukjin Kim' <kgene@kernel.org>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Lukasz Majewski wrote:
> 
> Hi Eduardo,
> 
> > On Fri, Mar 06, 2015 at 07:16:53PM +0900, Kukjin Kim wrote:
> > > Arnd Bergmann wrote:
> > > >
> > > + Eduardo
> > >
> > > Hi Arnd,
> > >
> > > > On Tuesday 03 March 2015 04:00:14 Kukjin Kim wrote:
> > > > > Please pull Samsung tmu and hdmi regression fixes for v4.0 and
> > > > > I know this is quite big for fixes but I couldn't handle this
> > > > > series for previous merge window because of dependency with
> > > > > driver side...sorry for that and please pull so that we could
> > > > > support them in v4.0 on exynos platforms.
> > > >
> > > > What kind of dependency do you have there? It really should not be
> > > > necessary to wait for driver changes, unless you do an
> > > > incompatible DT binding change, which you should avoid.
> > > >
> > > For TMU patches, I've asked Eduardo to provide topic branch for
> > > 'include/dt-bindings/thermal/thermal_exynos.h' has been added via
> > > thermal tree because if I can't apply the patch in Samsung tree for
> > > arm-soc, kernel build breakage will be happened. But I couldn't get
> > > Eduardo's topic branch.
> >
> >
> > Specifically, the developer, while migrating the driver to support DT
> > and OF thermal, decided to create a header with constants. The header
> > is used by DT files and the driver code. The header was the
> > dependency.
> 
> Just my 2 cents :-).
> 
> The above situation is the justification for adding the whole patch set
> to one repository when all ACKs are collected for it.
> 
I don't think so, even your series can be upstreamed though, other useless
merge conflicts would be happened so we decided all of DT should be handled
in arch side not driver side. So please don't argue about that.

- Kukjin
