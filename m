From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH V6 2/2] video: drm: exynos: Add device tree support
Date: Mon, 1 Oct 2012 10:59:04 +0530
Message-ID: <CAL1wa8eOA6eV-9EoeUFrSFaFwq5sEVnYXn9yKnPRv=0mSU5WvQ@mail.gmail.com>
References: <1348226536-22899-1-git-send-email-l.krishna@samsung.com>
 <1348226536-22899-3-git-send-email-l.krishna@samsung.com> <505BF79A.8060802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:62096 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750822Ab2JAF30 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Oct 2012 01:29:26 -0400
Received: by lbon3 with SMTP id n3so3666678lbo.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 30 Sep 2012 22:29:24 -0700 (PDT)
In-Reply-To: <505BF79A.8060802@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org

Hello Stephen Warren,

The binding names that I use in my dts file should match with the
names given in http://lists.freedesktop.org/archives/dri-devel/2012-July/024875.html
right?
I think that is the only thing I have to take care, and as I'm not
using "struct drm_display_mode"  in my driver its my wish whether to
use the helper function or not.
Please clarify me if I miss something.

Best Regards,
Leela Krishna Amudala.

On Fri, Sep 21, 2012 at 10:44 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 09/21/2012 05:22 AM, Leela Krishna Amudala wrote:
>> This patch adds device tree based discovery support for exynos DRM-FIMD
>> driver which includes driver modification to handle platform data in
>> both the cases with DT and non-DT, Also adds the documentation for bindings.
>
>> diff --git a/Documentation/devicetree/bindings/drm/exynos/fimd.txt b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
> ...
>> + - samsung,fimd-display: This property should specify the phandle of the
>> +   display device node which holds the video interface timing with the
>> +   below mentioned properties.
>> +
>> +   - lcd-htiming: Specifies the horizontal timing for the overlay. The
>> +     horizontal timing includes four parameters in the following order.
>> +
>> +     - horizontal back porch (in number of lcd clocks)
>> +     - horizontal front porch (in number of lcd clocks)
>> +     - hsync pulse width (in number of lcd clocks)
>> +     - Display panels X resolution.
>> +
>> +   - lcd-vtiming: Specifies the vertical timing for the overlay. The
>> +     vertical timing includes four parameters in the following order.
>> +
>> +     - vertical back porch (in number of lcd lines)
>> +     - vertical front porch (in number of lcd lines)
>> +     - vsync pulse width (in number of lcd clocks)
>> +     - Display panels Y resolution.
>
> Should this not use the new videomode timings that are under discussion at:
>
> http://lists.freedesktop.org/archives/dri-devel/2012-July/024875.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
