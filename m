From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH 5/5] ARM: S3C64XX: Add wifi RF kill support for SmartQ
 boards
Date: Tue, 17 Aug 2010 14:01:12 +0200
Message-ID: <4C6A7A08.6060709@gmail.com>
References: <4c659a71.d37b0e0a.4deb.ffffcd80@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:47318 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751647Ab0HQMBQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Aug 2010 08:01:16 -0400
Received: by eyg5 with SMTP id 5so1843306eyg.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Aug 2010 05:01:15 -0700 (PDT)
In-Reply-To: <4c659a71.d37b0e0a.4deb.ffffcd80@mx.google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org

 Op 13-08-10 21:18, Maurus Cuelenaere schreef:
> This patch create a new platform driver which adds support for RF kill to the
> on-board WM-G-MR-09 wifi chip. It also adds the platform device glue to the
> SmartQ board definitions.
>
> Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
> ---
>  arch/arm/mach-s3c64xx/Kconfig       |    7 ++
>  arch/arm/mach-s3c64xx/Makefile      |    3 +
>  arch/arm/mach-s3c64xx/mach-smartq.c |   38 ++--------
>  arch/arm/mach-s3c64xx/smartq-wifi.c |  135 +++++++++++++++++++++++++++++++++++
>  4 files changed, 152 insertions(+), 31 deletions(-)
>  create mode 100644 arch/arm/mach-s3c64xx/smartq-wifi.c

@Ben:
Any specific reason why you didn't pick this up?

-- 
Maurus Cuelenaere
