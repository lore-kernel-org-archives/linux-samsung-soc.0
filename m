From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v2 1/1] ARM: exynos_defconfig: Enable options to mount
 a rootfs via NFS
Date: Fri, 27 Mar 2015 01:50:50 +0900
Message-ID: <551438EA.3010509@kernel.org>
References: <1427310504-1505-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:36971 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751624AbbCZQu4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Mar 2015 12:50:56 -0400
In-Reply-To: <1427310504-1505-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/26/15 04:08, Javier Martinez Canillas wrote:
> This patch enables the options to mount a rootfs over NFS and also support
> for automatic configuration of IP addresses during boot as needed by NFS.
> 
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
> 
> Changes since v1:
>  - Found a typo in the changelog after posting the patch. Sorry for the noise.
> 
>  arch/arm/configs/exynos_defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 72a4fffd603e..02be4c072497 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -36,6 +36,10 @@ CONFIG_PACKET=y
>  CONFIG_UNIX=y
>  CONFIG_NET_KEY=y
>  CONFIG_INET=y
> +CONFIG_IP_PNP=y
> +CONFIG_IP_PNP_DHCP=y
> +CONFIG_IP_PNP_BOOTP=y
> +CONFIG_IP_PNP_RARP=y
>  CONFIG_WIRELESS=y
>  CONFIG_CFG80211=y
>  CONFIG_MWIFIEX=y
> @@ -206,6 +210,8 @@ CONFIG_TMPFS=y
>  CONFIG_TMPFS_POSIX_ACL=y
>  CONFIG_CRAMFS=y
>  CONFIG_ROMFS_FS=y
> +CONFIG_NFS_FS=y
> +CONFIG_ROOT_NFS=y
>  CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ASCII=y
>  CONFIG_NLS_ISO8859_1=y

Applied, thanks.

- Kukjin
