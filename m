From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 2/3] ARM: mach-shmobile: Use common always on power domain governor
Date: Fri, 2 Dec 2011 23:36:19 +0100
Message-ID: <201112022336.19993.rjw@sisk.pl>
References: <1322765339-29879-1-git-send-email-broonie@opensource.wolfsonmicro.com> <201112012137.08119.rjw@sisk.pl> <20111202003333.GC31903@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:39731 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755539Ab1LBWd2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Dec 2011 17:33:28 -0500
In-Reply-To: <20111202003333.GC31903@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Friday, December 02, 2011, Mark Brown wrote:
> On Thu, Dec 01, 2011 at 09:37:07PM +0100, Rafael J. Wysocki wrote:
> > On Thursday, December 01, 2011, Mark Brown wrote:
> > > Saves a tiny amount of code.
> 
> > How so?
> 
> It saves source code size when we get the second user, by itself you're
> right it doesn't achieve anything (except avoiding redundancy once 1/3
> gets applied I guess).

But the patch removed useful code without adding any replacements, as far
as I could see it.

Thanks,
Rafael
