From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/7] clk: exynos: prepare for multiplatform
Date: Mon, 15 Apr 2013 12:01:43 +0530
Message-ID: <CAJuYYwRfoU1y_3qbZtdhdyRugPD_QCYWr_LuesOXzq+-jmxouw@mail.gmail.com>
References: <1365775405-115297-1-git-send-email-arnd@arndb.de>
	<1365775405-115297-2-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:64188 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751299Ab3DOGbo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Apr 2013 02:31:44 -0400
Received: by mail-ie0-f181.google.com with SMTP id as1so920539iec.26
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Apr 2013 23:31:43 -0700 (PDT)
In-Reply-To: <1365775405-115297-2-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Chanho Park <chanho61.park@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mike Turquette <mturquette@linaro.org>

On 12 April 2013 19:33, Arnd Bergmann <arnd@arndb.de> wrote:
> The new common clock drivers for exynos are using compile
> time constants and soc_is_exynos* macros to provide backwards
> compatibility for pre-DT systems, which is not possible with
> multiplatform kernels. This moves all the necessary
> information back into platform code and removes the mach/*
> header inclusions.


Since kgene has submitted a patch to remove pre-dt Exynos support
which looks like it will be accepted, we could just remove the use of
soc_is_xyz() instead of continuing to support non-dt Exynos.

Thanks,
Thomas.
