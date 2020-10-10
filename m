Return-Path: <SRS0=3hxP=DR=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FAAC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 10 Oct 2020 22:57:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E60A20795
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 10 Oct 2020 22:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602370632;
	bh=QORHMnmWSEjYd8YMjB0g1v/EbTLN970fmst2j2tRPfM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=ZDDf/RWqk/rzVhDWYBWvgoJN/sk0Ecq1LSwH4w+6R+GubtVXWJwbTWm+dBt6wHHs9
	 hcQnoHgAFysNoPfBiUBWd6Ya0rzp9x0sk1cS8aET/++HVtLuqL0xPOB+2eCahNI46b
	 glhWbObABY+rfgeKXSE+/bfEb3U1wF2TZqSjVKy0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390417AbgJJW5L (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 10 Oct 2020 18:57:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:52034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731436AbgJJTW0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 10 Oct 2020 15:22:26 -0400
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2FCF922404;
        Sat, 10 Oct 2020 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602348663;
        bh=QORHMnmWSEjYd8YMjB0g1v/EbTLN970fmst2j2tRPfM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BdKZKSbB1/KZzKiQy9HRaLRagU6gYw2wZ5P6B9weBcPigsRhwQOIICIdR+6NY93de
         XdM5Kv70uWNgDWyVqa+haOBaVGxc+W6lZw+MhTYHD7WvAH7c58WFcO6yBjiB3V21Sj
         hNj6td5defmDaHkzhGk173Vrz4v1ZmJ8miquhqM0=
Date:   Sat, 10 Oct 2020 17:50:57 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     dmitry.torokhov@gmail.com
Cc:     Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-iio@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: adc: exynos: do not rely on 'users' counter in
 ISR
Message-ID: <20201010175057.768fe3b3@archlinux>
In-Reply-To: <20201006215509.GA2556081@dtor-ws>
References: <20201006215509.GA2556081@dtor-ws>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 6 Oct 2020 14:55:09 -0700
dmitry.torokhov@gmail.com wrote:

> The order in which 'users' counter is decremented vs calling drivers'
> close() method is implementation specific, and we should not rely on
> it. Let's introduce driver private flag and use it to signal ISR
> to exit when device is being closed.
>=20
> This has a side-effect of fixing issue of accessing inut->users
> outside of input->mutex protection.
>=20
> Reported-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to work their magic.

Given this doesn't have a fixes tag etc I'm assuming it isn't
high priority etc.  Let me know if it is!

Thanks,

Jonathan
> ---
>=20
> v3: fixed typo in exynos_adc_ts_close() per Micha=C5=82 Miros=C5=82aw
> v2: switched from ordinary read/write to READ_ONCE/WRITE_ONCE per Micha=
=C5=82
> Miros=C5=82aw
>=20
>  drivers/iio/adc/exynos_adc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
> index 22131a677445..908df4b9b93c 100644
> --- a/drivers/iio/adc/exynos_adc.c
> +++ b/drivers/iio/adc/exynos_adc.c
> @@ -7,6 +7,7 @@
>   *  Copyright (C) 2013 Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>   */
> =20
> +#include <linux/compiler.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/interrupt.h>
> @@ -135,6 +136,8 @@ struct exynos_adc {
>  	u32			value;
>  	unsigned int            version;
> =20
> +	bool			ts_enabled;
> +
>  	bool			read_ts;
>  	u32			ts_x;
>  	u32			ts_y;
> @@ -633,7 +636,7 @@ static irqreturn_t exynos_ts_isr(int irq, void *dev_i=
d)
>  	bool pressed;
>  	int ret;
> =20
> -	while (info->input->users) {
> +	while (READ_ONCE(info->ts_enabled)) {
>  		ret =3D exynos_read_s3c64xx_ts(dev, &x, &y);
>  		if (ret =3D=3D -ETIMEDOUT)
>  			break;
> @@ -712,6 +715,7 @@ static int exynos_adc_ts_open(struct input_dev *dev)
>  {
>  	struct exynos_adc *info =3D input_get_drvdata(dev);
> =20
> +	WRITE_ONCE(info->ts_enabled, true);
>  	enable_irq(info->tsirq);
> =20
>  	return 0;
> @@ -721,6 +725,7 @@ static void exynos_adc_ts_close(struct input_dev *dev)
>  {
>  	struct exynos_adc *info =3D input_get_drvdata(dev);
> =20
> +	WRITE_ONCE(info->ts_enabled, false);
>  	disable_irq(info->tsirq);
>  }
> =20

