From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: Adding set_blob ioctl to DRM
Date: Thu, 20 Feb 2014 07:24:49 +0530
Message-ID: <CAPdUM4Nvy1S07L0LcD+Zcov=9obwrFAFr2EX-nDCmx8uYK56tA@mail.gmail.com>
References: <CAPdUM4PXxXgywMA8KnLhwAToHqfc0EP7HNDKjKJLK3T1HA7_eQ@mail.gmail.com>
	<CAPM=9tz6TzVyyCsNAGqt4Vy+WoKjcc-yvq7fSiLhNUKeWFO6bA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:56062 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752039AbaBTByv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Feb 2014 20:54:51 -0500
Received: by mail-wg0-f47.google.com with SMTP id k14so954088wgh.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2014 17:54:49 -0800 (PST)
In-Reply-To: <CAPM=9tz6TzVyyCsNAGqt4Vy+WoKjcc-yvq7fSiLhNUKeWFO6bA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dave Airlie <airlied@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Inki Dae <inki.dae@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, ajaykumar.rs@samsung.com, sunilm@samsung.com

Thanks Dave,

On 20 February 2014 06:54, Dave Airlie <airlied@gmail.com> wrote:
>> I am working on enabling a Color Enhancement block for primary display
>> for Exynos SoC. I need to
>> set a bunch of parameters like Color Conversion matrix, Contrast
>> Improvement parameters etc ~ 30 parameters from User Space.
>>
>> I am planning to use KDS blob property to receive these parameters.
>> Currently drivers are not allowed to create a blob property inside
>> drm. Neither, user space can set the blob. There is no ioctl provided
>> for same.
>
> I don't really like the idea of sticking unstructured data into an
> ioctl, for the driver to interpret,
>
> it opens the door to all kinds of ugly driver hacks, so I think we
> should have writable blobs,
> but with well defined structures inside them, not per-driver ones.
>

I agree with you. I will define these as generic structures which
are complete sets of parameters, required by standard color algorithms.
Something like this:

Color Reproduction:
        - R[r,g,b], G[r,g,b], B[r,g,b]
        - Cyan[r,g,b], Magenta[r,g,b], Yellow[r,g,b]
        - White[r,g,b]
        - Black[r,g,b]

I will share the code once it is in some shape.

Regards,
Rahul Sharma.

> Per-driver structures will lead to binary userspace drivers that start
> sticking a pll timings blob on the end and require it to set a mode,
> because I know driver developers will abuse any interface in the worst
> way possible.
>
> Currently the only blob we really have is EDID and its well defined,
> so if we are going to add writable blobs, they need to be well defined
> and as little as possible driver specific, just to avoid driver
> writings doing what driver writers do.
>
> Dave.
