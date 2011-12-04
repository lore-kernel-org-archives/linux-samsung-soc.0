From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] ARM: mach-shmobile: Use common always on power
 domain governor
Date: Sun, 4 Dec 2011 01:22:40 +0000
Message-ID: <20111204012239.GA31215@opensource.wolfsonmicro.com>
References: <1322765339-29879-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <201112022336.19993.rjw@sisk.pl>
 <20111203110309.GA6043@opensource.wolfsonmicro.com>
 <201112032331.07336.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:43612 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752479Ab1LDBWn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Dec 2011 20:22:43 -0500
Content-Disposition: inline
In-Reply-To: <201112032331.07336.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Sat, Dec 03, 2011 at 11:31:07PM +0100, Rafael J. Wysocki wrote:
> On Saturday, December 03, 2011, Mark Brown wrote:

> > The first patch in the series added the replacement as generic code,
> > this patch is deleting the shmobile specific implementation and using
> > the generic code instead.

> No, the first patch didn't add any replacements for the functions that the
> second patch removed.  At least I don't see the replacements in the first
> patch.

Oh, right.  It'd really help if you were more specific.  I'd probably
have realised earlier that you are probably talking about the stop_dev
and start_dev functions which appear to have got caught up in the mess
of a rebase somehow - I didn't intentionally remove them as their
absence from the patch description and the lack of any removal of
references to them should suggest.
