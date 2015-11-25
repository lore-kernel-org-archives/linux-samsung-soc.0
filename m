From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/2] drivers: amba: properly handle devices with power
 domains
Date: Wed, 25 Nov 2015 18:09:53 +0000
Message-ID: <20151125180953.GN8644@n2100.arm.linux.org.uk>
References: <1448456127-31842-1-git-send-email-m.szyprowski@samsung.com>
 <1448456289-31960-1-git-send-email-m.szyprowski@samsung.com>
 <20151125132458.GL8644@n2100.arm.linux.org.uk>
 <5655B8F6.1070104@samsung.com>
 <CAPDyKFqTqPijF+Lbq0+a-Gv8CyaAr13JvZPjUN1-GNL5i3-mAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:57757 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752086AbbKYSKC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Nov 2015 13:10:02 -0500
Content-Disposition: inline
In-Reply-To: <CAPDyKFqTqPijF+Lbq0+a-Gv8CyaAr13JvZPjUN1-GNL5i3-mAw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, Nov 25, 2015 at 02:56:10PM +0100, Ulf Hansson wrote:
> On 25 November 2015 at 14:34, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > Is ignoring dev_pm_domain_attach() return value a solution for you?
> 
> That's probably better than nothing, but I wonder if it in practice
> will have any effect?

If the PM domain is down, then trying to tread the ID is likely to oops
the kernel.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
