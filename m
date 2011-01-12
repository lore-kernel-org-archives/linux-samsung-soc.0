From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH/RFC 0/3] ARM: S5P: Add a common platform setup code for
 MIPI CSIS/DSIM
Date: Thu, 13 Jan 2011 07:34:52 +0900
Message-ID: <01e701cbb2a8$f048bde0$d0da39a0$%kim@samsung.com>
References: <1294153764-25006-1-git-send-email-s.nawrocki@samsung.com>
 <4D2D92F9.3000902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:16393 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754892Ab1ALWe5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jan 2011 17:34:57 -0500
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LEX00AHMLE8E540@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jan 2011 07:34:56 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LEX00JX8LE8FG@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jan 2011 07:34:56 +0900 (KST)
In-reply-to: <4D2D92F9.3000902@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <snjw23@gmail.com>
Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, 'Inki Dae' <inki.dae@samsung.com>

Sylwester Nawrocki wrote:
> 
> On 01/04/2011 04:09 PM, Sylwester Nawrocki wrote:
> > Hello,
> >
> > the following patch series adds the common platform code for configuration
> > of the MIPI CSIS and MIPI DSIM PHYs on S5PV210 and S5PV310 SoCs.
> > The spinlock is used to avoid races while the common PHY control register
> > is accessed from within MIPI DSIM and MIPI CSIS drivers.
> > The common PHY enable bit is cleared only when both CSIS and DSIM devices
> > are not in use.
> >
> >
> > The patch series contains:
> >
> > [PATCH/RFC 1/3] ARM: S5P: Add a platform callback for MIPI CSIS PHY control
> > [PATCH/RFC 2/3] ARM: S5PV310: Add a platform helper for MIPI DSIM/CSIS
> setup
> > [PATCH/RFC 3/3] ARM: S5PV210: Add a platform helper for MIPI DSIM/CSIS
> setup
> >
> 
> Any comments on this one?
> 
Hi,

It's 38 merge window now. So I want to wait until after this merge window.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
