From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: exynos_hdmi.c fails to build with v3.13-10094-g9b0cd30
Date: Fri, 31 Jan 2014 12:14:20 +0530
Message-ID: <CAK9yfHzhv-QJxKZ0cRStfU-bnJrL8RCPMbPXbXzp+WkLSa8xTA@mail.gmail.com>
References: <CA+5PVA6CNam9F_n=Sz9o=4-RHVCVczeJ1G1_EzcUTj92nzALFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:43379 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751292AbaAaGoU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Jan 2014 01:44:20 -0500
Received: by mail-ob0-f175.google.com with SMTP id wn1so4575625obc.34
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jan 2014 22:44:20 -0800 (PST)
In-Reply-To: <CA+5PVA6CNam9F_n=Sz9o=4-RHVCVczeJ1G1_EzcUTj92nzALFQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Josh Boyer <jwboyer@fedoraproject.org>
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene.kim@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>

Hi Josh,

On 30 January 2014 22:17, Josh Boyer <jwboyer@fedoraproject.org> wrote:
> Hi All,
>
> After the DRM merge, the exynos_hdmi.c file fails to build with our
> ARM config.  The error is:
>
> drivers/gpu/drm/exynos/exynos_hdmi.c:382:8: error: 'hdmi_infoframe'
> defined as wrong kind of tag
>  struct hdmi_infoframe {
>         ^
> make[4]: *** [drivers/gpu/drm/exynos/exynos_hdmi.o] Error 1
> make[3]: *** [drivers/gpu/drm/exynos] Error 2
> make[2]: *** [drivers/gpu/drm] Error 2
>
> which to me was a somewhat confusing error message.  After digging
> further, I believe it means that there is a conflict with the
> definition in exynos_hdmi.c and the one found in include/linux/hdmi.h
> for what hdmi_infoframe is supposed to be.
>
> exynos_hdmi.c:
>
> struct hdmi_infoframe {
>         enum HDMI_PACKET_TYPE type;
>         u8 ver;
>         u8 len;
> };
>
>
> include/linux/hdmi.h:
>
> union hdmi_infoframe {
>         struct hdmi_any_infoframe any;
>         struct hdmi_avi_infoframe avi;
>         struct hdmi_spd_infoframe spd;
>         union hdmi_vendor_any_infoframe vendor;
>         struct hdmi_audio_infoframe audio;
> };
>
>
> Could someone take a look at this?  I have no idea how this wasn't
> caught before being merged.

Thank you for reporting this issue. I have just posted a fix for this
(CC'd you) and hence the link is not yet available. Please test the
patch.
This issue surfaced because of commit 985e5dc207e1 ("drm/edid:
Populate picture aspect ratio for CEA modes") which includes
linux/hdmi.h and which got merged last month and hence the build issue
did not appear when the failing patch (commit a144c2e9f17b "
drm/exynos: sending AVI and AUI info frames") initially got merged
about a year earlier. Infact "union hdmi_infoframe" itself was added
to include/linux/hdmi.h in Aug. 2013. Now that we have something
available in global header, the next step would be to utilize that
definition instead of the local one in exynos_hdmi.c.

-- 
With warm regards,
Sachin
