From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 08/15] ARM: shmobile: fix a leaked reference by
 addingmissing of_node_put
Date: Mon, 4 Mar 2019 10:55:27 +0000
Message-ID: <TY1PR01MB17701D48CA7E650507C2E010C0710@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
 <1551430616-42014-8-git-send-email-wen.yang99@zte.com.cn>
 <CAMuHMdWrY0UNhCA7a8oHVfdVNXaB=15qFuWqvuU9OZpf7-ecmg@mail.gmail.com>
 <20190304102423.bipib6frc6ma2ltv@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190304102423.bipib6frc6ma2ltv@verge.net.au>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>, Wei Xu <xuwei5@hisilicon.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Wen Yang <wen.yang99@zte.com.cn>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Will Deacon <will.deacon@arm.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@br
List-Id: linux-samsung-soc@vger.kernel.org

Hello Simon,

> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vger.kernel.org> On Behalf Of Simon Horman
> Sent: 04 March 2019 10:24
> Subject: Re: [PATCH 08/15] ARM: shmobile: fix a leaked reference by addingmissing of_node_put
> 
> On Fri, Mar 01, 2019 at 10:51:27AM +0100, Geert Uytterhoeven wrote:
> > On Fri, Mar 1, 2019 at 9:57 AM Wen Yang <wen.yang99@zte.com.cn> wrote:
> > > The call to of_get_next_child returns a node pointer with refcount
> > > incremented thus it must be explicitly decremented after the last
> > > usage.
> > >
> > > Detected by coccinelle with the following warnings:
> > > ./arch/arm/mach-shmobile/pm-rcar-gen2.c:77:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount
> incremented on line 66, but without a corresponding object release within this function.
> > > ./arch/arm/mach-shmobile/pm-rcar-gen2.c:85:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount
> incremented on line 66, but without a corresponding object release within this function.
> > > ./arch/arm/mach-shmobile/pm-rcar-gen2.c:90:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount
> incremented on line 66, but without a corresponding object release within this function.
> > >
> > > Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks, applied for v5.2.

I am sorry for commenting on this just a moment after you took the patch, I guess there is a space missing in the title s/addingmissing/adding missing/ ? Is that still fixable?

Thanks,
Fab
