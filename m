From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH 0/6] ARM: s3cxxxx: Use PWM lookup table
Date: Tue, 13 Oct 2015 04:17:29 +0900
Message-ID: <561C0749.6020703@kernel.org>
References: <1444049237-29878-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:49091 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752724AbbJLTRe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2015 15:17:34 -0400
In-Reply-To: <1444049237-29878-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 10/05/15 21:47, Thierry Reding wrote:
> Back when the PWM framework was introduced the concept of PWM lookup
> tables was added to allow board code to register a table of PWM devices
> and their association with consumers. The goal is to allow drivers to
> use a unified method to request PWM devices. At the same time, since no
> boards were exposing these tables, fallback code was kept in drivers to
> allow old code to remain functional. In order to get rid of the legacy
> fallback code, legacy users need to be updated to register PWM lookup
> tables.
> 
> This series converts all s3c24xx and s3c64xx boards that hook up a pwm-
> backlight device to use the new PWM lookup tables. All patches have been
> compile-tested, but I don't have access to any of these boards, so I
> couldn't verify that they really work.
> 
> Thierry
> 
> Thierry Reding (6):
>   ARM: s3c24xx: h1940: Use PWM lookup table
>   ARM: s3c24xx: rx1950: Use PWM lookup table
>   ARM: s3c64xx: smdk6410: Use PWM lookup table
>   ARM: s3c64xx: crag6410: Use PWM lookup table
>   ARM: s3c64xx: hmt: Use PWM lookup table
>   ARM: s3c64xx: smartq: Use PWM lookup table
> 
>  arch/arm/mach-s3c24xx/mach-h1940.c    | 10 +++++++---
>  arch/arm/mach-s3c24xx/mach-rx1950.c   |  8 ++++++--
>  arch/arm/mach-s3c64xx/dev-backlight.c |  4 ----
>  arch/arm/mach-s3c64xx/mach-crag6410.c |  9 +++++++--
>  arch/arm/mach-s3c64xx/mach-hmt.c      |  9 +++++++--
>  arch/arm/mach-s3c64xx/mach-smartq.c   |  9 +++++++--
>  arch/arm/mach-s3c64xx/mach-smdk6410.c |  8 +++++++-
>  7 files changed, 41 insertions(+), 16 deletions(-)
> 
Applied this whole series with Krzysztof's review tag.

Thanks,
Kukjin
