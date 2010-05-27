From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 3/4] ARM: S5PC100: Add support for Compact Flash driver
	on SMDKC100
Date: Thu, 27 May 2010 20:47:14 +0100
Message-ID: <20100527194714.GE25921@n2100.arm.linux.org.uk>
References: <1274948524-2970-1-git-send-email-kgene.kim@samsung.com> <1274948524-2970-4-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-ide-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1274948524-2970-4-git-send-email-kgene.kim@samsung.com>
Sender: linux-ide-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Abhilash Kesavan <a.kesavan@samsung.com>, ben-linux@fluff.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, May 27, 2010 at 05:22:03PM +0900, Kukjin Kim wrote:
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/io.h>
> +
> +#include <mach/gpio.h>

linux/gpio.h ?
