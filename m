From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v6 15/15] ARM: dts: rename the clock of MIPI DSI 'pll_clk'
 to 'sclk_mipi'
Date: Tue, 23 Jun 2015 11:10:18 +0900
Message-ID: <CAJKOXPeZY=RmFxozjGPoUbP+-LcnEOE=vEcj-gHDyaoYXLTS4Q@mail.gmail.com>
References: <1434113958-15877-1-git-send-email-human.hwang@samsung.com>
	<1434113958-15877-16-git-send-email-human.hwang@samsung.com>
	<5587D111.9090602@samsung.com>
	<5587F4A1.2090502@samsung.com>
	<CAJKOXPe-XJb2qCSWxY2gQnYpACGcN=6=1XmWHX5gF7s2a_UTPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f47.google.com ([209.85.216.47]:43158 "EHLO
	mail-vn0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752713AbbFWCKT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jun 2015 22:10:19 -0400
In-Reply-To: <CAJKOXPe-XJb2qCSWxY2gQnYpACGcN=6=1XmWHX5gF7s2a_UTPw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, daniel@fooishbar.org, sw0312.kim@samsung.com, jy0922.shim@samsung.com, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>

2015-06-22 21:35 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com=
>:
> 2015-06-22 20:42 GMT+09:00 Inki Dae <inki.dae@samsung.com>:
>> + Krzysztof
>>
>> On 2015=EB=85=84 06=EC=9B=94 22=EC=9D=BC 18:10, Inki Dae wrote:
>>> On 2015=EB=85=84 06=EC=9B=94 12=EC=9D=BC 21:59, Hyungwon Hwang wrot=
e:
>>>> The clock which was named as 'pll_clk' is actually not the clock s=
ource
>>>> of PLL in MIPI DSI. This patch fixes this disagreement.
>>>
>>> Mr. Kukjin and Krzysztof, can you give me Acked-by or Singed-off-by=
? I'd
>>> like to merge this patch to mainline through drm-next.
>
> Thanks for forwarding me other necessary patch. All that burden could
> be easily avoided by sending everything to samsung-soc anyway.
>
> The patch itself looks good:
> Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
> Best regards,
> Krzysztof

To clarify. There were seven versions of this patch and none of them
were sent to samsung-soc list, to Kukjin Kim or to me.

I also wonder about patch 2: "of: add helper for getting endpoint node
with specific identifiers"
for which I can't find respective ack from Rob Herring (+Cc). I only fo=
und this:
http://www.spinics.net/lists/devicetree/msg69336.html
but there are only comments, not an ack.

Best regards,
Krzysztof
