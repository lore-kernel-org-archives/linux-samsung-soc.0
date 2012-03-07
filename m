From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/4] S3C24XX: Another move of code to the new mach directory
Date: Wed, 07 Mar 2012 03:18:16 -0800
Message-ID: <4F5743F8.4040001@samsung.com>
References: <201203061057.15815.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:36424 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753067Ab2CGLST (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Mar 2012 06:18:19 -0500
Received: by mail-tul01m020-f174.google.com with SMTP id uo6so6773643obb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Mar 2012 03:18:19 -0800 (PST)
In-Reply-To: <201203061057.15815.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 03/06/12 01:57, Heiko St=FCbner wrote:
> This series contains the easy moves of common code for the SMDKs,
> Simtec boards and device setup from plat-s3c24xx to mach-s3c24xx.
>
> It also contains an extra patch to keep the Simtec code more together=
=2E
>
> Changes to the Kconfig and Makefile will probably conflict with the
> S3C2416-SPI series posted sunday, but this is ok, as the SPI series
> will probably have to wait for 3.5 anyway and can be redone then.
>
OK, I agree so applied this whole series.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
