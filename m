From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCHv2 1/4] video: add hotplug detect notifier support
Date: Mon, 20 Mar 2017 14:26:17 +0000
Message-ID: <20170320142616.GM21222@n2100.armlinux.org.uk>
References: <1483366747-34288-1-git-send-email-hverkuil@xs4all.nl>
 <1483366747-34288-2-git-send-email-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1483366747-34288-2-git-send-email-hverkuil@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jan 02, 2017 at 03:19:04PM +0100, Hans Verkuil wrote:
> From: Hans Verkuil <hans.verkuil@cisco.com>
> 
> Add support for video hotplug detect and EDID/ELD notifiers, which is used
> to convey information from video drivers to their CEC and audio counterparts.
> 
> Based on an earlier version from Russell King:
> 
> https://patchwork.kernel.org/patch/9277043/
> 
> The hpd_notifier is a reference counted object containing the HPD/EDID/ELD state
> of a video device.

I thought we had decided to drop the ELD bits?

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
