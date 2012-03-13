From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 0/5] pinctrl: add new Samsung pinctrl driver and add
 Exynos4 support
Date: Tue, 13 Mar 2012 15:48:24 +0530
Message-ID: <CAJuYYwSUepRJuwdtDUGu6frCsHvvtmDEUrXEHKitYJppWwL0aw@mail.gmail.com>
References: <1331469965-28846-1-git-send-email-thomas.abraham@linaro.org>
	<CACRpkdYB4ambuDeMUX1kZn793xxfaaNjQ56EB4C8OAykMxoPJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYB4ambuDeMUX1kZn793xxfaaNjQ56EB4C8OAykMxoPJQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

On 13 March 2012 15:43, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sun, Mar 11, 2012 at 1:46 PM, Thomas Abraham
> <thomas.abraham@linaro.org> wrote:
>
>> This patch series adds new pinctrl driver for Samsung SoC's. The driver supports
>> a gpiolib interface as well since Samsung SoC's have a combined pinmux/pinctrl
>> and gpio controller.
>
> Overall this all looks good to me Thomas!
> I will provide detailed review if/when it is more ripe for merge.

Thanks linus for having a look. The missing bits in the driver are
wakeup interrupt and gpio interrupt support. Without these, it would
not be possible to meaningfully demonstrate a fully functional system
using the pinctrl and gpiolib driver for Exynos4.

Regards,
Thomas.

>
> Yours,
> Linus Walleij
