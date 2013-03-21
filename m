From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH v8 0/4] Add DRM FIMD DT support for Exynos4 DT Machines
Date: Thu, 21 Mar 2013 10:15:28 +0530
Message-ID: <CAGm_ybhXp9w2HGvUNDoR1D6Xjtd_gKyjNzA6Z54wj0CSXnbwkQ@mail.gmail.com>
References: <1363676892-21296-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:35872 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753633Ab3CUEp3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Mar 2013 00:45:29 -0400
Received: by mail-ob0-f178.google.com with SMTP id wd20so2487564obb.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Mar 2013 21:45:28 -0700 (PDT)
In-Reply-To: <1363676892-21296-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, linaro-kernel@lists.linaro.org, joshi@samsung.com

Hi,

On Tue, Mar 19, 2013 at 12:38 PM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> This patch series adds support for DRM FIMD DT for Exynos4 DT Machines,
> specifically for Exynos4412 SoC.
>

Any more comments on this patch set ? I am about to re-spin v9, let me
know if anybody has more comments.

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
>  .../devicetree/bindings/video/samsung-fimd.txt     |   61 ++++++++++++++++++++
>  arch/arm/boot/dts/exynos4.dtsi                     |   11 ++++
>  arch/arm/boot/dts/exynos4412-origen.dts            |   22 +++++++
>  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi          |   14 +++++
>  4 files changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/samsung-fimd.txt
>
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
