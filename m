From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 04/15] tests/exynos: disable the G2D userptr/blend test
Date: Wed, 11 Feb 2015 02:39:32 +0100
Message-ID: <54DAB2D4.1070405@math.uni-bielefeld.de>
References: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de> <1422971645-30621-5-git-send-email-tjakobi@math.uni-bielefeld.de> <54DAAC4F.5020906@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:41293 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751075AbbBKBjh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Feb 2015 20:39:37 -0500
In-Reply-To: <54DAAC4F.5020906@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org

Hello Joonyoung!

Joonyoung Shim wrote:
> Hi,
> 
> On 02/03/2015 10:53 PM, Tobias Jakobi wrote:
>> The blend test uses the userptr functionality of exynos-drm, which
>> is currently not safe to use. If the kernel hasn't been build with
>> exynos-iommu support, then the blend test is going to produce (kernel)
>> memory corruption, eventually leading to a system crash.
>>
>> Disable the test for now, until the kernel code has been sanitized.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  tests/exynos/exynos_fimg2d_test.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
>> index aa140e5..48dfe97 100644
>> --- a/tests/exynos/exynos_fimg2d_test.c
>> +++ b/tests/exynos/exynos_fimg2d_test.c
>> @@ -788,11 +788,13 @@ int main(int argc, char **argv)
>>  
>>  	getchar();
>>  
>> +#if 0
> 
> How about add some comments about why need disable?
You mean the current patch description is not enough, or that I should
put that description also in the sourcecode?


With best wishes,
Tobias
