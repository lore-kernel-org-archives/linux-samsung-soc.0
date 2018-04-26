From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: linux-next: build failure after merge of the clk-samsung tree
Date: Thu, 26 Apr 2018 09:29:14 +0200
Message-ID: <CAJKOXPexiwOyPwmAV8KQj4JAnWHYYP4o8eVYodhvRYfKFGVbNw@mail.gmail.com>
References: <20180426091940.16bb1faf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180426091940.16bb1faf@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Apr 26, 2018 at 1:19 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Sylwester,
>
> After merging the clk-samsung tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> In file included from arch/arm/boot/dts/exynos5440-sd5v1.dts:10:0:
> arch/arm/boot/dts/exynos5440.dtsi:9:10: fatal error: dt-bindings/clock/exynos5440.h: No such file or directory
>  #include <dt-bindings/clock/exynos5440.h>
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> scripts/Makefile.lib:291: recipe for target 'arch/arm/boot/dts/exynos5440-sd5v1.dtb' failed
> In file included from arch/arm/boot/dts/exynos5440-ssdk5440.dts:10:0:
> arch/arm/boot/dts/exynos5440.dtsi:9:10: fatal error: dt-bindings/clock/exynos5440.h: No such file or directory
>  #include <dt-bindings/clock/exynos5440.h>
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   f986c0e40ff5 ("clk: samsung: Remove support for Exynos5440")
>
> I used the version of the clk-samsung tree from next-20180424 for today.

Thanks for the report, kbuild also mentioned this. The DTS which are
using this header are removed in first patch of patchset... which was
not applied yet and anyway would end in different tree. I think the
patch removing clk header should wait till DTS change get merged into
mainline.

Best regards,
Krzysztof
