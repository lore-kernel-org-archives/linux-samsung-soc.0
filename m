From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 16:57:52 +0100
Message-ID: <20150825155752.GU7557@n2100.arm.linux.org.uk>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <20150825095817.GC14034@ulmo.nvidia.com>
 <55DC75C8.209@rock-chips.com>
 <20150825142150.GB3820@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:55992 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755058AbbHYP60 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 11:58:26 -0400
Content-Disposition: inline
In-Reply-To: <20150825142150.GB3820@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: Yakir Yang <ykk@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, djkurtz@google.com, dianders@google.com, seanpaul@google.com, Takashi Iwai <tiwai@suse.de>, ajaynumb@gmail.com, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Vincent Palatin <vpalatin@chromium.org>, Mark Yao <mark.yao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.orgl

On Tue, Aug 25, 2015 at 04:21:51PM +0200, Thierry Reding wrote:
> You cited code from dw_hdmi.c earlier, it looks like it might be correct
> even though it doesn't cite a reference for why this was done. Perhaps
> someone on this thread, or someone involved with dw_hdmi can answer
> where that code came from.

dw_hdmi doesn't do any format conversion - it's hard coded to RGB, 8
bits per colour component.  That's a requirement for all HDMI sinks.

The reason it's hard-coded in dw_hdmi is that (a) no one has yet decided
its worth the effort to get the dw_hdmi hardware to do the colourspace
conversion to the YUV spaces and verify that it works, and (b) I really
don't see the point when we're talking about computer like devices which
work primerily with RGB and RGB is always supported by the sink.

As far as greater colour depths go, the driver came from the Freescale
iMX6 code base, and the hardware which feeds dw_hdmi can't do more than
8 bits per component - so going to 10, 12 or 16 bits per component is
beyond what iMX6 can cope with.  Hence, no one on the iMX6 side has a
need for the deep colour stuff.

In any case, I view this as a very low priority issue - it would be nice
to have audio support on HDMI for iMX6 at some point in the next 20 years,
preferably before the hardware becomes obsolete.  I've been maintaining
patches for this for 1.5 years now... how much longer is it going to take?
My pull request to David from 15th July was ignored.  My re-send of that
after he returned was ignored.  My reminder of it has been ignored.  What's
going on in DRM land?  It would be nice to get _some_ kind of feedback so
I know why they're not being taken, so I can fix whatever the issue is.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
