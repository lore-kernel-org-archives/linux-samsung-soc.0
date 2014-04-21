From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: Re: [PATCH] usb: ohci-exynos: Add facility to use phy provided by the
 generic phy framework
Date: Tue, 22 Apr 2014 01:00:57 +0530
Message-ID: <CAFp+6iGrgMTE27FxpFTQfALJO_XypxGSZ1-wny8KAoY1sLBbWw@mail.gmail.com>
References: <1397136261-16408-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1397136261-16408-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linux USB Mailing List <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-doc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Kukjin Kim <kgene.kim@samsung.com>, robh+dt@kernel.org, Jingoo Han <jg1.han@samsung.com>, Alan Stern <stern@rowland.harvard.edu>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Apr 10, 2014 at 6:54 PM, Vivek Gautam <gautam.vivek@samsung.com> wrote:
> Add support to consume phy provided by Generic phy framework.
> Keeping the support for older usb-phy intact right now, in order
> to prevent any functionality break in absence of relevant
> device tree side change for ohci-exynos.
> Once we move to new phy in the device nodes for ohci, we can
> remove the support for older phys.

Any comments on this please.
I think whatever the approach we follow, that can be common to both
ehci-exynos[1], and ohci-exynos, since
both are needed to move to the new generic phy framework, keeping
support for older usb-phy
so as to have smooth transition, in order to avoid any regression.

> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> Cc: Jingoo Han <jg1.han@samsung.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> ---
>
> Based on 'usb-next' branch of Greg's usb tree.
> Tested with local dt patches, similar to ehci dt changes posted by Kamil[1].
> Tested on Exynos5250 smdk.
>
 [1] [PATCH v6 4/8] dts: Add usb2phy to Exynos 5250
     https://lkml.org/lkml/2014/1/29/302
>
>  .../devicetree/bindings/usb/exynos-usb.txt         |   14 ++++
>  drivers/usb/host/ohci-exynos.c                     |   79 ++++++++++++++++++--
>  2 files changed, 85 insertions(+), 8 deletions(-)
>
[snip]
