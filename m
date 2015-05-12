From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: drm/exynos: Add atomic modesetting support
Date: Tue, 12 May 2015 15:29:08 -0300
Message-ID: <20150512182908.GB3327@joana>
References: <1430430651-22416-1-git-send-email-gustavo@padovan.org>
 <554D2FC7.1070208@gmx.net>
 <CAAQKjZPCQZV7DxTuf12NyPbT2H5PJhNQs4CwtM8g563Zuw8-6w@mail.gmail.com>
 <554DF9DE.7000200@gmx.net>
 <CAAQKjZMRG_a1FrTRD9dACSBz8w3zvrLYWSSM0-wUbaVePaPA2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f179.google.com ([209.85.216.179]:32830 "EHLO
	mail-qc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933013AbbELS3M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 May 2015 14:29:12 -0400
Received: by qcvo8 with SMTP id o8so9479207qcv.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 May 2015 11:29:11 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAAQKjZMRG_a1FrTRD9dACSBz8w3zvrLYWSSM0-wUbaVePaPA2Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Tobias Jakobi <liquid.acid@gmx.net>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>

2015-05-10 Inki Dae <inki.dae@samsung.com>:

> 2015-05-09 21:13 GMT+09:00 Tobias Jakobi <liquid.acid@gmx.net>:
> > Hello Inki,
> >
> >
> > Inki Dae wrote:
> >> Hi,
> >>
> >> 2015-05-09 6:51 GMT+09:00 Tobias Jakobi <liquid.acid@gmx.net>:
> >>> Hello,
> >>>
> >>> I've tested this on my Hardkernel Odroid-X2 (connected via HDMI to a
> >>> 1080p panel).
> >>>
> >>> Run the usual modetest tests (just primary plane, primary plane with
> >>> vsync, primary plane with overlay, primary plane with overlay and video
> >>> overlay, overlay partially outside of crtc area, etc.) and haven't
> >>> noticed any issues so far.
> >>
> >> As I mentioned several times, it works well in case that only one crtc
> >> driver is enabled. Could you check it again after you enable two or
> >> more crtc drivers such as FIMD and HDMI or FIMD, HDMI and VIDI
> >> together? For this, dts file for X2 should contain their device nodes
> >> and also should be configurated though menuconfig.
> > I've enabled VIDI and FIMD and confirmed that they should up properly in
> > modetest before applying the series.
> >
> > Booting with the atomic series works fine, but I get a segfault when
> > calling modetest. I've attached the kernel log below.
> 
> Below panic issue is same as one I faced with at previous patch seris,
> v3, which was invalid memory access - state->crtc is NULL whille
> modetest is being performed. It seems that the last patch of v4 didn't
> resolve this issue yet.

The weird thing is that it works quite fine on my exynos 5 hardware.
I'll take a look on what could be be happening to cause this kind of
crash.

	Gustavo
