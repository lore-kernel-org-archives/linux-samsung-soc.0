From: Tushar Behera <tushar.behera@linaro.org>
Subject: Build failure on linux-next
Date: Wed, 14 Aug 2013 14:44:22 +0530
Message-ID: <CAHbNUh0ydr7-8rhoOz2+aQYGSNHYiO3bO6WBx6+TYoSqFm2M=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:56180 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759675Ab3HNJOX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 05:14:23 -0400
Received: by mail-oa0-f48.google.com with SMTP id o17so12736923oag.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2013 02:14:23 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi,

We are getting a build failure on today's linux-next (next-20130814)
with exynos_defconfig.

  DTC     arch/arm/boot/dts/exynos5420-smdk5420.dtb
ERROR (phandle_references): Reference to non-existent node or label "pdma1"

ERROR (phandle_references): Reference to non-existent node or label "pdma1"

ERROR (phandle_references): Reference to non-existent node or label "pdma0"

ERROR (phandle_references): Reference to non-existent node or label "pdma0"

ERROR: Input tree has errors, aborting (use -f to force output)
make[1]: *** [arch/arm/boot/dts/exynos5420-smdk5420.dtb] Error 2
make: *** [dtbs] Error 2


-- 
Tushar Behera
