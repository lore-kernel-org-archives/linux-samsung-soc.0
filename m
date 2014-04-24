From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 2/4] ARM: S3C24XX: trim down debug uart handling
Date: Thu, 24 Apr 2014 11:34:55 +0100
Message-ID: <20140424103455.GJ26756@n2100.arm.linux.org.uk>
References: <1544889.hRy2JpKRQe@phil> <1410234.AYxfyBcLWB@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:47745 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754203AbaDXKft (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 06:35:49 -0400
Content-Disposition: inline
In-Reply-To: <1410234.AYxfyBcLWB@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arm@kernel.org

On Thu, Apr 24, 2014 at 12:24:31PM +0200, Heiko St=FCbner wrote:
> +choice
> +	prompt "S3C24XX low-level debugging port type"
> +	depends on DEBUG_LL && ARCH_S3C24XX
> +
> +	config DEBUG_S3C24XX_UART_S3C2440
> +		bool "S3C2440 uart type"
> +		help
> +		  Select this if you're debugging S3C2416, S3C2440, S3C2442,
> +		  S3C2443 or S3C2450 SoCs.
> +
> +	config DEBUG_S3C24XX_UART_S3C2410
> +		bool "S3C2410 uart type"
> +		help
> +		  Select this if you're debugging S3C2410 or S3C2412 SoCs.
> +endchoice

Why does this need to be a separate choice statement?  What's special
about S3C24XX?  Is there something wrong with the main choice statement
just above this where everyone else lists their debugging UART?

--=20
=46TTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... sl=
owly
improving, and getting towards what was expected from it.
