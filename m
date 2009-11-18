From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 09/19] drivers: serial: add support for Samsung S5PC110
	SoC uart
Date: Wed, 18 Nov 2009 22:13:45 +0000
Message-ID: <20091118221345.GB4808@trinity.fluff.org>
References: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com> <1258551194-16018-10-git-send-email-m.szyprowski@samsung.com> <1b68c6790911180614y355f656fs828177ecc845ec8e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:49537 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757522AbZKRWNm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Nov 2009 17:13:42 -0500
Content-Disposition: inline
In-Reply-To: <1b68c6790911180614y355f656fs828177ecc845ec8e@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Wed, Nov 18, 2009 at 11:14:52PM +0900, jassi brar wrote:
> On Wed, Nov 18, 2009 at 10:33 PM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> > From: Kyungmin Park <kyungmin.park@samsung.com>
> >
> > Samsung S5PC110 SoCs have UART that differs a bit from the one known
> > from the previous Samsung SoCs. This patch adds support for this new
> > driver.
> >
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

> Not just about this c110 patch: I think this string comparison thing
> isn't very neat.
> I think we'd better be doing it by indexing into an array of clock
> names(which can be
> defined in some platform specific code).

I don't mind changing to using a table, but the table is probably best
off here, closest to the UART drivers in question.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
