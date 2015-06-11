From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v2] MAINTAINERS: ARM64: EXYNOS: Extend entry for ARM64 DTS
Date: Thu, 11 Jun 2015 14:48:02 -0700
Message-ID: <CAMAWPa-3RhXgCjXcdQkPn3W1SJ++iAkfaBdp_p4Se9Ykg1A1mw@mail.gmail.com>
References: <1433584939-3520-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:34978 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752532AbbFKVsH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 17:48:07 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id B244120416
	for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2015 21:48:06 +0000 (UTC)
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 66C3520465
	for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2015 21:48:04 +0000 (UTC)
Received: by wgme6 with SMTP id e6so12135198wgm.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2015 14:48:02 -0700 (PDT)
In-Reply-To: <1433584939-3520-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

Hi Krzysztof,

On Sat, Jun 6, 2015 at 3:02 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> Extend the Exynos entry to ARM64 device tree sources.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Kevin Hilman <khilman@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Applied to arm-soc's next/soc branch.

Note I found this by chance.  It almost fell through the cracks
because arm@kernel.org (for arm-soc maintainers) wasn't on the to/cc
list.

Kevin
