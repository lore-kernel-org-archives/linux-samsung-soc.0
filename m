From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] ARM: dts: Add sd0_rst pinctrl node to exynos5420
Date: Fri, 23 Jan 2015 15:36:43 +0100
Message-ID: <CABxcv=mJhHTBKes38+6kHi5o3RmBHHN6sVqBUDRc-YyNvkdESQ@mail.gmail.com>
References: <1422023038-11842-1-git-send-email-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422023038-11842-1-git-send-email-jh80.chung@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Jaehoon,

On Fri, Jan 23, 2015 at 3:23 PM, Jaehoon Chung <jh80.chung@samsung.com> wrote:
> Add sd0_rst node to exynos5420-pinctrl.dtsi.
> (It's used on odroid-xu3 board)
>

It would be good to mention which device needs this pinctrl line.

> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    5 +++++

If this pin is used by the Odroid XU3 board, shouldn't be defined in
the exynos5422-odroidxu3.dts instead?

Best regards,
Javier
