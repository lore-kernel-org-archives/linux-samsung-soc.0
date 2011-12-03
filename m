From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 2/3] ARM: mach-shmobile: Use common always on power domain governor
Date: Sat, 3 Dec 2011 23:31:07 +0100
Message-ID: <201112032331.07336.rjw@sisk.pl>
References: <1322765339-29879-1-git-send-email-broonie@opensource.wolfsonmicro.com> <201112022336.19993.rjw@sisk.pl> <20111203110309.GA6043@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:40464 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751805Ab1LCW2Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Dec 2011 17:28:16 -0500
In-Reply-To: <20111203110309.GA6043@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Saturday, December 03, 2011, Mark Brown wrote:
> On Fri, Dec 02, 2011 at 11:36:19PM +0100, Rafael J. Wysocki wrote:
> > On Friday, December 02, 2011, Mark Brown wrote:
> 
> > > It saves source code size when we get the second user, by itself you're
> > > right it doesn't achieve anything (except avoiding redundancy once 1/3
> > > gets applied I guess).
> 
> > But the patch removed useful code without adding any replacements, as far
> > as I could see it.
> 
> The first patch in the series added the replacement as generic code,
> this patch is deleting the shmobile specific implementation and using
> the generic code instead.

No, the first patch didn't add any replacements for the functions that the
second patch removed.  At least I don't see the replacements in the first
patch.

Thanks,
Rafael
