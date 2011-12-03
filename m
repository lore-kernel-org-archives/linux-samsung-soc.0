From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] ARM: mach-shmobile: Use common always on power
 domain governor
Date: Sat, 3 Dec 2011 11:03:09 +0000
Message-ID: <20111203110309.GA6043@opensource.wolfsonmicro.com>
References: <1322765339-29879-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <201112012137.08119.rjw@sisk.pl>
 <20111202003333.GC31903@opensource.wolfsonmicro.com>
 <201112022336.19993.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:44970 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754498Ab1LCLD3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Dec 2011 06:03:29 -0500
Content-Disposition: inline
In-Reply-To: <201112022336.19993.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Dec 02, 2011 at 11:36:19PM +0100, Rafael J. Wysocki wrote:
> On Friday, December 02, 2011, Mark Brown wrote:

> > It saves source code size when we get the second user, by itself you're
> > right it doesn't achieve anything (except avoiding redundancy once 1/3
> > gets applied I guess).

> But the patch removed useful code without adding any replacements, as far
> as I could see it.

The first patch in the series added the replacement as generic code,
this patch is deleting the shmobile specific implementation and using
the generic code instead.
