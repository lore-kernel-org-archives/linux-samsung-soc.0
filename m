From: Olof Johansson <olof@lixom.net>
Subject: Broken device trees for exynos in linux-next
Date: Thu, 15 Aug 2013 09:43:37 -0700
Message-ID: <CAOesGMgv9gTQ_NtaKZY_ZfLD1NBU19E-vaLaWwmvGJJB1MQrwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f47.google.com ([209.85.216.47]:36783 "EHLO
	mail-qa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757521Ab3HOQnr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Aug 2013 12:43:47 -0400
Received: by mail-qa0-f47.google.com with SMTP id o19so1851315qap.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Aug 2013 09:43:46 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Kukjin,

On Thu, Aug 15, 2013 at 12:34 AM,  <build@lixom.net> wrote:

>         exynos5440_defconfig:
> ERROR: Input tree has errors, aborting (use -f to force output)
>
>         exynos_defconfig:
> ERROR: Input tree has errors, aborting (use -f to force output)

Full error is:

  DTC     arch/arm/boot/dts/exynos5420-smdk5420.dtb
ERROR (phandle_references): Reference to non-existent node or label "pdma1"
ERROR (phandle_references): Reference to non-existent node or label "pdma1"
ERROR (phandle_references): Reference to non-existent node or label "pdma0"
ERROR (phandle_references): Reference to non-existent node or label "pdma0"

Looks like you have broken device trees in linux next. Also, what is
exynos5440_defconfig? Don't add contents (which includes defconfigs)
to linux-next branches that won't make it all the way upstream.


Thanks,

-Olof
