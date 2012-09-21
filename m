From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH V6 2/2] video: drm: exynos: Add device tree support
Date: Fri, 21 Sep 2012 16:22:29 +0900
Message-ID: <CAAQKjZN7B1spgoD+LJjDU=PDd9jFk6g7PekuiKEeKpXLT-X4UA@mail.gmail.com>
References: <1348226536-22899-1-git-send-email-l.krishna@samsung.com>
	<1348226536-22899-3-git-send-email-l.krishna@samsung.com>
	<505BF79A.8060802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:61967 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753783Ab2IUHW3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Sep 2012 03:22:29 -0400
Received: by pbbrr4 with SMTP id rr4so2015069pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Sep 2012 00:22:29 -0700 (PDT)
In-Reply-To: <505BF79A.8060802@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org

2012/9/21 Stephen Warren <swarren@wwwdotorg.org>:
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
>

ok, I agree with you. then the videomode helper is going to be merged
to mainline(3.6)? if so, this patch should be reworked based on the
videomode helper.


> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
