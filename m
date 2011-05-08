From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH 2/4] ARM: S3C24XX: Add plaform device definition for USB
 High-Speed gadget controller.
Date: Sun, 08 May 2011 15:17:52 +0400
Message-ID: <4DC67BE0.9080905@ru.mvista.com>
References: <Pine.LNX.4.44L0.1104141313210.2487-100000@iolanthe.rowland.org> <20110416145830.GA8811@kroah.com> <201105072223.44163.heiko@sntech.de> <201105072226.53556.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:51307 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753767Ab1EHLTg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 8 May 2011 07:19:36 -0400
In-Reply-To: <201105072226.53556.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Greg KH <greg@kroah.com>, Alan Stern <stern@rowland.harvard.edu>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Thomas Abraham <thomas.ab@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Alexander Neumann <alexander@debian.org>

Hello.

On 08-05-2011 0:26, Heiko St=FCbner wrote:

> From: Thomas Abraham<thomas.ab@samsung.com>

> S3C2416, S3C2443 and S3C2450 includes a USB High-Speed Gadget control=
ler module.
> This patch adds the following for supporting this controller.

> 1. Definition for USB High-Speed controller base address.
> 2. Platform device instantiation.
> 3. Declaration for platform data structure.
> 4. Functionality to setup platform data for the controller.

> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
> Signed-off-by: Sangbeom Kim<sbkim73@samsung.com>
[...]

> diff --git a/arch/arm/plat-s3c24xx/devs.c b/arch/arm/plat-s3c24xx/dev=
s.c
> index 268f3ed..7366799 100644
> --- a/arch/arm/plat-s3c24xx/devs.c
> +++ b/arch/arm/plat-s3c24xx/devs.c
[...]
> @@ -233,6 +234,46 @@ void __init s3c24xx_udc_set_platdata(struct s3c2=
410_udc_mach_info *pd)
[...]
> +void __init s3c24xx_hsudc_set_platdata(struct s3c24xx_hsudc_platdata=
 *pd)
> +{
> +	struct s3c24xx_hsudc_platdata *npd;
> +
> +	npd =3D kmalloc(sizeof(*npd), GFP_KERNEL);
> +	if (npd) {
> +		memcpy(npd, pd, sizeof(*npd));

    You could use kmemdup() (from mm/util.c) instead...

WBR, Sergei
