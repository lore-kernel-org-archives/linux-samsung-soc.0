From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v3 6/6] pinctrl: exynos: Handle suspend/resume of GPIO EINT
 registers
Date: Fri, 24 May 2013 11:23:23 +0200
Message-ID: <2032031.lFyZLmqevW@amdc1227>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
 <3059629.yu4Ei1BXhd@amdc1227>
 <CACRpkdbN4Nxg2VSr0bf+h4Y2U=CmX9mijdZz+=tom9V0-i-69g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:12365 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760028Ab3EXJXa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 05:23:30 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MNA00IPUPTR2K20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 24 May 2013 10:23:29 +0100 (BST)
In-reply-to: <CACRpkdbN4Nxg2VSr0bf+h4Y2U=CmX9mijdZz+=tom9V0-i-69g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Hi Linus,

On Friday 24 of May 2013 11:12:00 Linus Walleij wrote:
> On Wed, May 22, 2013 at 4:03 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> > Some GPIO EINT control registers needs to be preserved across
> > suspend/resume cycle. This patch extends the driver to take care of
> > this.
> > 
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> > 
> > Changes since v2:
> >  - Fixed error path
> > 
> > Changes since v1:
> >  - Added optional debugging messages
> >  - Added proper error path in initialization
> 
> v2 version applied for fixes.

I posted v3 two days ago. It fixes a stupid mistake in error path I made in a 
hurry and also addresses some suggestions from Doug.

> Again confirm you must really have all this. It is not looking
> good with diffstats like this for fixing regressions.

Yes. The whole series is necessary to have correct suspend/resume support of 
DT-enabled Exynos boards.

Best regards,
-- 
Tomasz Figa
Linux Kernel Developer
Samsung R&D Institute Poland
Samsung Electronics
