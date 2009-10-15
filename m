From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2 2/4] S3C: sdhci: Update sdhci platform data.
Date: Thu, 15 Oct 2009 11:16:12 +0100
Message-ID: <20091015101612.GC884@sirena.org.uk>
References: <1255586371-28042-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:38787 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752662AbZJOKQt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Oct 2009 06:16:49 -0400
Content-Disposition: inline
In-Reply-To: <1255586371-28042-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

On Thu, Oct 15, 2009 at 02:59:31PM +0900, Thomas Abraham wrote:
> This patch removes the unsed host_caps field entry from the sdhci platform data
> structure. It then adds three new fields for specifying parent clock name,
> source clock name and clock frequency for sdhci controller. This patch also
> does corresponding fixups for sdhci-0 amd sdhci-1 controller's platform data.

Why is this required?  Passing clock names around as platform data is
generally frowned upon within the clock API - the idea is that this
should all be mapped within the clock API and the drivers should just
request fixed clock names with any setup done in the board
initialisation.  Perhaps clkdev support for the S3C platforms would help
here?
