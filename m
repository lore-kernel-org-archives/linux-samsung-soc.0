From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [Patch v2] pinctrl: Add s5pv210 support to pinctrl-exynos
Date: Tue, 27 Aug 2013 15:40:40 +0200
Message-ID: <3696905.8yvPmhxxxP@amdc1227>
References: <1377608890-8528-1-git-send-email-m.krawczuk@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1377608890-8528-1-git-send-email-m.krawczuk@partner.samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Cc: linus.walleij@linaro.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, rob@landley.net, thomas.abraham@linaro.org, kgene.kim@samsung.com, l.krishna@samsung.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mateusz,

On Tuesday 27 of August 2013 15:08:10 Mateusz Krawczuk wrote:
> This patch implements pinctrl support and adds device tree bindings
> for s5pv210.
>
> Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
> ---
>  .../bindings/pinctrl/samsung-pinctrl.txt           |  3 +-
>  drivers/pinctrl/Kconfig                            |  2 +-
>  drivers/pinctrl/pinctrl-exynos.c                   | 58
> ++++++++++++++++++++++ drivers/pinctrl/pinctrl-samsung.c                
>  |  2 +
>  drivers/pinctrl/pinctrl-samsung.h                  |  1 +
>  5 files changed, 64 insertions(+), 2 deletions(-)

Acked-by: Tomasz Figa <t.figa@samsung.com>

As a side note, please write the PATCH keyword in the topic in upper case 
next time.

Best regards,
Tomasz

