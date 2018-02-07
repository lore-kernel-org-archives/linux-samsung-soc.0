From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3.18] ARM: exynos_defconfig: enable CONFIG_ROOT_NFS and dependencies
Date: Wed, 7 Feb 2018 10:32:20 +0100
Message-ID: <CAJKOXPfsvXfONa8gT1-Vfa1qme3kC2DQBhHHLtkmTdSA+-zRKQ@mail.gmail.com>
References: <33565d824a8fde35618fdfaa2205f437874aec6c.1517925184.git.guillaume.tucker@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753311AbeBGJcX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Feb 2018 04:32:23 -0500
In-Reply-To: <33565d824a8fde35618fdfaa2205f437874aec6c.1517925184.git.guillaume.tucker@collabora.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org

On Tue, Feb 6, 2018 at 3:00 PM, Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
> Enable CONFIG_ROOT_NFS and dependencies (CONFIG_NFS_*, CONFIG_IP_PNP)
> in order to be able to boot the Exynos devices with NFS root.
>
> Tested on exynos4412-odroidx2.
>
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> ---
>  arch/arm/configs/exynos_defconfig | 8 ++++++++
>  1 file changed, 8 insertions(+)
>

Instead, I think it is better to backport mainline commits which
synchronizes the history and follows the stable process (mainline ->
stable):
19f79ccf6d77409cd138bce8d ("ARM: exynos_defconfig: Enable options to
mount a rootfs via NFS")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=19f79ccf6d77409cd138bce8db206cdac7fd5ea7

1c1fb9b0c89a2506e556114c813 ("ARM: exynos_defconfig: Enable NFSv4 client")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1c1fb9b0c89a2506e556114c813a606bc1508d49

Best regards,
Krzysztof


> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index e21ef830a483..999ea477be54 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -33,6 +33,10 @@ CONFIG_PACKET=y
>  CONFIG_UNIX=y
>  CONFIG_NET_KEY=y
>  CONFIG_INET=y
> +CONFIG_IP_PNP=y
> +CONFIG_IP_PNP_DHCP=y
> +CONFIG_IP_PNP_BOOTP=y
> +CONFIG_IP_PNP_RARP=y
>  CONFIG_RFKILL_REGULATOR=y
>  CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
> @@ -170,6 +174,10 @@ CONFIG_TMPFS=y
>  CONFIG_TMPFS_POSIX_ACL=y
>  CONFIG_CRAMFS=y
>  CONFIG_ROMFS_FS=y
> +CONFIG_NFS_FS=y
> +CONFIG_NFS_V3_ACL=y
> +CONFIG_NFS_V4=y
> +CONFIG_ROOT_NFS=y
>  CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ASCII=y
>  CONFIG_NLS_ISO8859_1=y
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
