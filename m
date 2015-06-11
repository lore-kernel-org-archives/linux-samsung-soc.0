From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [GIT PULL 2/5] Samsung 2nd defconfig for v4.2
Date: Thu, 11 Jun 2015 14:30:48 -0700
Message-ID: <7hwpzac4qf.fsf@deeprootsystems.com>
References: <5571E4B0.5090001@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:33667 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751224AbbFKVav (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 17:30:51 -0400
Received: by pdjn11 with SMTP id n11so10630922pdj.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2015 14:30:51 -0700 (PDT)
In-Reply-To: <5571E4B0.5090001@kernel.org> (Kukjin Kim's message of "Sat, 06
	Jun 2015 03:04:32 +0900")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Kukjin Kim <kgene@kernel.org> writes:

> Hi,
>
> Here is 2nd defconfig updates for v4.2 but actually just one patch for
> Samsung updates for multi_v7_defconfig. Please pull or apply the patch
> directly, anyway I'm fine either way.
>
> Note that this is based on arm-soc/next/defconfig to avoid useless merge
> conflicts and I've merged previous tags/samsung-defconfig-2.

We don't mind the simple conflicts like this.

It's better if you just send an updated pull that's based on your
previous pull.

Anyways, I cherry-picked this patch into next/defconfig.

Thanks,

Kevin
