From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/15] ARM: actions: fix a leaked reference by
 addingmissing of_node_put
Date: Mon, 4 Mar 2019 13:29:33 +0100
Message-ID: <CACRpkdb=E9_rm4_7DQV3dS5uOs1gozxEwN9MtWr0tTwmjcYe=A@mail.gmail.com>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn> <20190301155523.GA1915@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301155523.GA1915@Mani-XPS-13-9360>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Wen Yang <wen.yang99@zte.com.cn>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, Dinh Nguyen <dinguyen@kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 1, 2019 at 4:55 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
> Hi Wen,
>
> On Fri, Mar 01, 2019 at 04:56:42PM +0800, Wen Yang wrote:
> > The call to of_get_next_child returns a node pointer with refcount
> > incremented thus it must be explicitly decremented after the last
> > usage.
> >
> > Detected by coccinelle with the following warnings:
> > ./arch/arm/mach-actions/platsmp.c:112:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 103, but without a corresponding object release within this function.
> > ./arch/arm/mach-actions/platsmp.c:124:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 115, but without a corresponding object release within this function.
> > ./arch/arm/mach-actions/platsmp.c:137:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 128, but without a corresponding object release within this function.
> >
>
> We have a floating patch for this:
> https://www.spinics.net/lists/arm-kernel/msg694544.html
>
> Andreas: Can you please take a second look at the patchset submitted by Linus
> Walleij and Russel for simplifying the Actions startup code?

Andreas wrote a version of simplifying secondary startup in the
same spirit as Russell's patches, and it's merged and all
is fine I think.

If this patch applied on top of the current upstream code I'd say
just forget about my patch and merge Wen's patch instead.

Yours,
Linus Walleij
