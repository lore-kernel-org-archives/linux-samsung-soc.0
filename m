From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: switch Exynos EHCI/OHCI bindings to
 use array of generic PHYs
Date: Fri, 26 Jul 2019 12:54:44 +0200
Message-ID: <CAJKOXPceXJ4UPu9HDAy5rb0zqfe98YyS0pXCNMiT4zjjxQ0+nQ@mail.gmail.com>
References: <CGME20190726081505eucas1p22472e5d1e81180b7bca4f0c0af302af5@eucas1p2.samsung.com>
 <20190726081453.9456-1-m.szyprowski@samsung.com> <20190726081453.9456-2-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726081453.9456-2-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>, Peter Chen <peter.chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 26 Jul 2019 at 10:15, Marek Szyprowski <m.szyprowski@samsung.com> w=
rote:
>
> Commit 69bec7259853 ("USB: core: let USB device know device node") added
> support for attaching devicetree node for USB devices. Those nodes are
> children of their USB host controller. However Exynos EHCI and OHCI
> driver bindings already define child-nodes for each physical root hub
> port and assigns respective PHY controller and parameters to them. This
> leads to the conflict. A workaround for it has been merged as commit
> 01d4071486fe ("usb: exynos: add workaround for the USB device bindings
> conflict"), but it disabled support for USB device binding for Exynos
> EHCI/OHCI controllers.
>
> To resolve it properly, lets move PHYs from the sub-nodes to a standard
> array under the 'phys' property.
>
> Suggested-by: M=C3=A5ns Rullg=C3=A5rd <mans@mansr.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../devicetree/bindings/usb/exynos-usb.txt    | 41 +++++++------------
>  1 file changed, 14 insertions(+), 27 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
