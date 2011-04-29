From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: S3C2416, S3C2443 HS-SPI driver?
Date: Fri, 29 Apr 2011 09:15:39 +0530
Message-ID: <BANLkTikieLM9yyDttFvo4CvmmxjG9=m6FQ@mail.gmail.com>
References: <201104282205.33100.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:51543 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751073Ab1D2Dpk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Apr 2011 23:45:40 -0400
Received: by bwz15 with SMTP id 15so2818896bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Apr 2011 20:45:39 -0700 (PDT)
In-Reply-To: <201104282205.33100.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

On Fri, Apr 29, 2011 at 1:35 AM, Heiko St=C3=BCbner <heiko@sntech.de> w=
rote:
> Hi,
>
> does a driver for spi on s3c2416/s3c2443 SoCs exist somewhere? The on=
e for the
> other s3c24XX SoCs seems to be different.
>
> I did a comparison of the spi-parts of s3c2416 and s3c6400 manuals an=
d they
> seem very much alike in their registers and working descriptions.
>
The spi_s3c64xx.c has designed to accomodate such slight variations in
controllers.
=46or the same 'template' controller, the driver can make it work if
passed appropriate
configuration parameters via 'struct s3c64xx_spi_info'
