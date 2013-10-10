From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 3/5] USB: ehci-exynos: Remove non-DT support
Date: Thu, 10 Oct 2013 15:59:37 +0900
Message-ID: <000001cec586$48cb84f0$da628ed0$%han@samsung.com>
References: <000001cec582$02a6cfb0$07f46f10$%han@samsung.com>
 <000901cec582$6ba1f6c0$42e5e440$%han@samsung.com>
 <CAK9yfHx6+j7WfY077wP24_U5MAEoqySHHiWtsjjO7JtezOiz1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45417 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752049Ab3JJG7k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 02:59:40 -0400
In-reply-to: <CAK9yfHx6+j7WfY077wP24_U5MAEoqySHHiWtsjjO7JtezOiz1A@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Alan Stern' <stern@rowland.harvard.edu>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Thursday, October 10, 2013 3:49 PM, Sachin Kamat wrote:
> On 10 October 2013 12:01, Jingoo Han <jg1.han@samsung.com> wrote:
> > The non-DT for EXYNOS SoCs is not supported from v3.11.
> > Thus, there is no need to support non-DT for Exynos EHCI driver.
> >
> > The 'include/linux/platform_data/usb-ehci-exynos.h' file has been
> > used for non-DT support. Thus, the 'usb-ehci-exynos.h' file can
> > be removed.
> 
> Wouldn't it be better to do the non-DT cleanup first and then the renaming.
> This would avoid unnecessary code churn. For e.g., since the header file is
> deleted in this patch, it doesn't make sense to rename the file and
> other variable/function
> names in the previous patch.

Hi Sachin Kamat,

OK, I see.
I will do the non-DT cleanup first and then the renaming,
as you mentioned.
Then, the v2 patches will be as below:

[PATCH 1/5] ARM: SAMSUNG: Remove unused s5p_device_ehci
[PATCH 2/5] USB: ehci-s5p: Remove non-DT support
[PATCH 3/5] USB: ohci-exynos: Remove non-DT support
[PATCH 4/5] USB: host: Rename ehci-s5p to ehci-exynos
[PATCH 5/5] USB: ohci-exynos: Add missing usb_put_hcd()

Best regards,
Jingoo Han
