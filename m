From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v5 RESEND 4/5] ARM: amba: Move reading of periphid to
 amba_match()
Date: Tue, 16 Feb 2016 16:31:43 +0000
Message-ID: <20160216163143.GD19428@n2100.arm.linux.org.uk>
References: <1455101250-11327-1-git-send-email-m.szyprowski@samsung.com>
 <1455101250-11327-5-git-send-email-m.szyprowski@samsung.com>
 <20160215175250.GJ10826@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:56092 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751477AbcBPQb5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Feb 2016 11:31:57 -0500
Content-Disposition: inline
In-Reply-To: <20160215175250.GJ10826@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-samsung-soc@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

On Mon, Feb 15, 2016 at 05:52:50PM +0000, Russell King - ARM Linux wrote:
> On Wed, Feb 10, 2016 at 11:47:29AM +0100, Marek Szyprowski wrote:
> > From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > 
> > Reading the periphid when the Primecell device is registered means that
> > the apb pclk must be available by then or the device won't be registered
> > at all.
> > 
> > By reading the periphid in amba_match() we can return -EPROBE_DEFER if
> > the apb pclk isn't there yet and the device will be retried later.
> 
> I've just realised, we can't do this.  We need to read the peripheral
> ID at registration time, because that's published to userspace via
> (a) a sysfs attribute, and (b) as part of the uevent, which will be
> used by udev to locate the driver module.
> 
> So, this will have the side effect of breaking systems which have
> AMBA primecell devices configured as modules.
> 
> Sorry, I can't apply this.  We can't regress existing platforms for
> the sake of introducing new platforms to this code.

I just re-applied the patch set to the amba branch, and then dropped
the last two patches because of this issue.  Please ignore the "applied"
notification for the last two patches from the patch system.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
