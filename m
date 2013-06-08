From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH V2] ARM: EXYNOS: no more support non-DT for EXYNOS SoCs
Date: Fri, 7 Jun 2013 18:13:39 -0700
Message-ID: <20130608011339.GE27436@quad.lixom.net>
References: <0a1201ce6268$d5a51610$80ef4230$%kim@samsung.com>
 <201306061812.18138.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:34300 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756548Ab3FHBNg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Jun 2013 21:13:36 -0400
Received: by mail-pb0-f52.google.com with SMTP id xa12so5278245pbc.25
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Jun 2013 18:13:36 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <201306061812.18138.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>

On Thu, Jun 06, 2013 at 06:12:17PM +0200, Arnd Bergmann wrote:
> On Thursday 06 June 2013, Kukjin Kim wrote:
> > As we discussed in mailing list, non-DT for EXYNOS SoCs will not be
> > supported from v3.11. This patch removes regarding files for non-DT
> > including board files and defconfig.
> > 
> > Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Cc: Tomasz Figa <t.figa@samsung.com>
> > Cc: Thomas Abraham <thomas.ab@samsung.com>
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Olof Johansson <olof@lixom.net>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > 
> > It's time to remove non-DT stuff for EXYNOS SoCs.
> > If no objection on this, this will be sent to arm-soc in a couple of days.
> 
> Please do. I think there are no excuses left this time ;-)

Agreed.


-Olof
