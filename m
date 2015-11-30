From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Set recommended options for
 systemd
Date: Mon, 30 Nov 2015 09:02:43 -0300
Message-ID: <565C3AE3.4080006@osg.samsung.com>
References: <1448865083-13272-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448865083-13272-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 11/30/2015 03:31 AM, Krzysztof Kozlowski wrote:
> Set following options to recommended value by systemd (which also
> matches the multi_v7 deconfig):
> 1. Enable AUTOFS4_FS - for systemd.automount [0];
> 2. Enable BLK_DEV_BSG - SG v4 for recend udev [0][1];
> 3. Disable UEVENT_HELPER_PATH - legacy hook for hotplug, forked for each
>    uevent, slows down booting [0];
> 
> [0] http://cgit.freedesktop.org/systemd/systemd/tree/README
> [1] http://patchwork.ozlabs.org/patch/47921/
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
