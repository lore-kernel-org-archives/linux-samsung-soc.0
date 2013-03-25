From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH v9 0/4] Add DRM FIMD DT support for Exynos4 DT Machines
Date: Mon, 25 Mar 2013 16:19:39 +0530
Message-ID: <CAGm_ybhxqzDJ8zNCEMnnaApVnfVzVzP_k6MSy7PA5NQZeYD5uw@mail.gmail.com>
References: <1363960608-23825-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:44383 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755671Ab3CYKtl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Mar 2013 06:49:41 -0400
Received: by mail-wi0-f181.google.com with SMTP id hj8so2735632wib.14
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2013 03:49:39 -0700 (PDT)
In-Reply-To: <1363960608-23825-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, sunil joshi <joshi@samsung.com>, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, linaro-kernel@lists.linaro.org

Hi Kukjin Kim,

Can you please apply these patches?

On Fri, Mar 22, 2013 at 7:26 PM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> This patch series adds support for DRM FIMD DT for Exynos4 DT Machines,
> specifically for Exynos4412 SoC.
>
> changes since v8:
>         - addressed comments to add missing documentation for clock and clock-names
>         properties as pointed out by Sachin Kamat <sachin.kamat@linaro.org>
>
> changes since v7:
>         - rebased to kgene's "for-next"
>         - Migrated to Common Clock Framework
>         - removed the patch "ARM: dts: Add FIMD AUXDATA node entry for exynos4 DT",
>         as migration to Common Clock Framework will NOT need this.
>         - addressed the comments raised by Sachin Kamat <sachin.kamat@linaro.org>
>
> changes since v6:
>         - addressed comments and added interrupt-names = "fifo", "vsync", "lcd_sys"
>         in exynos4.dtsi and re-ordered the interrupt numbering to match the order in
>         interrupt combiner IP as suggested by Sylwester Nawrocki <sylvester.nawrocki@gmail.com>.
>
> changes since v5:
>         - renamed the fimd binding documentation file name as "samsung-fimd.txt",
>         since it not only talks about exynos display controller but also about
>         previous samsung display controllers.
>         - rephrased an abmigious statement about the interrupt combiner in the
>         fimd binding documentation as pointed out by
>         Sachin Kamat <sachin.kamat@linaro.org>
>
> changes since v4:
>         - moved the fimd binding documentation to Documentation/devicetree/bindings/video/
>         as suggested by Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
>
>         - added more fimd compatiblity strings in fimd documentation as
>         discussed at  https://patchwork.kernel.org/patch/2144861/ with
>         Sylwester Nawrocki <sylvester.nawrocki@gmail.com> and
>         Tomasz Figa <tomasz.figa@gmail.com>
>
>         - modified compatible string for exynos4 fimd as "exynos4210-fimd"
>         exynos5 fimd as "exynos5250-fimd" to stick to the rule that compatible
>         value should be named after first specific SoC model in which this
>         particular IP version was included as discussed at
>         https://patchwork.kernel.org/patch/2144861/
>
>         - documented more about the interrupt combiner and their order as
>         suggested by Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
>
> changes since v3:
>         - rebased on
>         http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git;a=shortlog;h=refs/heads/for-next-next
>
> changes since v2:
>         - added alias to 'fimd@11c00000' node
>                 (reported by: Rahul Sharma <r.sh.open@gmail.com>)
>         - removed 'lcd0_data' node as there was already a similar node lcd_data24
>                 (reported by: Jingoo Han <jg1.han@samsung.com>
>         - replaced spaces with tabs in display-timing node
>
> changes since v1:
>         - added new patch to add FIMD DT binding Documentation
>         - removed patch enabling SAMSUNG_DEV_BACKLIGHT and SAMSUNG_DEV_PMW
>         for mach-exynos4 DT
>         - added 'status' property to fimd DT node
>
> Is based on branch kgene's "for-next"
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next
>
> Sachin Kamat (1):
>   ARM: dts: Add lcd pinctrl node entries for EXYNOS4412 SoC
>
> Vikas Sajjan (3):
>   ARM: dts: Add FIMD node to exynos4
>   ARM: dts: Add FIMD node and display timing node to
>     exynos4412-origen.dts
>   ARM: dts: Add FIMD DT binding Documentation
>
>  .../devicetree/bindings/video/samsung-fimd.txt     |   68 ++++++++++++++++++++
>  arch/arm/boot/dts/exynos4.dtsi                     |   11 ++++
>  arch/arm/boot/dts/exynos4412-origen.dts            |   22 +++++++
>  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi          |   14 ++++
>  4 files changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/samsung-fimd.txt
>
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
