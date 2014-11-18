From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] ARM: dts: Add SPI flash node for Peach boards
Date: Tue, 18 Nov 2014 09:50:04 -0800
Message-ID: <CAD=FV=Xkei_wxa3jWb8bPvuynbSyq4o=ezjVD0+e04aOPCAM+Q@mail.gmail.com>
References: <1416246184-29071-1-git-send-email-javier.martinez@collabora.co.uk>
	<1416246184-29071-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416246184-29071-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Mark Brown <broonie@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Javier,

On Mon, Nov 17, 2014 at 9:43 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> +&spi_1 {
> +       status = "okay";
> +       samsung,spi-src-clk = <0>;
> +       num-cs = <1>;
> +       cs-gpios = <&gpa2 5 0>;
> +
> +       spidev@0 {
> +               compatible = "spidev";

This is common practice in the Chrome OS tree, but we've gotten
pushback from upstream questioning about whether "spidev" is really a
physical device.  See:

http://www.spinics.net/lists/linux-samsung-soc/msg29563.html


I don't really have an answer for something better to do here but I
figured I'd at least bring up the point.

-Doug
