From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH V6 2/2] video: drm: exynos: Add device tree support
Date: Wed, 3 Oct 2012 09:36:00 +0530
Message-ID: <CAL1wa8egdA=1iu8Jr-TQLnSweOQoCL=TD4cvo1BHHNn9UyOSEQ@mail.gmail.com>
References: <1348226536-22899-1-git-send-email-l.krishna@samsung.com>
 <1348226536-22899-3-git-send-email-l.krishna@samsung.com> <505BF79A.8060802@wwwdotorg.org>
 <CAL1wa8eOA6eV-9EoeUFrSFaFwq5sEVnYXn9yKnPRv=0mSU5WvQ@mail.gmail.com> <5069C2DC.8080905@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:43049 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750704Ab2JCEGV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Oct 2012 00:06:21 -0400
Received: by pbbrr4 with SMTP id rr4so9433082pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Oct 2012 21:06:21 -0700 (PDT)
In-Reply-To: <5069C2DC.8080905@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, kgene.kim@samsung.com, laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org

On Mon, Oct 1, 2012 at 9:50 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 09/30/2012 11:29 PM, Leela Krishna Amudala wrote:
>> Hello Stephen Warren,
>>
>> The binding names that I use in my dts file should match with the
>> names given in http://lists.freedesktop.org/archives/dri-devel/2012-July/024875.html
>> right?
>
> I don't think so; the binding in that link is for example:
>
>> + - xres, yres: Display resolution
>> + - left-margin, right-margin, hsync-len: Horizontal Display timing parameters
>> +   in pixels
>> +   upper-margin, lower-margin, vsync-len: Vertical display timing parameters in
>> +   lines
>> + - clock: displayclock in Hz
>
> i.e. a bunch of separate properties, one for each value needed to
> describe the display timing. However, your patch contains:
>

I mean to say that even I have to use separate properties for each one
instead of grouping them.
Also the names should match with the ones given in the example..?

>>>> + - samsung,fimd-display: This property should specify the phandle of the
>>>> +   display device node which holds the video interface timing with the
>>>> +   below mentioned properties.
>>>> +
>>>> +   - lcd-htiming: Specifies the horizontal timing for the overlay. The
>>>> +     horizontal timing includes four parameters in the following order.
>>>> +
>>>> +     - horizontal back porch (in number of lcd clocks)
>>>> +     - horizontal front porch (in number of lcd clocks)
>>>> +     - hsync pulse width (in number of lcd clocks)
>>>> +     - Display panels X resolution.
>
> A single lcd-htiming property, which contains 4 values. (and a similar
> construct for the vertical timing).
>
> That seems entirely different to me...
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
