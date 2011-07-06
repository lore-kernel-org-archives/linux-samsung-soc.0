From: padma venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 1/2] SPI: S5PC100: Enable the SPI driver for S5PC100
Date: Wed, 6 Jul 2011 12:34:52 +0530
Message-ID: <CAAgF-BdGHzTjQABzqzVN=-XA6Qzn3b0FPppZLY_XG3OMehYwcA@mail.gmail.com>
References: <1309801476-29678-1-git-send-email-padma.v@samsung.com>
	<20110705100506.GT8286@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:42696 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752882Ab1GFHEy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Jul 2011 03:04:54 -0400
Received: by wwg11 with SMTP id 11so2883642wwg.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2011 00:04:52 -0700 (PDT)
In-Reply-To: <20110705100506.GT8286@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Padmavathi Venna <padma.v@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Russell,

On Tue, Jul 5, 2011 at 3:35 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Mon, Jul 04, 2011 at 01:44:35PM -0400, Padmavathi Venna wrote:
>> =A0config SPI_S3C64XX
>> =A0 =A0 =A0 tristate "Samsung S3C64XX series type SPI"
>> - =A0 =A0 depends on (ARCH_S3C64XX || ARCH_S5P64X0)
>> + =A0 =A0 depends on (ARCH_S3C64XX || ARCH_S5P64X0 || ARCH_S5PC100)
>
> Just get rid of the unnecessary parens here.
Thanks for your comment. I will remake the patch and will send the same=
=2E
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
