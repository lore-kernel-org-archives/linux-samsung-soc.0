From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 04/15] tests/exynos: disable the G2D userptr/blend test
Date: Wed, 11 Feb 2015 10:47:15 +0900
Message-ID: <54DAB4A3.1020606@samsung.com>
References: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1422971645-30621-5-git-send-email-tjakobi@math.uni-bielefeld.de>
 <54DAAC4F.5020906@samsung.com> <54DAB2D4.1070405@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:22462 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751315AbbBKBrQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Feb 2015 20:47:16 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJL00IDR3MQO060@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Feb 2015 10:47:14 +0900 (KST)
In-reply-to: <54DAB2D4.1070405@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org

Hi,

On 02/11/2015 10:39 AM, Tobias Jakobi wrote:
> Hello Joonyoung!
> 
> Joonyoung Shim wrote:
>> Hi,
>>
>> On 02/03/2015 10:53 PM, Tobias Jakobi wrote:
>>> The blend test uses the userptr functionality of exynos-drm, which
>>> is currently not safe to use. If the kernel hasn't been build with
>>> exynos-iommu support, then the blend test is going to produce (kernel)
>>> memory corruption, eventually leading to a system crash.
>>>
>>> Disable the test for now, until the kernel code has been sanitized.
>>>
>>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>> ---
>>>  tests/exynos/exynos_fimg2d_test.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
>>> index aa140e5..48dfe97 100644
>>> --- a/tests/exynos/exynos_fimg2d_test.c
>>> +++ b/tests/exynos/exynos_fimg2d_test.c
>>> @@ -788,11 +788,13 @@ int main(int argc, char **argv)
>>>  
>>>  	getchar();
>>>  
>>> +#if 0
>>
>> How about add some comments about why need disable?
> You mean the current patch description is not enough, or that I should
> put that description also in the sourcecode?
> 

I mean just to add on source code, if anyone meets #if 0 without any
comments, he will have question.

Thanks.
