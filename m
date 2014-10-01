From: Daniel Drake <drake@endlessm.com>
Subject: Re: 3.17-rc6 on ODROID: ERROR: Bad of_node_put() on /ehci@12580000/port@1
Date: Wed, 1 Oct 2014 09:12:38 -0600
Message-ID: <CAD8Lp46UxTd04fczjm9c1597SBnvR--PUasjBqZwvWU8MKtj8Q@mail.gmail.com>
References: <CAD8Lp45qyHpHqRnUy4T9Sm8zV4XJBDp=cLYXjtcxmVrS8GSjbg@mail.gmail.com>
	<CAFp+6iGwB3XuzSuYPzO=5MacPO2LGFDnh9oS5rAL3Ne26wb9Dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:39540 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751236AbaJAPMj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Oct 2014 11:12:39 -0400
Received: by mail-wi0-f181.google.com with SMTP id hi2so961440wib.14
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Oct 2014 08:12:38 -0700 (PDT)
In-Reply-To: <CAFp+6iGwB3XuzSuYPzO=5MacPO2LGFDnh9oS5rAL3Ne26wb9Dg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>

On Wed, Oct 1, 2014 at 12:36 AM, Vivek Gautam <gautam.vivek@samsung.com> wrote:
> One reason i doubt why it could be coming is because we are
> specifically putting the
> child after doing everything with it.
>
> When we are getting the child node using for_each_available_child_of_node(),
> which calls for of_get_next_available_child(). So of_get_next_available_child()
> does a of_node_put() on the "prev" node, in case we have siblings to the child.
>
> Can you see if the below change helps ?
>
> ------------------------------------------------------------------------------------------------------------
> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> index 7189f2e..1b726bf 100644
> --- a/drivers/usb/host/ehci-exynos.c
> +++ b/drivers/usb/host/ehci-exynos.c
> @@ -74,7 +74,6 @@ static int exynos_ehci_get_phy(struct device *dev,
>
>                 phy = devm_of_phy_get(dev, child, NULL);
>                 exynos_ehci->phy[phy_number] = phy;
> -               of_node_put(child);
>                 if (IS_ERR(phy)) {
>                         ret = PTR_ERR(phy);
>                         if (ret == -EPROBE_DEFER) {
> ------------------------------------------------------------------------------------------------------------
>
>
> This is on top of usb-next.
> If you are testing on rc6 only, then probably you will have to cherrypick two
> patches each for ehci-exynos and ohci-exynos:
> usb: host: ehci-exynos: Remove unnecessary usb-phy support
> usb: host: ohci-exynos: Remove unnecessary usb-phy support

I made the equivalent change to 3.17-rc7 (right now 3.17 is my main
interest), i.e. removed all of_node_put calls from
exynos_ehci_get_phy(). Same change is needed in exynos_ohci_get_phy().
Now the warnings are gone.
BTW, I think the warning only appeared when CONFIG_OF_SELFTEST=y

I didn't check the implementation details like you did, but I looked
at a few other users of for_each_available_child_of_node and it looks
like indeed you do not need to call of_node_put() on the children in
the normal case, or at least, nobody else does.

Thanks,
Daniel
