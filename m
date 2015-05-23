From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: savedefconfig
Date: Sat, 23 May 2015 20:41:29 +0900
Message-ID: <CAJKOXPcaK8B3oJw=qaJhgHFH3XfYNmmkGa3MFEbdBnsokZyhDA@mail.gmail.com>
References: <555FF55E.7020701@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f51.google.com ([209.85.216.51]:39544 "EHLO
	mail-vn0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753097AbbEWLla (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 23 May 2015 07:41:30 -0400
Received: by vnbf1 with SMTP id f1so2854891vnb.6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 23 May 2015 04:41:29 -0700 (PDT)
In-Reply-To: <555FF55E.7020701@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

2015-05-23 12:34 GMT+09:00 Kukjin Kim <kgene@kernel.org>:
> This patch does 'savedefconfig' for exynos_defconfig to remove useless
> configs and check its dependencies. Sometimes some configs could be
> ignored because of the dependencies even they are enabled in defconfig
> file manually. So checking the dependencies would be better.
>
> Signed-off-by: Kukjin Kim <kgene@kernel.org>

Generated autoconf.h is almost the same as previously, so:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
