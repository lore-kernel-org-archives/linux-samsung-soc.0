From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 00/14] ARM: samsung-time: Prepare for multiplatform support
Date: Fri, 5 Apr 2013 01:15:02 +0200
Message-ID: <201304050115.03879.heiko@sntech.de>
References: <1365093431-30621-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:35615 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1764883Ab3DDXPR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 19:15:17 -0400
In-Reply-To: <1365093431-30621-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, sameo@linux.intel.com, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, tomasz.figa@gmail.com, robherring2@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de

Am Donnerstag, 4. April 2013, 18:36:57 schrieb Tomasz Figa:
> This series is an attempt to make the samsung-time clocksource driver ready
> for multiplatform kernels. It moves the driver to drivers/clocksource,
> cleans it up from uses of static platform-specific definitions, simplifies
> timer interrupt handling and adds Device Tree support.
> 
> Only samsung-time driver is reworked to use the master driver at this time,
> since the PWM driver can be already considered broken at the moment and
> needs separate series of several patches to fix and clean it up, which
> I am already working on.
> 
> Tested on Universal C210 board with Device Tree. Not tested without
> Device Tree, since it has been already broken before this series.
> Compile tested for other related SoCs.

Looks nice.

On a non-DT S3C2416 board:
Tested-by: Heiko Stuebner <heiko@sntech.de>


And just so I don't search myself silly, am I right in thinking that the 
driver does not use the generic clocksource registration yet and dt machines 
must still use samsung_timer_init at this point?


Heiko
