From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/4] ARM: dts: s5pv210: aries: Support for more devices
 present on Aries
Date: Fri, 11 Jan 2019 09:33:41 +0100
Message-ID: <CAJKOXPdZPTP1c1GN-274G0jBMCHZiXk1C3Q+JnergehkuExPXg@mail.gmail.com>
References: <20190108165601.25708-1-pawel.mikolaj.chmiel@gmail.com> <20190108165601.25708-3-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108165601.25708-3-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, xc-racer2@live.ca, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 8 Jan 2019 at 17:56, Pawe=C5=82 Chmiel
<pawel.mikolaj.chmiel@gmail.com> wrote:
>
> From: Jonathan Bakker <xc-racer2@live.ca>
>
> This commit enables following devices present on Aries based phones:
> - pwm-vibrator attached to PWM 1
> - poweroff support
> - Atmel maXTouch touchscreen, connected to i2c2
> - Broadcom BCM4329 bluetooth over uart0
>
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
> Changes from v1:
>    - Touchscreen irq pin should have PULL_NONE, since it's already
>      pulled up with 2.8v
>    - Touchscreen irq should be edge failing (like in vendor sources)
> ---
>  arch/arm/boot/dts/s5pv210-aries.dtsi | 68 ++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)

Thanks, applied.

Best regards,
Krzysztof
