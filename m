From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 1/3] PM: Provide an always on power domain governor
Date: Mon, 5 Dec 2011 01:15:18 +0100
Message-ID: <201112050115.18489.rjw@sisk.pl>
References: <1322765339-29879-1-git-send-email-broonie@opensource.wolfsonmicro.com> <201112042156.59990.rjw@sisk.pl> <20111204231005.GA4255@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:41298 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755858Ab1LEAMW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Dec 2011 19:12:22 -0500
In-Reply-To: <20111204231005.GA4255@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Monday, December 05, 2011, Mark Brown wrote:
> On Sun, Dec 04, 2011 at 09:56:59PM +0100, Rafael J. Wysocki wrote:
> > On Thursday, December 01, 2011, Mark Brown wrote:
> 
> > > Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> 
> > Looks good with the new version of [2/3].
> 
> > Do you want me to takt it?
> 
> It might make sense for it to go via the Samsung tree - the third patch
> depends on it and there's some other stuff going on with the s3c64xx
> power management - so let's see what Kukjin thinks is best.

OTOH, it will conflict with some patches I have in the works.
