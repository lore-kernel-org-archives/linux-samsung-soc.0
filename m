From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 00/33] Use common macro to define resources
Date: Wed, 25 Apr 2012 12:35:21 +0100
Message-ID: <20120425113521.GW24211@n2100.arm.linux.org.uk>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org> <201204250938.58397.heiko@sntech.de> <20120425101007.GM9142@game.jcrosoft.org> <201204251121.47358.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:49060 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758825Ab2DYLfh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 07:35:37 -0400
Content-Disposition: inline
In-Reply-To: <201204251121.47358.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Tushar Behera <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, patches@linaro.org

On Wed, Apr 25, 2012 at 11:21:47AM +0000, Arnd Bergmann wrote:
> Note that the point of the DEFINE_RES_*() macros is really to prevent
> people from coming up with new silly macros to do the same thing, as
> we've had in the past.

One of the other reaons was to stop the stream of resources with wrong
endings (because people kept thinking it was exclusive rather than
inclusive) - and the resulting stream of additional patches to fix those
errors.

The legacy platforms do have those kinds of errors - when I converted
SA11x0 as part of a previous patch set, I found a number suffering from
this error.  (Were any found in this patch set?  I've not read through
it.)

I think if this becomes a small %age of the change to Samsung stuff,
and Kukjin is happy with it, it should go in.
