From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 0/3] Deterministic UART numbering on Samsung SoCs
Date: Thu, 26 Jun 2014 12:39:39 +0100
Message-ID: <20140626113939.GP32514@n2100.arm.linux.org.uk>
References: <1403781875-5425-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:43625 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756355AbaFZLjs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 07:39:48 -0400
Content-Disposition: inline
In-Reply-To: <1403781875-5425-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, Daniel Drake <drake@endlessm.com>, Tomasz Figa <tomasz.figa@gmail.com>

On Thu, Jun 26, 2014 at 01:24:32PM +0200, Tomasz Figa wrote:
> Current Samsung UART driver relies on probe order of particular
> samsung-uart instances, which makes it impossible to get proper
> initialization of ports when not all ports are available on board,
> not even saying of deterministic device naming.
> 
> This series intends to fix this situation by adding support to parse
> aliases from device tree and use them to assign instance IDs to
> particular port instances.

How about instead exporting the path/id information so that userspace
can create /dev/serial/by-{path,id}/... for internal devices instead?

The problem you're raising is very much the same problem you have when
there are multiple USB serial devices connected to the machine - you
just get a bunch of /dev/ttyUSB* devices which are unordered (they can
change on each boot, or change order if you disconnect and reconnect
them.)

/dev/serial/by-{path,id}/ allows for a much more stable path.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
