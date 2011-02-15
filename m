From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: S5PC210: add support for i2c PMICs on
	Universal_C210 board
Date: Tue, 15 Feb 2011 11:35:04 +0000
Message-ID: <20110215113504.GF4152@n2100.arm.linux.org.uk>
References: <1297767555-13326-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:58411 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754363Ab1BOLfP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Feb 2011 06:35:15 -0500
Content-Disposition: inline
In-Reply-To: <1297767555-13326-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com

On Tue, Feb 15, 2011 at 11:59:15AM +0100, Marek Szyprowski wrote:
>  #include <mach/map.h>
> +#include <mach/gpio.h>

Need I say anything about this?
