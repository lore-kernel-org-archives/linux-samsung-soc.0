From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 1/4] ARM: dts: Add SROMc to Exynos 5410
Date: Wed, 28 Oct 2015 16:24:20 +0900
Message-ID: <56307824.1050302@samsung.com>
References: <cover.1445935215.git.p.fedin@samsung.com>
 <91ae80f172192fa4dbc8bf8ee5a9068661592de6.1445935215.git.p.fedin@samsung.com>
 <56302F1F.5090206@samsung.com> <009001d1114f$3c7a1f60$b56e5e20$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:11160 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755544AbbJ1HYc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 03:24:32 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWX000275WT5740@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Oct 2015 07:24:29 +0000 (GMT)
In-reply-to: <009001d1114f$3c7a1f60$b56e5e20$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Kukjin Kim' <kgene@kernel.org>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>

On 28.10.2015 16:06, Pavel Fedin wrote:
>  Hello!
> 
>>> +		sromc: sromc@12250000 {
>>> +			compatible = "samsung,exynos-srom";
>>> +			reg = <0x12250000 0x10>;
>>
>> Isn't 0x10 too small (SROM_BC3 won't be mapped)?
> 
>  Muhaha, indeed, thanks for noticing this.
>  By the way, i've just checked exynos4.dtsi and exynos5.dtsi, they specify the same size. Did reviewers overlook this small thing?

Yep, I pointed that 0x100 (from first version of patchset) is too big...
but did not exactly check the length of new value.

> Shouldn't it be fixed then?

Yes. It hasn't been pulled yet by arm-soc... Let's wait Kukjin's opinion
how to deal with exynos[45].dtsi.

Best regards,
Krzysztof
