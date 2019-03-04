From: Avi Fishman <avifishman70@gmail.com>
Subject: Re: [PATCH 06/15] arm: npcm: fix a leaked reference by addingmissing of_node_put
Date: Mon, 4 Mar 2019 17:39:28 +0200
Message-ID: <CAKKbWA5GkC7M9gm_HRN-4=neJKNH4JGRj1aaNsHyR7Ar54dS0A@mail.gmail.com>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn> <1551430616-42014-6-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551430616-42014-6-git-send-email-wen.yang99@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: liviu.dudau@arm.com, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kgene@kernel.org, krzk@kernel.org, linux-samsung-soc@vger.kernel.org, michal.simek@xilinx.com, afaerber@suse.de, manivannan.sadhasivam@linaro.org, dinguyen@kernel.org, heiko@sntech.de, linux-rockchip@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.or>
List-Id: linux-samsung-soc@vger.kernel.org

Reviewed-by: Avi Fishman <avifishman70@gmail.com>

Thanks

On Fri, Mar 1, 2019 at 10:57 AM Wen Yang <wen.yang99@zte.com.cn> wrote:
>
> The call to of_get_next_child returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
>
> Detected by coccinelle with the following warnings:
> ./arch/arm/mach-npcm/platsmp.c:52:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 31, but without a corresponding object release within this function.
> ./arch/arm/mach-npcm/platsmp.c:68:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 60, but without a corresponding object release within this function.
>
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Patrick Venture <venture@google.com>
> Cc: Nancy Yuen <yuenn@google.com>
> Cc: Brendan Higgins <brendanhiggins@google.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: openbmc@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm/mach-npcm/platsmp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
> index 21633c7..fe63edc 100644
> --- a/arch/arm/mach-npcm/platsmp.c
> +++ b/arch/arm/mach-npcm/platsmp.c
> @@ -35,6 +35,7 @@ static int npcm7xx_smp_boot_secondary(unsigned int cpu,
>                 goto out;
>         }
>         gcr_base = of_iomap(gcr_np, 0);
> +       of_node_put(gcr_np);
>         if (!gcr_base) {
>                 pr_err("could not iomap gcr");
>                 ret = -ENOMEM;
> @@ -63,6 +64,7 @@ static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
>                 return;
>         }
>         scu_base = of_iomap(scu_np, 0);
> +       of_node_put(scu_np);
>         if (!scu_base) {
>                 pr_err("could not iomap scu");
>                 return;
> --
> 2.9.5
>


-- 
Regards,
Avi
