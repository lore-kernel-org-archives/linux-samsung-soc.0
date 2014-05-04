From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: dts: Add MFC memory banks to Exynos5420 boards
Date: Sun, 4 May 2014 21:08:57 +0530
Message-ID: <CAK9yfHy6Ms4c0vDiWs4Dy3acfVViQJpPFNyPGBmmwhAGo4VJKw@mail.gmail.com>
References: <1395036689-31382-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:60997 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751071AbaEDPi6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 May 2014 11:38:58 -0400
Received: by mail-ob0-f176.google.com with SMTP id wp4so7335616obc.21
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 May 2014 08:38:57 -0700 (PDT)
In-Reply-To: <1395036689-31382-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>

On 17 March 2014 11:41, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Add MFC memory banks to Exynos5420 based SMDK and Arndale-octa boards.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5420-arndale-octa.dts |    5 +++++
>  arch/arm/boot/dts/exynos5420-smdk5420.dts     |    5 +++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> index f509e8fc290f..051bde7c3665 100644
> --- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> +++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> @@ -37,6 +37,11 @@
>                 status = "okay";
>         };
>
> +       codec@11000000 {
> +               samsung,mfc-r = <0x43000000 0x800000>;
> +               samsung,mfc-l = <0x51000000 0x800000>;
> +       };
> +
>         mmc@12200000 {
>                 status = "okay";
>                 broken-cd;
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> index ae1ee0470fca..6a9b4553d802 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -68,6 +68,11 @@
>                 status = "okay";
>         };
>
> +       codec@11000000 {
> +               samsung,mfc-r = <0x43000000 0x800000>;
> +               samsung,mfc-l = <0x51000000 0x800000>;
> +       };
> +
>         mmc@12200000 {
>                 status = "okay";
>                 broken-cd;
> --
> 1.7.9.5
>
 Ping Kukjin.


-- 
With warm regards,
Sachin
