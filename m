From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v3 2/2] ARM: EXYNOS: Call regulator core suspend prepare
 and finish functions
Date: Tue, 11 Nov 2014 11:23:26 +0100
Message-ID: <CABxcv=mMqh5UD0_Wz3rNaFbZD3BH_2Z+7srzccd=-5_ndo_a1Q@mail.gmail.com>
References: <1413839151-10875-1-git-send-email-javier.martinez@collabora.co.uk>
	<1413839151-10875-3-git-send-email-javier.martinez@collabora.co.uk>
	<CABxcv==YZjO9p3aNyuRpe3DYS+=BcY_N2esuTg0hGASb_b_OdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:50318 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751623AbaKKKX1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Nov 2014 05:23:27 -0500
Received: by mail-wi0-f178.google.com with SMTP id bs8so1124896wib.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Nov 2014 02:23:26 -0800 (PST)
In-Reply-To: <CABxcv==YZjO9p3aNyuRpe3DYS+=BcY_N2esuTg0hGASb_b_OdA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Mark Brown <broonie@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hello Kukjin,

On Thu, Oct 30, 2014 at 11:06 AM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> Hello Kukjin,
>
> On Mon, Oct 20, 2014 at 11:05 PM, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> wrote:
>> The regulator framework has a set of helpers functions to be used when
>> the system is entering and leaving from suspend but these are not called
>> on Exynos platforms. This means that the .set_suspend_* function handlers
>> defined by regulator drivers are not called when the system is suspended.
>>
>> Suggested-by: Doug Anderson <dianders@chromium.org>
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> Reviewed-by: Doug Anderson <dianders@chromium.org>
>> ---
>>  arch/arm/mach-exynos/suspend.c | 23 +++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>
> Any comments on this patch?
>

Just a gentle reminder about this patch.

Best regards,
Javier
