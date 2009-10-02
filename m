From: Harald Welte <laforge@gnumonks.org>
Subject: Re: [PATCH 0/5] S3C: sdhci: Update Samsung 6410 SDHCI driver.
Date: Fri, 2 Oct 2009 09:48:06 +0200
Message-ID: <20091002074806.GB19548@prithivi.gnumonks.org>
References: <33519709.339161254183501956.JavaMail.weblogic@epml10>
 <20091001125238.GD14417@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:37353 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756832AbZJBHsI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Oct 2009 03:48:08 -0400
Content-Disposition: inline
In-Reply-To: <20091001125238.GD14417@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: THOMAS P ABRAHAM <thomas.ab@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Mark,

On Thu, Oct 01, 2009 at 01:52:39PM +0100, Mark Brown wrote:
 
> Could you clarify what the policy is here?  I've noticed that some of
> the patches posted to this list are being sent to Ben directly which
> seems to work against the goal of cleaning stuff up pre-submission.

see Kukjin Kim's explanation.  The point of this mailinglist is mainly to make
sure the actual maintainers (like Ben) already get patches that have some level
of review, and they don't have to both with things like incomplete commit
messages, whitespace changes, or other things that are "obvious" to people with
more mainline experience.

Once that has been achieved, the patches should be forwarded to Ben and
linux-arm-kernel (or whatever other apropriate mailinglist/maintainer depending
on the files the patch touches) for actual merging.

The fact that Ben has decided to also hang out on this list and spend some
of his time on review is of course great, but we cannot be sure how much time
he can dedicate to this.  The amount of code that Samsung System LSI needs
to push is very big, and not everything is already in as good a shape as the
patches that you have seen so far.

Regards,
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
