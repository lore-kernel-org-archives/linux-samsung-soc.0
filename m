From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 08/15] ARM: shmobile: fix a leaked reference by
 addingmissing of_node_put
Date: Fri, 1 Mar 2019 10:51:27 +0100
Message-ID: <CAMuHMdWrY0UNhCA7a8oHVfdVNXaB=15qFuWqvuU9OZpf7-ecmg@mail.gmail.com>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn> <1551430616-42014-8-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551430616-42014-8-git-send-email-wen.yang99@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Dinh Nguyen <dinguyen@kernel.org>, Heiko Stuebner <heiko@sntech.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadco>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 1, 2019 at 9:57 AM Wen Yang <wen.yang99@zte.com.cn> wrote:
> The call to of_get_next_child returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
>
> Detected by coccinelle with the following warnings:
> ./arch/arm/mach-shmobile/pm-rcar-gen2.c:77:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 66, but without a corresponding object release within this function.
> ./arch/arm/mach-shmobile/pm-rcar-gen2.c:85:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 66, but without a corresponding object release within this function.
> ./arch/arm/mach-shmobile/pm-rcar-gen2.c:90:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 66, but without a corresponding object release within this function.
>
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
