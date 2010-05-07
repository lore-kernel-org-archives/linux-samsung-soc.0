From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH 4/6] ARM: S3C64XX: Adds Touch Screen Driver Support for S3C6410
Date: Fri, 07 May 2010 11:55:56 +0200
Message-ID: <35ca77fb-232a-459d-95dd-970308d3e9ba@email.android.com>
References: <1273213885-6498-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:44815 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756309Ab0EGJ4L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 May 2010 05:56:11 -0400
Received: by ey-out-2122.google.com with SMTP id d26so107881eyd.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 May 2010 02:56:08 -0700 (PDT)
In-Reply-To: <1273213885-6498-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Naveen Krishna <ch.naveen@samsung.com>

Hi Naveen,

"Kukjin Kim" <kgene.kim@samsung.com> wrote:

>From: Naveen Krishna <ch.naveen@samsung.com>
>
>Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
>Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>---
> arch/arm/mach-s3c64xx/Kconfig          |    1 +
> arch/arm/mach-s3c64xx/mach-smdk6410.c  |   12 +++++++
> arch/arm/mach-s3c64xx/s3c6410.c        |    1 +
> arch/arm/plat-samsung/Kconfig          |    5 +++
> arch/arm/plat-samsung/Makefile         |    1 +
> arch/arm/plat-samsung/dev-ts.c         |   54 ++++++++++++++++++++++++++++++++
> drivers/input/touchscreen/Kconfig      |    3 +-
> drivers/input/touchscreen/s3c2410_ts.c |   19 +++++++++--
> 8 files changed, 92 insertions(+), 4 deletions(-)
> create mode 100644 arch/arm/plat-samsung/dev-ts.c
>

I'm sure you've seen my patch which does pretty much the same wrt adjusting s3c2410_ts.c.
Though that one has already been acked by Ben so I'm unsure what should happen: you adjusting your patchset or me dropping mine (obviously I prefer the former :) ).

P.S.: I'd recommend splitting this patch and sending the drivers/input part to the linux-input mailing list.

--
Maurus Cuelenaere
