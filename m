From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/3] PM: Provide an always on power domain governor
Date: Sun, 4 Dec 2011 23:10:05 +0000
Message-ID: <20111204231005.GA4255@opensource.wolfsonmicro.com>
References: <1322765339-29879-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <201112042156.59990.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:42524 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755097Ab1LDXKI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Dec 2011 18:10:08 -0500
Content-Disposition: inline
In-Reply-To: <201112042156.59990.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Sun, Dec 04, 2011 at 09:56:59PM +0100, Rafael J. Wysocki wrote:
> On Thursday, December 01, 2011, Mark Brown wrote:

> > Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

> Looks good with the new version of [2/3].

> Do you want me to takt it?

It might make sense for it to go via the Samsung tree - the third patch
depends on it and there's some other stuff going on with the s3c64xx
power management - so let's see what Kukjin thinks is best.
