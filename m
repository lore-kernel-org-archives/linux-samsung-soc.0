From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 3/5] pinctrl: exynos: add exynos5410 SoC specific data
Date: Sun, 30 Nov 2014 21:13:30 +0900
Message-ID: <CA+Ln22HEs83SYOF9txBPfd=77EB3Hcwerra=7e97AvP0JBjCFw@mail.gmail.com>
References: <547104D5.4030803@suse.de>
	<1416695185-5198-1-git-send-email-afaerber@suse.de>
	<CACRpkdZie8JJGxSPkc8PPvC3qZkWhe5WqmpSKSoDFwqRd6tR_Q@mail.gmail.com>
	<54786567.4050305@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <54786567.4050305@suse.de>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?B?6rmA7ZWZ7KO8?= <ruppi.kim@hardkernel.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "PIN CONTROL SUBSY..." <linux-gpio@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andreas,

2014-11-28 21:07 GMT+09:00 Andreas F=C3=A4rber <afaerber@suse.de>:
> Am 28.11.2014 um 12:59 schrieb Linus Walleij:
>> On Sat, Nov 22, 2014 at 11:26 PM, Andreas F=C3=A4rber <afaerber@suse=
=2Ede> wrote:
>>
>>> From: Hakjoo Kim <ruppi.kim@hardkernel.com>
>>>
>>> Add Samsung EXYNOS5410 SoC specific data to enable pinctrl
>>> support for all platforms based on EXYNOS5410.
>>>
>>> Signed-off-by: Hakjoo Kim <ruppi.kim@hardkernel.com>
>>> [AF: Rebased onto Exynos5260 and irq_chip consolidation]
>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>> ---
>>>  v2 -> v3:
>>>  * Rebased (.svc, .{g,w}eint_{con,mask,pend} fields dropped)
>>>
>>>  v1 -> v2:
>>>  * Filled in Sob from Hakjoo Kim
>>
>> Is this based on the pinctrl devel branch so I can apply it?
>
> It was based on the Samsung for-next tree. I can rebase if needed.

Yes, please rebase (and please make sure that all the structs are
const, which became possible after recent changes). Otherwise the
patch looks good.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
