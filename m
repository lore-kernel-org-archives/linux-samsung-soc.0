From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 2/3] ARM: mach-shmobile: Use common always on power domain governor
Date: Sun, 4 Dec 2011 20:53:14 +0100
Message-ID: <201112042053.14351.rjw@sisk.pl>
References: <1322765339-29879-1-git-send-email-broonie@opensource.wolfsonmicro.com> <201112032331.07336.rjw@sisk.pl> <20111204012239.GA31215@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:41037 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754636Ab1LDTuS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Dec 2011 14:50:18 -0500
In-Reply-To: <20111204012239.GA31215@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Sunday, December 04, 2011, Mark Brown wrote:
> On Sat, Dec 03, 2011 at 11:31:07PM +0100, Rafael J. Wysocki wrote:
> > On Saturday, December 03, 2011, Mark Brown wrote:
> 
> > > The first patch in the series added the replacement as generic code,
> > > this patch is deleting the shmobile specific implementation and using
> > > the generic code instead.
> 
> > No, the first patch didn't add any replacements for the functions that the
> > second patch removed.  At least I don't see the replacements in the first
> > patch.
> 
> Oh, right.  It'd really help if you were more specific.  I'd probably
> have realised earlier that you are probably talking about the stop_dev
> and start_dev functions which appear to have got caught up in the mess
> of a rebase somehow - I didn't intentionally remove them as their
> absence from the patch description and the lack of any removal of
> references to them should suggest.

Well, I mentioned these two functions specifically in my first reply to the
patch message. :-)

Thanks,
Rafael
