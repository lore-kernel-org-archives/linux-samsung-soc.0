From: Kevin Hilman <khilman@linaro.org>
Subject: Re: Broken device trees for exynos in linux-next
Date: Mon, 19 Aug 2013 08:15:35 -0700
Message-ID: <8738q5lnjc.fsf@kernel.org>
References: <CAOesGMgv9gTQ_NtaKZY_ZfLD1NBU19E-vaLaWwmvGJJB1MQrwg@mail.gmail.com>
	<13b101ce9a14$2cebd700$86c38500$@org>
	<CAOesGMiyNM6VdNzKQU3XwoiacJV8hc60mcLiH+vHoS6xJM6q-A@mail.gmail.com>
	<159201ce9b36$2a513f30$7ef3bd90$@org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:51787 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750723Ab3HSPPj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Aug 2013 11:15:39 -0400
Received: by mail-pd0-f177.google.com with SMTP id y10so5295256pdj.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2013 08:15:39 -0700 (PDT)
In-Reply-To: <159201ce9b36$2a513f30$7ef3bd90$@org> (Kukjin Kim's message of
	"Sat, 17 Aug 2013 19:40:18 +0900")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, 'Mark Brown' <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, 'Arnd Bergmann' <arnd@arndb.de>

Kukjin Kim <kgene@kernel.org> writes:

[...]

> If we could make LPAE enabled defconfig for all ARM platforms, I'm fine. I
> think your concern is creating SoC specific defconfig and I agree with you.
> But I'm not sure how we can support LPAE enabled defconfig for ARM
> platforms.

Here's a simple way to keep a single base defconfig, and enable LPAE:

$ echo CONFIG_ARM_LPAE=y > /tmp/lpae.config
$ ./scripts/kconfig/merge_config.sh arch/arm/config/exynos_defconfig /tmp/lpae.config

Kevin
