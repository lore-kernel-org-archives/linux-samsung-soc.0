From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 11/15] ARM: versatile: fix a leaked reference by
 addingmissing of_node_put
Date: Fri, 1 Mar 2019 14:30:07 +0100
Message-ID: <CACRpkdbRfagzAr6zRBtEJ0Z2fvLhiMsy8CPsuiFswf0NjzvCRw@mail.gmail.com>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn> <1551430616-42014-11-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551430616-42014-11-git-send-email-wen.yang99@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Dinh Nguyen <dinguyen@kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 1, 2019 at 9:57 AM Wen Yang <wen.yang99@zte.com.cn> wrote:

> The call to of_get_next_child returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
>
> Detected by coccinelle with the following warnings:
> ./arch/arm/mach-versatile/versatile_dt.c:315:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 302, but without a corresponding object release within this function.
> ./arch/arm/mach-versatile/versatile_dt.c:320:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 302, but without a corresponding object release within this function.
>
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org

Patch applied. Will send upstream next kernel cycle or so.

Yours,
Linus Walleij
