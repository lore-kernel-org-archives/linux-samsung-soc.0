From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3 07/22] ARM: dts: Remove '0x's from Exynos4210 DTSI
 file
Date: Tue, 06 Aug 2013 03:07:44 +0900
Message-ID: <51FFE9F0.1000100@samsung.com>
References: <1374490361-25769-1-git-send-email-lee.jones@linaro.org> <1374490361-25769-7-git-send-email-lee.jones@linaro.org> <20130724150937.GO26801@laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:40791 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753843Ab3HESHv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Aug 2013 14:07:51 -0400
In-Reply-To: <20130724150937.GO26801@laptop>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, arnd@arndb.de, linus.walleij@stericsson.com, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On 07/25/13 00:09, Lee Jones wrote:
> ... for the sake of consistency and assumed convention.
>
> Cc: Kukjin Kim<kgene.kim@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Lee Jones<lee.jones@linaro.org>
>
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index b7f358a..53e2527 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -72,7 +72,7 @@
>                  };
    ^^^^^^^^^^^^^^^^
>          };
    ^^^^^^^^
>
> -       clock: clock-controller@0x10030000 {
    ^^^^^^^^
> +       clock: clock-controller@10030000 {
    ^^^^^^^^
>                  compatible = "samsung,exynos4210-clock";
    ^^^^^^^^^^^^^^^^
>                  reg =<0x10030000 0x20000>;
    ^^^^^^^^^^^^^^^^
>                  #clock-cells =<1>;
    ^^^^^^^^^^^^^^^^

BTW, should be tab at the mark '^' not white space :(

- Kukjin
