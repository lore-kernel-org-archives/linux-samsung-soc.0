From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 16/19] ARM: dts: s5pv210: replace legacy *,wakeup property
 with wakeup-source
Date: Thu, 17 Dec 2015 08:52:56 +0900
Message-ID: <CAJKOXPcRVPq+wU7=cPkQyqF2Z7dCc0samcHV9UgCYZbeStuCCg@mail.gmail.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
	<1445422216-29375-17-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:38863 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932076AbbLPXw5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2015 18:52:57 -0500
In-Reply-To: <1445422216-29375-17-git-send-email-sudeep.holla@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org

2015-10-21 19:10 GMT+09:00 Sudeep Holla <sudeep.holla@arm.com>:
> Though the keyboard and other driver will continue to support the legacy
> "gpio-key,wakeup", "linux,input-wakeup" boolean property to enable the
> wakeup source, "wakeup-source" is the new standard binding.
>
> This patch replaces all the legacy wakeup properties with the unified
> "wakeup-source" property in order to avoid any futher copy-paste
> duplication.
>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  arch/arm/boot/dts/s5pv210-aquila.dts   | 4 ++--
>  arch/arm/boot/dts/s5pv210-goni.dts     | 4 ++--
>  arch/arm/boot/dts/s5pv210-smdkv210.dts | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
