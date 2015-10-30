From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 1/4] Documentation: dt-bindings: Describe SROMc
 configuration
Date: Fri, 30 Oct 2015 15:09:28 +0900
Message-ID: <56330998.5060706@samsung.com>
References: <cover.1446018918.git.p.fedin@samsung.com>
 <046d990092dc85cf50db9082fc894d93a3ece7c0.1446018918.git.p.fedin@samsung.com>
 <563183F9.6020806@samsung.com> <008001d1121d$c0fef160$42fcd420$@samsung.com>
 <CAJKOXPcSehXRYDpYiybzdagPS76QKGpeMb7DxkpwJq8GTfuPOw@mail.gmail.com>
 <003c01d1123f$002a3220$007e9660$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47618 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751940AbbJ3GJg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 02:09:36 -0400
In-reply-to: <003c01d1123f$002a3220$007e9660$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Kukjin Kim' <kgene@kernel.org>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, devicetree@vger.kernel.org

On 29.10.2015 20:43, Pavel Fedin wrote:
>  Hello!
> 
>>>> Any vendor prefix here? How generic is this?
>>>
>>>  I just don't know... Does *everything* really need a vendor prefix? How readable would that
>> be? "compatible" property already says
>>> that it's samsung-exynos-specific. And IMHO it's quite obvious that properties of vendor-
>> specific device are automatically
>>> vendor-specific.
>>>  Ok, i am currently fixing up the rest and will post v4 soon, and will Cc: it to devicetree
>> ML.
>>
>> Which my reply you are referring to? You stripped part of some
>> sentence and put it without *any context*. Just random sentence.
>> I asked for vendor prefix in few places... srom-timing? width? And I
>> do not remember where I used exactly these words.
> 
>  Ok, sorry, i promise to improve. :)
>  Anyway, i have figured out how to add sub-devices, and heavily modified the whole thing. And indeed, vendor prefix is now very useful, so i added it to all three properties. Making v4...

Actually now I found:
Documentation/devicetree/bindings/net/gpmc-eth.txt

Aren't you duplicating this work? This looks very, very similar.

Best regards,
Krzysztof
