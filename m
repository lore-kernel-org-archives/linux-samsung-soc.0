From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC PATCH] ARM: exynos_defconfig: Increase
 CONFIG_BLK_DEV_RAM_SIZE to 64K
Date: Mon, 19 Oct 2015 12:51:51 +0100
Message-ID: <20151019115150.GY32532@n2100.arm.linux.org.uk>
References: <1445251715-9725-1-git-send-email-alim.akhtar@samsung.com>
 <5624D87D.4090901@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:47372 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751392AbbJSLwA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 07:52:00 -0400
Content-Disposition: inline
In-Reply-To: <5624D87D.4090901@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, k.kozlowski@samsung.com, kgene@kernel.org, linux-arm-kernel@lists.infradead.org

On Mon, Oct 19, 2015 at 01:48:13PM +0200, Javier Martinez Canillas wrote:
> Hello Alim,
> 
> On 10/19/2015 12:48 PM, Alim Akhtar wrote:
> > CONFIG_BLK_DEV_RAM_SIZE is currently set to 8K, which is a bit on the
> > smaller side, lets bump it up to 64K so that a bigger RAM_DISK can
> > be used with defconfig.
> > 
> > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> > ---
> 
> I agree that 8KiB is too small and that should be bumped, I'm also
> not sure what the best size would be but 64KiB sounds reasonable
> to me. So for this patch:

It's _not_ 8KiB or 64KiB.

config BLK_DEV_RAM_SIZE
        int "Default RAM disk size (kbytes)"

It's 8MiB or 64MiB - the value you place here is in units of 1024 bytes.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
