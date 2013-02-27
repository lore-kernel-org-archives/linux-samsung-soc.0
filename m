From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [RESEND PATCH v9 0/2] usb: phy: samsung: Introducing usb phy
 driver for samsung SoCs
Date: Wed, 27 Feb 2013 14:00:25 +0530
Message-ID: <CAFp+6iGx1z9BcE3nLTVvOMG6VWVuYhDuKm5wu3DtbL8M1pfUtg@mail.gmail.com>
References: <1358499623-13901-1-git-send-email-p.paneri@samsung.com>
	<20130227081521.GG8016@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f51.google.com ([209.85.214.51]:60526 "EHLO
	mail-bk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753735Ab3B0Ia0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 03:30:26 -0500
In-Reply-To: <20130227081521.GG8016@arwen.pp.htv.fi>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com
Cc: Praveen Paneri <p.paneri@samsung.com>, linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, gregkh@linuxfoundation.org, thomas.abraham@linaro.org, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, l.majewski@samsung.com, kyungmin.park@samsung.com, grant.likely@secretlab.ca, heiko@sntech.de, t.figa@samsung.com, gautam.vivek@samsung.com

Hi Balbi,


On Wed, Feb 27, 2013 at 1:45 PM, Felipe Balbi <balbi@ti.com> wrote:
> Hi,
>
> On Fri, Jan 18, 2013 at 02:30:21PM +0530, Praveen Paneri wrote:
>> Changes from v8:
>> Resending this patch series after rebasing to the latest usb-next branch.
>> Rewording inline comments for better readability.
>> Removed IS_ENABLED(CONFIG_OF) as pdev->dev.of_node is enough to check for dt support.
>> Using of_match_ptr to add of_match_table to platform_driver structure.
>> Removed unnecessary variables.
>
> trying applying these but it doesn't apply unfortunately.
>

Already present in 3.8.0 ? ;-)


-- 
Thanks & Regards
Vivek
