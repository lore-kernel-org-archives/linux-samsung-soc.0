From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/2] SPI: S5PC100: Enable the SPI driver for S5PC100
Date: Tue, 5 Jul 2011 11:05:06 +0100
Message-ID: <20110705100506.GT8286@n2100.arm.linux.org.uk>
References: <1309801476-29678-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:58232 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753395Ab1GEKFR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 06:05:17 -0400
Content-Disposition: inline
In-Reply-To: <1309801476-29678-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Mon, Jul 04, 2011 at 01:44:35PM -0400, Padmavathi Venna wrote:
>  config SPI_S3C64XX
>  	tristate "Samsung S3C64XX series type SPI"
> -	depends on (ARCH_S3C64XX || ARCH_S5P64X0)
> +	depends on (ARCH_S3C64XX || ARCH_S5P64X0 || ARCH_S5PC100)

Just get rid of the unnecessary parens here.
