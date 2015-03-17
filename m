From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH] ARM: dts: Update exynos5250-spring with mmc node changes
Date: Wed, 18 Mar 2015 01:27:49 +0900
Message-ID: <55085605.2000001@kernel.org>
References: <1424275812-6797-1-git-send-email-afaerber@suse.de> <54E5CD2E.9070608@collabora.co.uk> <5506EEF9.7080100@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:37049 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754324AbbCQQ2B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Mar 2015 12:28:01 -0400
In-Reply-To: <5506EEF9.7080100@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>

On 03/16/15 23:55, Andreas F=C3=A4rber wrote:
> Am 19.02.2015 um 12:46 schrieb Javier Martinez Canillas:
>> Hello Andreas,
>>
Hi,

>> On 02/18/2015 05:10 PM, Andreas F=C3=A4rber wrote:
>>> Resolve a merge conflict with mmc refactoring aaa25a5a33cb ("ARM: d=
ts:
>>> unuse the slot-node and deprecate the supports-highspeed for dw-mmc=
 in
>>> exynos") by dropping the slot@0 nodes, moving its bus-width propert=
y to
>>> the mmc node and replacing supports-highspeed with cap-{mmc,sd}-hig=
hspeed,
>>> matching exynos5250-snow.
>>>
>>> Cc: Jaehoon Chung <jh80.chung@samsung.com>
>>> Fixes: 53dd4138bb0a ("ARM: dts: Add exynos5250-spring device tree")
>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>> ---
>>>  arch/arm/boot/dts/exynos5250-spring.dts | 16 ++++------------
>>>  1 file changed, 4 insertions(+), 12 deletions(-)
>>>
>>
>> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.=
uk>
>=20
> Ping!
>=20
Thanks, applied with 'Cc: <stable@vger.kernel.org> [3.19+]'

- Kukjin
