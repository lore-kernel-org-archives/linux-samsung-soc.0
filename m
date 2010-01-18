From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Add initial documentation directory and
 overview
Date: Mon, 18 Jan 2010 12:13:34 +0100
Message-ID: <4B54425E.8020400@gmail.com>
References: <1263804317-8996-1-git-send-email-ben-linux@fluff.org> <1263804317-8996-4-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:63801 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750898Ab0ARLNh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jan 2010 06:13:37 -0500
Received: by ewy19 with SMTP id 19so392910ewy.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Jan 2010 03:13:36 -0800 (PST)
In-Reply-To: <1263804317-8996-4-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Op 18-01-10 09:45, Ben Dooks schreef:
> Start Documentation/arm/Samsung and add an initial overview file
> which whilst is not complete, is better than nothing.
>
> Signed-off-by: Ben Dooks<ben-linux@fluff.org>
> ---
>   Documentation/arm/Samsung/Overview.txt |   63 ++++++++++++++++++++++++++++++++
>   1 files changed, 63 insertions(+), 0 deletions(-)
>   create mode 100644 Documentation/arm/Samsung/Overview.txt
>
> diff --git a/Documentation/arm/Samsung/Overview.txt b/Documentation/arm/Samsung/Overview.txt
> new file mode 100644
> index 0000000..c3d2f44
> --- /dev/null
> +++ b/Documentation/arm/Samsung/Overview.txt
> @@ -0,0 +1,63 @@
> +		Samsung ARM Linux Overview
> +		==========================
> +
> +Introduction
> +------------
> +
> +  The Samsung range of ARM SoCs spans many similar devices, from the initial
> +  ARM9 through to the newest ARM cores. This document shows an overview of
> +  the current kernel support, how to use it and where to find the code
> +  that supports this.
> +
> +  The currently supported SoCs are:
> +
> +  - S3C24XX: See Documentation/arm/Samsung-S3C24XX/Overview.txt for full list
> +  - S3C64XX: S3C6400 and S3C6410
> +
> +  S5PC100 and S5PC110 support is currently being merged
> +
> +
> +S3C24XX Systems
> +---------------
> +
> +  There is still documentation in Docuemntation/arm/Samsung-S3C24XX/ which
>    

Same typo as before? Docuemntation ->  Documentation


> +  deals with the architecture and drivers specific to these devices.
> +
> +  See Documentation/arm/Samsung-S3C24XX/Overview.txt for more information
> +  on the implementation details and specific support.
> +
> +
> +Configuration
> +-------------
> +
> +  A number of configurations are supplied, as there is no current way of
> +  unifying all the SoCs into one kernel.
> +
> +  [ to finish ]
> +
> +Layout
> +------
> +
> +  [ to finish ]
> +
> +
> +Port Contributors
> +-----------------
> +
> +  Ben Dooks (BJD)
> +  Vincent Sanders
> +  Herbert Potzl
> +  Arnaud Patard (RTP)
> +  Roc Wu
> +  Klaus Fetscher
> +  Dimitry Andric
> +  Shannon Holland
> +  Guillaume Gourat (NexVision)
> +  Christer Weinigel (wingel) (Acer N30)
> +  Lucas Correia Villa Real (S3C2400 port)
> +
> +
> +Document Author
> +---------------
> +
> +Copyright 2009 Ben Dooks<ben-linux@fluff.org>
>    

Regards,
Maurus Cuelenaere
