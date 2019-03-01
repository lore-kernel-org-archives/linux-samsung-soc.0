From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 01/15] ARM: actions: fix a leaked reference by
 addingmissing of_node_put
Date: Fri, 1 Mar 2019 21:25:23 +0530
Message-ID: <20190301155523.GA1915@Mani-XPS-13-9360>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wen Yang <wen.yang99@zte.com.cn>, linus.walleij@linaro.org, afaerber@suse.de
Cc: heiko@sntech.de, maxime.ripard@bootlin.com, catalin.marinas@arm.com, liviu.dudau@arm.com, michal.simek@xilinx.com, xuwei5@hisilicon.com, tmaimon77@gmail.com, lorenzo.pieralisi@arm.com, yuenn@google.com, will.deacon@arm.com, openbmc@lists.ozlabs.org, magnus.damm@gmail.com, linux@armlinux.org.uk, krzk@kernel.org, linux-samsung-soc@vger.kernel.org, wens@csie.org, kgene@kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com, linux-rockchip@lists.infradead.org, brendanhiggins@google.com, wang.yi59@zte.com.cn, rjui@broadcom.com, s.hauer@pengutronix.de, f.fainelli@gmail.com, linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com, avifishman70@gmail.com, venture@google.com, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, dinguyen@kernel.org, horms@verge.net.au, kernel@pengutronix.de, sudeep.holla@arm.com, fabio.estevam@nxp.com, shawnguo@kernel
List-Id: linux-samsung-soc@vger.kernel.org

Hi Wen,

On Fri, Mar 01, 2019 at 04:56:42PM +0800, Wen Yang wrote:
> The call to of_get_next_child returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
> =

> Detected by coccinelle with the following warnings:
> ./arch/arm/mach-actions/platsmp.c:112:2-8: ERROR: missing of_node_put; ac=
quired a node pointer with refcount incremented on line 103, but without a =
corresponding object release within this function.
> ./arch/arm/mach-actions/platsmp.c:124:2-8: ERROR: missing of_node_put; ac=
quired a node pointer with refcount incremented on line 115, but without a =
corresponding object release within this function.
> ./arch/arm/mach-actions/platsmp.c:137:3-9: ERROR: missing of_node_put; ac=
quired a node pointer with refcount incremented on line 128, but without a =
corresponding object release within this function.
> =


We have a floating patch for this:
https://www.spinics.net/lists/arm-kernel/msg694544.html

Andreas: Can you please take a second look at the patchset submitted by Lin=
us
Walleij and Russel for simplifying the Actions startup code?

Thanks,
Mani

> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: "Andreas F=E4rber" <afaerber@suse.de>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm/mach-actions/platsmp.c | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/arch/arm/mach-actions/platsmp.c b/arch/arm/mach-actions/plat=
smp.c
> index 4fd479c..1a8e078 100644
> --- a/arch/arm/mach-actions/platsmp.c
> +++ b/arch/arm/mach-actions/platsmp.c
> @@ -107,6 +107,7 @@ static void __init s500_smp_prepare_cpus(unsigned int=
 max_cpus)
>  	}
>  =

>  	timer_base_addr =3D of_iomap(node, 0);
> +	of_node_put(node);
>  	if (!timer_base_addr) {
>  		pr_err("%s: could not map timer registers\n", __func__);
>  		return;
> @@ -119,6 +120,7 @@ static void __init s500_smp_prepare_cpus(unsigned int=
 max_cpus)
>  	}
>  =

>  	sps_base_addr =3D of_iomap(node, 0);
> +	of_node_put(node);
>  	if (!sps_base_addr) {
>  		pr_err("%s: could not map sps registers\n", __func__);
>  		return;
> @@ -132,6 +134,7 @@ static void __init s500_smp_prepare_cpus(unsigned int=
 max_cpus)
>  		}
>  =

>  		scu_base_addr =3D of_iomap(node, 0);
> +		of_node_put(node);
>  		if (!scu_base_addr) {
>  			pr_err("%s: could not map scu registers\n", __func__);
>  			return;
> -- =

> 2.9.5
> =
