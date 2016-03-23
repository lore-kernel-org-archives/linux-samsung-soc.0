From: Dave Airlie <airlied@gmail.com>
Subject: Re: Who is going to merge it [Was: Re: [PATCH v14 0/17] Add Analogix
 Core Display Port Driver]
Date: Wed, 23 Mar 2016 10:41:58 +1000
Message-ID: <CAPM=9tz9_rbGJFuv-+YN=Sicfng++tHTDLrOX5Ohtwft+VnwtA@mail.gmail.com>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>
	<1919945.Y1tg0YzXlm@diego>
	<56F1CAEB.3080701@samsung.com>
	<8949624.HmxDpZAlt2@diego>
	<56F1D0AD.8030905@samsung.com>
	<20160322233906.GP19428@n2100.arm.linux.org.uk>
	<56F1DB27.4040001@samsung.com>
	<20160323000835.GQ19428@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34759 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751520AbcCWAmA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Mar 2016 20:42:00 -0400
In-Reply-To: <20160323000835.GQ19428@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Inki Dae <inki.dae@samsung.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, David Airlie <airlied@linux.ie>, Mark Yao <mark.yao@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Doug Anderson <dianders@chromium.org>, Jingoo Han <jingoohan1@gmail.com>, Yakir Yang <ykk@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.>

>
>> So although it's small framework or just subdirectory, we would need
>> someone who can manage the framework to avoid further confusion if
>> necessary.
>
> So maybe it just doesn't need a maintainer, and maybe those the owner
> of the bridge driver should be responsible for choosing the tree which
> it's merged through along with updates.  That's how dw-hdmi has been
> managed on the whole.
>
> It also means that the bridge driver maintainer is able to test changes
> to the bridge driver, rather than having some over-arching bridge
> subdirectory maintainer who doesn't have a clue whether the changes
> work on the hardware.
>
> IMHO, having bridge driver authors/maintainers look after their own
> code has many advantages.

The author just send me a pull request with acks from a git tree
that hopefully both people agreed and tested from. No need to
send this via another maintainer layer.

Dave.
