From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v3 00/27] ARM: dts: exynos: Add initial support for Odroid
 XU
Date: Wed, 11 May 2016 11:41:34 -0400
Message-ID: <09dcc771-40e2-8be0-de73-bc1db37d6804@osg.samsung.com>
References: <1462910970-1812-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:46955 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932080AbcEKPlq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 May 2016 11:41:46 -0400
In-Reply-To: <1462910970-1812-1-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>

Hello Krzysztof,

On 05/10/2016 04:09 PM, Krzysztof Kozlowski wrote:
> Hi,
> 
> Patchset adds necessary clocks, reorganizes existing stuff and finally
> adds Odroid XU support.
> 
> 
> Changes since v2
> ================
> 1. Got global-ack from Stephen for the clock changes. I think merging
>    everything through arm-soc might be the easiest but:
>    a. In such case I will prepare a tag with clock changes,
>    b. Anyway I will wait for response from Sylwester and Tomasz.
> 2. Applied comments from Javier and added his Reviewed-by.
> 3. Patch 22: added ack from Rob.
> 4. Minor improvements in existing patches.
> 5. Five new patches at the end: 23-27 (not reviewed yet).
>    Some of them could be squashed with existing ones but existing
>    changes got reviews. Although the final Odroid XU DTS works fine but
>    in general this is still work-in-progress so I suspect it will grow.
>    I am releasing it early following Linux concept. :)
> 
> Patchset is available at my private repo @github:
> https://github.com/krzk/linux.git for-next/odroid-xu-v3
> 

I have tested this branch on both an Exynos5422 Odroid XU4 board and an
Exynos5800 Peach Pi Chromebook. All the peripherals are working correctly.

So for all patches affecting Exynos54xx/5800 (9,12,13,14,16,19,20,21,25):

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
