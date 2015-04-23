From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: drm/exynos: mixer blending and layer order
Date: Thu, 23 Apr 2015 14:28:59 +0200
Message-ID: <f71d728970bc036fdce8934a499aba9f@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:42252 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934422AbbDWM3B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Apr 2015 08:29:01 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com

Hello,

I've noticed some inconsistency in what is currently exported as 'zpos' 
DRM propery to userspace. Currently we create three planes, where the 
zpos maps to the mixer 'win' (is this simply short for window?).

But this is wrong since the mixer layer configuration is currently done 
in this way (in mixer_win_reset()):
layer1 (win[1]) > layer0 (win[0]) > video (win[2])

So layer1 is at the top of our stack, and the video layer is at the 
bottom. So regardless on how you interpret the zpos property (0 being 
the top, or 0 being bottom), it doesn't give you accurate information on 
how the planes are ordered.

Related to this is the issue of how to blend planes. When should 
blending of layer be enabled? We probably want to based this on three 
states:
- which layer are enabled
- which pixelformats are associated to the layers
- in which order are the layers (*)

(*) So in the case of 'layer1 > layer0 > video', layer1 disabled, 
layer0/video enabled, layer0 having alpha-pixelformat, we want to blend 
layer0 and the video layer (so effectively making layer0 translucent).

I'm trying to come up with a proposition for that issue in the next 
days, but it would really help to hear thoughts of you guys.

With best wishes,
Tobias
