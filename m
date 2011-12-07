From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/3] PM: Provide an always on power domain governor
Date: Wed, 7 Dec 2011 12:35:00 +0000
Message-ID: <20111207123459.GB18715@opensource.wolfsonmicro.com>
References: <1322765339-29879-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <20111205001500.GA10173@opensource.wolfsonmicro.com>
 <02d601ccb400$a19380e0$e4ba82a0$%kim@samsung.com>
 <201112062239.57001.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:41614 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755631Ab1LGMgZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Dec 2011 07:36:25 -0500
Content-Disposition: inline
In-Reply-To: <201112062239.57001.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Paul Mundt' <lethal@linux-sh.org>, 'Magnus Damm' <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Tue, Dec 06, 2011 at 10:39:56PM +0100, Rafael J. Wysocki wrote:
> On Tuesday, December 06, 2011, Kukjin Kim wrote:

> > Rafael, please let me know the branch when you create it so that I can merge
> > it into Samsung tree to avoid other conflicts.

> I need an ack from Magnus or Paul on the shmobile patch. When I get one, I'll
> put patches [1/3] and [2/3] (new version) into my linux-next branch and then
> (after a few days spent in linux-next) to the pm-domains branch.  I'll let you
> know when that happens.

Well, I guess you could put patch 1 and 3 in then add 2 if an ack is
forthcoming for that - there's no direct dependency.
