From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/1] ARM: Kconfig.debug: Update Samsung UART config
	options
Date: Wed, 25 Jun 2014 13:51:07 +0100
Message-ID: <20140625125107.GJ32514@n2100.arm.linux.org.uk>
References: <1403605171-31805-1-git-send-email-sachin.kamat@samsung.com> <03dd01cf906a$5e22b620$1a682260$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:42348 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S932160AbaFYMvL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 08:51:11 -0400
Content-Disposition: inline
In-Reply-To: <03dd01cf906a$5e22b620$1a682260$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Sachin Kamat' <sachin.kamat@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, spk.linux@gmail.com

On Wed, Jun 25, 2014 at 08:41:13PM +0900, Kukjin Kim wrote:
> Sachin Kamat wrote:
> > 
> + Russell
> 
> > In a multiplatform config, the low level debug option shows several
> > UART port entries. Improve the user visible string so that it becomes
> > clear to the user about Samsung UART ports.
> > While at it also remove some lines from the help text that are no
> > longer applicable across all Samsung platforms.
> > 
> Looks good to me and will apply into cleanup.

That's fine.  I don't have anything which clashes with this.  Thanks for
asking.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
