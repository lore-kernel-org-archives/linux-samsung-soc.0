From: Willy WOLFF <willy.mh.wolff@gmail.com>
Subject: Re: Exynos542x/5800 dts - multiple conflicting thermal-zones
 definition
Date: Wed, 1 Feb 2017 18:45:24 +0000
Message-ID: <08f2bac8-e42b-f359-0fe7-567204e657df@gmail.com>
References: <fda674a2-b209-7683-191b-80bc1286c334@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36833 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754214AbdBASp1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Feb 2017 13:45:27 -0500
Received: by mail-wm0-f68.google.com with SMTP id r18so7482594wmd.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Feb 2017 10:45:26 -0800 (PST)
In-Reply-To: <fda674a2-b209-7683-191b-80bc1286c334@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rob Herring <robh+dt@kernel.org>;Mark Rutland <mark.rutland@arm.com>;Russell King <linux@armlinux.org.uk>;Kukjin Kim <kgene@kernel.org>;Krzysztof Kozlowski <krzk@kernel.org>;Javier Martinez Canillas" <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org

Forgive this mail, it's my mistake.

On 01/02/2017 17:49, Willy WOLFF wrote:
> Since the commit f4715dc7eb89e1e776ab2c260cb008617490f931
> ARM: dts: exynos: Only Odroid XU3-family boards use DTSI with CPU
> thermal nodes
>
> The file exynos5422-cpu-thermal.dtsi which defines thermal-zones for
> this processor, has been injected in exynos5422-odroidxu3-common.dtsi
> This file includes exynos5800.dtsi, which finally include exynos5420.dtsi
>
> On this last file, you have already some thermal-zones definition
> specific to exynos5420 processor, that are different from the
> thermal-zones defined in exynos5422-odroidxu3-common.dtsi
>
> Is it possible to revert this patch? or modify the includes hierarchy to
> have better isolation of thermal-zones definition?
>
> Best Regards,
> Willy Wolff
