From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 3/5] pinctrl: exynos: add exynos5410 SoC specific data
Date: Sun, 28 Dec 2014 20:16:24 +0900
Message-ID: <549FE688.1060601@gmail.com>
References: <547104D5.4030803@suse.de> <1416695185-5198-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1416695185-5198-1-git-send-email-afaerber@suse.de>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, =?UTF-8?B?6rmA7ZWZ7KO8?= <ruppi.kim@hardkernel.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "open list:PIN CONTROL SUBSY..." <linux-gpio@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andreas,

On 23.11.2014 07:26, Andreas F=C3=A4rber wrote:
> From: Hakjoo Kim <ruppi.kim@hardkernel.com>
>
> Add Samsung EXYNOS5410 SoC specific data to enable pinctrl
> support for all platforms based on EXYNOS5410.
>
> Signed-off-by: Hakjoo Kim <ruppi.kim@hardkernel.com>
> [AF: Rebased onto Exynos5260 and irq_chip consolidation]
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>   v2 -> v3:
>   * Rebased (.svc, .{g,w}eint_{con,mask,pend} fields dropped)
>
>   v1 -> v2:
>   * Filled in Sob from Hakjoo Kim

Any news on this patch? I'd like to ACK it, but apparently it is waitin=
g=20
for a rebase.

Sorry for the delay, unfortunately things are a little bit busy on my=20
side nowadays.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
