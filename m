From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/3] usb: exynos: add support for getting PHYs from the
 standard dt array
Date: Fri, 26 Jul 2019 13:00:02 +0200
Message-ID: <CAJKOXPddpDso=Zjktwm0ofLe20o_FHD4REtuR5dEG64ttVwLEg@mail.gmail.com>
References: <CGME20190726081505eucas1p146c14eed320c57050aa968b7c97b227b@eucas1p1.samsung.com>
 <20190726081453.9456-1-m.szyprowski@samsung.com> <20190726081453.9456-3-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726081453.9456-3-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>, Peter Chen <peter.chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 26 Jul 2019 at 10:15, Marek Szyprowski <m.szyprowski@samsung.com> w=
rote:
>
> Add the code for getting generic PHYs from standard device tree array
> from the main controller device node. This is a first step in resolving
> the conflict between Exynos EHCI/OHCI sub-nodes and generic USB device
> bindings. Later the sub-nodes currently used for assigning PHYs to root
> ports of the controller will be removed making a place for the generic
> USB device bindings nodes.
>
> Suggested-by: M=C3=A5ns Rullg=C3=A5rd <mans@mansr.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/host/ehci-exynos.c | 23 +++++++++++++++++++----
>  drivers/usb/host/ohci-exynos.c | 23 +++++++++++++++++++----
>  2 files changed, 38 insertions(+), 8 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
