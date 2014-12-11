From: David Laight <David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org>
Subject: RE: [PATCH 0/4] phy: samsung-usb2: Add support for Vbus regulator
Date: Thu, 11 Dec 2014 12:22:56 +0000
Message-ID: <063D6719AE5E284EB5DD2968C1650D6D1CA0B0EB@AcuExch.aculab.com>
References: <1418299367-2412-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418299367-2412-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Vivek Gautam' <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kishon-l0cyMroinI0@public.gmane.org" <kishon-l0cyMroinI0@public.gmane.org>, "k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Vivek Gautam
> This has been on my to-do list for sometime.
> Until now the host controller (specifically ehci-exynos) is responsible
> for enabling VBUS supply. This opens up one more issue which is, when
> only ohci-exynos is enabled and ehci-exynosis disabled then VBUS was
> never enabled (since ohci did not have the code to enabled the VBUS supply).
> 
> Rather it should be wise to move the VBUS related stuff to phy driver and
> let phy take care of enabling it.
> 
> This patch series adds that VBUS regulator to phy-samsung-usb2 driver,
> adds necessary binding information as well as vbus-supply properties
> to phy nodes on exynos5250 systems.
...

Does this go anyway to allowing devices to be powered from a micro-usb
connector while acting as a USB host (USB OTG).
ie when you want VBUS disabled even though it would normally
need to be enabled.

	David



--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
