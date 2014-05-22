From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [GIT PULL 2/5] Samsung clock updates for 3.16
Date: Thu, 22 May 2014 11:56:05 +0200
Message-ID: <537DC9B5.6090405@samsung.com>
References: <014501cf73c8$5eb66960$1c233c20$@samsung.com>
 <20140522053126.GF32618@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:52514 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752598AbaEVJ4L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 05:56:11 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5Y00FK3ZLKZS20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 May 2014 10:56:08 +0100 (BST)
In-reply-to: <20140522053126.GF32618@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Olof,

On 22.05.2014 07:31, Olof Johansson wrote:
> On Tue, May 20, 2014 at 10:11:03AM +0900, Kukjin Kim wrote:
>> The following changes since commit 34c453ce16633539a94a2e876faeb731ac1be899:
>>
>>   ARM: S3C24XX: fix merge conflict (2014-05-15 05:54:38 +0900)
>>
>> are available in the git repository at:
>>
>>   http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>> tags/samsung-clk
>>
>> for you to fetch changes up to 6520e968eef4f88c076a84a80e026049d157132e:
>>
>>   clk: exynos5420: Add 5800 specific clocks (2014-05-19 22:15:08 +0900)
>>
> 
> 1. This is new SoC support -- you said you're sending multiplatform soon so
>    we'll hold off until that's made it in.
> 
> 2. What's the actual dependency here for taking it through arm-soc? Seems like
>    nearly all of it is in drivers/clk.

This is a complicated network of dependencies:

 1) s3c24xx conversion to CCF had dependencies on Kukjin's tree so it
was applied there,
 2) support for multiple clock providers in Samsung clock library needed
to convert s3c24xx clock driver (applied to Kukjin's tree) as well,
 3) due to quite invasive nature of the series above, most of the
patches touching Samsung clock drivers ended depending on it, due to
multiple conflicts otherwise.

Best regards,
Tomasz
