From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH 0/2] usb: exynos: Fix compatible strings used for device
Date: Thu, 13 Dec 2012 21:37:16 +0530
Message-ID: <CAFp+6iEqaV7osuo_4pQKEmWMoGuqY-O03k-9n23wbJBMKa0kwg@mail.gmail.com>
References: <1355410348-5129-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1355410348-5129-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, jg1.han@samsung.com, Vivek Gautam <gautam.vivek@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

CC: LKML

On Thu, Dec 13, 2012 at 8:22 PM, Vivek Gautam <gautam.vivek@samsung.com> wrote:
> Using chip specific compatible string as it should be.
> So fixing this for ehci-s5p, ohci-exynos and dwc3-exynos
> which till now used a generic 'exynos' in their compatible strings.
>
> This goes as per the discussion happened in the thread for
> [PATCH v2] ARM: Exynos5250: Enabling dwc3-exynos driver
> available at:
> http://www.spinics.net/lists/linux-usb/msg74145.html
>
> Vivek Gautam (2):
>   usb: ehci-s5p/ohci-exynos: Fix compatible strings for the device
>   usb: dwc3-exynos: Fix compatible strings for the device
>
>  drivers/usb/dwc3/dwc3-exynos.c |    2 +-
>  drivers/usb/host/ehci-s5p.c    |    2 +-
>  drivers/usb/host/ohci-exynos.c |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> --
> 1.7.6.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Thanks & Regards
Vivek
