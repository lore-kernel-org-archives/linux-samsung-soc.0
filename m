From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 12/15] ARM: vexpress: fix a leaked reference by
 addingmissing of_node_put
Date: Mon, 4 Mar 2019 14:46:06 +0000
Message-ID: <20190304144606.GA7466@e107155-lin>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
 <1551430616-42014-12-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1551430616-42014-12-git-send-email-wen.yang99@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: liviu.dudau@arm.com, lorenzo.pieralisi@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kgene@kernel.org, krzk@kernel.org, linux-samsung-soc@vger.kernel.org, michal.simek@xilinx.com, afaerber@suse.de, manivannan.sadhasivam@linaro.org, dinguyen@kernel.org, heiko@sntech.de, linux-rockchip@lists.infradead.org, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com, yuenn@google.com, brendanhiggins@google.com, openbmc@lists.ozlabs.org, xuwei5@hisilicon.com, maxime.ripard@bootlin.com, wens@csie.org, catalin.marinas@arm.com, will.deacon@arm.com, horms@verge.net.au, magnus.damm@gmail.comlinux-
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 01, 2019 at 04:56:53PM +0800, Wen Yang wrote:
> The call to of_get_next_child returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
> 
> Detected by coccinelle with the following warnings:
> ./arch/arm/mach-vexpress/dcscb.c:150:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 145, but without a corresponding object release within this function.
> ./arch/arm/mach-vexpress/dcscb.c:160:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 145, but without a corresponding object release within this function.
> ./arch/arm/mach-vexpress/dcscb.c:171:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 145, but without a corresponding object release within this function.
> 
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>

Looks good, assuming you want to take this as a series. Please shout if
you want us to take this.

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep
