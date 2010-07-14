From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/3] ARM: S5PV210: GONI: add support for MAX8998 PMIC
Date: Wed, 14 Jul 2010 09:33:33 +0100
Message-ID: <20100714083332.GB5933@sirena.org.uk>
References: <1279095416-24871-1-git-send-email-m.szyprowski@samsung.com> <1279095416-24871-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:47831 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751427Ab0GNIdd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jul 2010 04:33:33 -0400
Content-Disposition: inline
In-Reply-To: <1279095416-24871-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

On Wed, Jul 14, 2010 at 10:16:56AM +0200, Marek Szyprowski wrote:
> This patch adds required platform definitions for MAX8998 PMIC driver. Power
> regulators for LDO and BUCK outputs has been defined as well as a simple
> gpio-keys button for power key (to enable wakeup functionality with
> external interrupt).
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

For the regulator API usage:

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
