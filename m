From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCHv2 7/7] ARM: S5PC110: add support for MMC regulators on
	Goni board
Date: Mon, 20 Sep 2010 14:03:44 +0100
Message-ID: <20100920130344.GC31167@sirena.org.uk>
References: <1284987337-15365-1-git-send-email-m.szyprowski@samsung.com> <1284987337-15365-8-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:33707 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756104Ab0ITNDq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Sep 2010 09:03:46 -0400
Content-Disposition: inline
In-Reply-To: <1284987337-15365-8-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

On Mon, Sep 20, 2010 at 02:55:37PM +0200, Marek Szyprowski wrote:
> Add required platform definitions for MMC power regulators on Samsung
> Goni board. GPIO pin GONI_EXT_FLASH_EN has been transferred from machine
> startup code to fixed voltage regulator.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

Looks good from a regulator API point of view:

Reviewed-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
