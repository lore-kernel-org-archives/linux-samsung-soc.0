From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 1/3] PM: Provide an always on power domain governor
Date: Wed, 7 Dec 2011 22:28:02 +0100
Message-ID: <201112072228.02916.rjw@sisk.pl>
References: <1322765339-29879-1-git-send-email-broonie@opensource.wolfsonmicro.com> <201112062239.57001.rjw@sisk.pl> <20111207123459.GB18715@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:48069 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756686Ab1LGVZF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Dec 2011 16:25:05 -0500
In-Reply-To: <20111207123459.GB18715@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Paul Mundt' <lethal@linux-sh.org>, 'Magnus Damm' <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Wednesday, December 07, 2011, Mark Brown wrote:
> On Tue, Dec 06, 2011 at 10:39:56PM +0100, Rafael J. Wysocki wrote:
> > On Tuesday, December 06, 2011, Kukjin Kim wrote:
> 
> > > Rafael, please let me know the branch when you create it so that I can merge
> > > it into Samsung tree to avoid other conflicts.
> 
> > I need an ack from Magnus or Paul on the shmobile patch. When I get one, I'll
> > put patches [1/3] and [2/3] (new version) into my linux-next branch and then
> > (after a few days spent in linux-next) to the pm-domains branch.  I'll let you
> > know when that happens.
> 
> Well, I guess you could put patch 1 and 3 in then add 2 if an ack is
> forthcoming for that - there's no direct dependency.

It's been acked already, I'm going to pul all three patches into
linux-pm/linux-next later today.

Thanks,
Rafael
