From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 4/4] ARM: dts: Use OF graph for DP to panel connection in
 exynos5800-peach-pi
Date: Tue, 08 Dec 2015 10:47:16 +0900
Message-ID: <566636A4.1050908@samsung.com>
References: <1449492758-19989-1-git-send-email-inki.dae@samsung.com>
 <1449492758-19989-5-git-send-email-inki.dae@samsung.com>
 <5666283A.5@samsung.com> <56663384.8060708@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:43871 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932193AbbLHBrZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Dec 2015 20:47:25 -0500
In-reply-to: <56663384.8060708@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 08.12.2015 10:33, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 12/07/2015 09:45 PM, Krzysztof Kozlowski wrote:
>> On 07.12.2015 21:52, Inki Dae wrote:
>>> From: Javier Martinez Canillas <javier@osg.samsung.com>
>>>
>>> The DT binding for the Exynos DRM Display Port (DP) driver isn't consistent
>>> since it uses a phandle to describe the connection between the DP port and
>>> the display panel but uses the OF graph ports and endpoints to describe the
>>> connection betwen the DP port, a bridge chip and the panel.
>>>
>>> The Exynos DP driver and the DT binding have been changed to allow also to
>>> describe the DP port to panel connection using ports / endpoints (OF graph)
>>> so this patch changes the Exynos5800 Peach Pi DT to make it consistent with
>>> the Exynos5420 Peach Pit that has a eDP to LVDS chip and uses OF graph too.
>>>
>>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>> Reviewed-by: Inki Dae <inki.dae@samsung.com>
>>> ---
>>>  arch/arm/boot/dts/exynos5800-peach-pi.dts | 15 ++++++++++++++-
>>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>>
>>
>> Looks sensible:
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
>> Dependencies are not mentioned, does it depend on patch 1?
>>
> 
> Yes, it depends on patch 1/4 so it should be merged through the Exynos DRM
> tree to maintain bisectability. Inki's patch maintains the DT ABI backward
> compatibility though so another option is to wait until the DRM change hit
> mainline and then pick $SUBJECT.

Thanks. We could also use a tag with DRM changes for samsung-soc but
since I already flushed my queue for v4.5 I think it would be an
overkill. From my point of view it can safely go through exynos-drm tree.

Best regards,
Krzysztof
