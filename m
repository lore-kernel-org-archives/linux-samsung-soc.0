From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: drm/exynos: Add atomic modesetting support
Date: Tue, 19 May 2015 19:54:42 +0100
Message-ID: <CAPj87rPAGCXBhB7Wyn9o7cO=P069Fop0UQGsuwbD5CSUvid_Cg@mail.gmail.com>
References: <10cea26ae89c8bf2f26c2d258dcabd3a@math.uni-bielefeld.de>
	<20150518195101.GA18856@joana>
	<CAPj87rOnseYOzPqetbxKpq7_4855Vup2cySzZJmz8JejBHFPMw@mail.gmail.com>
	<20150518210239.GB18856@joana>
	<182ac8915516e85d964fca30afa1702a@math.uni-bielefeld.de>
	<CAPj87rM-oNsqb+=7HyJ4k7GMJA80nfq_AwYVx5ct1J7hYL12PA@mail.gmail.com>
	<933513a3ff2090c9ec2921e8cb71effb@math.uni-bielefeld.de>
	<20150519184300.GA12704@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:33058 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751100AbbESSyn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 May 2015 14:54:43 -0400
Received: by igbpi8 with SMTP id pi8so114535852igb.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 May 2015 11:54:42 -0700 (PDT)
In-Reply-To: <20150519184300.GA12704@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Stone <daniel@fooishbar.org>, InKi Dae <inki.dae@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, liquid.acid@gmx.net

Hi,

On 19 May 2015 at 19:43, Gustavo Padovan <gustavo@padovan.org> wrote:
> 2015-05-19 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:
>> so Daniel helped me track down this issue. It came from an incorrect
>> 'clock-frequency' entry in my DTS. The freq was 500000. Daniel recommended
>> 70600000 which works 'fine' (and according to modetest produces a 59Hz
>> mode). I say 'fine' because I can't confirm that FIMD is actually working. I
>> just see that with that change I no longer get any div-by-zeros in the
>> kernel.
>
> That is good to hear! So maybe we are now ready to have the atomic
> modesetting patches merged in. I'll send a new version with the last
> fix to avoid crashes with null CRTC.

Indeed. Though as he says below:

>> So fimd_calc_clkdiv needs some sanitizing for 'ideal_clk' at least.

It would be nice to:
  a) reject any mode with an impossible clock in mode_valid (filter
connector modes) + mode_fixup (explicit request)
  b) WARN_ON and return during FIMD commit if clk_div ends up being zero

>> What still bothers me though is the fact that FIMD actually gets enabled.
>> I'm just calling 'modetest -M exynos', so it's just doing probing. Why does
>> that trigger dpms?
>
> That comes from restore_fbdev_mode() when modetest closes the file
> descriptor, but I'm not sure why a update happens at this time.

It comes from lastclose: when the last client exits, DRM tries to
restore the mode that fbcon was using. Quite why it didn't fail before
this point (i.e. when doing it initially), I'm not quite sure, but oh
well.

Cheers,
Daniel
