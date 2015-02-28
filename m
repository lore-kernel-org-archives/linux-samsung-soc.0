From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Subject: Re: smdk4412 (Samsung Galaxy S3 i9300) status
Date: Sat, 28 Feb 2015 17:15:05 +0100
Message-ID: <CAJKOXPeexstnOb0WLuh6Ygqb4KqVbDhYBQYdCwzXC4JtWWsifg@mail.gmail.com>
References: <CAH=tA9FSPmegGofqYcatRCsBoviQxRgQFdT-FOEXytCt_Yos9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:58050 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752126AbbB1QPG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 28 Feb 2015 11:15:06 -0500
Received: by mail-vc0-f169.google.com with SMTP id im6so551259vcb.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 28 Feb 2015 08:15:05 -0800 (PST)
In-Reply-To: <CAH=tA9FSPmegGofqYcatRCsBoviQxRgQFdT-FOEXytCt_Yos9w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicolae Rosia <nicolae.rosia@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

2015-02-28 11:57 GMT+01:00, Nicolae Rosia <nicolae.rosia@gmail.com>:
> Hello,
>
> I want to boot my i9300 to a framebuffer console with the mainline
> kernel. Did anyone tried this already and have a device tree for the
> device?

Hi,

The Trats2 device is the other name for S3, so you can use exynos
defconfig and exynos4412-trats2.dts.

P.S. I am resending the mail because Google produced HTML which is
banned on LKML.

Best regards,
Krzysztof


> Best regards,
> Nicolae Rosia
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
