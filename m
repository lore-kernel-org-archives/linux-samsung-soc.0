From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: exynos: Use standard arrays of generic
 PHYs for EHCI/OHCI devices
Date: Fri, 26 Jul 2019 13:04:52 +0200
Message-ID: <CAJKOXPeQS+f6KAUW5xkh2A7Kz9wAfQdJ5Q9aeW_NCMDbjVv=GA@mail.gmail.com>
References: <CGME20190726081506eucas1p20e7e633e89529b862952fe9f783f72e5@eucas1p2.samsung.com>
 <20190726081453.9456-1-m.szyprowski@samsung.com> <20190726081453.9456-4-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726081453.9456-4-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>, Peter Chen <peter.chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 26 Jul 2019 at 10:15, Marek Szyprowski <m.szyprowski@samsung.com> w=
rote:
>
> Move USB PHYs to a standard arrays for Exynos EHCI/OHCI devices. This
> resolves the conflict between Exynos EHCI/OHCI sub-nodes and generic USB
> device bindings. Once the Exynos EHCI/OHCI sub-nodes are removed, the
> boards can finally provide sub-nodes for the USB devices using generic US=
B
> device bindings.
>
> Suggested-by: M=C3=A5ns Rullg=C3=A5rd <mans@mansr.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi                | 28 +++----------------
>  .../boot/dts/exynos4210-universal_c210.dts    |  8 ++----
>  arch/arm/boot/dts/exynos4412-itop-elite.dts   |  9 ++----
>  arch/arm/boot/dts/exynos4412-odroidu3.dts     |  8 ++----
>  arch/arm/boot/dts/exynos4412-odroidx.dts      |  5 ++--
>  arch/arm/boot/dts/exynos4412-origen.dts       |  9 ++----
>  arch/arm/boot/dts/exynos5250.dtsi             | 16 +++--------
>  arch/arm/boot/dts/exynos54xx.dtsi             | 18 +++---------
>  8 files changed, 22 insertions(+), 79 deletions(-)

Looks ok. I see it depends on driver changes so I will pick it up
after the driver hits mainline.

Best regards,
Krzysztof
