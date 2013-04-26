From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] drm/exynos: fix multiple definition build error
Date: Fri, 26 Apr 2013 22:00:27 +0200
Message-ID: <517ADCDB.3040101@gmail.com>
References: <1366952590-11652-1-git-send-email-inki.dae@samsung.com> <CAAQKjZPQ4LWTka0rfgPypsh+a-B5gzBv5hEbRYdkrry_C5J6Hg@mail.gmail.com> <517A4D82.8010306@samsung.com> <4121004.exzbXa8F0p@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:59802 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756097Ab3DZUAc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Apr 2013 16:00:32 -0400
Received: by mail-ee0-f54.google.com with SMTP id e49so739251eek.27
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2013 13:00:30 -0700 (PDT)
In-Reply-To: <4121004.exzbXa8F0p@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>

On 04/26/2013 09:42 PM, Tomasz Figa wrote:
> On Friday 26 of April 2013 11:48:50 Sylwester Nawrocki wrote:
>> On 04/26/2013 10:20 AM, Inki Dae wrote:
>>> Exactly right. it's my mistake. But now it seems that
>>> __mode_of_device_table is multi defined at fimd and g2d side so there
>>> still is module build error. :(
>> Since all drivers seem to be linked into single a single module, you
>> likely need to create a separate table of struct of_device_id just for
>> the purpose of MODULE_DEVICE_TABLE(of, ...). This table would contain
>> 'compatible' strings for all devices. Or choose of_device_id for just
>> one device and define MODULE_DEVICE_TABLE() for it in some common place,
>> e.g. exynos_drm_drv.c. I believe all devices should be listed though.
>
> IMHO, the most proper solution would be to split the module into parent
> exynos_drm module and per-device submodules, which would depend on the
> parent module.
>
> This way you would be able to load dynamically any submodule you want,
> without recompiling the modules.

Yes, this is how it would have been in a perfect world. Probably something
worth to consider for the future, it likely implies a lot of work.

OTOH if there is one device for which the driver will always be present
in the main module it should be enough to make a single entry
MODULE_DEVICE_TABLE including its compatible string to ensure the driver
is properly loaded, shouldn't it ?
