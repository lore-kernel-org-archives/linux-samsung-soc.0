From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH v2] ARM: SAMSUNG: Move GPIO common functions to
	plat-samsung for Samsung's SoCs
Date: Mon, 18 Jan 2010 02:21:30 +0000
Message-ID: <20100118022130.GH10014@trinity.fluff.org>
References: <1263552730-16187-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:38361 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751984Ab0ARCVc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jan 2010 21:21:32 -0500
Content-Disposition: inline
In-Reply-To: <1263552730-16187-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Aditya Pratap Sharma <aditya.ps@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>

On Fri, Jan 15, 2010 at 07:52:10PM +0900, Kukjin Kim wrote:
> This patch moves GPIO common functions (from plat-s3c64xx) into plat-samsung.
> and adds the config option to build the plat-samsung/gpiolib for Samsung SoCs.
> 
> Changes since v1:
> 
> Address comments from Ben
> 
> Signed-off-by: Aditya Pratap Sharma <adityaps@samsung.com>
> Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/plat-s3c/include/plat/gpio-core.h |    3 +
>  arch/arm/plat-s3c64xx/Kconfig              |    1 +
>  arch/arm/plat-s3c64xx/gpiolib.c            |  162 +----------------------
>  arch/arm/plat-samsung/Kconfig              |    7 +
>  arch/arm/plat-samsung/Makefile             |    1 +
>  arch/arm/plat-samsung/gpiolib.c            |  202 ++++++++++++++++++++++++++++
>  6 files changed, 216 insertions(+), 160 deletions(-)
>  create mode 100644 arch/arm/plat-samsung/gpiolib.c

We add CONFIG_SAMSUNG_GPIOLIB in this patch to indicate our support for
the moved gpiolib code, however this code is only dealing with the case
where we have 4bit control registers, the code to deal with the 2bit
case is still in arch/arm/plat-s3c/gpio.c along with some other common
functionality.

I'm just wondering whether to ask for SAMSUNG_GPIOLIB to be renamed
to SAMSUNG_GPIOLIB_4BIT or leave this for the moment as the older
code is being implicity compiled so could be simply moved from the
arch/arm/plat-s3c to arch/arm/plat-samsung easily.

-- 
Ben
