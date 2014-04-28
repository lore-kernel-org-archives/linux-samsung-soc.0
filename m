From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 3/6] rtc: s5m: Use shorter time of register update
Date: Mon, 28 Apr 2014 13:13:52 +0100
Message-ID: <20140428121352.GC21279@lee--X1>
References: <1397827139-14589-1-git-send-email-k.kozlowski@samsung.com>
 <1397827139-14589-4-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:57038 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754408AbaD1MN7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 08:13:59 -0400
Received: by mail-wi0-f175.google.com with SMTP id cc10so5562628wib.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2014 05:13:57 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1397827139-14589-4-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

> Set the time needed for updating alarm and time registers to 0.45 ms.
> The default is 7.32 ms which is too long and leads to warnings when
> setting alarm or time:
> 	s5m-rtc: waiting for UDR update, reached max number of retries
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/rtc/rtc-s5m.c           |  7 +++++++
>  include/linux/mfd/samsung/rtc.h | 10 ++++++++++

=46or the MFD changes:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
