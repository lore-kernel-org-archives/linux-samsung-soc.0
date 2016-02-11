From: Chanho Park <parkch98@gmail.com>
Subject: Re: [PATCH] drm/exynos: support exynos5422 mipi-dsi
Date: Thu, 11 Feb 2016 23:10:04 +0900
Message-ID: <CAPTzV14s80eRe+pPmPToJcmV902aKk41bvNT04+vQkLkKSCRUg@mail.gmail.com>
References: <1454163110-20103-1-git-send-email-parkch98@gmail.com>
	<CACvgo51WTYAYon4e4+hT7_vaeSDDR41pA0QmnjZ1FM3QR8vvOg@mail.gmail.com>
Reply-To: chanho61.park@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vk0-f44.google.com ([209.85.213.44]:36237 "EHLO
	mail-vk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751255AbcBKOKF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Feb 2016 09:10:05 -0500
Received: by mail-vk0-f44.google.com with SMTP id c3so37028193vkb.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Feb 2016 06:10:05 -0800 (PST)
In-Reply-To: <CACvgo51WTYAYon4e4+hT7_vaeSDDR41pA0QmnjZ1FM3QR8vvOg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, ML dri-devel <dri-devel@lists.freedesktop.org>

Hi Emil,

On Wed, Feb 10, 2016 at 9:34 PM, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> Hi Chanho Park
>
> On 30 January 2016 at 14:11, Chanho Park <parkch98@gmail.com> wrote:
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>
>>  static struct of_device_id exynos_dsi_of_match[] = {
>
> If you feel extra gracious you can constify the array and all of it's
> entries, for good measure.
> Likely in another patch of course :-)

Andrzej already made the patch[1] as pointed out from you.

[1]: http://www.spinics.net/lists/dri-devel/msg100246.html

-- 
Best Regards,
Chanho Park
