From: Varka Bhadram <varkabhadram@gmail.com>
Subject: Re: [PATCH v7 05/15] drm/exynos: add Exynos5433 decon driver
Date: Mon, 22 Jun 2015 17:29:52 +0530
Message-ID: <5587F8B8.2040307@gmail.com>
References: <1434113958-15877-6-git-send-email-human.hwang@samsung.com> <1434971779-5342-1-git-send-email-inki.dae@samsung.com> <5587F47F.5050405@gmail.com> <5587F82A.6000409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:34074 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753592AbbFVMAW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jun 2015 08:00:22 -0400
Received: by pabvl15 with SMTP id vl15so86665030pab.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jun 2015 05:00:21 -0700 (PDT)
In-Reply-To: <5587F82A.6000409@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>

On 06/22/2015 05:27 PM, Inki Dae wrote:

> On 2015=EB=85=84 06=EC=9B=94 22=EC=9D=BC 20:41, Varka Bhadram wrote:
>
(..)

> +    platform_set_drvdata(pdev, ctx);
>> You are setting the driver data as ctx..
>>
>> But no where you are using it...?
>>
>> Am i missing anything ?
> See decon_bind and decon_unbind functions. :)

Cleared. Thanks


--=20
Best regards,
Varka Bhadram.
