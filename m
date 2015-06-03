From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL] ARM: EXYNOS: DTS improvements for 4.2, 3rd
Date: Wed, 03 Jun 2015 15:41:27 +0900
Message-ID: <556EA197.2040107@samsung.com>
References: <451852203.401141433216406853.JavaMail.weblogic@epmlwas09b>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:42049 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752847AbbFCGla (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 02:41:30 -0400
In-reply-to: <451852203.401141433216406853.JavaMail.weblogic@epmlwas09b>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Peter Chubb <peter.chubb@nicta.com.au>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 02.06.2015 12:40, Kukjin Kim wrote:
> Krzysztof Kozlowski wrote:
>> Dear Kukjin,
>>
>> Quite big set of changes, mostly refactor.
>>
>> You can find them also on the lists with my reviewed-by.
> 
> Thanks for your gentle reminder and gathering.
> 
> I'm sorting them out and it should be fine tonight in my tree...
> If any differences with yours, I'll let you know and please check them
> tomorrow morning so that it could be sent out to arm-soc tomorrow for 4.2.  

Hi,

Everything from pull request was merged, thanks. However I cannot find
the Marek's Exynos IOMMU patches in your tree. You replied that you will
also take care of them. They are waiting on the lists for quite long time.

Marek recently rebased them on top of my DTS-label-rework, so you can
pull them directly:

1. From mailing list:
   http://www.spinics.net/lists/linux-samsung-soc/msg45022.html
   They only miss Javier's tested-by:
   Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

2. From my dt-for-next branch:
   https://github.com/krzk/linux/commits/dt-for-next

The IOMMU part of Marek's patchset was applied by Joerg so it would be
great if the Exynos-stuff also could be merged for 4.2.


Best regards,
Krzysztof
